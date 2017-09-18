<?php
namespace App\Controllers;


class HomeController extends Controller {

  public function home($request, $response, $args) {
    $stmt = $this->pdo()->select()->from('page')->whereLike('link',$args['link']);
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
        $stmt = $this->pdo()->select()->from('post');
        $stmt = $stmt->execute();
        $posts = $stmt->fetchAll();
        $blog = '';

        foreach($posts as $post) {
          $blog_template_var = array('{{title}}','{{content}}','{{img}}');
          $blog_replace_with = array($post['title'],$post['content'],$post['img']);
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

    if($page) $this->render($response, 'home/home.twig', [ 'page' => $page, 'page_block' => $page_block ]);
    else $this->render($response, 'error/404.twig');
  }
}
