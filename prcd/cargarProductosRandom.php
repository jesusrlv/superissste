<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM inventario ORDER BY RAND() LIMIT 12";
$resultado = $conn->query($sql);

while($row = $resultado->fetch_assoc()){
    echo '
    <div class="col-md-4 col-sm-12 mb-4">
    <a onclick="carritoStore('.$row['id'].',\''.$row['descripcion'].'\','.$row['precio'].')">
    <div class="card card-cover h-100 overflow-hidden text-bg-dark rounded-4 cardImg position-relative" 
         style="background-image: url(productos/'.$row['ruta'].'); width: 23rem; height:27vh;">
         
        <!-- Overlay y botón que aparecen al hacer hover -->
        <div class="hover-overlay position-absolute top-0 start-0 w-100 h-100" 
             style="background: rgba(0,0,0,0.5); opacity: 0; transition: opacity 0.3s;">
        </div>
        
        <button class="btn btn-primary position-absolute top-50 start-50 translate-middle hover-btn" style="opacity: 0; transition: opacity 0.3s;" onclick="carritoStore('.$row['id'].',\''.$row['descripcion'].'\','.$row['precio'].')">
            <i class="bi bi-cart-plus-fill"></i> Añadir al carrito
        </button>
        
        <!-- Contenido original (siempre visible) -->
        <div class="d-flex flex-column h-100 p-5 pb-3 text-white text-shadow-1 position-relative">
            <h3 class="pt-5 mt-5 mb-4 display-6 lh-1 fw-bold">'.$row['descripcion'].'</h3>
            <ul class="d-flex list-unstyled mt-auto">
                <li class="me-auto">
                <span class="badge rounded-pill text-bg-primary">Precio:  $'.$row['precio'].'</span>
                </li>
                <li class="d-flex align-items-center me-3">
                    <small class="rounded text-light" style="background-color:rgba(0, 0, 0, 0.5);padding:4px;">
                        Precio: $'.$row['precio'].'
                    </small>
                </li>
            </ul>
        </div>
    </div>
    </a>
</div>
';
}

// texto alterno

// <div class="col-md-4 col-sm-12">
//         <div class="card border-0" style="width: 23rem; height:27vh; overflow: hidden;"> <!-- overflow:hidden para contener el efecto -->
//             <!-- Contenedor de la imagen con efecto hover -->
//             <div class="img-hover-container position-relative">
//             <img src="productos/'.$row['ruta'].'" class="card-img-top img-hover" alt="..." id="imagenCatalogo">
//             <!-- Botón que aparece al hacer hover -->
//             <button class="btn btn-primary position-absolute top-50 start-50 translate-middle hover-btn" 
//                     type="button" 
//                     onclick="carritoStore('.$row['id'].',\''.$row['descripcion'].'\','.$row['precio'].')"
//                     style="opacity: 0; transition: opacity 0.3s;">
//                 <i class="bi bi-cart-plus-fill"></i> Agregar
//             </button>
//             </div>
//             <div class="card-body">
//             <h5 class="card-title">
//                 <span class="badge text-bg-primary">'.$row['descripcion'].'</span>
//             </h5>
//             <p><span><strong>Precio:</strong></span> $'.$row['precio'].'</p>
//             </div>
//         </div>
//     </div>