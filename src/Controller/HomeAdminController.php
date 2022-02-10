<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Entity\Category;
use App\Entity\Article;

class HomeAdminController extends AbstractController
{

    public function index(): Response
    {
        $nbrArticleNotValid = $this->getDoctrine()->getRepository(Article::class)->findCountArticleNotValide();
        $nbrArticleNotPublished = $this->getDoctrine()->getRepository(Article::class)->findCountArticleNotPublished();


        return $this->render('admin/home.html.twig', [
            'nbrArticleNotValid' => $nbrArticleNotValid,
            'nbrArticleNotPublished' => $nbrArticleNotPublished

        ]);
    }
}
