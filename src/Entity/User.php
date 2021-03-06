<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use Symfony\Component\String\Slugger\AsciiSlugger;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;




/**
 * @ORM\Entity(repositoryClass=UserRepository::class)
 * @ORM\Table(name="`user`")
 * @ORM\HasLifecycleCallbacks()
 * @UniqueEntity(
 *     fields={"email"},
 *     message="email.teken"
 * )
 * @Vich\Uploadable
 */
class User implements UserInterface, PasswordAuthenticatedUserInterface, \Serializable
{
    /**
     * @ORM\Id
     * @ORM\GeneratedValue
     * @ORM\Column(type="integer")
     */

    private $id;

    /**
     * @ORM\Column(type="string", length=180, unique=true)
     * @Assert\NotBlank(
     *              message = "req.email"
     * )
     * @Assert\Email(
     *             message="valid.email"
     * )
     */
    private $email;

    /**
     * @ORM\Column(type="json")
     */
    private $roles = [];

    /**
     * @var string The hashed password
     * @ORM\Column(type="string")
     */
    private $password;


    // /**
    //  * @Assert\NotBlank(
    //  *              message = " "
    //  * )
    //  * @Assert\Regex(
    //  *     pattern = "/^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-+!*$@%_])([-+!*$@%_\w]{8,15})$/i",
    //  *     message = "valid.password"
    //  * )
    //  */
    // private $plainPassword;


    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(
     *          message = "req.firstname"
     * )
     
     */
    private $firstName;

    /**
     * @ORM\Column(type="string", length=255)
     * @Assert\NotBlank(
     *          message = "req.lastname"
     * )
     */
    private $lastName;

    /**
     * @ORM\Column(type="string", length=255)
     */
    private $slug;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $address;

    /**
     * @ORM\Column(type="integer", nullable=true)
     * @Assert\Regex(
     *     pattern = "/^[0-9]{8}$/i",
     *     message = "valid.phone"
     * )
     */
    private $tel;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isActivate;

    /**
     * @ORM\Column(type="boolean")
     */
    private $isDeleted;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $thumb;

    /**
     * @Assert\File(
     *     maxSize = "2048k",
     *     mimeTypes = {"image/jpeg","image/png" ,"image/jpg"},
     *     mimeTypesMessage = "file.valid.type" ,
     *     maxSizeMessage = "file.size.type"
     * )
     * 
     * @Vich\UploadableField(mapping="user_thumb", fileNameProperty="thumb")
     * 
     * @var File|null
     */
    private $thumbFile;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $gradJobe;

    /**
     * @ORM\Column(type="string", length=255, nullable=true)
     */
    private $functionJob;

    /**
     * @ORM\Column(type="datetime", nullable=true)
     */
    private $updateAt;

    /**
     * @ORM\Column(type="datetime"  , nullable=true)
     */
    private $createdAt;

    /**
     * @ORM\OneToMany(targetEntity=Article::class, mappedBy="user")
     */
    private $articles;

    public function __construct()
    {
        $this->articles = new ArrayCollection();
    }



    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(?string $email): self
    {
        $this->email = $email;

        return $this;
    }

    /**
     * A visual identifier that represents this user.
     *
     * @see UserInterface
     */
    public function getUserIdentifier(): string
    {
        return (string) $this->email;
    }

    /**
     * @deprecated since Symfony 5.3, use getUserIdentifier instead
     */
    public function getUsername(): string
    {
        return (string) $this->email;
    }

    /**
     * @see UserInterface
     */
    public function getRoles(): array
    {
        $roles = $this->roles;
        // guarantee every user at least has ROLE_USER
        $roles[] = 'ROLE_AUTHEUR';

        return array_unique($roles);
    }

    public function setRoles(array $roles): self
    {
        $this->roles = $roles;

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->password;
    }

    public function setPassword(string $password): self
    {
        $this->password = $password;

        return $this;
    }



    /**
     * Returning a salt is only needed, if you are not using a modern
     * hashing algorithm (e.g. bcrypt or sodium) in your security.yaml.
     *
     * @see UserInterface
     */
    public function getSalt(): ?string
    {
        return null;
    }

    /**
     * @see UserInterface
     */
    public function eraseCredentials()
    {
        // If you store any temporary, sensitive data on the user, clear it here
        // $this->plainPassword = null;
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


    public function getIsDeleted(): ?bool
    {
        return $this->isDeleted;
    }

    public function setIsDeleted(bool $isDeleted): self
    {
        $this->isDeleted = $isDeleted;

        return $this;
    }



    public function getFirstName(): ?string
    {
        return $this->firstName;
    }

    public function setFirstName(?string $firstName): self
    {
        $this->firstName = $firstName;

        return $this;
    }

    public function getLastName(): ?string
    {
        return $this->lastName;
    }

    public function setLastName(?string $lastName): self
    {
        $this->lastName = $lastName;

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

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(?string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getTel(): ?int
    {
        return $this->tel;
    }

    public function setTel(?int $tel): self
    {
        $this->tel = $tel;

        return $this;
    }

    public function getThumb(): ?string
    {
        return $this->thumb;
    }

    public function setThumb(?string $thumb): self
    {
        $this->thumb = $thumb;

        return $this;
    }



    /**
     * @ORM\PrePersist
     */

    public function makeSlugUser()
    {
        $slugger = new AsciiSlugger();
        $randomStr = substr(md5(mt_rand()), 0, 4);;
        $slug = $slugger->slug($this->getFirstName() . "-" . $this->getLastName() . "-" . $randomStr);
        $this->setSlug($slug);
    }



    public function setThumbFile(?File $thumbFile = null): void
    {
        $this->thumbFile = $thumbFile;

        if (null !== $thumbFile) {
            // It is required that at least one field changes if you are using doctrine
            // otherwise the event listeners won't be called and the file is lost
            $this->updatedAt = new \DateTime();
        }
    }

    public function getThumbFile(): ?File
    {
        return $this->thumbFile;
    }


    public function getUpdateAt(): ?\DateTimeInterface
    {
        return $this->updateAt;
    }

    public function setUpdateAt(?\DateTimeInterface $updateAt): self
    {
        $this->updateAt = $updateAt;

        return $this;
    }




    public function getGradJobe(): ?string
    {
        return $this->gradJobe;
    }

    public function setGradJobe(?string $gradJobe): self
    {
        $this->gradJobe = $gradJobe;

        return $this;
    }

    public function getFunctionJob(): ?string
    {
        return $this->functionJob;
    }

    public function setFunctionJob(?string $functionJob): self
    {
        $this->functionJob = $functionJob;

        return $this;
    }


    public function serialize()
    {

        return serialize(array(
            $this->id,
            $this->email,
            $this->password,
            $this->thumb,

        ));
    }

    public function unserialize($serialized)
    {

        list(
            $this->id,
            $this->email,
            $this->password,
            $this->thumb,

        ) = unserialize($serialized);
    }

    public function getCreatedAt(): ?\DateTimeInterface
    {
        return $this->createdAt;
    }

    public function setCreatedAt(\DateTimeInterface $createdAt): self
    {
        $this->createdAt = $createdAt;

        return $this;
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
            $article->setUser($this);
        }

        return $this;
    }

    public function removeArticle(Article $article): self
    {
        if ($this->articles->removeElement($article)) {
            // set the owning side to null (unless already changed)
            if ($article->getUser() === $this) {
                $article->setUser(null);
            }
        }

        return $this;
    }
}
