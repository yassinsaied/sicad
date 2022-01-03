<?php

namespace App\Form\Transformer;

use Symfony\Component\Form\DataTransformerInterface;
use Symfony\Component\Form\Exception\TransformationFailedException;
use Symfony\Contracts\Translation\TranslatorInterface;

class DateTransformer implements  DataTransformerInterface
{   
    private  $translator;

    public function __construct(TranslatorInterface $translator)
    {

        $this->translator = $translator;
    }



    public function transform($date)
    {
       if($date === null){
          
          return '';
       }

       return $date->format('Y-m-d');

    }



    public function reverseTransform($stringDate)
    {
      
         if($stringDate === null) {
          
            $exceptionErrorMessage = sprintf('An issue with number "%s" does not exist!', $stringDate);
            throw new TransformationFailedException($exceptionErrorMessage);

         }
        // dd($stringDate) ;
        
         $date = \DateTime::createFromFormat('Y-m-d' , $stringDate);
        // dd($date) ;

         if($date === false) {
            
            $exceptionErrorMessage = sprintf('format date ivalide "%s"', $stringDate);
            $failure = new TransformationFailedException($exceptionErrorMessage);
            $failure->setInvalidMessage($stringDate.' '.$this->translator->trans('date.ivalid.article'));

            throw $failure;
         }

         return   $date ;
        
    }
    
}
