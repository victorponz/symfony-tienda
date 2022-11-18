<?php

namespace App\Controller;
use App\Entity\Product;
use App\Service\CartService;
use App\Service\ProductsService;
use Doctrine\Persistence\ManagerRegistry;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;


#[Route(path:'/cart')]
class CartController extends AbstractController
{
    private $doctrine;
    private $repository;
    private $cart;
    public  function __construct(ManagerRegistry $doctrine, CartService $cart)
    {
        $this->doctrine = $doctrine;
        $this->repository = $doctrine->getRepository(Product::class);
        $this->cart = $cart;
    }
    #[Route('/', name: 'app_cart')]
    public function index(): Response
    {
        return $this->render('cart/index.html.twig', [
            'controller_name' => 'CartController',
        ]);
    }
    #[Route('/add/{id}', name: 'cart_add', methods: ['GET', 'POST'], requirements: ['id' => '\d+'])]
    public function cart_add(int $id): Response
    {
        $product = $this->repository->find($id);
        if (!$product)
            return new JsonResponse("[]", Response::HTTP_NOT_FOUND);
        
        $this->cart->add($id, 1);
        
        $data = [
            "id"=> $product->getId(),
            "name" => $product->getName(),
            "price" => $product->getPrice(),
            "photo" => $product->getPhoto(),
            "quantity" => $this->cart->getCart()[$product->getId()]
            ];
        return new JsonResponse($data, Response::HTTP_OK);
        
    }
}
