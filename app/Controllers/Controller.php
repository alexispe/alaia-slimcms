<?php
namespace App\Controllers;

class Controller {
  private $container;

  public function __construct($container) {
    $this->container = $container;
  }

  public function render($response, $file, $params = []) {
    $this->container->view->render($response, $file, $params);
  }

  public function pdo() {
    return $this->container->pdo;
  }

  public function redirect($response, $name, $params = []) {
    return $response->withStatus(302)->withHeader('Location', $this->container->router->pathFor($name, $params));
  }

  public function flash($message, $type = 'success') {
    if(!isset($_SESSION['flash'])) $_SESSION['flash'] = [];
    return $_SESSION['flash'][$type] = $message;
  }
}
