<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Contracts\Translation\TranslatorInterface;
use App\Form\UserRegistrationType;
use App\Entity\User;

class SecurityController extends AbstractController
{

    private $entityManager;
    private  $translator;

    public function __construct(EntityManagerInterface $entityManagerInterface, TranslatorInterface $translator)
    {

        $this->entityManager = $entityManagerInterface;
        $this->translator = $translator;
    }


    public function login(AuthenticationUtils $authenticationUtils): Response
    {

        return $this->render('security/login.html.twig', [
            'error' => $authenticationUtils->getLastAuthenticationError()
        ]);
    }


    public function logout()
    {
        // symfony has implemented logout function
    }

    public function register(Request $request, UserPasswordHasherInterface $UserPasswordHasher): Response
    {
        $user = new User();
        $form = $this->createForm(UserRegistrationType::class, $user);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {

            $user->setRoles(array("ROLE_AUTHEUR"));
            $user->setThumb("avatar.png");
            $user->setIsActivate(0);
            $user->setIsDeleted(0);
            $user->setCreatedAt(new \DateTime());
            $plaintextPassword = $form->get("plainPassword")->getData();
            $hashedPassword = $UserPasswordHasher->hashPassword(
                $user,
                $plaintextPassword
            );

            $user->setPassword($hashedPassword);
            $this->entityManager->persist($user);
            $this->entityManager->flush();

            $this->addFlash('success', $this->translator->trans('success.register'));
        }
        return $this->render('security/register.html.twig', [

            "formRegister" => $form->createView()

        ]);
    }
}
