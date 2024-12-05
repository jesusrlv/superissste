<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM inventario WHERE oferta = 1 ORDER BY id DESC";
$resultado = $conn->query($sql);
$filas = $resultado->num_rows;
if ($filas > 0){

    while($row = $resultado->fetch_assoc()){
        echo '
<div class="carousel-item active">
    <img src="productos/'.$row['ruta'].'" class="d-block w-100 imagenOfertas" alt="...">

    <!-- Etiqueta "Ofertas" en la esquina superior izquierda -->
    <div class="position-absolute top-0 start-0 bg-warning text-dark text-center p-2 w-50">
        <i class="bi bi-piggy-bank"></i> Ofertas
    </div>

    <!-- Información en la parte inferior con botones de control -->
    <div class="position-absolute bottom-0 start-0 bg-primary text-white w-100 p-3">
        <div class="container">
            <div class="d-flex justify-content-between align-items-center">
                <!-- Información del producto y botón alineados verticalmente -->
                <div class="d-flex align-items-center">
                    <h5 class="mb-0">'.$row['descripcion'].' | Precio: $'.$row['precio'].'</h5>
                </div>
                <!-- Botón alineado verticalmente -->
                <div class="d-flex align-items-center">
                    <a href="detalleProducto.php?id='.$row['id'].'" class="btn btn-light btn-sm text-primary">
                        <i class="bi bi-cart-plus-fill"></i> Agregar
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
';





    }

}
else{
    echo '
       <div class="carousel-item active">
            <img src="img/superissste_no_ofertas.jpg" class="d-block w-100 h-100 " alt="..." style="object-fit: contain;">
        </div>
        
        ';
}