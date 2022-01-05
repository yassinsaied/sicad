<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\JsonResponse;

use App\Entity\Category;
use App\Form\CategoryType;

class CategoryController extends AbstractController
{


    public function addCategory(Request $request)
    {
        $category = new Category();
        $local = $request->getLocale();

        $form =  $this->createForm(CategoryType::class, $category, [
            'local' => $local
        ]);
        $form->handleRequest($request);
        if ($form->isSubmitted() && $form->isValid()) {
            $category->setcreatedAt(new \DateTimeImmutable());
            $this->getDoctrine()->getManager()->persist($category);
            $this->getDoctrine()->getManager()->flush();
            return $this->redirectToRoute('home_admin');
        }

        return $this->render('admin/category/add_category.html.twig', [

            'addCategoryForm' => $form->createView(),
        ]);
    }




    public function UpdateCategory(Category $category, Request $request)
    {
        $local = $request->getLocale();

        $form =  $this->createForm(CategoryType::class, $category, [
            'local' => $local
        ]);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $category->setUpdatedAt(new \DateTimeImmutable());
            $this->getDoctrine()->getManager()->flush();
            return $this->redirectToRoute('home_admin');
        }

        return $this->render('admin/category/update_category.html.twig', [

            'updateCategoryForm' => $form->createView(),
        ]);
    }


    public function listCategory(Request $request)
    {   
        $locale = $request->getLocale();;
        
        $listCateg = $this->getDoctrine()->getRepository(Category::class)->findAllCategorylableLocal($locale);
        return $this->render('admin/category/list_category.html.twig', [

            'listCateg' => $listCateg
        ]);
    }


    public function deleteCategory(Request $request)
    {

        if ($request->isXmlHttpRequest()) {
         
            $entityManager =  $this->getDoctrine();
            $category = $request->get('slugCateg');
            $category = $entityManager->getRepository(Category::class)->findOneBy([
                'slug' =>  $category 
            ]);

            if($category) {
                
                $entityManager->getManager()->remove($category);
                $entityManager->getManager()->flush();
                return new JsonResponse('done');
            }

            return new JsonResponse('impossible');
        }
    
    }
}
