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

function cargaProductos(producto,num){
    document.getElementById('inventario').innerHTML = "";
    contador(producto,num);
    $.ajax({
        type: "POST",
        url: "prcd/cargarProductos.php",
        data:{
            producto:producto,
            num:num
        },
        dataType: "html",
        success: function(data){
            $('#inventario').fadeIn(1000).html(data);    
        }
    });
}

function contador(producto,num){
    $.ajax({
        type:"POST",
        data:{
            producto:producto,
            num:num
        },
        url:"prcd/contador.php",
        dataType:"html",
        success:function(data){
            $('#contadorProductos').fadeIn(1000).html(data);
        }
    });
}

function ofertas(){
    $.ajax({
        type: "POST",
        url: "prcd/cargarOfertas.php",
        dataType: "html",
        success: function(data){
            $('#ofertas').fadeIn(1000).html(data);    
        }
    });
}