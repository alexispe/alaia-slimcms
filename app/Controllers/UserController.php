<?php
namespace App\Controllers;


class UserController extends Controller {

  public function list($request, $response) {
    //$this->flash('Message de succès');

    $req = $this->pdo()->prepare('SELECT u.*, r.name AS role FROM user u INNER JOIN role r ON u.role = r.id');
    $req->execute();
    $users = $req->fetchAll();
    $req->closeCursor();
    return $this->render($response, 'user/list.twig', ['users' => $users]);
  }

  public function create($request, $response) {
    if($request->isPost()) {
      $firstname = trim($request->getParam('firstname'));
      $lastname = trim($request->getParam('lastname'));
      $email = trim($request->getParam('email'));
      $password = trim($request->getParam('password'));
      $role = $request->getParam('role');
      if($email != '') {
        $insertStatement = $this->pdo()->insert(array('firstname','lastname','email','password','role'))
                       ->into('user')
                       ->values(array($firstname,$lastname,$email,$password,$role));
        $insertStatement->execute(false);
        $this->flash('L\'utilisateur "'.$email.'" a été crée');
      }
      else $this->flash('L\'email est obligatoire','warning');
      return $this->redirect($response, 'userList');
    }
    else {
      $stmt = $this->pdo()->select()->from('role');
      $stmt = $stmt->execute();
      $roles = $stmt->fetchAll();
      return $this->render($response, 'user/create.twig', ['roles' => $roles]);
    }
  }

  public function update($request, $response, $args) {
    if($request->isPost()) {
      $id = $args['id'];
      $firstname = trim($request->getParam('firstname'));
      $lastname = trim($request->getParam('lastname'));
      $email = trim($request->getParam('email'));
      $password = trim($request->getParam('password'));
      $role = $request->getParam('role');
      $stmt = $this->pdo()->update(array('firstname'=>$firstname,'lastname'=>$lastname,'email'=>$email,'password'=>$password,'role'=>$role))
                             ->table('user')
                             ->where('id','=',$id);
      $affectedRows = $stmt->execute();
      if($affectedRows) $this->flash('L\'utilisateur "'.$email.'" a été modifié');
      else $this->flash('Impossible de modifier l\'utilisateur', 'warning');
      return $this->redirect($response, 'userUpdate', array('id' => $id));
    }
    else {
      $id = $args['id'];
      $req = $this->pdo()->prepare('SELECT u.*, r.name AS role, r.id AS idrole FROM user u INNER JOIN role r ON u.role = r.id WHERE u.id=:id ');
      $req->bindParam(':id', $id);
      $req->execute();
      $user = $req->fetch();
      $req->closeCursor();
      $req = $this->pdo()->prepare('SELECT * FROM role');
      $req->execute();
      $roles = $req->fetchAll();
      $req->closeCursor();
      return $this->render($response, 'user/update.twig', ['user' => $user, 'roles' => $roles]);
    }
  }

  public function delete($request, $response, $args) {
      $id = $args['id'];
      $req = $this->pdo()->prepare('DELETE FROM user WHERE id=:id');
      $req->bindParam(':id', $id);
      $req->execute();
      $req->closeCursor();
      $this->flash('L\'utilisateur a été supprimée');
      return $this->redirect($response, 'userList');
  }
}
