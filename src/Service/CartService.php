<?php
namespace App\Service;
use Symfony\Component\HttpFoundation\RequestStack;

class CartService{
    private const KEY = '_cart';
    private $requestStack;

    public function __construct(RequestStack $requestStack)
    {
        $this->requestStack = $requestStack;
    }
    
    public function getSession()
    {
        return $this->requestStack->getSession();
    }
    
    /**
     * @return array
     */
    public function getCart(): array {
        return $this->getSession()->get(self::KEY, []);
    }

    public function add(int $id, int $quantity = 1){
        //https://symfony.com/doc/current/session.html
        $cart = $this->getCart();
        $cart[$id] = $quantity;
        $this->getSession()->set(self::KEY, $cart);

    }
   
}