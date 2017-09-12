<?php
require '../vendor/autoload.php';

use \App\Controllers\HomeController;
use \App\Controllers\PageController;
use \App\Controllers\UserController;
use \App\Controllers\RoleController;
use \App\Controllers\PostController;
use \App\Controllers\CategorieController;
use \App\Controllers\AdminController;

use \App\Middlewares\AccessAdminMiddleware;
use \App\Middlewares\FlashMiddleware;

session_start();

$app = new \Slim\App([
  'settings' => [
    'displayErrorDetails' => true
  ]
]);


require('../app/settings.php');
require('../app/container.php');

$container = $app->getContainer();

$app->add(new FlashMiddleware($container->view->getEnvironment()));

$app->group('/'.$settings['admin']['url'], function () use ($app) {
  $app->get('/page', PageController::class.':list')->setName('pageList');
  $app->get('/page/create', PageController::class.':create')->setName('pageCreate');
  $app->post('/page/create', PageController::class.':create');
  $app->get('/page/delete/{id}', PageController::class.':delete')->setName('pageDelete');
  $app->get('/page/update/{id}', PageController::class.':update')->setName('pageUpdate');
  $app->post('/page/update/{id}', PageController::class.':update');

  $app->get('/user', UserController::class.':list')->setName('userList');
  $app->get('/user/create', UserController::class.':create')->setName('userCreate');
  $app->post('/user/create', UserController::class.':create');
  $app->get('/user/delete/{id}', UserController::class.':delete')->setName('userDelete');
  $app->get('/user/update/{id}', UserController::class.':update')->setName('userUpdate');
  $app->post('/user/update/{id}', UserController::class.':update');

  $app->get('/role', RoleController::class.':list')->setName('roleList');
  $app->post('/role/create', RoleController::class.':create')->setName('roleCreate');
  $app->get('/role/delete/{id}', RoleController::class.':delete')->setName('roleDelete');
  $app->post('/role/update/{id}', RoleController::class.':update')->setName('roleUpdate');

  $app->get('/post', PostController::class.':list')->setName('postList');
  $app->get('/post/create', PostController::class.':create')->setName('postCreate');
  $app->post('/post/create', PostController::class.':create');
  $app->get('/post/delete/{id}', PostController::class.':delete')->setName('postDelete');
  $app->get('/post/update/{id}', PostController::class.':update')->setName('postUpdate');
  $app->post('/post/update/{id}', PostController::class.':update');

  $app->get('/categorie', CategorieController::class.':list')->setName('categorieList');
  $app->post('/categorie/create', CategorieController::class.':create')->setName('categorieCreate');
  $app->get('/categorie/delete/{id}', CategorieController::class.':delete')->setName('categorieDelete');
  $app->post('/categorie/update/{id}', CategorieController::class.':update')->setName('categorieUpdate');
})->add(new \App\Middlewares\AccessAdminMiddleware($container, $_SESSION['admin']['id']));

$app->group('/'.$settings['admin']['url'], function () use ($app) {
  $app->get('/login', AdminController::class.':login')->setName('adminLogin');
  $app->post('/login', AdminController::class.':login');
  $app->get('/logout', AdminController::class.':logout')->setName('adminLogout');
});

$app->get('/{link}', HomeController::class.':home')->setName('index');


$app->run();
