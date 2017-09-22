<?php
namespace App\Controllers;


class HomeController extends Controller {

  public function home($request, $response, $args) {
    if($args['link']) $link = $args['link'];
    else $link = 'bienvenue';

    // Vérification de l'installation
    $source = file_get_contents('../app/install/init.json');
    $data = json_decode($source);
    if($data->init == false) {
      return $response->getBody()->write("Vous devez configurer l'accès à la base de donnée dans /app/install/init.json");
    }

    $stmt = $this->pdo()->select()->from('menu');
    $stmt = $stmt->execute();
    $menu = $stmt->fetchAll();

    $stmt = $this->pdo()->select()->from('page')->whereLike('link',$link);
    $stmt = $stmt->execute();
    $page = $stmt->fetch();

    $stmt = $this->pdo()->select()->from('page_block')->where('page', '=', $page['id'])->orderBy('y');
    $stmt = $stmt->execute();
    $page_block = $stmt->fetchAll();

    foreach ($page_block as $key => $block) {
      $stmt = $this->pdo()->select()->from('block_template')->where('id', '=', $block['block_template']);
      $stmt = $stmt->execute();
      $block_template = $stmt->fetch();

      $variables = json_decode($block['variables']);
      $template_var = array();
      $replace_with = array();
      if($block_template['title']=='blog') {
        $stmt = $this->pdo()->select()->from('post')->join('categorie', 'categorie.id', '=', 'post.categorie', 'INNER')->orderBy('post.id', 'DESC');;
        $stmt = $stmt->execute();
        $posts = $stmt->fetchAll();
        $blog = '';

        foreach($posts as $post) {
          $createdAt = date_format(date_create($post['createdAt']), 'd/m/Y');
          $blog_template_var = array('{{title}}','{{content}}','{{img}}','{{categorie}}','{{date}}');
          $blog_replace_with = array($post['title'],$post['content'],$post['img'],$post['name'],$createdAt);
          $blog .= str_replace($blog_template_var, $blog_replace_with, $block_template['template_inner']);
        }
        array_push($template_var,'{{blog}}');
        array_push($replace_with,$blog);
      }
      foreach($variables as $key2 => $variable) {
        array_push($template_var,'{{'.$key2.'}}');
        array_push($replace_with,$variable);
      }
      $page_block[$key]['content'] = str_replace($template_var, $replace_with, $block_template['template']);
    }

    if($page) $this->render($response, 'home/home.twig', [ 'page' => $page, 'page_block' => $page_block, 'menu' => $menu]);
    else $this->render($response, 'error/404.twig');
  }

  public function contact($request, $response) {
    if($request->isPost()) {
      $email = trim($request->getParam('email'));
      $content = trim($request->getParam('content'));
      $insertStatement = $this->pdo()->insert(array('email','content','createdAt'))
                     ->into('contact')
                     ->values(array($email,$content,date("Y-m-d H:i:s")));
      $insertStatement->execute(false);
      $this->flash('Votre demande a bien été prise en compte. Nous vous répondrons au plus vite.<br>Merci pour votre participation.');

      return $this->redirect($response, 'index');
    }
  }
}
