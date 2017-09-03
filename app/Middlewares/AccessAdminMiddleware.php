<?php
namespace App\Middlewares;

class AccessAdminMiddleware {

  private $admin_id;
  private $container;

  public function __construct($container, $admin_id) {
    $this->container = $container;
    $this->admin_id = $admin_id;
  }

  public function __invoke($request, $response, $next) {
    if($this->admin_id==1) $response = $next($request, $response);
    else {
      $uri = $request->getUri()->withPath($this->container->router->pathFor('adminLogin'));
      return $response = $response->withRedirect($uri, 403);
    }
    return $response;
  }
}
