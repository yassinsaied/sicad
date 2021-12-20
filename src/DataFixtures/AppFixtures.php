<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Entity\User;
use App\Entity\Category;


class AppFixtures extends Fixture
{

    private $userPasswordHashe;

    public function __construct(UserPasswordHasherInterface $UserPasswordHasherInterface)
    {
        $this->userPasswordHashe = $UserPasswordHasherInterface;
    }


    // public function load(ObjectManager $manager): void
    // {
    //     $user = new User();
    //     $user->setFirstName("Robert");
    //     $user->setLastName("dinero");
    //     $user->setEmail("Robert.dinero@gmail.com");
    //     $user->setRoles(array('ROLE_USER'));
    //     $user->setAddress("Urban; 91 acres (36.8 ha)");
    //     $user->setTel(55223369);
    //     $user->setIsActivate(true);
    //     $user->setIsDeleted(false);
    //     $plaintextPassword = "azerty88*";
    //     $hashedPassword = $this->userPasswordHashe->hashPassword(
    //         $user,
    //         $plaintextPassword
    //     );
    //     $user->setPassword($hashedPassword);
    //     $manager->persist($user);
    //     $manager->flush();
    // }



    public function load(ObjectManager $manager): void
    {
        $cat = new Category();
        $cat->setName("Competitions");
        $cat->setLabelFR("Concours");
        $cat->setLabelEn("Competitions");
        $cat->setLabelAr("مناظرات");
        $cat->setCreatedAt(new \DateTimeImmutable());
        $manager->persist($cat);
        $manager->flush();
    }
}
