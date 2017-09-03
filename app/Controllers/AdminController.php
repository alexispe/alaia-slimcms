<?php
namespace App\Controllers;


class AdminController extends Controller {

  public function login($request, $response) {
    if($request->isPost()) {
      $pseudo = trim($request->getParam('pseudo'));
      $password = trim($request->getParam('password'));

      $stmt = $this->pdo()->select()->from('admin')->whereLike('pseudo',$pseudo)->whereLike('password',$password);
      $stmt = $stmt->execute();
      $admin = $stmt->fetch();

      if($admin) {
        $_SESSION['admin']['id'] = $admin['id'];
        return $this->redirect($response, 'pageList');
      }
      else {
        $this->flash('Les identifiants sont incorrects','warning');
        return $this->redirect($response, 'adminLogin');
      }
    }
    else return $this->render($response, 'admin/login.twig');
  }

  public function logout($request, $response) {
    $_SESSION['admin']['id']=0;
    $this->flash('Vous êtes bien déconnecté');
    return $this->redirect($response, 'adminLogin');
  }
}
