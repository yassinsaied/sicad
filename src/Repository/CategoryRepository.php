<?php

namespace App\Repository;

use App\Entity\Category;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;

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
            ->orderBy('c.name', 'ASC')
                ;
    }


    /**
      * @return Category[] Returns an array of Category  objects  width label of local
      */
    
      public function findAllCategorylableLocal($local)
      {   $local =='fr'? $labelLocal = "Fr" : ($local  =='en' ? $labelLocal = "En" :  $labelLocal = "Ar");
        
        return $this->createQueryBuilder('c')
        ->select('c.label'.$labelLocal.' as labelLocal , c.slug , c.name ')
        ->leftJoin("c.parent", "parent")
        ->addSelect('parent.label'.$labelLocal.' as labelParentLocal')
        ->orderBy('c.name', 'ASC')
        ->getQuery()
        ->getResult();
      }
    

    /*
    public function findOneBySomeField($value): ?Category
    {
        return $this->createQueryBuilder('c')
            ->andWhere('c.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}