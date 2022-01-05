<?php

namespace App\Form;

use App\Entity\Category;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use App\Repository\CategoryRepository;
use Symfony\Contracts\Translation\TranslatorInterface;

class CategoryType extends AbstractType
{   
    
  
    private  $translator ;

    public function __construct(TranslatorInterface $translator)
    {
     
        $this->translator = $translator;
    }


    public function buildForm(FormBuilderInterface $builder, array $options): void
    {   

     
        $builder
         
            ->add('labelFr')
            ->add('labelEn')
            ->add('labelAr')
            
            ->add('parent', EntityType::class, [
                    'class' => Category::class,
                    'placeholder' => $this->translator->trans('placeholder.selecte.parent.categ'),
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
