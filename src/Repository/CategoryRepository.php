<?php

namespace App\Repository;

use App\Entity\Category;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Category|null find($id, $lockMode = null, $lockVersion = null)
 * @method Category|null findOneBy(array $criteria, array $orderBy = null)
 * @method Category[]    findAll()
 * @method Category[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class CategoryRepository extends ServiceEntityRepository
{   
    

    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Category::class);
    }

     /**
      * @return Category[] Returns an array of Category Parent objects 
      */
    
    public function findParentCategory()
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.parent is NULL')
            ->andWhere('c.isActivate = :isActivate')
            ->setParameter('isActivate', true)
            ->orderBy('c.slug', 'ASC')
                ;
    }


    /**
      * @return Category[] Returns an array of Category  objects  width label of local
      */
    
      public function findAllCategorylableLocal($local)
      {   $local =='fr'? $labelLocal = "Fr" : ($local  =='en' ? $labelLocal = "En" :  $labelLocal = "Ar");
        
        return $this->createQueryBuilder('c')
        ->select('c.label'.$labelLocal.' as labelLocal , c.slug , c.isActivate')
        ->leftJoin("c.parent", "parent")
        ->addSelect('parent.label'.$labelLocal.' as labelParentLocal')
        ->orderBy('c.slug', 'ASC')
        ->getQuery()
        ->getResult();
      }


      public function getArrayOfAllCategory($local)
      {   $local =='fr'? $labelLocal = "Fr" : ($local  =='en' ? $labelLocal = "En" :  $labelLocal = "Ar");
        
        return $this->createQueryBuilder('c')
        ->select('c.label'.$labelLocal.' as labelLocal')
        ->orderBy('c.slug', 'ASC')
        ->getQuery()
        ->getArrayResult();
      }

}
