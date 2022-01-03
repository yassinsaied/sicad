<?php

namespace App\Entity;

use App\Repository\ImageRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\Validator\Constraints as Assert;



/**
 * @ORM\Entity(repositoryClass=ImageRepository::class)
 * @ORM\HasLifecycleCallbacks()
 */
class Image
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Article::class, inversedBy="images")
     */
    private $article;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $name;

   /**
     * @Assert\File(
     *     maxSize = "2048k",
     *     mimeTypes = {"image/jpeg","image/png" ,"image/jpg"},
     *     mimeTypesMessage = "file.valid.type" ,
     *     maxSizeMessage = "file.size.type"
     * )
     * 
     */
    private $imageFile;



    public function getId(): ?int
    {
        return $this->id;
    }

    public function getArticle(): ?Article
    {
        return $this->article;
    }

    public function setArticle(?Article $article): self
    {
        $this->article = $article;

        return $this;
    }

    public function getName(): ?string
    {
        return $this->name;
    }

    public function setName(string $name): self
    {
        $this->name = $name;

        return $this;
    }

  

    /* upload function and variable */


    public function getImageFile()
    {
        return $this->imageFile;
    }

    public function setImageFile(UploadedFile $file = null)
    {
        $this->imageFile = $file;
    
    }

    /**
     * @ORM\PrePersist()
     * @ORM\PreUpdate()
     */
    public function preUpload()
    {
        // If no file is set, do nothing
        if (null === $this->imageFile) {
            return;
        }
        $newName =  md5(uniqid()) . "." . $this->imageFile->guessExtension();
        $this->name =  $newName;
       
    }

    /**
     * @ORM\PostPersist()
     * @ORM\PostUpdate()
     */
    public function upload()
    {
        // If no file is set, do nothing
        if (null === $this->imageFile) {
            return;
        }

        // Move the file to the upload folder
        $this->imageFile->move(
            $this->getUploadRootDir(),
            $this->name
        );
    }

    
    /**
     * @ORM\PostRemove()
     */
    public function removeUpload()
    {
        // PostRemove => We no longer have the entity's ID => Use the name we saved
        if (file_exists($this->name)) {
            // Remove file
            unlink($this->getUploadRootDir() . '/' .$this->name);
        }
    }

    public function  getUploadRootDir()
    {
        // Upload directory
        return 'uploads/articles/';
        // This means /web/uploads/documents/
    }


    

    // public function __toString() {
    //     return $this->name;
    // }
    








}
