<?php
session_start();
include('includes/config.php');

// $funcionario_id = 1;
// $sql ="SELECT f.*,p.nome,p.email,p.telefone FROM trabalho_concessionaria.funcionario as f
// JOIN trabalho_concessionaria.Pessoa as p
// ON p.id = :funcionario_id ";
// $query = $dbh->prepare($sql);
// $query->bindValue(':funcionario_id',$funcionario_id);
// $query-> execute();
// while($row=$query->fetch(PDO::FETCH_OBJ)){
//     $results[] = $row;
// }
if(isset($_GET['funcionarioId'])) {
  $funcionario_id = $_GET['funcionarioId'];
  $sql ="SELECT f.*,p.id,p.nome,p.email,p.telefone FROM trabalho_concessionaria.funcionario as f
  JOIN trabalho_concessionaria.Pessoa as p
  ON p.id = f.id
  WHERE p.id=:funcionario_id";

  $query = $dbh->prepare($sql);
  $query->bindValue(':funcionario_id',$funcionario_id);
  $query-> execute();
  while($row=$query->fetch(PDO::FETCH_OBJ)){
      $results[] = $row;
  }

} else if(isset($_POST['nome'])){


  
  $id = $_POST['id'];
  $nome = $_POST['nome'];
  $email = $_POST['email'];
  $telefone = $_POST['telefone'];
  $agencia = $_POST['agencia'];
  $conta = $_POST['conta'];
  $sql = "UPDATE trabalho_concessionaria.Pessoa SET nome=:nome,email=:email,telefone=:telefone WHERE id = :funcionario_id";

  $query = $dbh->prepare($sql);
  $query->bindValue(':funcionario_id',$id);
  $query->bindValue(':nome',$nome);
  $query->bindValue(':email',$email);
  $query->bindValue(':telefone',$telefone);
  $query->execute();  
  
  $sql2 = "UPDATE trabalho_concessionaria.funcionario SET agencia=:agencia,conta=:conta WHERE id = :funcionario_id";

  $query2 = $dbh->prepare($sql2);
  $query2->bindValue(':funcionario_id',$id);
  $query2->bindValue(':agencia',$agencia);
  $query2->bindValue(':conta',$conta);
  $query2->execute();  
  
  //echo "<script type='text/javascript'>alert('O livro $nome foi atualizado com sucesso!');</script>";

  header('location:listarFuncionarios.php?funcionarioId=' . $id);


}


?>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title> Editar dados do funcionário </title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>


</head>

<body>
    <!------MENU SECTION START-->
<?php include('includes/header.php');?>
<!-- MENU SECTION END-->
<div class="content-wrapper"> 
<div class="container">
    <div class="page-header">
        <h2>Atualizar dados do Funcionário</h2>
    </div>

 
<form action="editarFuncionario.php" method="post">

  <div class="form-group">
    <label for="Nome">Nome</label>
    <input type="text" class="form-control" name="nome"  value ="<?php echo htmlentities($results[0]->nome); ?>  " >
  </div>
  <div class="form-group">
    <label for="Email">Email</label>
    <input type="text" class="form-control" name="email" value ="<?php echo htmlentities($results[0]->email); ?>  " >
  </div>
  <div class="form-group">
    <label for="telefone">Telefone</label>
    <input type="text" class="form-control" name="telefone" value ="<?php echo htmlentities($results[0]->telefone); ?>  " >
  </div>
  <div class="form-group">
    <label for="agencia">Agencia</label>
    <input type="number" class="form-control" name="agencia" value =<?php echo htmlentities($results[0]->agencia); ?>   >
  </div>
  <div class="form-group">
    <label for="conta">Conta</label>
    <input type="number" class="form-control" name="conta" value =<?php echo htmlentities($results[0]->conta); ?>   >
  </div>

  <div class="form-group">
    <label for="id">Id</label>
    <input type="number" class="form-control" name="id" value =<?php echo htmlentities($results[0]->id); ?>   >
  </div>


  <button id="SubmitButton" type="submit" class="btn btn-dark">Atualizar</button>

  
</form>
</div>
</div>

 <?php include('includes/footer.php');?>
      <!-- FOOTER SECTION END-->
    <script src="assets/js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS  -->
    <script src="assets/js/bootstrap.js"></script>
      <!-- CUSTOM SCRIPTS  -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
