function cargaCategoria(){
    $.ajax({
        type: "POST",
        url: "prcd/cargarCategoria.php",
        dataType: "html",
        success: function(data){
            $('#categoria').fadeIn(1000).html(data);    
        }
    });
}

function cargaProductosRandom(){
    $.ajax({
        type: "POST",
        url: "prcd/cargarProductosRandom.php",
        dataType: "html",
        success: function(data){
            $('#inventario').fadeIn(1000).html(data);    
        }
    });
}

function cargaProductos(producto){
    document.getElementById('inventario').innerHTML = "";
    $.ajax({
        type: "POST",
        url: "prcd/cargarProductos.php",
        data:{
            producto:producto
        },
        dataType: "html",
        success: function(data){
            $('#inventario').fadeIn(1000).html(data);    
        }
    });
}