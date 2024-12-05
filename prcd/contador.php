<?php

require('../prcd/conn.php');

$producto = $_POST['producto'];
$num = $_POST['num'];

// $sql = "SELECT * FROM inventario WHERE categoria = '$producto' ORDER BY id ASC";
$sql = "SELECT COUNT(*) as contador FROM inventario WHERE categoria = '$producto'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();
$numero = $row['contador'];
$contar = $numero / 12;
echo '
<nav aria-label="Page navigation example">
    <ul class="pagination">
    <li class="page-item"><a class="page-link" href="#">Anterior</a></li>
';
$i = 0;
for ($x = 0; $x <= $contar; $x++) {
    $i++;
    echo'
    <li class="page-item"><a href="javascript:void(0)"  class="page-link" onclick="cargaProductos(\''.$producto.'\','.$x.')">'.$i.'</a></li>
    ';
}

echo'
    <li class="page-item"><a class="page-link" href="#">Siguiente</a></li>
    </ul>
</nav>
';
