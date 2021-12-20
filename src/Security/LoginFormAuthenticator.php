<?php

namespace App\Security;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\RedirectResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Generator\UrlGeneratorInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;
use Symfony\Component\Security\Core\Exception\AuthenticationException;
use Symfony\Component\Security\Core\Exception\CustomUserMessageAuthenticationException;
use Symfony\Component\Security\Http\Authenticator\AbstractAuthenticator;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\UserBadge;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\CsrfTokenBadge;
use Symfony\Component\Security\Http\Authenticator\Passport\Passport;
use Symfony\Component\Security\Http\Authenticator\Passport\PassportInterface;
use Symfony\Component\Security\Http\Authenticator\Passport\Credentials\PasswordCredentials;
use Symfony\Component\Security\Core\Security;
use Symfony\Component\Security\Http\Authenticator\Passport\Badge\RememberMeBadge;
use Symfony\Contracts\Translation\TranslatorInterface;

class LoginFormAuthenticator extends AbstractAuthenticator
{   
    private $userRepo;
    private $urlGenerator;
    private  $translator ;

    public function __construct(UserRepository $userRepo , UrlGeneratorInterface $UrlGenerator , TranslatorInterface $translator)
    {
        $this->userRepo = $userRepo;
        $this->urlGenerator =  $UrlGenerator;
        $this->translator = $translator;
    }


    public function supports(Request $request): ?bool
    {  
        return ($request->getPathInfo() === '/login' && $request->isMethod('POST'));
    }

    public function authenticate(Request $request)
    {   
         
        $email = $request->request->get('email');
        $password = $request->request->get('password');
        $csrfToken = $request->request->get('csrf_token');
     
       
      
        return new Passport(
            new UserBadge($email, function($userIdentifier) {
                $user = $this->userRepo->findOneByEmail($userIdentifier);
                
                if (!$user) {
                    throw new CustomUserMessageAuthenticationException($this->translator->trans('user.notfound'));
                }

                if($user->getIsActivate() !== true){

                    throw new CustomUserMessageAuthenticationException($this->translator->trans('activate.account'));
                }

                return $user;
            }),
            new PasswordCredentials($password),
            [
                new CsrfTokenBadge('login_form_csrf', $csrfToken),
                new RememberMeBadge()
                
            ]
        );
    }

    public function onAuthenticationSuccess(Request $request, TokenInterface $token, string $firewallName): ?Response
    {
         //dd($firewallName);
        return new RedirectResponse($this->urlGenerator->generate("home_admin")) ;
    }

    public function onAuthenticationFailure(Request $request, AuthenticationException $exception): ?Response
    {
        $request->getSession()->set(Security::AUTHENTICATION_ERROR, $exception);
        return new RedirectResponse($this->urlGenerator->generate("login")) ;
    }

//    public function start(Request $request, AuthenticationException $authException = null): Response
//    {
//        /*
//         * If you would like this class to control what happens when an anonymous user accesses a
//         * protected page (e.g. redirect to /login), uncomment this method and make this class
//         * implement Symfony\Component\Security\Http\EntryPoint\AuthenticationEntryPointInterface.
//         *
//         * For more details, see https://symfony.com/doc/current/security/experimental_authenticators.html#configuring-the-authentication-entry-point
//         */
//    }
}
