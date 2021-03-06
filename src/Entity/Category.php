<?php

namespace App\Entity;

use App\Repository\CategoryRepository;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\String\Slugger\AsciiSlugger;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Doctrine\Common\Collections\ArrayCollection;


/**
 * @ORM\Entity(repositoryClass=CategoryRepository::class)
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity(
 *     fields={"slug"},
 *     message="slug.taken"
 * )
 */
class Category
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */
    private $id;

 

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(
     *              message = "req.labfr.cat"
     * )
     */
    private $labelFr;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     * @Assert\NotBlank(
     *              message = "req.laben.cat"
     * )
     */
    private $labelEn;

    /**
     * @ORM\Column(type="string", length=255 , nullable=true)
     * @Assert\NotBlank(
     *              message = "req.labar.cat"
     * )
     */
    private $labelAr;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

    /**
     * @ORM\Column(type="datetime_immutable")
     */
    private $createdAt;

    /**
     * @ORM\Column(type="datetime_immutable" , nullable=true)
     */
    private $updatedAt;


    /**
     * @ORM\OneToMany(targetEntity="Category", mappedBy="parent")
     **/
    protected $children;

    /**
     * @ORM\ManyToOne(targetEntity="Category", inversedBy="children")
     * @ORM\JoinColumn(name="parent_id", referencedColumnName="id" , nullable=true)
     **/
    protected $parent;

    /**
     * @ORM\OneToMany(targetEntity=Article::class, mappedBy="category")
     */
    private $articles;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isActivate;


    public function __construct()
    {
      
        $this->children = new ArrayCollection();
        $this->articles = new ArrayCollection();
    }


    public function getId(): ?int
    {
        return $this->id;
    }

  

    public function getLabelFr(): ?string
    {
        return $this->labelFr;
    }

    public function setLabelFr(string $labelFr): self
    {
        $this->labelFr = $labelFr;

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

    public function getChildren()
    {
        return $this->children;
    }

    public function getParent()
    {
        return $this->parent;
    }

    public function setParent($parent) :?self 
    {
       
            $this->parent = $parent;
        return $this;
    }


    /**
     * @ORM\PrePersist
     */

    public function defaultCategoryConfig()
    {  
       $slugger = new AsciiSlugger();
       $randomStr = substr(md5(mt_rand()), 0, 4);;
       $slug = $slugger->slug($this->getLabelFr()."-".$randomStr);
       $this->setSlug($slug);
       $this->setIsActivate(false);
    
    }

    public function getLabelEn(): ?string
    {
        return $this->labelEn;
    }

    public function setLabelEn(?string $labelEn): self
    {
        $this->labelEn = $labelEn;

        return $this;
    }

    public function getLabelAr(): ?string
    {
        return $this->labelAr;
    }

    public function setLabelAr(string $labelAr): self
    {
        $this->labelAr = $labelAr;

        return $this;
    }

    
    public function getIsActivate(): ?bool
    {
        return $this->isActivate;
    }

    public function setIsActivate(bool $isActivate): self
    {
        $this->isActivate = $isActivate;

        return $this;
    }

    public function __toString() {
        return $this->labelFr;
    }

    /**
     * @return Collection|Article[]
     */
    public function getArticles(): Collection
    {
        return $this->articles;
    }

    public function addArticle(Article $article): self
    {
        if (!$this->articles->contains($article)) {
            $this->articles[] = $article;
            $article->setCategory($this);
        }

        return $this;
    }

    public function removeArticle(Article $article): self
    {
        if ($this->articles->removeElement($article)) {
            // set the owning side to null (unless already changed)
            if ($article->getCategory() === $this) {
                $article->setCategory(null);
            }
        }

        return $this;
    }



}
