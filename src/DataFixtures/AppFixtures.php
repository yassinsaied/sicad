<?php

namespace App\DataFixtures;

use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use App\Entity\User;


class AppFixtures extends Fixture
{

    private $userPasswordHashe;

    public function __construct(UserPasswordHasherInterface $UserPasswordHasherInterface)
    {
        $this->userPasswordHashe = $UserPasswordHasherInterface;
    }


    public function load(ObjectManager $manager): void
    {
        $user = new User();
        $user->setFirstName("jams");
        $user->setLastName("dean");
        $user->setEmail("dean.jams5458@gmail.com");
        $user->setRoles(array('ROLE_USER'));
        $user->setAddress("582th streat one cas--append Californie 6625s");
        $user->setTel(55223369);
        $plaintextPassword = "password8*";
        $hashedPassword = $this->userPasswordHashe->hashPassword(
            $user,
            $plaintextPassword
        );
        $user->setPassword($hashedPassword);
        $manager->persist($user);
        $manager->flush();
    }
}
