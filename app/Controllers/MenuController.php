<?php
namespace App\Controllers;


class MenuController extends Controller {

  public function list($request, $response) {
    $stmt = $this->pdo()->select()->from('menu');
    $stmt = $stmt->execute();
    $menus = $stmt->fetchAll();
    return $this->render($response, 'menu/list.twig', ['menus' => $menus]);
  }

  public function create($request, $response) {
    $title = trim($request->getParam('title'));
    $link = trim($request->getParam('link'));

    $insertStatement = $this->pdo()->insert(array('title','link'))->into('menu')->values(array($title,$link));
    $insertStatement->execute(false);
    $this->flash('Le lien "'.$title.'" a été crée');
    return $this->redirect($response, 'menuList');
  }

  public function delete($request, $response, $args) {
      $stmt = $this->pdo()->delete()->from('menu')->where('id','=',$args['id']);
      $affectedRows = $stmt->execute();
      if($affectedRows) $this->flash('Le lien a été supprimé');
      else $this->flash('Impossible de supprimer le lien', 'warning');
      return $this->redirect($response, 'menuList');
  }
}
