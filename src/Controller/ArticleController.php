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
            $entityManger = $this->getDoctrine()->getManager();
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




    public function updateArticle(Request $request, Article $article)
    {

        $local = $request->getLocale();

        $form =  $this->createForm(ArticleType::class, $article, [
            'local' => $local
        ]);

        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $entityManger = $this->getDoctrine()->getManager();
            $images = $form->get('images')->getData();

            foreach ($images as $image) {
                if ($image->getImageFile() != null) {
                    $image->setArticle($article);
                }
            }


            $entityManger->flush();
            return $this->redirectToRoute('home_admin');
        }

        return $this->render('admin/article/edit_article.html.twig', [

            'editArticleForm' => $form->createView(),
        ]);
    }


    public function listArticle(Request $request)
    {
        $locale = $request->getLocale();;

        $listCateg = $this->getDoctrine()->getRepository(Article::class)->findAllArticleByTitleLocal($locale);
        return $this->render('admin/article/list_article.html.twig', [

            'listArticle' => $listCateg
        ]);
    }


    public function deleteArticle(Request $request)
    {

        if ($request->isXmlHttpRequest()) {

            $entityManager =  $this->getDoctrine();
            $slugArticle = $request->get('slugArticle');

            $article = $entityManager->getRepository(Article::class)->findOneBy([
                'slug' =>  $slugArticle
            ]);

            if ($article) {

                $entityManager->getManager()->remove($article);
                $entityManager->getManager()->flush();


                return new JsonResponse('done');
            }
        }

        return new JsonResponse('impossible');
    }


    public function validateArticle(Request $request)
    {

        if ($request->isXmlHttpRequest()) {

            $entityManager =  $this->getDoctrine();
            $slugArticle = $request->get('slugArticle');

            $article = $entityManager->getRepository(Article::class)->findOneBy([
                'slug' =>  $slugArticle
            ]);

            if ($article) {
                if ($article->getIsValid() == false) {
                    $article->setIsValid(true);
                    $valid = true;
                } else {
                    $article->setIsValid(false);
                    $valid = false ;
                }
                $entityManager->getManager()->flush();
                return new JsonResponse($valid);
            }
        }

        return new JsonResponse('impossible');
    }


    public function publishArticle(Request $request)
    {

        if ($request->isXmlHttpRequest()) {

            $entityManager =  $this->getDoctrine();
            $slugArticle = $request->get('slugArticle');

            $article = $entityManager->getRepository(Article::class)->findOneBy([
                'slug' =>  $slugArticle
            ]);

            if ($article) {
                if ($article->getIsPublished() == false) {
                    $article->setIsPublished(true);
                    $valid = true;
                } else {
                    $article->setIsPublished(false);
                    $valid = false ;
                }
                $entityManager->getManager()->flush();
                return new JsonResponse($valid);
            }
        }

        return new JsonResponse('impossible');
    }





}
