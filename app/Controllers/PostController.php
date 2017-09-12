<?php
namespace App\Controllers;


class PostController extends Controller {

  public function list($request, $response) {
    $stmt = $this->pdo()->select()->from('post');
    $stmt = $stmt->execute();
    $posts = $stmt->fetchAll();
    return $this->render($response, 'post/list.twig', ['posts' => $posts]);
  }

  public function create($request, $response) {
    if($request->isPost()) {
      $title = trim($request->getParam('title'));
      $content = trim($request->getParam('content'));
      $categorie = $request->getParam('categorie');
      $insertStatement = $this->pdo()->insert(array('title','content','categorie','author'))
                     ->into('post')
                     ->values(array($title,$content,$categorie,1));
      $insertStatement->execute(false);
      $this->flash('L\'article "'.$title.'" a été crée');

      return $this->redirect($response, 'postList');
    }
    else {
      $stmt = $this->pdo()->select()->from('categorie');
      $stmt = $stmt->execute();
      $categories = $stmt->fetchAll();
      return $this->render($response, 'post/create.twig', ['categories' => $categories]);
    }
  }

  public function update($request, $response, $args) {
    if($request->isPost()) {
      $id = $args['id'];
      $title = trim($request->getParam('title'));
      $content = trim($request->getParam('content'));
      $categorie = $request->getParam('categorie');
      $stmt = $this->pdo()->update(array('title'=>$title,'content'=>$content,'categorie'=>$categorie))->table('post')->where('id','=',$args['id']);
      $updatedRows = $stmt->execute();
      if($updatedRows) $this->flash('L\'article a été modifié');
      else $this->flash('Impossible de modifier l\'article', 'warning');
      return $this->redirect($response, 'postUpdate', array('id' => $id));
    }
    else {
      $id = $args['id'];
      $stmt = $this->pdo()->select()->from('post')->join('categorie', 'categorie.id', '=', 'post.categorie', 'INNER')->where('post.id','=',$id);
      $stmt = $stmt->execute();
      $post = $stmt->fetch();
      $stmt = $this->pdo()->select()->from('categorie');
      $stmt = $stmt->execute();
      $categories = $stmt->fetchAll();
      return $this->render($response, 'post/update.twig', ['post' => $post, 'categories' => $categories]);
    }
  }

  public function delete($request, $response, $args) {
      $stmt = $this->pdo()->delete()->from('post')->where('id','=',$args['id']);
      $affectedRows = $stmt->execute();
      if($affectedRows) $this->flash('L\'article à été supprimé');
      else $this->flash('Impossible de supprimer l\'article', 'warning');
      return $this->redirect($response, 'postList');
  }
}
