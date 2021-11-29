<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeAdminController extends AbstractController
{
    
    public function index(): Response
    {
        return $this->render('admin/baseBack.html.twig');
    }
}
