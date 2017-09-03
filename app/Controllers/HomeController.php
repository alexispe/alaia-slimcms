<?php
namespace App\Controllers;


class HomeController extends Controller {

  public function home($request, $response, $args) {
    $stmt = $this->pdo()->select()->from('page')->whereLike('link',$args['link']);
    $stmt = $stmt->execute();
    $page = $stmt->fetch();
    if($page) $this->render($response, 'home/home.twig', [ 'page' => $page, 'blog' => 'mon blog' ]);
    else $this->render($response, 'error/404.twig');
  }
}
