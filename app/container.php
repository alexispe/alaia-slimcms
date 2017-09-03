<?php
$container = $app->getContainer();


$container['pdo'] = function () {
  $dsn = 'mysql:host=localhost;dbname=alaia;charset=utf8';
  $usr = 'root';
  $pwd = 'root';
  $pdo = new \Slim\PDO\Database($dsn, $usr, $pwd);
  return $pdo;
};
$container['view'] = function ($container) {
  $dir = dirname(__DIR__);
  $view = new \Slim\Views\Twig($dir.'/app/views', [
      'cache' => false, //$dir.'/tmp/cache'
      'debug' => true
  ]);

  $basePath = rtrim(str_ireplace('index.php', '', $container['request']->getUri()->getBasePath()), '/');
  $view->addExtension(new Slim\Views\TwigExtension($container['router'], $basePath));
  $view->addExtension(new Twig_Extension_StringLoader());
  $view->addExtension(new Twig_Extension_Debug());


  return $view;
};
$container['v'] = function() {
  $v = new Respect\Validation\Validator;
  return $v;
};
