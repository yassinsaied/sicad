<?php

namespace App\Service ;

use App\Entity\Category;
use Doctrine\ORM\EntityManagerInterface;


class TwigGlobalService 
{

    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager ;  
    }


    public function getAllCategories()
    {   
        $listAllCategories =  $this->entityManager->getRepository(Category::class)->findAll();
       // dd($listAllCategories);
        return $listAllCategories;
        
    }




}