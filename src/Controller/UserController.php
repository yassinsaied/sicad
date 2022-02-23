<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Mailer\MailerInterface;
use Symfony\Bridge\Twig\Mime\TemplatedEmail;
use Symfony\Contracts\Translation\TranslatorInterface;
use App\Form\ProfileType;
use App\Entity\User;
use App\Form\UpdatePasswordType;
use Symfony\Component\Form\FormError;



class UserController extends AbstractController
{
    private $entityManager;
    private  $translator;

    public function __construct(EntityManagerInterface $entityManagerInterface, TranslatorInterface $translator)
    {

        $this->entityManager = $entityManagerInterface;
        $this->translator = $translator;
    }

    public function updateProfile(Request $request): Response
    {
        $user =  $this->getUser();
        $form =  $this->createForm(ProfileType::class, $user);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $user->setUpdateAt(new \DateTime());
            $this->entityManager->flush();
            return $this->redirectToRoute('home_admin');
        }

        return $this->render('admin/user/update_profile.html.twig', [

            'updateProfile' => $form->createView(),
        ]);
    }



    public function updatePassword(Request $request, UserPasswordHasherInterface  $userPasswordHasher): Response
    {

        $user = $this->getUser();
        $form =  $this->createForm(UpdatePasswordType::class);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {


            $oldPassword = $form->get("oldPassword")->getData();

            if ($userPasswordHasher->isPasswordValid($user, $oldPassword)) {
                $plaintextPassword = $form->get("plainPassword")->getData();
                $newHashedPassword = $userPasswordHasher->hashPassword(
                    $user,
                    $plaintextPassword
                );

                $user->setPassword($newHashedPassword);
                $this->entityManager->flush();


                $this->addFlash('success', $this->translator->trans('flash.message.successUpdate.passord'));
                return $this->redirectToRoute('home_admin');
            } else {

                $form->addError(new FormError($this->translator->trans('invalid.oldpass')));
            }
        }



        return $this->render('admin/user/update_password.html.twig', [

            'updatePasswordForm' => $form->createView(),

        ]);
    }



    public function listOfUsers(Request $request)
    {
        $roles = array();
        $AllrolesHierarchy = $this->getParameter('security.role_hierarchy.roles');

        foreach ($AllrolesHierarchy as $originalRole => $inheritedRoles) {
            foreach ($inheritedRoles as $inheritedRole) {
                $roles[$inheritedRole] = array();
            }

            $roles[$originalRole] = array();
        }

        $listOfUsers = $this->getDoctrine()->getRepository(User::class)->findAll();
        return $this->render('admin/user/list_users.html.twig', [
            'listOfUsers' => $listOfUsers,
            'roles' => $roles
        ]);
    }


    public function activatUser(Request $request, MailerInterface $mailer)
    {

        if ($request->isXmlHttpRequest()) {

            $entityManager =  $this->getDoctrine();
            $slugUser = $request->get('slugUser');

            $user = $entityManager->getRepository(User::class)->findOneBy([
                'slug' =>  $slugUser
            ]);

            if ($user) {
                if ($user->getIsActivate() == false) {
                    $user->setIsActivate(true);
                    $active = true;
                    $mailMessage = $this->translator->trans('activated.mail.message');
                } else {
                    $user->setIsActivate(false);
                    $active = false;
                    $mailMessage = $this->translator->trans('deactivated.mail.message');
                }
                $entityManager->getManager()->flush();

                //sending email for activation/dasactivation user 

                $email = (new TemplatedEmail())
                    ->from('sicad.pg@gmail.com')
                    ->to($user->getEmail())
                    ->subject('activation account sicad')
                    ->htmlTemplate('admin/user/activate_user_email.html.twig')
                    ->context([
                        'mailMessage' => $mailMessage,
                        'username' => $user->getLastName(),
                    ]);

                $mailer->send($email);

                return new JsonResponse($active);
            }
        }

        return new JsonResponse('impossible');
    }



    public function modifyRoleUser(Request $request)
    {
        if ($request->isXmlHttpRequest()) {

            $entityManager =  $this->getDoctrine();
            $slugUser = $request->get('slugUser');
            $roleUser = $request->get('roleUser');

            $user = $entityManager->getRepository(User::class)->findOneBy([
                'slug' =>  $slugUser
            ]);

            if ($user) {
                $user->setRoles(array($roleUser));
                $entityManager->getManager()->flush();
                return new JsonResponse($roleUser . ' Done');
            }
        }

        return new JsonResponse('impossible');
    }
}
