<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;
use App\Entity\Article;
use App\Entity\Image;
use App\Form\ArticleType;

class ArticleController extends AbstractController
{


    public function addArticle(Request $request)
    {   
        $article = new Article();
        $local = $request->getLocale();

        $form =  $this->createForm(ArticleType::class, $article, [
            'local' => $local
        ]);
        
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManger = $this->getDoctrine()->getManager() ; 
            $images = $form->get('images')->getData();
        
            foreach ($images as $image) {
                                
                $image->setArticle($article);
                $entityManger->persist($image);
           }

            $entityManger->persist($article);
            $entityManger->flush();
            return $this->redirectToRoute('home_admin');
        }

        return $this->render('admin/article/add_article.html.twig', [

            'addArticleForm' => $form->createView(),
        ]);
    }




}
