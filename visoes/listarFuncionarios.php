<?php
    session_start();
    include('includes/config.php');
    $sql ="SELECT f.*,p.nome,p.email,p.telefone FROM trabalho_concessionaria.funcionario as f
    JOIN trabalho_concessionaria.Pessoa as p
    ON p.id = f.id ";
    $query= $dbh -> prepare($sql);
    $query-> execute();
    while($row=$query->fetch(PDO::FETCH_OBJ)){
        $list[] = $row;
    }
?>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title> Listar Funcionarios </title>
    <!-- BOOTSTRAP CORE STYLE  -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>


</head>

<body>
<!------MENU SECTION START-->
<?php include('includes/header.php');?>
<!-- MENU SECTION END-->

<div class="content-wrapper">

<br>

<div class="container">

<!--BOOK DIV START-->           
<div class="custom-table table-responsive-lg">
    <table class="mb-0 table table-hover table-striped">
        <thead class="thead-dark">
            <tr>
                <th class="column0">ID</th>
                <th class="column1">Nome</th>
                <th class="column2">telefone</th>
                <th class="column3">agencia</th>
                <th class="column4">conta</th>
                <th class="column5" colspan="2" style="text-align: center">Ação</th>
            </tr>
        </thead>
        <tbody>
        <?php foreach($list as $var) { ?>
            <tr>
                <td class="column0 text-nowrap"><?php echo $var->id;?></td> 
                <td class="column1 text-nowrap"><?php echo $var->nome;?></td> 
                <td class="column2"><?php echo $var->telefone;?></td>
                <td class="column3"><?php echo $var->agencia;?></td>
                <td class="column4" style="text-align: left"><?php echo $var->conta;?></td>

                <td>
                    <div> 
                        <?php
                        if($query->rowCount() > 0)
                        {
                           
                         echo ('<a href="editarLivro.php?bookId='.$var->id.'"><button class="btn btn-secondary btn-sm" ><i class="fa fa-pencil "></i> Editar</button>');
                                   
                        } 
                        ?>
                    </div>
                </td>   
                <td>
                    <div> 
                        <?php
                        if($query->rowCount() > 0)
                        {
                           
                         echo ('<a href="PagarFuncionario.php?bookId='.$var->id.'"><button class="btn btn-secondary btn-sm" ><i class="fa fa-pencil "></i> Pagar</button>');
                                   
                        } 
                        ?>
                    </div>
                </td>          
            </tr>
        <?php } ?>
        </tbody>
    </table>
</div>
<!---BOOK DIV END-->            
       
    </div>
</div>

<!-- CONTENT-WRAPPER SECTION END-->
    <?php include('includes/footer.php');?>


</body>
</html>

