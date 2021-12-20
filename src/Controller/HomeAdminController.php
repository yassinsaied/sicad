<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Category;

class HomeAdminController extends AbstractController
{
    
    public function index(): Response
    {   
        $allCategorys = $this->getDoctrine()->getRepository(Category::class)->findAll();
        return $this->render('admin/baseBack.html.twig' ,[
            'allCategorys' => $allCategorys
        ]);
    }
}
