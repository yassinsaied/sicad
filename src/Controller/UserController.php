<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use App\Form\ProfileType;
use App\Form\UpdatePasswordType;
use Symfony\Component\Form\FormError;



class UserController extends AbstractController
{   
    private $entityManager ;
 
    public function __construct(EntityManagerInterface $entityManagerInterface)
     {
      
         $this->entityManager = $entityManagerInterface;
        
     }
   
    public function updateProfile(Request $request): Response
    {    $user =  $this->getUser();
         $form =  $this->createForm(ProfileType::class , $user);
         $form->handleRequest($request);
         if($form->isSubmitted() && $form->isValid()) {
            $user->setUpdateAt(new \DateTime());
            $this->entityManager->flush();
            return $this->redirectToRoute('home_admin');
         }

        return $this->render('admin/user/update_profile.html.twig', [
           
            'updateProfile' => $form->createView(),
        ]);
    }



    public function updatePassword(Request $request , UserPasswordHasherInterface  $userPasswordHasher): Response 
    {

         $user = $this->getUser();
         $form =  $this->createForm(UpdatePasswordType::class);
         $form->handleRequest($request);
         if($form->isSubmitted() && $form->isValid())
         {

           
            $oldPassword = $form->get("oldPassword")->getData();

            if($userPasswordHasher->isPasswordValid($user, $oldPassword))
            {   
                $plaintextPassword = $form->get("plainPassword")->getData(); 
                $newHashedPassword = $userPasswordHasher->hashPassword(
                    $user,
                    $plaintextPassword
                );
                  
                $user->setPassword($newHashedPassword);
                $this->entityManager->flush();
                 
             
                $this->addFlash('success', 'Your password has been successfully changed');
                return $this->redirectToRoute('home_admin');

            } else {

                $form->addError(new FormError('Old Password Is not valid'));

            }

         }


         
         return $this->render('admin/user/update_password.html.twig',[

            'updatePasswordForm' => $form->createView(),

        ]);

    }










    
}
