<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/dashboard.aspx.cs" Inherits="dashboard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script  type="text/javascript" language="javascript">
function menu() {
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
    }
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
    function ocultar_globales() {
        document.getElementById("<%= panel_ventas_globales.ClientID %>").style.display = "none";
        document.getElementById("<%= panel_rendimiento_vendedor.ClientID %>").style.display = "inline-block";
    }
    function ocultar_rendimiento() {
        document.getElementById("<%= panel_ventas_globales.ClientID %>").style.display = "inline-block";
        document.getElementById("<%= panel_rendimiento_vendedor.ClientID %>").style.display = "none";
    }
    function graficar() {
   //     var ventas_globales = document.getElementById("grafica_ventas_globales").getContext("2d");
    //    window.grafica_globales = new Chart(ventas_globales).Pie(datos_globales, {
    //        responsive: true, tooltipFontColor: "rgba(0, 0, 0, 0.0)",tooltipFillColor: "rgba(0,0,0,0.0)"
    //    });

         var ventas_globales = document.getElementById("grafica_ventas_globales").getContext("2d");
            window.grafica_globales = new Chart(ventas_globales).Bar(datos_globales, {
                responsive: true
            });


        var ventas_vendedor = document.getElementById("grafica_ventas_vendedor").getContext("2d");
            window.vendedor = new Chart(ventas_vendedor).Doughnut(datos_ventas_totales, {
                responsive: true, tooltipFontColor: "rgba(0, 0, 0, 0.0)", tooltipFillColor: "rgba(0,0,0,0.0)"
            });
            var comisiones_vendedor = document.getElementById("grafica_comisiones_vendedor").getContext("2d");
            window.comision_vendedor = new Chart(comisiones_vendedor).Doughnut(datos_comisiones_totales, {
                responsive: true, tooltipFontColor: "rgba(0, 0, 0, 0.0)", tooltipFillColor: "rgba(0,0,0,0.0)"
            });
            var ventas_anuales = document.getElementById("grafica_ventas_anuales").getContext("2d");
            window.ventas_anuales_grafica = new Chart(ventas_anuales).Line(datos_anuales, {
                responsive: true
            });
    }
    window.onload = function () {
    menu();
        graficar();
    }
         <%  var serializer =  new  System . Web . Script . Serialization . JavaScriptSerializer ();  %>   
        var vendedores =  <%= serializer . Serialize ( vendedores)  %>;
        var ventas =  <%= serializer . Serialize ( ventas )  %>;
      //  var colores =  <%= serializer . Serialize ( colores )  %>;
       // var contador_vendedores = "<%= contador_vendedores %>";
       // var datos_globales= new Array();
       // var datos= new Array();
       // var i; 
       //  for(i=0 ; i < contador_vendedores; i++)
        //     {
         //      datos =    {
			//	    value: ventas[i],
		//		    color: colores[i],
		//		    highlight: "#193235",
		//		    label: vendedores[i]};
        //       datos_globales[i]=datos;
         //      }

               var datos_globales = {
        labels: vendedores,
        datasets: [
			{
			    fillColor: "rgba(26, 188, 156  ,0.5)",
			    strokeColor: "rgba(39, 174, 96  ,0.8)",
			    highlightFill: "rgba(39, 174, 96  ,0.75)",
			    highlightStroke: "rgba(39, 174, 96  ,1)",
			    data: ventas
			}
		]

    }


             //grafica total de ventas por vendedor
             var total_ventas_vendedor =  <%= serializer . Serialize (total_ventas_vendedor)  %>;
             var total_ventas =  <%= serializer . Serialize (total_ventas)  %>;
             var vendedor =  <%= serializer . Serialize ( nombre_vendedor_actual )  %>;
             var datos_ventas_totales = new Array();
             datos_ventas_totales =    [{
				    value: total_ventas_vendedor,
				    color: "#3399FF",
				    highlight: "#193235",
				    label: vendedor},
                    {
                    value: total_ventas,
				    color: "#003366",
				    highlight: "#193235",
				    label: "Total de ventas"}];
             //graficar total de comisiones_vendedor
             var total_comisiones_vendedor =  <%= serializer . Serialize (total_comisiones_vendedor)  %>;
             var total_ventas_comision =  <%= serializer . Serialize (total_ventas_comision)  %>;
             var vendedor_nombre =  <%= serializer . Serialize ( nombre_vendedor_actual )  %>;
             var datos_comisiones_totales = new Array();
             datos_comisiones_totales =    [
              {
                    value: total_ventas_comision,
				    color: "#FF9900",
				    highlight: "#193235",
				    label: "Total de ventas"},
             {
				    value: total_comisiones_vendedor,
				    color: "#FFCC33",
				    highlight: "#193235",
				    label: vendedor_nombre}
                    ];
           //grafica de ventas anuales
       var ventas_anuales =  <%= serializer . Serialize ( ventas_anuales )  %>;
       var ventas_anuales_espejo =  <%= serializer . Serialize ( ventas_anuales_espejo )  %>;
       var datos_anuales = {
        labels: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio","Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
        datasets: [
                				{
                				    label: "My Second dataset",
                				    fillColor: "rgba(118, 68, 138    ,0.8)",
                                    strokeColor: "rgba(118, 68, 138,1)",
                                    pointColor: "rgba(118, 68, 138,0.5)",
                                    pointStrokeColor: "rgba(118, 68, 138,0.5)",
                                    pointHighlightFill: "rgba(118, 68, 138,0.5)",
                                    pointHighlightStroke: "rgba(118, 68, 138,0.5)",
                				    data: ventas_anuales
                				},
                                 {
                				    label: "My Second dataset",
                				    fillColor: "rgba(26, 82, 118  ,0.8)",
                                    strokeColor: "rgba(26, 82, 118  ,0.8)",
                                    pointColor: "rgba(26, 82, 118  ,0.8)",
                                    pointStrokeColor: "rgba(26, 82, 118  ,0.8)",
                                    pointHighlightFill: "rgba(26, 82, 118  ,0.8)",
                                    pointHighlightStroke: "rgba(26, 82, 118  ,0.8)",
                				    data: ventas_anuales_espejo
                				}
			]
    }
  </script>
<head runat="server">
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Dashboard - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/dashboard.css" />
    <script type="text/javascript" src="js/foundation.min.js"></script>
    <script type="text/javascript" src="js/Chart.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css' />
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="css/material-design-font.css" />
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet" />
    </head>
<body>
    <form id="formulario" runat="server">
         <div id="menu">
           <i class="fa fa-dashboard fa-2x blanco"></i><asp:Label ID="vendedor" runat="server" CssClass="nombre_vendedor"></asp:Label>
           <div id="menu_mobiles">
                     <asp:LinkButton ID="boton_menu" runat="server"  ToolTip="Menu de opciones"><i class="fa fa-bars fa-2x"></i></asp:LinkButton>
                     <asp:LinkButton ID="boton_menu_cerrar" runat="server"  ToolTip="Cerrar menu de opciones"><i class="fa fa-bars fa-2x"></i></asp:LinkButton>
           </div>
           <div class="botones_menu">
                    <asp:LinkButton ID="boton_traspasos" runat="server" CssClass="boton" ToolTip="Reportes de Traspaso de Material" onclick="reportes_traspasos_Click" Enabled="True"><img id="a" class="icono" src="png/a.png"></asp:LinkButton>
                    <asp:LinkButton ID="boton_inventario" runat="server" CssClass="boton" ToolTip="Reportes de Inventario" onclick="reportes_inventario_Click" Enabled="True"><img id="b" class="icono" src="png/b.png"></asp:LinkButton>               
                    <asp:LinkButton ID="boton_ordenes_compras" runat="server" CssClass="boton" ToolTip="Reportes de Ordenes Compra" onclick="reportes_compras_Click" Enabled="True"><img id="c" class="icono" src="png/c.png"></asp:LinkButton>             
                    <asp:LinkButton ID="boton_clientes" runat="server" CssClass="boton" ToolTip="Reportes de Clientes" onclick="reportes_clientes_Click" Enabled="True"><img id="d" class="icono" src="png/d.png"></asp:LinkButton>               
                    <asp:LinkButton ID="reportes_ventas" runat="server" CssClass="boton" ToolTip="Reportes de ventas" onclick="reportes_ventas_Click" Enabled="True"><img id="e" class="icono" src="png/e.png"></asp:LinkButton>    
                    <asp:LinkButton ID="reporte_sucursales" runat="server" CssClass="boton" ToolTip="Reportes de sucursales" onclick="reportes_sucursales_Click" Enabled="True"><img id="g" class="icono" src="png/g.png"></asp:LinkButton>
                    <asp:LinkButton ID="filtro_ventas" runat="server" CssClass="boton" ToolTip="Reportes de sucursales" onclick="filtro_ventas_Click" Enabled="True"><img id="y" class="icono" src="png/y.png"></asp:LinkButton>         
                    <asp:LinkButton ID="salir" runat="server" CssClass="boton" ToolTip="Salir" onclick="salir_Click"><img id="f" class="icono" src="png/f.png"></asp:LinkButton>
            </div> 
        </div>
        <div id="submenu">
                    <div id="elementos">
                            <asp:LinkButton CssClass="elemento_menu" ID="m_sucursales" runat="server"  ToolTip="Reportes de Sucursales" onclick="reportes_sucursales_Click" ><p class="texto_m">Sucursales</p></asp:LinkButton>
                            <asp:LinkButton CssClass="elemento_menu" ID="m_traspasos" runat="server"  ToolTip="Reportes de Traspaso de Material" onclick="reportes_traspasos_Click" ><p class="texto_m">Traspasos</p></asp:LinkButton>
                            <asp:LinkButton CssClass="elemento_menu" ID="m_inventario" runat="server"  ToolTip="Reportes de Inventario" onclick="reportes_inventario_Click" ><p class="texto_m">Inventario</p></asp:LinkButton>              
                            <asp:LinkButton CssClass="elemento_menu" ID="m_ordenes_compra" runat="server"  ToolTip="Reportes de Ordenes Compra" onclick="reportes_compras_Click" ><p class="texto_m">Ordenes de compra</p></asp:LinkButton>             
                            <asp:LinkButton CssClass="elemento_menu" ID="m_clientes" runat="server"  ToolTip="Reportes de Clientes" onclick="reportes_clientes_Click" ><p class="texto_m">Clientes</p></asp:LinkButton>               
                            <asp:LinkButton CssClass="elemento_menu" ID="m_ventas" runat="server"  ToolTip="Reportes de ventas" onclick="reportes_ventas_Click" ><p class="texto_m">Ventas</p></asp:LinkButton>                
                            <asp:LinkButton CssClass="elemento_menu" ID="m_salir" runat="server"  ToolTip="Salir" onclick="salir_Click"><p class="texto_m">Salir</p></asp:LinkButton>
                    </div>
                    </div>
        
     <div id="main">
     <div id="main_izquierdo">

       <div class="paneles_graficas">
       <div class="cabecera_informacion"><p class="texto_cabecera">Mis Ventas</p></div>
             <div class="grafica">
                <canvas id="grafica_ventas_vendedor" class="graficas"></canvas>
              </div>
              <div class="informacion_grafica">
                <asp:Panel ID="indicadores_vendedor" runat="server" CssClass="indicador"></asp:Panel>
                 <asp:Panel ID="datos_vendedor" runat="server" CssClass="dato"></asp:Panel>
             </div>
             <div class="espacio"></div>
       </div>
    
       <div class="paneles_graficas">
       <div class="cabecera_informacion"><p class="texto_cabecera">Mis Comisiones</p></div>
            <div class="grafica">
                <canvas id="grafica_comisiones_vendedor" class="graficas"></canvas>
            </div>
            <div class="informacion_grafica">
                <asp:Panel ID="indicadores_vendedor_comisiones" runat="server" CssClass="indicador"></asp:Panel>
                <asp:Panel ID="datos_vendedor_comisiones" runat="server" CssClass="dato"></asp:Panel>
            </div>
            <div class="espacio"></div>
          </div>

       <asp:Panel ID="panel_ventas_globales" CssClass="paneles_graficas" runat="server">
       <div class="cabecera_informacion"><p class="texto_cabecera">Ventas Globales</p></div>
            <div class="grafica puntos">
                <canvas id="grafica_ventas_globales" class="graficas"></canvas>
                </div>
                <div class="espacio"></div>
      </asp:Panel>     


       <asp:Panel ID="panel_rendimiento_vendedor" CssClass="paneles_graficas" runat="server">
       <div class="cabecera_informacion"><p class="texto_cabecera">Rendimiento</p></div>
              <div class="rendimiento">
           <ul class="barras">
           <li>
            <div class="barra"><div style="<%=Session["monto_ventas_mensuales"]%>" class="progreso morado"></div><asp:Label ID="etiqueta_volumen_mensual" runat="server" Text="Monto Mensual 60%" CssClass="descripcion_barra"></asp:Label></div>
            </li>
              <li>
            <div class="barra"><div style="<%=Session["clientes_mensuales"]%>" class="progreso naranja"></div> <asp:Label ID="etiqueta_clientes_mensuales" runat="server" Text="Clientes Mensuales 50%" CssClass="descripcion_barra"></asp:Label></div>
            </li>        
            <li>
            <div class="barra"><div style="<%=Session["volumen_ventas_mensuales"]%>" class="progreso azul"></div><asp:Label ID="etiqueta_ventas_mensuales" runat="server" Text="Volumen Mensual 80%" CssClass="descripcion_barra"></asp:Label></div>
            </li>
            </ul>
            </div>
            <div class="espacio"></div>
            </asp:Panel>
      

    
        
        
      </div>


      <div id="main_derecho">
 
         <div class="paneles_graficas">
           <div class="cabecera_informacion"><p class="texto_cabecera">Ventas Anuales</p></div>
           <div class="grafica puntos">
                <canvas id="grafica_ventas_anuales" class="graficas"></canvas>
                </div>
                <div class="espacio"></div>
                </div>


          <div class="paneles_graficas">
          <div class="sin_espacio"><p class="texto_cabecera">Ultimas Ventas</p></div>
          <div class="datos_ventas">
         <asp:GridView ID="tabla_ventas" runat="server" DataSource='<%# datos_ventas() %>'  
                ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
                AllowPaging="True"
                PagerSettings-Visible = "false" 
                PageSize="7">
                <HeaderStyle CssClass="cabecera_tabla"/>
		        <PagerSettings Visible="False" />
		        <RowStyle CssClass="renglon_tabla" HorizontalAlign="Center" />
		        <AlternatingRowStyle CssClass="renglon_tabla" />
                <Columns>
                    <asp:BoundField HeaderText="Cliente" DataField="cliente">
                    <ItemStyle CssClass="campo" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Subtotal" DataField="subtotal" DataFormatString="{0:C}">
                    <ItemStyle CssClass="campo campo_oculto" />
                    <HeaderStyle CssClass="campo_oculto" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Iva" DataField="iva" DataFormatString="{0:C}">
                    <ItemStyle CssClass="campo campo_oculto" />
                    <HeaderStyle CssClass="campo_oculto" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Total" DataField="total" DataFormatString="{0:C}">
                    <ItemStyle CssClass="campo" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Comision" DataField="comision" DataFormatString="{0:C}">
                    <ItemStyle CssClass="campo campo_oculto" />
                    <HeaderStyle CssClass="campo_oculto" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            </div>
            <div class="espacio"></div>
           </div>


      
        
            </div>
            </div>
    </form>
    </body>
    </html>
    
    
    
    