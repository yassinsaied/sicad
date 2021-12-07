<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use App\Form\ProfileType;



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
         
            $this->entityManager->flush();
            return $this->redirectToRoute('home_admin');
         }

        return $this->render('user/update_profile.html.twig', [
           
            'updateProfile' => $form->createView(),
        ]);
    }
    
}
