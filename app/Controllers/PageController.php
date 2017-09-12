<?php
namespace App\Controllers;


class PageController extends Controller {

  public function list($request, $response) {
    $stmt = $this->pdo()->select()
                       ->from('page');
    $stmt = $stmt->execute();
    $pages = $stmt->fetchAll();
    return $this->render($response, 'page/list.twig', ['pages' => $pages]);
  }

  public function create($request, $response) {
    if($request->isPost()) {
      $title = trim($request->getParam('title'));
      $link = strtolower(str_replace('.','',str_replace(' ','-',trim($request->getParam('title')))));
      if($title) {
        $stmt = $this->pdo()->insert(array('title', 'link'))->into('page')->values(array($title, $link));
        $insertId = $stmt->execute();
        $this->flash('La page "'.$title.'" a été crée');
        return $this->redirect($response, 'pageUpdate', ['id' => $insertId]);
      }
      else {
        $this->flash('Le titre de la page est invalide');
        return $this->redirect($response, 'pageCreate');
      }
    }
    else return $this->render($response, 'page/create.twig');
  }

  public function update($request, $response, $args) {
    if($request->isPost()) {
      $post = $_POST;
      $number_of_updates = 0;
      $page = $request->getParam('id');
      $all_blocks = array();
      $all_uniqid = array();
      foreach($post as $key => $value) {
        $identifier = explode("_", $key);
        if(count($identifier)==3) {
          if(!in_array($identifier[1], $all_uniqid)) array_push($all_uniqid, $identifier[1]);
        }
      }
      foreach($all_uniqid as $uniqid) {
        $current_block = array();
        foreach($post as $key => $value) {
          $identifier = explode("_", $key);
          if(count($identifier)==3) {
            if($uniqid == $identifier[1]) {
              if(!isset($current_block['block_template'])) $current_block['block_template'] = $identifier[0];
              $current_block[$identifier[2]] = $value;
            }
          }
        }
        $all_blocks[$uniqid] = $current_block;
      }
      $stmt = $this->pdo()->delete()->from('page_block')->where('page','=',$page);
      $affectedRows = $stmt->execute();
      foreach($all_blocks as $key => $block) {
        $stmt = $this->pdo()->insert(array('uniqid','page','block_template','variables','x','y'))->into('page_block')->values(array($key,$page,$block['block_template'],json_encode($block),$block['x'],$block['y']));
        $insertId = $stmt->execute();
      }

      $id = $request->getParam('id');
      $title = $request->getParam('title');
      $link = strtolower(str_replace('.','-',str_replace(' ','-',trim($request->getParam('link')))));

      $stmt = $this->pdo()->update(array('title'=>$title,'link'=>$link))->table('page')->where('id', '=', $id);
      $affectedRows = $stmt->execute();

      $this->flash('La page "'.$title.'" a été sauvegardée');
      return $this->redirect($response, 'pageUpdate', array('id' => $id));
    }
    else {
      // Récupération de la page
      $stmt = $this->pdo()->select()->from('page')->where('id','=',$args['id']);
      $stmt = $stmt->execute();
      $page = $stmt->fetch();
      // Récupération des blocs de la page
      $stmt = $this->pdo()->select()->from('page_block')->where('page','=',$args['id']);
      $stmt = $stmt->execute();
      $page_blocks = $stmt->fetchAll();
      // Traitement des données des blocs et des templates des formulaires
      $blocks = array();
      foreach($page_blocks as $page_block) {
        $stmt = $this->pdo()->select()->from('block_template')->where('id','=',$page_block['block_template']);
        $stmt = $stmt->execute();
        $block_template = $stmt->fetch();
        $variables = json_decode($page_block['variables']);

        $template_var = array();
        $replace_with = array();
        foreach($variables as $key=>$variable) {
          array_push($template_var,'{{'.$key.'}}');
          array_push($replace_with,$variable);
          if($key=='x') $x = $variable;
          if($key=='y') $y = $variable;
        }
        array_push($template_var,'{{widget.id}}');
        array_push($replace_with,$page_block['block_template'].'_'.$page_block['uniqid']);

        $coords = array('x'=>$x,'y'=>$y);
        $size = array('width'=>$block_template['width'],'height'=>$block_template['height']);
        array_push($blocks,array(
          'uniqid' => $page_block['block_template'].'_'.$page_block['uniqid'],
          'coords' => $coords,
          'size' => $size,
          'data' => str_replace($template_var, $replace_with, $block_template['content'])
        ));
      }
      // Récupération des blocs
      $stmt = $this->pdo()->select()->from('block_template');
      $stmt = $stmt->execute();
      $block_templates = $stmt->fetchAll();
      return $this->render($response, 'page/update.twig', ['page' => $page, 'block_templates' => $block_templates, 'blocks' => $blocks]);
    }
  }

  public function delete($request, $response, $args) {
      $stmt = $this->pdo()->delete()->from('page')->where('id','=',$args['id']);
      $affectedRows = $stmt->execute();
      if($affectedRows) $this->flash('La page a été supprimée');
      else $this->flash('Impossible de supprimer la page', 'warning');
      return $this->redirect($response, 'pageList');
  }
}
