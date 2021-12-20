<?php

namespace App\Form;

use App\Entity\Category;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Doctrine\ORM\EntityManagerInterface;
use App\Repository\CategoryRepository;

class CategoryType extends AbstractType
{   
    
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }


    public function buildForm(FormBuilderInterface $builder, array $options): void
    {   

     
        $builder
            ->add('name')
            ->add('labelFr')
            ->add('labelEn')
            ->add('labelAr')
            
            ->add('parent', EntityType::class, [
                    'class' => Category::class,
                    'placeholder' => 'Choose an option',
                    'required' => false,
                    'query_builder' => function (CategoryRepository $categoryRepository) {
                        return $categoryRepository->findParentCategory();
                    },
                     'choice_label' => function (Category $category) use ( $options ) {
                       $options['local'] =='fr'? $labelLocal = $category->getLabelFr() : ($options['local'] =='en' ? $labelLocal = $category->getLabelEn() :  $labelLocal = $category->getLabelAr());
                       return $labelLocal;
                     },      

            ])
            ->add('addCateg' , SubmitType::class);
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'local' =>'fr',
            'data_class' => Category::class,
        ]);
    }
}
