<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/filtrado_ventas.aspx.cs" Async="true" Inherits="filtrado_ventas" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" language="javascript">

   
    
    (function () {
        var mouse = false, keyboard = false;
        document.onmousemove = function () {
            mouse = true;
        };
        document.onkeydown = function () {
            keyboard = true;
        };
        setInterval(function () {
            if (!mouse && !keyboard) {
                //  var boton = window.opener.document.getElementById('actualizar');
                // boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 1000);
    })()
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
        
    }
    onload = abrir();
    
    function salir() {

        window.close();
    }
    function cargar(boton) {
        document.getElementById("panel_cargando").style.display = "inline";
        if (boton.toString() == "boton_inicio") {
            setTimeout(function () {
                var boton = document.getElementById("boton_oculto_inicio");
                boton.click();
            }, 500);
        }
    }

    
</script>



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

<title>Registros De Ventas</title>

<link rel="stylesheet" href="css/registro_ventas.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
    ////////***************MUESTRA GRIDVIEW ANIDADOS Y LOS PASA A .DIALOG JQUERY********///////////////
      function sacalo(divname) {       
          var div = document.getElementById(divname);
          var img = document.getElementById('img' + divname);
          if (div.style.display == "none") {
              div.style.display = "inline";
              $(div).dialog({ width: 'auto' });
              img.src = "png/minus.png";
          } else {
              div.style.display = "none";
              img.src = "png/plus.png";
          }
          $(div).on('dialogclose', function (event) {
              div.style.display = "none";
              img.src = "png/plus.png"; 
          });
      }    
</script>
<script type="text/javascript">
/////////////////////////////******OCULTAR COLUMNAS SELECCIONADAS*********///////////////
    $(function () {
        $('.esconder').click(function () {
            var id_boton = $(this).attr("id");
            $('.enchufe > tbody > tr > td:nth-child(' + id_boton + '),.enchufe > tbody > tr > th:nth-child(' + id_boton + ')').toggle();
            $('#header-fixed > tbody > tr > th:nth-child(' + id_boton + ')').toggle();
            
           
            $(this).toggleClass("mostrar");
        });

        $('.desactivado').click(function () {
            $(this).toggleClass("mostrar");
        });
        $('#boton_calcular').click(function () {
            $(this).toggleClass("mostrar");
        });
    });
</script>   
<script type="text/javascript">
///////////////////////*****OCULTAR COLUMNAS AL CARGAR PAGINA******////////////////////////////////////
    $(function () {
        for (var i = 10; i <= 21; i++) {
            $('td:nth-child(' + i + '),th:nth-child(' + i + ')').toggle();
            $('#' + i + '').toggleClass("mostrar");
        }
        ///////////////////////////*****DATAPICKER*******////////////////////////////////////////////////
        $("#buscarfecha").datepicker({ dateFormat: 'dd/mm/yy', maxDate: "0D" }).val();
        $("#buscarfecha2").datepicker({ dateFormat: 'dd/mm/yy', maxDate: "0D" }).val();
        $("#fecha_i").datepicker({ dateFormat: 'dd/mm/yy', maxDate: "0D"  }).val();
        $("#fecha_f").datepicker({ dateFormat: 'dd/mm/yy', maxDate: "0D" }).val();

        //////////////////////****SUMA VENTAS TOTALES DE LAS TABLAS SELECCIONADAS********//////////////
        var suma = 0;
        $("#tabla_principal > tbody > tr").click(function () {
            if ($('#boton_calcular').hasClass("mostrar")) {
                $(this).toggleClass("selected");
                var currentRow = $(this).closest("tr");
                var productos = $(this).closest("tr").find("div >.tabla_venta_lista > tbody > .orales > td");
                var cantidad = currentRow.find("td:eq(3)").text();
                $.each($(productos).eq(1),
         function (i, val) {
             var muestra = $(val).text();
             //document.getElementById('panel_mamalon').innerHTML += '<br/><input type="text" id="caja' + i + '" value="' + val.text(); +'" "  /><br/>';
         });
                if ($(this).hasClass("selected")) {
                    if (!isNaN(cantidad) && (cantidad.length !== 0)) {
                        suma += parseInt(cantidad, 10);
                        //suma += parseFloat(cantidad);
                        //alert('la suma de las columnas va en ' + suma + '');
                    }
                }
                else if (!isNaN(cantidad) && cantidad.length !== 0) {
                    suma -= parseInt(cantidad, 10);
                    //suma -= parseFloat(cantidad);
                    //alert('le restamos ala cuenta ' + cantidad + ' y nos quedan' + suma + ' ');  
                } $("#resultados").text('' + suma + '');
                $("#panel_mamalon").dialog();
            }
        });
    });
</script>
<script type="text/javascript"> 
///////////***********BUSCADOR DE LA TABLA  PRINCIPAL**************///////////////////
    function estadisticas() {

        // Variables
            $("#clon").empty();
            var $header = $("#tabla_principal > tbody > .cabecera_tabla").clone();
            $("#clon").append($header);
            var td_sucursal,entrada_sucursal,entrada,filtro_vendedor,filtro_sucursal,entrada_vendedor, entrada_fecha, tabla_fecha, filtro, tabla, tr, td, td_fecha, i, numero_ventas, productos_consume, promedio_consumo_mes, total, fecha_fila, fecha_busca;
            var venta = 0,td_vendedor;
            entrada = document.getElementById("calcular");
            entrada_fecha = document.getElementById("buscarfecha");
            entrada_fecha2 = document.getElementById("buscarfecha2");
            entrada_vendedor = document.getElementById("buscar_vendedor");
            entrada_sucursal = document.getElementById("buscar_sucursal");
            filtro_vendedor = entrada_vendedor.value.toUpperCase();
            filtro = entrada.value.toUpperCase();
            filtro_sucursal = entrada_sucursal.value.toUpperCase();
            fecha = entrada_fecha.value;
            fecha2 = entrada_fecha2.value;
            tabla = document.getElementById('tabla_principal');
            tr = tabla.getElementsByTagName('tr');
            if (!$("#buscarfecha2").is(':visible')) {
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    td_fecha = tr[i].getElementsByTagName("td")[4];
                    td_vendedor = tr[i].getElementsByTagName("td")[5];
                    td_sucursal = tr[i].getElementsByTagName("td")[6];
                    if (td && td_fecha && td_vendedor && td_sucursal) {
                        if (td.innerHTML.toUpperCase().indexOf(filtro) > -1 && td_fecha.innerHTML.toUpperCase().indexOf(fecha) > -1 && td_vendedor.innerHTML.toUpperCase().indexOf(filtro_vendedor) > -1 && td_sucursal.innerHTML.toUpperCase().indexOf(filtro_sucursal) > -1) {
                            tr[i].style.display = "";
                              var $clon = $(tr[i]).clone();
                              $("#clon").append($clon);
                        } else if (tr[i].className != "orales") { //devido alos gridview anidados es nesesario excluirlos
                            tr[i].style.display = "none";
                        }
                    }
                } //fin cliclo
            }
            else {

                var d1 = fecha.split("/");
                var d2 = fecha2.split("/");
                var from = new Date(d1[2], d1[1] - 1, d1[0]);
                var to = new Date(d2[2], d2[1] - 1, d2[0]);
                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[0];
                    td_fecha = tr[i].getElementsByTagName("td")[4];
                    td_vendedor = tr[i].getElementsByTagName("td")[5];
                    td_sucursal = tr[i].getElementsByTagName("td")[6];
                    var fechatexto = $(td_fecha).text();
                    if (td && td_fecha && td_vendedor && td_sucursal) {
                        if (td.innerHTML.toUpperCase().indexOf(filtro) > -1 && td_vendedor.innerHTML.toUpperCase().indexOf(filtro_vendedor) > -1 && td_sucursal.innerHTML.toUpperCase().indexOf(filtro_sucursal) > -1) {
                            var c = fechatexto.split("/");
                            var check = new Date(c[2], c[1] - 1, c[0]);
                            if ((check >= from) && (check <= to)) {
                                tr[i].style.display = "";
                                var $clon = $(tr[i]).clone();
                                $("#clon").append($clon);
                            } else
                                tr[i].style.display = "none";
                        } else if (tr[i].className != "orales") { //devido alos gridview anidados es nesesario excluirlos
                            tr[i].style.display = "none";
                        }

                    } //fin if (td || td_fecha)
                } //fin cliclo
            } //fin else
            $('#clontabla').show();
        } //fin funcion
    
///////////********************BUSCADOR DE LA TABLA DESGLOSADOS ***********/////////////////////////////////
    function estadisticas_productos() {

        // Variables
        $("#clon_desglosados").empty();
        var $header = $("#ventas_calcula > tbody > .cabecera_tabla").clone();
        $("#clon_desglosados").append($header);
        var entrada_sucursal, filtro_sucursal, td_sucursal, entrada, entrada_fecha, tabla_fecha, filtro, tabla, tr, td_cliente, td_producto, td_codigo, td_fecha, i, numero_ventas, productos_consume, promedio_consumo_mes, total, fecha_fila, fecha_busca;
        var venta = 0;
        entrada = document.getElementById("calcular");
        var entrada_productos = $("#buscar_producto").val();
        var entrada_codigo = $("#buscar_codigo").val();
        entrada_fecha2 = document.getElementById("buscarfecha2");
        entrada_fecha = document.getElementById("buscarfecha");
        entrada_sucursal = document.getElementById("buscar_sucursal");
        filtro = entrada.value.toUpperCase();
        fecha = entrada_fecha.value;
        fecha2 = entrada_fecha2.value;
        filtro_sucursal = entrada_sucursal.value.toUpperCase();
        tabla = document.getElementById('ventas_calcula');
        tr = tabla.getElementsByTagName('tr');
        if (!$("#buscarfecha2").is(':visible')) {
            for (i = 0; i < tr.length; i++) {
                td_cliente = tr[i].getElementsByTagName("td")[2];
                td_fecha = tr[i].getElementsByTagName("td")[0];
                td_codigo = tr[i].getElementsByTagName("td")[4];
                td_producto = tr[i].getElementsByTagName("td")[3];
                td_sucursal = tr[i].getElementsByTagName("td")[8];
                if (td_cliente && td_fecha && td_producto && td_codigo && td_sucursal) {
                    if (td_cliente.innerHTML.toUpperCase().indexOf(filtro) > -1 && td_fecha.innerHTML.toUpperCase().indexOf(fecha) > -1 && td_producto.innerHTML.toUpperCase().indexOf(entrada_productos.toUpperCase()) > -1 && td_codigo.innerHTML.toUpperCase().indexOf(entrada_codigo.toUpperCase()) > -1 && td_sucursal.innerHTML.toUpperCase().indexOf(filtro_sucursal) > -1) {
                        tr[i].style.display = "";
                        var $clon = $(tr[i]).clone();
                        $("#clon_desglosados").append($clon);
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            } // fin cliclo
        } // fin if (!$("#buscarfecha2").is(':visible'))
        else {
            var d1 = fecha.split("/");
            var d2 = fecha2.split("/");
            var from = new Date(d1[2], d1[1] - 1, d1[0]);
            var to = new Date(d2[2], d2[1] - 1, d2[0]);
            for (i = 0; i < tr.length; i++) {
                td_cliente = tr[i].getElementsByTagName("td")[2];
                td_fecha = tr[i].getElementsByTagName("td")[0];
                td_codigo = tr[i].getElementsByTagName("td")[4];
                td_producto = tr[i].getElementsByTagName("td")[3];
                td_sucursal = tr[i].getElementsByTagName("td")[8];
                var fechatexto = $(td_fecha).text();
                if (td_cliente && td_fecha && td_producto && td_codigo && td_sucursal) {
                    if (td_cliente.innerHTML.toUpperCase().indexOf(filtro) > -1 && td_producto.innerHTML.toUpperCase().indexOf(entrada_productos.toUpperCase()) > -1 && td_codigo.innerHTML.toUpperCase().indexOf(entrada_codigo.toUpperCase()) > -1 && td_sucursal.innerHTML.toUpperCase().indexOf(filtro_sucursal) > -1) {
                        var c = fechatexto.split("/");
                        var z = c[2].split(" ");
                        var check = new Date(z[0], c[1] - 1, c[0]);
                        if ((check >= from) && (check <= to)) {
                            tr[i].style.display = "";
                            var $clon = $(tr[i]).clone();
                            $("#clon_desglosados").append($clon);
                        } else
                            tr[i].style.display = "none";
                    } else { 
                        tr[i].style.display = "none";
                    }

                } //fin if (td || td_fecha)
            } //fin cliclo
        } //fin else
        $(function () {
            $("#panel_ventas_mamalon").dialog({ width: '90%', height: 400, title: "Tabla Ventas Desglosadas" });
        });
    } //fin funcion
    ////////////////////////********************BUSCADOR VENTAS PRODUCTOS******************///////////////////////////////////
    function buscar_ventas_productos() {

        // Variables
        $("#clon_productos").empty();
        var $header = $("#tabla_productos_ventas > tbody > .cabecera_tabla").clone();
        $("#clon_productos").append($header);
        var entrada, entrada_fecha, tabla_fecha, filtro, tabla, tr, td_cliente, td_producto, td_codigo, td_fecha, i, numero_ventas, productos_consume, promedio_consumo_mes, total, fecha_fila, fecha_busca;
        var venta = 0;
        entrada = document.getElementById("calcular");
        var entrada_productos = $("#buscar_producto").val();
        var entrada_codigo = $("#buscar_codigo").val();
        entrada_fecha2 = document.getElementById("buscarfecha2");
        entrada_fecha = document.getElementById("buscarfecha");
        filtro = entrada.value.toUpperCase();
        fecha = entrada_fecha.value;
        fecha2 = entrada_fecha2.value;
        tabla = document.getElementById('tabla_productos_ventas');
        tr = tabla.getElementsByTagName('tr');
        if (!$("#buscarfecha2").is(':visible')) {
            for (i = 0; i < tr.length; i++) {
                td_cliente = tr[i].getElementsByTagName("td")[1];
                td_fecha = tr[i].getElementsByTagName("td")[6];
                td_codigo = tr[i].getElementsByTagName("td")[3];
                td_producto = tr[i].getElementsByTagName("td")[2];
                if (td_cliente && td_fecha && td_codigo && td_producto) {
                    if (td_cliente.innerHTML.toUpperCase().indexOf(filtro) > -1 && td_fecha.innerHTML.toUpperCase().indexOf(fecha) > -1 && td_producto.innerHTML.toUpperCase().indexOf(entrada_productos.toUpperCase()) > -1 && td_codigo.innerHTML.toUpperCase().indexOf(entrada_codigo.toUpperCase()) > -1) {
                        tr[i].style.display = "";
                        var $clon = $(tr[i]).clone();
                        $("#clon_productos").append($clon);
                    } else {
                        tr[i].style.display = "none";
                    }
                }
            } // fin cliclo
        } // fin if (!$("#buscarfecha2").is(':visible'))
        else {
            var d1 = fecha.split("/");
            var d2 = fecha2.split("/");
            var from = new Date(d1[2], d1[1] - 1, d1[0]);
            var to = new Date(d2[2], d2[1] - 1, d2[0]);
            for (i = 0; i < tr.length; i++) {
                td_cliente = tr[i].getElementsByTagName("td")[1];
                td_fecha = tr[i].getElementsByTagName("td")[6];
                td_codigo = tr[i].getElementsByTagName("td")[3];
                td_producto = tr[i].getElementsByTagName("td")[2];
                var fechatexto = $(td_fecha).text();
                if (td_cliente && td_fecha && td_codigo && td_producto) {
                    if (td_cliente.innerHTML.toUpperCase().indexOf(filtro) > -1 && td_producto.innerHTML.toUpperCase().indexOf(entrada_productos.toUpperCase()) > -1 && td_codigo.innerHTML.toUpperCase().indexOf(entrada_codigo.toUpperCase()) > -1) {
                        var c = fechatexto.split("/");
                        var z = c[2].split(" ");
                        var check = new Date(z[0], c[1] - 1, c[0]);
                        if ((check >= from) && (check <= to)) {
                            tr[i].style.display = "";
                            var $clon = $(tr[i]).clone();
                            $("#clon_productos").append($clon);
                        } else
                            tr[i].style.display = "none";
                    } else {
                        tr[i].style.display = "none";
                    }

                } //fin if (td || td_fecha)
            } //fin cliclo
        } //fin else
    } //fin funcion
///////////////////////************************RESET PARAMETROS BUSQUEDA********/////////////////////////////////
    function reset_principal() {
        tabla = document.getElementById('tabla_principal');
        tr = tabla.getElementsByTagName('tr');
        var elements = document.getElementsByTagName("input");
        for (var ii = 0; ii < elements.length; ii++) {
            if (elements[ii].type == "text") {
                elements[ii].value = "";
            }
        }
        for (i = 0; i < tr.length; i++) {
            tr[i].style.display = "";
        } //fin cliclo

        tabla = document.getElementById('ventas_calcula');
        tr = tabla.getElementsByTagName('tr');
        for (i = 0; i < tr.length; i++) {
            tr[i].style.display = "";
        } //fin cliclo

        tabla = document.getElementById('tabla_productos_ventas');
        tr = tabla.getElementsByTagName('tr');
        for (i = 0; i < tr.length; i++) {
            tr[i].style.display = "";
        } //fin cliclo
        
    }  
</script>  
<script type="text/javascript" language="javascript">
    /////////**************** CLON DE HEADER TABLA PRINCIPAL CON POSICION FIXED ***************///////////////////
  /*  $(function(){
        var tableOffset = $('#contenido').offset().top;
        var $header = $('#tabla_principal > tbody > .cabecera_tabla').clone();
        var $fixedHeader = $('#header-fixed').append($header);

        $('#contenido').scroll( function () {
            var offset = $(this).scrollTop();

            if (offset >= tableOffset && $fixedHeader.is(":hidden")) {       
                $fixedHeader.show();
            }
            else if (offset < tableOffset) {
                $fixedHeader.hide();
            }
        });
    });*/
/////////////////////////****************FUNCION FUERA DE USO ANALIZAR ************//////////////////
    function productos() {
        // Variables
        var entrada, filtro, i,productos;
        var venta = 0;
        entrada = document.getElementById("calcular");
        filtro = entrada.value.toUpperCase();
        var cells = $(".tabla_venta_lista > tbody > .orales > td");
        $.each($(cells),
        function (i, val) {
            if ($(val).text().indexOf(filtro) > -1) {
                alert($(val).text());
            } else {

            }
        });
    }
/////////////////*************FUNCION MIXTA JQUERY************///////////////
    $(function () {
        var suma = 0, contador_ventas;
        var promedio = 0;
        $("#panel_mamalon_filtro").accordion({ collapsible: true }); //////CLASE .accordion JQUERY
        $("#div_mamalon_filtro").accordion({ collapsible: true }); //////CLASE .accordion JQUERY
        $('#productos_ventas').click(function () {
            if ($(this).hasClass("boton_select")) {
                $('#productos_ventas').toggleClass("mostrar")
                $('#div_ventas_productos').dialog({ width: 'auto', height: '400', title: 'Ventas' });
            }
        });
        $('#div_ventas_productos').on('dialogclose', function (event) {
            $('#productos_ventas').attr("class", "boton_select");
        });
       /// $(panel_mamalon_inicio).dialog({ modal:true,title:"Selecciona Fecha Inicial" });
        ///////////////*************** SUMA VALORES EN LA TABLA PRODUCTOS***********//////////////////////
        $("#ventas_calcula > tbody > tr").click(function () {
            if ($('#boton_calcular').hasClass("mostrar")) {
                $(this).toggleClass("selected");
                var currentRow = $(this).closest("tr");
                var cantidad = currentRow.find("td:eq(6)").text();

                if ($(this).hasClass("selected")) {
                    if (!isNaN(cantidad) && cantidad.length !== 0) {
                        suma += parseInt(cantidad, 10);
                        //suma += parseFloat(cantidad);
                        //alert('la suma de las columnas va en ' + suma + '');
                    }
                }
                else if (!isNaN(cantidad) && cantidad.length !== 0) {
                    suma -= parseInt(cantidad, 10);
                    //suma -= parseFloat(cantidad);
                    //alert('le restamos ala cuenta ' + cantidad + ' y nos quedan' + suma + ' ');  
                } $("#resultados_producto").text('' + suma + '');
                $("#panel_mamalon_productos").dialog();
            }
        });
    });
///////////////////***************PREPARATIVOS BUSCAR FECHA RANGO***************//////////////////////////
    function rango_fecha() {       
          var caja = document.getElementById('buscarfecha2');
          var img = document.getElementById('rango');
          if (caja.style.display == "none") {
              caja.style.display = "inline";
              $('#buscarfecha').attr("placeholder", "De");
              img.src = "png/minus.png";
          } else {
              caja.style.display = "none";
              img.src = "png/plus.png";
              $('#buscarfecha').attr("placeholder", "Buscar Fecha");
          }
      }
</script> 

<script type="text/javascript" language="javascript">
///////////////////*************** TEST DE FUNCION RANGO FECHAS ******************/////////////////////////
    function rango_fecha_buscar() {
        // Variables
        var entrada, entrada_fecha, tabla_fecha, filtro, tabla, tr, td, td_fecha, i, numero_ventas, productos_consume, promedio_consumo_mes, total, fecha_fila, fecha_busca;
        var venta = 0;
        entrada = document.getElementById("calcular");
        entrada_fecha = document.getElementById("buscarfecha");
        entrada_fecha2 = document.getElementById("buscarfecha2");
        filtro = entrada.value.toUpperCase();
        fecha = entrada_fecha.value;
        fecha2 = entrada_fecha2.value;
        tabla = document.getElementById('tabla_principal');
        tr = tabla.getElementsByTagName('tr');
        if (!$("#buscarfecha2").is(':visible')) {
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                td_fecha = tr[i].getElementsByTagName("td")[4];
                if (td || td_fecha) {
                    if (td.innerHTML.toUpperCase().indexOf(filtro) > -1 && td_fecha.innerHTML.toUpperCase().indexOf(fecha) > -1) {
                        tr[i].style.display = "";
                    } else if (tr[i].className != "orales") { //devido alos gridview anidados es nesesario excluirlos
                        tr[i].style.display = "none";
                    }

                }
            } //fin cliclo
        }
        else {
            var d1 = fecha.split("/");
            var d2 = fecha2.split("/");
            var from = new Date(d1[2], d1[1] - 1, d1[0]);
            var to = new Date(d2[2], d2[1] - 1, d2[0]);
            for (i = 0; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[0];
                td_fecha = tr[i].getElementsByTagName("td")[4];
                var fechatexto = $(td_fecha).text();
                if (td || td_fecha) {
                    if (td.innerHTML.toUpperCase().indexOf(filtro) > -1) {
                        var c = fechatexto.split("/");
                        var check = new Date(c[2], c[1] - 1, c[0]);
                        if ((check >= from) && (check <= to))
                            tr[i].style.display = "";
                            else
                            tr[i].style.display = "none";
                    } else if (tr[i].className != "orales") { //devido alos gridview anidados es nesesario excluirlos
                        tr[i].style.display = "none";
                    }
                } //fin if (td || td_fecha)
            } //fin cliclo
        } //fin else
    } //fin funcion
////////////////////////////************grafica*******************////////////////////////////////////
/////////////////////***************************************//////////////////////////
function fnExcelReport()
{
    
    var tab_text="<table border='2px'><tr bgcolor='#87AFC6'>";
    var textRange; var j=0;
    tab = document.getElementById('clon'); // id of table
    $(tab).find('[style="display: none;"]').remove();

    for(j = 0 ; j < tab.rows.length ; j++) 
    {     
        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
        //tab_text=tab_text+"</tr>";
    }

    tab_text=tab_text+"</table>";
    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE ");

    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
    {
        txtArea1.document.open("txt/html", "replace");
        txtArea1.document.write(tab_text);
        txtArea1.document.close();
        txtArea1.focus();
        sa = txtArea1.document.execCommand("SaveAs", true, "Say Thanks to Sumit.xls");
    }
    else {                 //other browser not tested on IE 11
        //sa = window.open('data:application/nd.openxmlformats-officedocument.spreadsheetml.sheet,' + encodeURIComponent(tab_text));
        var a = document.createElement('a');
        var dt = new Date();
        var day = dt.getDate();
        var month = dt.getMonth() + 1;
        var year = dt.getFullYear();
        var hour = dt.getHours();
        var mins = dt.getMinutes();
        var postfix = day + "." + month + "." + year + "_" + hour + "." + mins;
        var data_type = 'data:application/vnd.ms-excel';
        var table_html = encodeURIComponent(tab_text);
        a.href = data_type + ', ' + table_html;
        //setting the file name
        a.download = 'Reporte' + postfix + '.xls';
        //triggering the function
        a.click();
        //just in case, prevent default behaviour


        //return (sa);
    }
}

function exportar_productos()
{
    
    var tab_text="<table border='2px'><tr bgcolor='#87AFC6'>";
    var textRange; var j=0;
    tab = document.getElementById('clon_productos'); // id of table
    $(tab).find('[style*="display: none"]').remove();

    for(j = 0 ; j < tab.rows.length ; j++) 
    {     
        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
        //tab_text=tab_text+"</tr>";
    }

    tab_text=tab_text+"</table>";
    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE "); 

    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
    {
        txtArea1.document.open("txt/html","replace");
        txtArea1.document.write(tab_text);
        txtArea1.document.close();
        txtArea1.focus(); 
        sa=txtArea1.document.execCommand("SaveAs",true,"Say Thanks to Sumit.xls");
    }  
    else                 //other browser not tested on IE 11
        sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  

    return (sa);
}
function exportar_desglosados()
{
    
    var tab_text="<table border='2px'><tr bgcolor='#87AFC6'>";
    var textRange; var j=0;
    tab = document.getElementById('clon_desglosados'); // id of table
    $(tab).find('[style*="display: none"]').remove();

    for(j = 0 ; j < tab.rows.length ; j++) 
    {     
        tab_text=tab_text+tab.rows[j].innerHTML+"</tr>";
        //tab_text=tab_text+"</tr>";
    }

    tab_text=tab_text+"</table>";
    tab_text= tab_text.replace(/<A[^>]*>|<\/A>/g, "");//remove if u want links in your table
    tab_text= tab_text.replace(/<img[^>]*>/gi,""); // remove if u want images in your table
    tab_text= tab_text.replace(/<input[^>]*>|<\/input>/gi, ""); // reomves input params

    var ua = window.navigator.userAgent;
    var msie = ua.indexOf("MSIE "); 

    if (msie > 0 || !!navigator.userAgent.match(/Trident.*rv\:11\./))      // If Internet Explorer
    {
        txtArea1.document.open("txt/html","replace");
        txtArea1.document.write(tab_text);
        txtArea1.document.close();
        txtArea1.focus(); 
        sa=txtArea1.document.execCommand("SaveAs",true,"Say Thanks to Sumit.xls");
    }  
    else                 //other browser not tested on IE 11
        sa = window.open('data:application/vnd.ms-excel,' + encodeURIComponent(tab_text));  

    return (sa);
}

</script>
<script type="text/javascript">
    $(document).ready(function () {
        $("form").keypress(function (e) {
            if (e.which == 13) {
                return false;
            }
        });
    });
</script>
</head>

<body>

    <form id="registro_ventas" runat="server">
   <!----- esto es un comentario ----->
    <div id="menu">
        <div id="menu_mobiles">
            <asp:LinkButton ID="boton_menu" runat="server"  ToolTip="Menu de opciones"><i class="fa fa-bars fa-2x"></i></asp:LinkButton>
            <asp:LinkButton ID="boton_menu_cerrar" runat="server"  ToolTip="Cerrar menu de opciones"><i class="fa fa-bars fa-2x"></i></asp:LinkButton>
        </div>
   
        <asp:Label ID="vendedor" runat="server" Text="Ventas" CssClass="nombre_vendedor"/>
    <!----- esto es un comentario ----->    
        <div class="botones_menu">
            <asp:LinkButton ID="salir" runat="server" CssClass="boton" ToolTip="Salir" onclick="boton_salir_Click"><img id="f" class="icono" src="png/f.png"></asp:LinkButton>
        </div> 
    </div>
   <!----- esto es un comentario ----->  
    <div id="submenu">
        <div id="elementos">                                  
            <asp:LinkButton CssClass="elemento_menu" ID="m_exportar" runat="server"  ToolTip="Exportar" onclick="boton_exportar_Click" Enabled="False"><p class="texto_m">Exportar</p></asp:LinkButton>                
            <asp:LinkButton CssClass="elemento_menu" ID="m_salir" runat="server"  ToolTip="Salir" onclick="boton_salir_Click"><p class="texto_m">Salir</p></asp:LinkButton>
        </div>
    </div> 
   <!----- Main -----> 
    <div id="main">
   <!----- Main Izquierdo ----->
        <div id="main_izquierdo">
          <div class="paneles_graficas">         
            <div class="cabecera_informacion"><asp:Label runat="server" CssClass="texto_cabecera">Buscar</asp:Label></div>
            <div class="controles_busqueda">
            <!----- Acordeon Filtro ----->
                <div id="panel_mamalon_filtro" >
                    <h3 class="texto_cabecera">Filtro Busqueda</h3>
                    <div> 
                        <asp:TextBox ID="calcular" runat="server" CssClass="caja"  Enabled="true" placeholder="Buscar Cliente" ></asp:TextBox>
                        <a href="JavaScript:rango_fecha();" class="boton_plus">
                        <img alt="Rango Fechas" id="rango" src="png/plus.png" /></a>
                        <asp:TextBox ID="buscarfecha" runat="server" CssClass="caja" placeholder="Buscar Fecha" ></asp:TextBox>
                        <asp:TextBox ID="buscarfecha2" runat="server" CssClass="caja" placeholder="A" style="display: none" ></asp:TextBox>
                        <asp:TextBox ID="buscar_producto" runat="server" CssClass="caja" placeholder="Buscar Producto" ></asp:TextBox>
                        <asp:TextBox ID="buscar_codigo" runat="server" CssClass="caja" placeholder="Buscar Codigo" ></asp:TextBox>
                        <asp:TextBox ID="buscar_vendedor" runat="server" CssClass="caja" placeholder="Vendedor" ></asp:TextBox>
                        <asp:TextBox ID="buscar_sucursal" runat="server" CssClass="caja" placeholder="Sucursal" ></asp:TextBox>
                        <a href="JavaScript:estadisticas();"><input id="buscar" type="button" value="Buscar" class="boton_select"/></a>
                        <a href="JavaScript:buscar_ventas_productos();"><input id="Button4" type="button" value="Ventas" class="boton_select"/></a>
                        <a href="JavaScript:estadisticas_productos();"><input id="Button1" type="button"  value="Buscar En Desglosados" class="boton_select"/></a>
                        <a href="JavaScript:reset_principal();"><input id="Button3" style="margin-top: 5px;" type="button"  value="Reset" class="boton_select"/></a>
                        
                        
                    </div>
                    <!----- Acordeon Controles ----->
                    <h3 class="texto_cabecera">Filtro Controles</h3>
                    <div>  
                        <input id="boton_calcular" type="button" value="Calcular" class="boton_select"/>
                        <input id="productos_ventas" type="button" value="Ventas" class="boton_select"/>               
                    </div>  
                </div>
               <!----- PANELES DIALOG JQUERY RESULTADOS ----->
                <asp:Panel ID="panel_mamalon" title="Suma De Ventas Totales"  runat="server" style="display: none">
                    <asp:Label  ID ="resultados" Text="" runat="server" class="texto_cabecera resultado" />
                </asp:Panel>
                <asp:Panel ID="panel_mamalon_productos" title="Suma De Ventas Productos"  runat="server" style="display: none">
                    <asp:Label  ID ="resultados_producto" Text="" runat="server" class="texto_cabecera resultado" />
                </asp:Panel>
            </div>
          </div>
        </div>
   <!----- Main Derecho ----->
        <div id="main_derecho">
        <div class="paneles_graficas"> 
        <div class="cabecera_informacion"><asp:Label ID="Label2" runat="server" CssClass="texto_cabecera">Columnas</asp:Label></div>        
        <div class="controles_busqueda" id="div_mamalon_filtro">
        <h3 class="texto_cabecera">Seleccion De Fecha</h3>
           <div>
               <asp:Panel ID="panel_mamalon_inicio" runat="server">
                   <asp:TextBox ID="fecha_i" runat="server" Enabled="True" CssClass="caja" placeholder="De" ></asp:TextBox>
                   <asp:TextBox ID="fecha_f" runat="server" Enabled="True" CssClass="caja" placeholder="A" ></asp:TextBox>
                   <asp:LinkButton ID="boton_inicio" runat="server" ToolTip="Iniciar" onclick="iniciar_Click"><input id="iniciar" type="button" value="Iniciar" class="boton_select"/></asp:LinkButton>
                   <asp:LinkButton ID="salir_modal" runat="server" ToolTip="Salir" onclick="boton_salir_Click"><input id="out" type="button" value="Salir" class="boton_select"/></asp:LinkButton> 
                </asp:Panel>
           </div>
        <h3 class="texto_cabecera">Filtrado Columnas</h3>
        <div>
            <div class="izquierda">
                <ul> 
                  <li><input id="1" type="checkbox" value="Cliente" class="esconder" checked/>
                  <label for="1" class="texto_check">Cliente</label></li>
                  <li><input id="2" type="checkbox" value="IVA" class="esconder" checked/>
                  <label for="2" class="texto_check">IVA</label></li>
                  <li><input id="3" type="checkbox" value="Subtotal" class="esconder" checked/>
                  <label for="3" class="texto_check">Subtotal</label></li>
                  <li><input id="4" type="checkbox" value="Total" class="esconder" checked/>
                  <label for="4" class="texto_check">Total</label></li>
                  <li><input id="5" type="checkbox" value="Fecha Venta" class="esconder" checked/>
                  <label for="5" class="texto_check">Fecha Venta</label></li> 
                   <li><input id="6" type="checkbox" value="Vendedor" class="esconder" checked/>
                  <label for="6" class="texto_check">Vendedor</label></li>
                  <li><input id="7" type="checkbox" value="Sucursal" class="esconder" checked/>
                  <label for="7" class="texto_check">Sucursal</label></li>
                  <li><input id="8" type="checkbox" value="Clave Cotizacion" class="esconder" checked/>
                  <label for="8" class="texto_check">Clave Cotizacion</label></li>
                  <li><input id="9" type="checkbox" value="Clave Venta" class="esconder" checked/>
                  <label for="9" class="texto_check">Clave Venta</label></li>
                </ul>
            </div> 
            <div class="derecha">
                <ul>      
                  <li><input id="10" type="checkbox" value="Clave Pedido" class="esconder" />
                  <label for="10" class="texto_check">Clave Pedido</label></li>            
                  <li><input id="11" type="checkbox" value="Comision Negocio" class="esconder" />
                  <label for="11" class="texto_check">Comision Negocio</label></li>
                  <li><input id="12" type="checkbox" value="Comision Vendedor" class="esconder" />
                  <label for="12" class="texto_check">Comision Vendedor</label></li>
                  <li><input id="13" type="checkbox" value="Estado Venta" class="esconder"/>
                  <label for="13" class="texto_check">Estado Venta</label></li>
                  <li><input id="14" type="checkbox" value="Fecha Cotizacion" class="esconder" />
                  <label for="14" class="texto_check">Fecha Cotizacion</label></li>
                  <li><input id="15" type="checkbox" value="Fecha Pedido" class="esconder" />
                  <label for="15" class="texto_check">Fecha Pedido</label></li> 
                  <li><input id="16" type="checkbox" value="Detalle Pedido" class="esconder" />
                  <label for="16" class="texto_check">Detalle Pedido</label></li>
                  <li><input id="17" type="checkbox" value="Detalles Venta" class="esconder" />
                  <label for="17" class="texto_check">Detalles Venta</label></li>
                  <li><input id="18" type="checkbox" value="Requisicion" class="esconder" />
                  <label for="18" class="texto_check">Requisicion</label></li>
                  <li><input id="19" type="checkbox"" value="Trasferencias" class="esconder" />
                  <label for="19" class="texto_check">Trasferencias</label></li>
                  <li><input id="20" type="checkbox" value="Orden Compra" class="esconder" />
                  <label for="20" class="texto_check">Orden Compra</label></li>
                  <li><input id="21" type="checkbox" value="Factura" class="esconder" />
                  <label for="21" class="texto_check">Factura</label></li>
              </ul>                   
            </div>
           </div>    
           </div>
          </div>  
        </div>
        
   <!----- Main Centro ----->
       
        <div id="main_centro">
            <table id="header-fixed"></table> 
            <div class="paneles_graficas display"  id="contenido" runat="server">
               
                <table id="clon" runat="server" style="display: none" ></table>
                <table id="clon_productos" runat="server" style="display: none" ></table>
                <table id="clon_desglosados" runat="server" style="display: none" ></table>
                <a href="JavaScript:fnExcelReport();"><input id="clontabla" style="display: none" type="button"  value="Exportar" class="boton_select"/></a>
                <asp:GridView ID="tabla_principal" CssClass="enchufe" AutoGenerateColumns="false" runat="server" DataKeyNames="clave_cotizacion,clave_venta,clave_pedido"  OnRowDataBound="llenado_tabla_principal" DataSource='<%# ventas() %>' >
                <HeaderStyle CssClass="cabecera_tabla" />
                <Columns>
                    
                    <asp:BoundField HeaderText="Cliente" DataField="cliente" >
                    </asp:BoundField>
                    <asp:BoundField HeaderText="IVA" DataField="iva" DataFormatString="{0:0.00}">
                    <ItemStyle CssClass="derechito" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Subtotal" DataField="subtotal" DataFormatString="{0:0.00}" >
                    <ItemStyle CssClass="derechito" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Total" DataField="total" DataFormatString="{0:0.00}">
                    <ItemStyle CssClass="derechito" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Fecha Venta" DataField="fecha_venta" DataFormatString="{0:dd/MM/yyyy}">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Vendedor" DataField="vendedor">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Sucursal" DataField="sucursal">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Clave Cotizacion" DataField="clave_cotizacion"  >
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Clave Venta" DataField="clave_venta">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Clave Pedido" DataField="clave_pedido" >
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Comision Negocio" DataField="comision_negocio" DataFormatString="{0:0.00}">
                    <ItemStyle CssClass="derechito" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Comision Vendedor" DataField="comision_vendedor" DataFormatString="{0:0.00}" >
                    <ItemStyle CssClass="derechito" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Estado Venta" DataField="estado_venta">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Fecha Cotizacion" DataField="fecha_cotizacion" DataFormatString="{0:dd/MM/yyyy}">
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Fecha Pedido" DataField="fecha_pedido" DataFormatString="{0:dd/MM/yyyy}">
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="Detalles Pedido" >
                        <ItemStyle  CssClass="centro" />
                        <ItemTemplate >
                            <a href="JavaScript:sacalo('div<%# Eval("clave_pedido") %>');">
                            <img alt="Detalles" id="imgdiv<%# Eval("clave_pedido") %>" src="png/plus.png" /></a>
                            <div id="div<%# Eval("clave_pedido") %>" style="display: none"  title="Pedido <%# Eval("clave_pedido")%>">
                                <asp:GridView ID="tabla_pedido" class="display" runat="server" AutoGenerateColumns="false" >
                                    <RowStyle CssClass ="orales" />
                                    <Columns>                                  
                                        <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo_lista_pedido" >
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad_lista_pedido" >
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad Surtida" DataField="cantidad_surtida_lista_pedido" >
                                        </asp:BoundField>
                                        <asp:BoundField HeaderText="Cantidad Backorder" DataField="cantidad_backorder_lista_pedido" >
                                        </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Detalles Venta">
                        <ItemStyle  CssClass="centro" />
                        <ItemTemplate>
                            <a href="JavaScript:sacalo('div<%# Eval("clave_venta")+ "lv" %>');">
                            <img alt="Detalles" id="imgdiv<%# Eval("clave_venta") + "lv" %>" src="png/plus.png" /></a>
                            <div id="div<%# Eval("clave_venta") + "lv" %>" style="display: none" title="Productos <%# Eval("clave_venta")%>">
                                <asp:GridView ID="tabla_ventas_lista" class="tabla_venta_lista" runat="server" AutoGenerateColumns="false">
                                    <RowStyle CssClass ="orales" />
                                    <Columns>
                                    <asp:BoundField HeaderText="Clave Venta" DataField="clave_venta" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Codigo Proveedor" DataField="codigo_proveedor_lista_venta" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Descripcion" DataField="proveedor_lista_venta" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad_backorder_lista_venta" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Cantidad Backorder" DataField="cantidad_lista_venta" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Total" DataField="precio_lista_venta" DataFormatString="{0:0.00}" >
                                    <ItemStyle CssClass="derechito" />
                                    </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Requisicion">
                        <ItemStyle  CssClass="centro" />
                        <ItemTemplate>
                            <asp:Panel id="panel_requisiciones" runat="server" Visible="false">                           
                            <a href="JavaScript:sacalo('div<%# Eval("clave_cotizacion")+ "re" %>');">
                            <img alt="Detalles" id="imgdiv<%# Eval("clave_cotizacion")+ "re" %>" src="png/plus.png" /></a>
                            <div id="div<%# Eval("clave_cotizacion")+ "re" %>" style="display:none" class="panel" title="Requisicion <%# Eval("clave_cotizacion")%>">
                                <asp:GridView ID="tabla_requisiciones" class="display" runat="server" AutoGenerateColumns="false" OnRowDataBound="llenado_tabla_requisiciones" DataKeyNames="clave_requisicion">
                                    <RowStyle CssClass ="orales" />
                                    <Columns>
                                    <asp:TemplateField HeaderText="Detalles">
                                        <ItemStyle  CssClass="centro" />
                                        <ItemTemplate>
                                                <a href="JavaScript:sacalo('div<%# Eval("clave_requisicion") %>');">
                                                <img alt="Detalles" id="imgdiv<%# Eval("clave_requisicion") %>" src="png/plus.png" /></a>
                                                <div id="div<%# Eval("clave_requisicion") %>" style="display: none" class="panel" title="Productos <%# Eval("clave_requisicion")%>">
                                                <asp:GridView ID="tabla_lista_productos_requisiciones" class="display" runat="server" AutoGenerateColumns="false">
                                                    <RowStyle CssClass ="orales" />
                                                    <Columns>
                                                    <asp:BoundField HeaderText="Codigo" DataField="codigo_proveedor_requisicion" >
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Producto" DataField="producto_requisicion" >
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Aprobacion" DataField="aprobacion_requisicion" >
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad_requisicion" >
                                                    </asp:BoundField>
                                                    <asp:BoundField HeaderText="Precio" DataField="precio_requisicion" DataFormatString="{0:0.00}" >
                                                    <ItemStyle CssClass="derechito" />
                                                    </asp:BoundField>   
                                                    <asp:BoundField HeaderText="Total" DataField="precio_total_requisicon" DataFormatString="{0:0.00}">
                                                    <ItemStyle CssClass="derechito" />
                                                    </asp:BoundField>   
                                                    <asp:BoundField HeaderText="Proveedor" DataField="proveedor_requisicion" >
                                                    </asp:BoundField>                                       
                                                    </Columns>
                                                </asp:GridView>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField HeaderText="Clave Requisiscion" DataField="clave_requisicion" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Subtotal" DataField="subtotal_requisicion" DataFormatString="{0:0.00}">
                                    <ItemStyle CssClass="derechito" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="IVA" DataField="iva_requisicion" DataFormatString="{0:0.00}">
                                    <ItemStyle CssClass="derechito" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Total" DataField="total_requisicion" DataFormatString="{0:0.00}" >
                                    <ItemStyle CssClass="derechito" />
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Estado" DataField="estado_requisicion" >
                                    </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                           </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Trasferencias">
                        <ItemStyle  CssClass="centro" />
                        <ItemTemplate>
                            <asp:Panel ID="panel_trasferencias" runat="server" Visible="false" >                           
                            <a href="JavaScript:sacalo('div<%# Eval("clave_cotizacion") + "tr" %>');">
                            <img alt="Detalles" id="imgdiv<%# Eval("clave_cotizacion")+ "tr" %>" src="png/plus.png" /></a>
                            <div id="div<%# Eval("clave_cotizacion")+ "tr" %>" style="display: none" class="panel" title="Trasferencias <%# Eval("clave_venta")%>">
                                <asp:GridView ID="tabla_trasferencias" class="display" runat="server" AutoGenerateColumns="false">
                                    <RowStyle CssClass ="orales" />
                                    <Columns>
                                    <asp:BoundField HeaderText="ID Sucursal Transfiere" DataField="id_sucursal_transfer" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="ID Sucursal Requiere" DataField="id_sucursal_trasfer_requiere" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Codigo" DataField="codigo_trasfer" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad_trasfer" >
                                    </asp:BoundField>                                    
                                    </Columns>
                                </asp:GridView>
                            </div>
                            </asp:Panel>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Orden Compra">
                        <ItemStyle  CssClass="centro" />
                        <ItemTemplate>
                            <asp:Panel ID="panel_ordenes_compra" runat="server" Visible="false">                        
                            <a href="JavaScript:sacalo('div<%# Eval("clave_cotizacion")+ "or" %>');">
                            <img alt="Detalles" id="imgdiv<%# Eval("clave_cotizacion")+ "or" %>" src="png/plus.png" /></a>
                            <div id="div<%# Eval("clave_cotizacion")+ "or" %>" style="display: none" class="panel" title="Ordene De Compra <%# Eval("clave_cotizacion")%>">
                            <asp:GridView ID="tabla_ordenes_compra" class="display" runat="server" AutoGenerateColumns="false" DataKeyNames="clave_orden_compra" OnRowDataBound="llenado_tabla_ordenes_compra">
                                <RowStyle CssClass ="orales" />
                                <Columns>
                                <asp:TemplateField HeaderText="Detalles">
                                    <ItemStyle  CssClass="centro" />
                                    <ItemTemplate>
                                        <a href="JavaScript:sacalo('div<%# Eval("clave_orden_compra") %>');">
                                        <img alt="Detalles" id="imgdiv<%# Eval("clave_orden_compra") %>" src="png/plus.png" /></a>
                                        <div id="div<%# Eval("clave_orden_compra") %>" style="display: none" class="panel" title="Productos <%# Eval("clave_orden_compra")%>">
                                            <asp:GridView ID="tabla_lista_productos_ordenes_compra" class="display" runat="server" AutoGenerateColumns="false">
                                                <RowStyle CssClass ="orales" />
                                                <Columns>
                                                <asp:BoundField HeaderText="Codigo" DataField="codigo" >
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="Cantidad" DataField="cantidad" >
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="Producto" DataField="producto" >
                                                </asp:BoundField>
                                                <asp:BoundField HeaderText="Aprobacion" DataField="aprobacion" >
                                                </asp:BoundField>                                    
                                                </Columns>
                                            </asp:GridView>
                                        <div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="Clave Orden Compra" DataField="clave_orden_compra" >
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Estado" DataField="estado_orden_compra" >
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Fecha" DataField="fecha_orden_compra" DataFormatString="{0:dd/MM/yyyy}" >
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Listo" DataField="listo" >
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Almacen" DataField="almacen" >
                                </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        </asp:Panel>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Factura">
                        <ItemStyle  CssClass="centro" />
                        <ItemTemplate>
                        <asp:Panel ID="panel_factura" runat="server" Visible="false">                  
                            <a href="JavaScript:sacalo('div<%# Eval("clave_cotizacion" )+ "fa" %>');">
                            <img alt="Detalles" id="imgdiv<%# Eval("clave_cotizacion")+ "fa" %>" src="png/plus.png" /></a>
                            <div id="div<%# Eval("clave_cotizacion")+ "fa" %>" style="display: none" class="panel" title="Factura <%# Eval("clave_cotizacion")%>">
                                <asp:GridView ID="tabla_facturas" class="display" runat="server" AutoGenerateColumns="false" >
                                    <RowStyle CssClass ="orales" />
                                    <Columns>
                                    <asp:BoundField HeaderText="Factura" DataField="factura" >
                                    </asp:BoundField>
                                    <asp:BoundField HeaderText="Fecha" DataField="fecha_factura" DataFormatString="{0:dd/MM/yyyy}" >
                                    </asp:BoundField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </asp:Panel>
                    </ItemTemplate>
                    </asp:TemplateField>      
                </Columns>  
                </asp:GridView>
                
                <div id="panel_ventas_mamalon" style="display: none" >
                <div><a href="JavaScript:exportar_desglosados();"><input id="Button2" type="button"  value="Exportar" class="boton_select"/></a></div>
                    <asp:GridView ID="ventas_calcula" width="500px" runat="server" DataSource='<%# ventas_calcular() %>' AutoGenerateColumns="false" >
                        <HeaderStyle CssClass="cabecera_tabla"/>
                        <RowStyle CssClass="desglosada"  />
                        <Columns>
                        <asp:BoundField HeaderText="Fecha Venta" DataField="fecha_venta_calcula" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Clave Venta" DataField="clave_venta_calcula" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Cliente" DataField="cliente_calcula" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Producto" DataField="producto" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Codigo" DataField="codigo_proveedor" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Precio Total" DataField="precio" DataFormatString="{0:0.00}">
                        <ItemStyle CssClass="derechito" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Proveedor" DataField="proveedor" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Sucursal" DataField="sucursal" >
                        </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
                <div id="div_ventas_productos" style="display: none" >
                <div><a href="JavaScript:exportar_productos();"><input id="Button5" type="button"  value="Exportar" class="boton_select"/></a></div>
                    <asp:GridView ID="tabla_productos_ventas" width="500px"  runat="server" DataSource='<%# ventas_productos() %>' AutoGenerateColumns="false" >
                        <HeaderStyle CssClass="cabecera_tabla" />
                        <RowStyle CssClass="productos"  />
                        <Columns>
                        
                        <asp:BoundField HeaderText="ID Sucursal" DataField="id_sucursal" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Cliente" DataField="cliente" >
                        </asp:BoundField>
                         <asp:BoundField HeaderText="Producto" DataField="producto" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Codigo" DataField="codigo" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Cantidad" DataField="cantidad" >
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Precio Total" DataField="total" DataFormatString="{0:0.00}">
                        <ItemStyle CssClass="derechito" />
                        </asp:BoundField>
                        <asp:BoundField HeaderText="Fecha Venta" DataField="fecha" DataFormatString="{0:dd/MM/yyyy hh:mm:ss}" >
                        </asp:BoundField>
                        
                        </Columns>
                    </asp:GridView>
                </div>
                 
            </div>
           
        </div>
    </div>
    
     <asp:Panel ID="panel_cargando" runat="server" Visible="True" CssClass="panel_mamalon" Style=" display: none;">
      <div class="spinner">
      <div class="rect1"></div>
      <div class="rect2"></div>
      <div class="rect3"></div>
      <div class="rect4"></div>
      <div class="rect5"></div>
      </div>
    </asp:Panel>
    <asp:Button ID="boton_oculto_inicio" runat="server" OnClick="boton_oculto_inicio_Click" Style="visibility: hidden" /> 
   </form>
</body>
</html>
