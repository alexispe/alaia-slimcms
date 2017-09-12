<?php
namespace App\Controllers;


class CategorieController extends Controller {

  public function list($request, $response) {
    $stmt = $this->pdo()->select()->from('categorie');
    $stmt = $stmt->execute();
    $categories = $stmt->fetchAll();
    return $this->render($response, 'categorie/list.twig', ['categories' => $categories]);
  }

  public function create($request, $response) {
    $categorie = trim($request->getParam('categorie'));
    if($categorie != '') {
      $insertStatement = $this->pdo()->insert(array('name'))
                     ->into('categorie')
                     ->values(array($categorie));
      $insertStatement->execute(false);
      $this->flash('La catégorie "'.$categorie.'" a été crée');
    }
    else $this->flash('La catégorie est obligatoire','warning');
    return $this->redirect($response, 'categorieList');
  }

  public function update($request, $response, $args) {
    $categorie = trim($request->getParam('categorie'));
    $stmt = $this->pdo()->update(array('name'=>$categorie))->table('categorie')->where('id','=',$args['id']);
    $updatedRows = $stmt->execute();
    if($updatedRows) $this->flash('La catégorie a été modifiée');
    else $this->flash('Impossible de modifier la catégorie', 'warning');
    return $this->redirect($response, 'categorieList');
  }

  public function delete($request, $response, $args) {
      $stmt = $this->pdo()->delete()->from('categorie')->where('id','=',$args['id']);
      $affectedRows = $stmt->execute();
      if($affectedRows) $this->flash('La catégorie a été supprimée');
      else $this->flash('Impossible de supprimer la catégorie', 'warning');
      return $this->redirect($response, 'categorieList');
  }
}
