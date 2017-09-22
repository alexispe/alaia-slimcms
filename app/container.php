<?php
$container = $app->getContainer();


$container['pdo'] = function () {
  $source = file_get_contents('../app/install/init.json');
  $data = json_decode($source);
  $dsn = 'mysql:host='.$data->database[0]->host.';dbname='.$data->database[0]->dbname.';charset=utf8';
  $usr = $data->database[0]->user;
  $pwd = $data->database[0]->password;
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
