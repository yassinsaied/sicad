<?php

namespace App\Form;

use App\Entity\Article;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use App\Entity\Category;

class ArticleType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('titleFr')
            ->add('titleEn')
            ->add('titleAr')
            ->add('contentFr')
            ->add('contentEn')
            ->add('contentAr')
            ->add('category' , EntityType::class , [
                'class' => Category::class

            ])
            ->add('images' ,CollectionType::class, [
                'attr' => [
                  'required' => false
                 ],
                'entry_type' => ImageType::class,
                'allow_add' => true,  
                'prototype' => true, 
                      
            ])

            ->add('addArticle' ,SubmitType::class)
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Article::class,
        ]);
    }
}
