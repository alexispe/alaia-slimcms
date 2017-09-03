<?php

$settings = [
  'admin' => [
    'id' => $_SESSION['admin']['id'],
    'callable' => function($container) {
      return new \App\Middlewares\AccessAdminMiddleware($container, $_SESSION['admin']['id']);
    },
    'url' => 'admin'
  ]
];
