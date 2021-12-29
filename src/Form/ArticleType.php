<?php

namespace App\Form;

use App\Entity\Article;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\CollectionType;
use FOS\CKEditorBundle\Form\Type\CKEditorType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Contracts\Translation\TranslatorInterface;

use App\Entity\Category;

class ArticleType extends AbstractType
{
    private  $translator;

    public function __construct(TranslatorInterface $translator)
    {

        $this->translator = $translator;
    }


    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('titleFr')
            ->add('titleEn')
            ->add('titleAr')
            ->add('contentFr', CKEditorType::class, [

                'config' => [
                    'config_name' => 'sicad_ck',
                    'language' => $options['local']
                ]

            ])

            ->add('contentEn', CKEditorType::class, [

                'config' => [
                    'config_name' => 'sicad_ck',
                    'language' => $options['local']
                ]

            ])

            ->add('contentAr', CKEditorType::class, [

                'config' => [
                    'config_name' => 'sicad_ck',
                    'language' => $options['local']
                ]

            ])
            
            ->add('category', EntityType::class, [
                'class' => Category::class,
                'placeholder' => $this->translator->trans('placeholder.selecte.parent.categ'),
                'choice_label' => function (Category $category) use ($options) {
                    $options['local'] == 'fr' ? $labelLocal = $category->getLabelFr() : ($options['local'] == 'en' ? $labelLocal = $category->getLabelEn() :  $labelLocal = $category->getLabelAr());
                    return $labelLocal;
                },
            ])

            ->add('images', CollectionType::class, [
                'label' => false,
                'entry_type' => ImageType::class,
                'allow_add' => true,
                'allow_delete' => true,
                'prototype' => true,

            ])

            ->add('dateNews' , TextType::class, [
                            
            ])

            ->add('addArticle', SubmitType::class);
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'local' => 'fr',
            'data_class' => Article::class,
        ]);
    }
}
