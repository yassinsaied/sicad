<?php

namespace App\Repository;

use App\Entity\Article;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @method Article|null find($id, $lockMode = null, $lockVersion = null)
 * @method Article|null findOneBy(array $criteria, array $orderBy = null)
 * @method Article[]    findAll()
 * @method Article[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class ArticleRepository extends ServiceEntityRepository
{
  public function __construct(ManagerRegistry $registry)
  {
    parent::__construct($registry, Article::class);
  }




  /**
   * @return Category[] Returns an array of Category  objects  width label of local
   * @param  local     current local language 
   */

  public function findAllArticleByTitleLocal($local)
  {
    $local == 'fr' ? $labelLocal = "Fr" : ($local  == 'en' ? $labelLocal = "En" :  $labelLocal = "Ar");

    return $this->createQueryBuilder('a')
      ->select('a as articleDetails')
      ->addselect('a.title' . $labelLocal . ' as titleLocal')
      ->Join("a.category", "category")
      ->addSelect('category.label' . $labelLocal . ' as categotyLocal')
      ->andWhere('category.isActivate = :isActivate')
      ->setParameter('isActivate', true)
      ->orderBy('a.dateNews', 'DESC')
      ->getQuery()
      ->getResult();
  }

  /**
   * @return Category[] Returns an array of Category  objects  width label of local
   * @param  local     current local language 
   */

  public function findAllArticleNotValide($local)
  {
    $local == 'fr' ? $labelLocal = "Fr" : ($local  == 'en' ? $labelLocal = "En" :  $labelLocal = "Ar");

    return $this->createQueryBuilder('a')
      ->select('a as articleDetails')
      ->addselect('a.title' . $labelLocal . ' as titleLocal')
      ->andWhere('a.isValid = :isValid')
      ->setParameter('isValid', false)
      ->Join("a.category", "category")
      ->addSelect('category.label' . $labelLocal . ' as categotyLocal')
      ->andWhere('category.isActivate = :isActivate')
      ->setParameter('isActivate', true)
      ->orderBy('a.dateNews', 'DESC')
      ->getQuery()
      ->getResult();
  }


  public function findCountArticleNotValide()
  {
    return $this->createQueryBuilder('a')
      ->select('count(a.id)')
      ->andWhere('a.isValid = :isValid')
      ->setParameter('isValid', false)
      ->getQuery()
      ->getSingleScalarResult();
  }

  public function findCountArticleNotPublished()
  {
    return $this->createQueryBuilder('a')
      ->select('count(a.id)')
      ->andWhere('a.isPublished = :isPublished')
      ->setParameter('isPublished', false)
      ->getQuery()
      ->getSingleScalarResult();
  }








  // /**
  //  * @return Article[] Returns an array of Article objects
  //  */
  /*
    public function findByExampleField($value)
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->orderBy('a.id', 'ASC')
            ->setMaxResults(10)
            ->getQuery()
            ->getResult()
        ;
    }
    */

  /*
    public function findOneBySomeField($value): ?Article
    {
        return $this->createQueryBuilder('a')
            ->andWhere('a.exampleField = :val')
            ->setParameter('val', $value)
            ->getQuery()
            ->getOneOrNullResult()
        ;
    }
    */
}
