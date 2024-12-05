<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM inventario WHERE oferta = 1 ORDER BY id DESC";
$resultado = $conn->query($sql);
$filas = $resultado->num_rows;
if ($filas > 0){

    while($row = $resultado->fetch_assoc()){
        echo '
       <div class="carousel-item active">
            <div class="carousel-caption d-none d-md-block">
                <h5>First slide label</h5>
                <p>Some representative placeholder content for the first slide.</p>
            </div>      
            <img src="img/'.$row['ruta'].'" class="d-block w-100 imagenOfertas" alt="...">
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