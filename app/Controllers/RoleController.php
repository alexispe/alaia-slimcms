<?php
namespace App\Controllers;


class RoleController extends Controller {

  public function list($request, $response) {
    //$this->flash('Message de succès');

    $stmt = $this->pdo()->select()->from('role');
    $stmt = $stmt->execute();
    $roles = $stmt->fetchAll();
    return $this->render($response, 'role/list.twig', ['roles' => $roles]);
  }

  public function create($request, $response) {
    $role = trim($request->getParam('role'));
    if($role != '') {
      $insertStatement = $this->pdo()->insert(array('name'))
                     ->into('role')
                     ->values(array($role));
      $insertStatement->execute(false);
      $this->flash('Le rôle "'.$role.'" a été crée');
    }
    else $this->flash('Le rôle est obligatoire','warning');
    return $this->redirect($response, 'roleList');
  }

  public function update($request, $response, $args) {
    $role = trim($request->getParam('role'));
    $stmt = $this->pdo()->update(array('name'=>$role))->table('role')->where('id','=',$args['id']);
    $updatedRows = $stmt->execute();
    if($updatedRows) $this->flash('Le rôle a été modifié');
    else $this->flash('Impossible de modifier le rôle', 'warning');
    return $this->redirect($response, 'roleList');
  }

  public function delete($request, $response, $args) {
      $stmt = $this->pdo()->delete()->from('role')->where('id','=',$args['id']);
      $affectedRows = $stmt->execute();
      if($affectedRows) $this->flash('Le rôle a été supprimée');
      else $this->flash('Impossible de supprimer le rôle', 'warning');
      return $this->redirect($response, 'roleList');
  }
}
