<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/reporte_clientes.aspx.cs" Inherits="reporte_clientes" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" language="javascript">

    $(function menu() {

        $('#boton_menu').click(function () {
            $(window).scrollTop(0);
            $('#submenu').css('visibility', 'visible');
            $('#submenu').css('height', '300px');
            if (document.getElementById("submenu").style.visibility == "visible") {
                setTimeout(function () {
                    $('#elementos').css('display', 'inline');
                    //  $('#main').css('display', 'none');
                }, 200);
            }
            document.getElementById("<%= boton_menu_cerrar.ClientID %>").style.display = "inline";
            document.getElementById("<%= boton_menu.ClientID %>").style.display = "none";
            return false;
        });

        $('#boton_menu_cerrar').click(function () {
            $(window).scrollTop(0);
            $('#elementos').css('display', 'none');
            $('#submenu').css('height', '0px');
            $('#submenu').css('visibility', 'hidden');
            $('#main').css('display', 'inline-block');
            document.getElementById("<%= boton_menu.ClientID %>").style.display = "inline";
            document.getElementById("<%= boton_menu_cerrar.ClientID %>").style.display = "none";
            return false;
        });
    });

    (function () {
        var mouse = false, keyboard = false;
        document.onmousemove = function () 
        {
            mouse = true;
        };
        document.onkeydown = function () 
        {
            keyboard = true;
        };
        setInterval(function () 
        {
            if (!mouse && !keyboard) 
            {
                // var boton = document.getElementById('actualizar');
                // boton.click();
            }
            else 
            {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 1000);
    })()
    function salir() 
    {
        window.close();
    }
    function abrir() 
    {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    document.onkeypress = stopRKey;
</script>

   <script type="text/javascript" language="javascript">
    $(function () {
       <%  var serializer =  new  System . Web . Script . Serialization . JavaScriptSerializer ();  %> 
       var codigos_proveedor =  <%= serializer . Serialize ( lista_productos )  %>;
        $("#busqueda_medina").autocomplete({
            source: codigos_proveedor
            
        });       
    });

     $(function () {
          var $rows = $('#tabla_alta_clientes tr[class!="cabecera_tabla"]');
          var $rows2 = $('#tabla_ventas tr[class!="cabecera_tabla"]');
          $('#Buscar_java').click(function () {
              var val = $.trim($('#buscar').val()).replace(/ +/g, ' ').toLowerCase();

              $rows.show().filter(function () {
                  var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                  return ! ~text.indexOf(val);
              }).hide();

              $rows2.show().filter(function () {
                  var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                  return ! ~text.indexOf(val);
              }).hide();
          });
      });
      $(function () {
          $("#buscarfecha").datepicker({ dateFormat: 'dd/mm/yy', maxDate: "0D" }).val();
      });
       $(function () {
          var $rows = $('#tabla_alta_clientes tr[class!="cabecera_tabla"]');
          $('#buscarfecha').change(function () {
              var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase();

              $rows.show().filter(function () {
                  var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
                  return ! ~text.indexOf(val);
              }).hide();
          });
      });
  </script>

  <script type="text/javascript" language="javascript">
    $(function () {
       <%  var serializer2 =  new  System . Web . Script . Serialization . JavaScriptSerializer ();  %>   
       var compras_anuales =  <%= serializer2 . Serialize ( lista_productos_cliente )  %>;
        $("#busqueda_cliente").autocomplete({
            source: compras_anuales
            
        });
    });
    </script>
    
    <script>
    $(function () {
     <%  var enchufame =  new  System . Web . Script . Serialization . JavaScriptSerializer ();  %>   
     var productos =  <%= enchufame . Serialize ( lista_descripcion )  %>;
            $("#busqueda_producto").autocomplete({
                source: productos
            
        });
      });
    </script>

    <link rel="stylesheet" href="css/dashboard.css" />
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Reportes de Clientes - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />  
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/material-design-font.css">


    </head>
    <body bgcolor="#f0f0f0">
    <form id="form1" runat="server">
    <div id="menu">
        <div id="menu_mobiles">
                     <asp:LinkButton ID="boton_menu" runat="server"  ToolTip="Menu de opciones"><i class="fa fa-bars fa-2x"></i></asp:LinkButton>
                     <asp:LinkButton ID="boton_menu_cerrar" runat="server"  ToolTip="Cerrar menu de opciones"><i class="fa fa-bars fa-2x"></i></asp:LinkButton>
           </div>
           <i class="fa fa-dashboard fa-2x blanco"></i><asp:Label ID="vendedor" runat="server" CssClass="nombre_vendedor">Clientes</asp:Label>
           <div class="botones_menu">
                    <asp:LinkButton ID="boton_exportar" runat="server" CssClass="boton medina" ToolTip="Exportar" onclick="boton_exportar_Click" ><img id="d" class="icono" src="png/z.png"></asp:LinkButton>               
                    <asp:LinkButton ID="boton_imprimir" runat="server" CssClass="boton medina" ToolTip="Imprimir" onclick="boton_imprimir_Click" ><img id="e" class="icono" src="png/e.png"></asp:LinkButton>               
                    <asp:LinkButton ID="salir" runat="server" CssClass="boton medina" ToolTip="Salir" onclick="boton_salir_Click"><img id="f" class="icono" src="png/f.png"></asp:LinkButton>
            </div> 
        </div>  
        <div id="submenu">
                    <div id="elementos">
                                    
                            <asp:LinkButton CssClass="elemento_menu" ID="m_exportar" runat="server"  ToolTip="Exportar" onclick="boton_exportar_Click" Enabled="False"><p class="texto_m">Exportar</p></asp:LinkButton>                
                            <asp:LinkButton CssClass="elemento_menu" ID="m_salir" runat="server"  ToolTip="Salir" onclick="boton_salir_Click"><p class="texto_m">Salir</p></asp:LinkButton>
                    </div>
                    </div>   


   
         <div class ="main medina">
         <div id="main_derecho">  
         <div class="paneles_graficas">
         <div class="controles_busqueda">
         <ul >  
           <li class="cabecera_informacion"><p class="texto_cabecera">Filtrar</p></li>
         <li>
         <asp:DropDownList ID="tipo_busqueda" runat="server" CssClass="lista_categoria_medina" AutoPostBack="True" Width="150px" onselectedindexchanged="tipo_busqueda_SelectedIndexChanged">
         <asp:ListItem>Seleccionar</asp:ListItem>
         <asp:ListItem>Datos</asp:ListItem>
         <asp:ListItem>Consumo De Productos Por Clienete</asp:ListItem>
         <asp:ListItem>Consumo De Cliente</asp:ListItem>
         <asp:ListItem>Reportes Alta Clientes</asp:ListItem>
         </asp:DropDownList></li>
         <li>
         <li class="cabecera_informacion"><p class="texto_cabecera">Opciones</p></li>
         </li>
         <li>
         <asp:DropDownList ID="lista_fechas" runat="server" CssClass="lista_categoria_medina"  AutoPostBack="True" Width="200px" onselectedindexchanged="lista_fechas_SelectedIndexChanged">
         </asp:DropDownList>
         </li>
         </ul>  
         </div>
         </div>
         </div>


            <div id="main_izquierdo">        
            <div class="paneles_graficas">
            <div class="controles_busqueda">

               <asp:Panel ID="panel_busqueda" runat="server" Visible="false">
               <div class="cabecera_informacion"><p class="texto_cabecera">Buscar Codigo</p></div>
               <asp:TextBox ID="busqueda_medina" runat="server" CssClass="cajas_chicas margen_izquierdo" Enabled="true"  ToolTip="Buscar Codigo Proveedor"></asp:TextBox>
               <asp:LinkButton ID="buscale" runat="server"  ToolTip="Buscar" OnClick="boton_buscar_Click" Style="text-decoration: none" CssClass="boton_regresar button small margen_izquierdo">Buscar Codigo</asp:LinkButton>
               <div class="cabecera_informacion"><p class="texto_cabecera">Buscar Producto</p></div>
               <asp:TextBox ID="busqueda_producto" runat="server" CssClass="cajas_chicas margen_izquierdo" Enabled="true" ToolTip="Buscar Producto" ></asp:TextBox>
               <asp:LinkButton ID="LinkButton2" runat="server"  ToolTip="Buscar" OnClick="boton_buscar_producto_Click" Style="text-decoration: none" CssClass="boton_regresar button small margen_izquierdo">Buscar Producto</asp:LinkButton>
               <asp:Label ID="mensages" runat="server" Visible="false"></asp:Label>
               </asp:Panel>


               <asp:Panel ID="panel_busqueda_cliente" runat="server" Visible="false">
               <div class="cabecera_informacion"><p class="texto_cabecera">Buscar Cliente</p></div>
               <asp:TextBox ID="busqueda_cliente" runat="server" CssClass="caja_medina margen_izquierdo" Enabled="true" ></asp:TextBox>
               <asp:LinkButton ID="LinkButton1" runat="server"  ToolTip="Buscar" OnClick="boton_buscar_cliente_Click" Style="text-decoration: none" CssClass="boton_regresar button small margen_izquierdo">Buscar Cliente</asp:LinkButton>
               <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
               </asp:Panel>

               <asp:Panel ID="Busqueda_principal" runat="server" Visible="true" >
               <div class="cabecera_informacion"><p class="texto_cabecera">Buscar</p></div>
               <asp:TextBox ID="buscar" runat="server" CssClass="cajas_chicas" Enabled="true" placeholder="Buscar"></asp:TextBox>
               <asp:Label ID="Buscar_java" runat="server"  ToolTip="Buscar" Style="text-decoration: none" CssClass="boton_regresar button small margen_izquierdo">Buscar</asp:Label>
               <asp:TextBox ID="buscarfecha" runat="server" CssClass="caja_medina" Enabled="true" placeholder="Buscar Fecha"></asp:TextBox>
               </asp:Panel>
                
            <div class="espacio"></div>
            </div>
            </div>
            </div>

            <div id="main_centro">
            <div class="paneles_graficas">
            <div class="controles_busqueda">

            <div class="cabecera_informacion"><p class="texto_cabecera"><asp:Label ID="encabezado" runat="server"></asp:Label></p></div>
            <asp:Panel ID="panel_datos" runat="server" Visible="False">
            <asp:GridView ID="tabla_ventas" runat="server" AutoGenerateColumns="False" DataSource='<%# datos_clientes() %>'  CssClass="tabla"  DataKeyNames="cliente" onrowcommand="tabla_ventas_RowCommand" ShowHeaderWhenEmpty="True" PageSize="50">
            <HeaderStyle CssClass="cabecera_tabla" />
		    <PagerSettings Visible="False" />
		    <AlternatingRowStyle CssClass="renglon_tabla" />
            <Columns>
                
                <asp:BoundField HeaderText="Cliente" DataField="cliente">
                </asp:BoundField>
                <asp:BoundField HeaderText="Numero" DataField="numero_ventas">
                </asp:BoundField>
                <asp:BoundField HeaderText="Total" DataField="total" DataFormatString="{0:N}">
                </asp:BoundField>
                
                
            </Columns>
            </asp:GridView>
            </asp:Panel>

            <asp:Panel ID="panel_alta_clientes" runat="server" Visible="False">
            <asp:GridView ID="tabla_alta_clientes" runat="server" AutoGenerateColumns="False" DataSource='<%# alta_clientes_grilla() %>'  CssClass="tabla"  DataKeyNames="cliente" onrowcommand="tabla_ventas_RowCommand" ShowHeaderWhenEmpty="True" PageSize="50">
            <HeaderStyle CssClass="cabecera_tabla" />
		    <PagerSettings Visible="False" />
		    <AlternatingRowStyle CssClass="renglon_tabla" />
            <Columns>
                
                <asp:BoundField HeaderText="Nombre Cliente" DataField="cliente">
                </asp:BoundField>
                <asp:BoundField HeaderText="Fecha Alta" DataField="fecha_alta" DataFormatString="{0:dd/MM/yyyy}">
                </asp:BoundField>
                <asp:BoundField HeaderText="Nombre Vendedor" DataField="nombre_vendedor">
                </asp:BoundField>
                <asp:BoundField HeaderText="Telefono" DataField="telefono">
                </asp:BoundField>
                      
                
            </Columns>
            </asp:GridView>
            </asp:Panel>
            <asp:Panel ID="panel_no_resultados_busqueda" runat="server" CssClass="no_resultados" Visible="False">
            <br />
            <br />
            <i class="fa fa-frown-o fa-2x"></i>&nbsp;&nbsp;<asp:Label ID="leyenda" runat="server" CssClass="texto" Text="No se encontraron resultados relacionados con esta busqueda"></asp:Label>
            </asp:Panel>
            </div>
            </div>
            </div>
           </div>

            <asp:Panel ID="panel_detalles_venta" runat="server" 
            CssClass="panel_surtir_inventario modulo-esp tabla_larga" Visible="False">
            <asp:LinkButton ID="boton_cerrar_detalles_venta" runat="server" 
                CssClass="boton_cerrar_precios boton-cerrar" 
             onclick="boton_cerrar_detalles_venta_Click">
            <div class="cerrar-modulo">
            
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <i class="fa fa-times"></i>&nbsp;&nbsp;Cerrar Modulo</div>
            </asp:LinkButton>
                <div class="controles_surtir_inventario tabla_sobrepuesta">
                <ul class="vertical">
                <li>
                <asp:GridView ID="tabla_detalles_venta" runat="server" AutoGenerateColumns="False" CssClass="tabla_cantidades" ShowHeaderWhenEmpty="True" >
             <HeaderStyle CssClass="GridHeader" />
		    <PagerSettings Visible="False" />
		    <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
            <Columns>
                <asp:BoundField HeaderText="C. Proveedor" DataField="codigo_proveedor" >
                </asp:BoundField>
                <asp:BoundField HeaderText="Modelo" DataField="producto" >
                </asp:BoundField>
                <asp:BoundField HeaderText="Cantidad" DataField="cantidad">
                </asp:BoundField>
                <asp:BoundField HeaderText="Precio" DataField="precio" DataFormatString="{0:C}">
                </asp:BoundField>
                <asp:BoundField HeaderText="Total" DataField="total" DataFormatString="{0:C}">
                </asp:BoundField>
            </Columns>
            </asp:GridView>
                </li>
                </ul>
            </div>
             </asp:Panel>
    </form>
  </body>
</html>