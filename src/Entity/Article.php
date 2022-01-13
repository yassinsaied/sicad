<?php

namespace App\Entity;

use App\Repository\ArticleRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\String\Slugger\AsciiSlugger;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass=ArticleRepository::class)
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity(
 *     fields={"slug"},
 *     message="title.article.taken"
 * )
 */
class Article
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

    /**
     * @ORM\ManyToOne(targetEntity=Category::class, inversedBy="articles")
     * @ORM\JoinColumn(nullable=false)
     * @Assert\NotBlank(
     *              message = "req.categ.article"
     * ) 
     */
    private $category;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(
     *              message = "req.titlefr.article"
     * )  
     * @Assert\Length(
     *      min = 2,
     *      max = 200,
     *      minMessage = "min.titlefr.article",
     *      maxMessage = "max.titlefr.article"
     * ) 
     */
    private $titleFr;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(
     *              message = "req.titleen.article"
     * )  
     * @Assert\Length(
     *      min = 2,
     *      max = 200,
     *      minMessage = "min.titleen.article",
     *      maxMessage = "max.titleen.article"
     * )  
     */
    private $titleEn;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(
     *              message = "req.titlear.article"
     * )  
     * @Assert\Length(
     *      min = 2,
     *      max = 200,
     *      minMessage = "min.titlear.article",
     *      maxMessage = "max.titlear.article"
     * )  
     */
    private $titleAr;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank(
     *              message = "req.contentfr.article"
     * )  
     * @Assert\Length(
     *      min = 10 ,
     *      minMessage = "min.contentfr.article",
     *      
     * )  
     */
    private $contentFr;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank(
     *              message = "req.contenten.article"
     * )  
     * @Assert\Length(
     *      min = 10,
     *      minMessage = "min.contenten.article",
     *      
     * ) 
     */
    private $contentEn;

    /**
     * @ORM\Column(type="text")
     * @Assert\NotBlank(
     *              message = "req.contentar.article"
     * )  
     * @Assert\Length(
     *      min = 10,
     *      minMessage = "min.contentar.article",
     *      
     * )  
     */
    private $contentAr;

    /**
     * @ORM\Column(type="datetime_immutable")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="datetime_immutable", nullable=true)
     */
    private $updatedAt;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isValid;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isPublished;

    /**
     * @ORM\OneToMany(targetEntity=Image::class, mappedBy="article" , cascade={"persist"}, orphanRemoval=true)
     * @Assert\Valid
     */
     
     
    private $images;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

    /**
     * @ORM\Column(type="date", nullable=true)
     */
    private $dateNews;

    public function __construct()
    {
        $this->images = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getCategory(): ?Category
    {
        return $this->category;
    }

    public function setCategory(?Category $category): self
    {
        $this->category = $category;

        return $this;
    }

    public function getTitleFr(): ?string
    {
        return $this->titleFr;
    }

    public function setTitleFr(?string $titleFr): self
    {
        $this->titleFr = $titleFr;

        return $this;
    }

    public function getTitleEn(): ?string
    {
        return $this->titleEn;
    }

    public function setTitleEn(?string $titleEn): self
    {
        $this->titleEn = $titleEn;

        return $this;
    }

    public function getTitleAr(): ?string
    {
        return $this->titleAr;
    }

    public function setTitleAr(?string $titleAr): self
    {
        $this->titleAr = $titleAr;

        return $this;
    }

    public function getContentFr(): ?string
    {
        return $this->contentFr;
    }

    public function setContentFr(?string $contentFr): self
    {
        $this->contentFr = $contentFr;

        return $this;
    }

    public function getContentEn(): ?string
    {
        return $this->contentEn;
    }

    public function setContentEn(?string $contentEn): self
    {
        $this->contentEn = $contentEn;

        return $this;
    }

    public function getContentAr(): ?string
    {
        return $this->contentAr;
    }

    public function setContentAr(?string $contentAr): self
    {
        $this->contentAr = $contentAr;

        return $this;
    }

    public function getCreatedAt(): ?\DateTimeImmutable
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeImmutable $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    public function getUpdatedAt(): ?\DateTimeImmutable
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeImmutable $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getIsValid(): ?bool
    {
        return $this->isValid;
    }

    public function setIsValid(bool $isValid): self
    {
        $this->isValid = $isValid;

        return $this;
    }

    public function getIsPublished(): ?bool
    {
        return $this->isPublished;
    }

    public function setIsPublished(bool $isPublished): self
    {
        $this->isPublished = $isPublished;

        return $this;
    }

    /**
     * @return Collection|Image[]
     */
    public function getImages(): Collection
    {
        return $this->images;
    }

    public function addImage(Image $image): self
    {
        if (!$this->images->contains($image)) {
            $this->images[] = $image;
            $image->setArticle($this);
        }

        return $this;
    }

    public function removeImage(Image $image): self
    {
        if ($this->images->removeElement($image)) {
            // set the owning side to null (unless already changed)
            if ($image->getArticle() === $this) {
                $image->setArticle(null);
            }
        }

        return $this;
    }

    public function getSlug(): ?string
    {
        return $this->slug;
    }

    public function setSlug(string $slug): self
    {
        $this->slug = $slug;

        return $this;
    }


    public function getDateNews(): ?\DateTimeInterface
    {
        return $this->dateNews;
    }

    public function setDateNews(?\DateTimeInterface $dateNews): self
    {
        $this->dateNews = $dateNews;

        return $this;
    }



    /**
     * Function To Make unique slug
     *
     * @ORM\PrePersist
     */

    public function makeSlugUser()
    {  
       $slugger = new AsciiSlugger();
       $randomStr = substr(md5(mt_rand()), 0, 5);;
       $slug = $slugger->slug($this->getTitleFr()."-".$randomStr);
       $this->setSlug($slug);
    
    }


    /**
     * Function To Make curret default field of article
     *
     *@ORM\PrePersist
     *
     * @return void
     */

    public function defaultArticleConfig()
    {

        $this->createdAt =  new \DateTimeImmutable();
        $this->isPublished = false;
        $this->isValid = false;
    }

    public function __toString() {
        return $this->titleFr;
    }

  
}
