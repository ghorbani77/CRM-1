<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/diagnostico.aspx.cs" Inherits="diagnostico" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="js/Chart.js"></script>
<script type="text/javascript">
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
    function salir() {
        window.close();
    }
    function graficar() {
        var errores_tabla = document.getElementById("grafica_diagnostico").getContext("2d");
        window.errores_tablas_grafica = new Chart(errores_tabla).Line(datos_tablas, {
            responsive: true
        });
    }
    window.onload = function () {
        graficar();
    }
	</script>
    <script>
         <%  var serializer =  new  System . Web . Script . Serialization . JavaScriptSerializer ();  %>   
       var tablas_db =  <%= serializer . Serialize ( tablas_db )  %>;
       var errores_tabla =  <%= serializer . Serialize ( errores_tabla )  %>;
       var datos_tablas = {
        labels: tablas_db,
        datasets: [
                				{
                				    label: "My Second dataset",
                				    fillColor: "rgba(245,7,70,0.5)",
                                    strokeColor: "rgba(22,6,40,1)",
                                    pointColor: "rgba(79,193,233,0.5)",
                                    pointStrokeColor: "#fff",
                                    pointHighlightFill: "#fff",
                                    pointHighlightStroke: "rgba(220,220,220,1)",
                				    data: errores_tabla
                				}
			]
    }
  </script>
<head id="Head1" runat="server">
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Diagnostico - Inklaser</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
      <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
      <link rel="stylesheet" href="css/material-design-font.css">
    </head>
<body bgcolor="#e9e9e9">
    <form id="form1" runat="server">
        
        
         <div class="large-12 header-inventario header-prom header-dash">
    <span class="titulo left">Diagnostico del sistema</span>
              <ul class="inline-list right ul-prom">
            <li>
   <asp:LinkButton ID="salir" runat="server" 
                CssClass="boton_salir" ToolTip="Salir" onclick="salir_Click"><i class="fa fa-sign-out"></i>
                <span>Salir</span>
                </asp:LinkButton>
            </li>
              </ul>
             
             
             
        </div>
        
    <div class="large-12 ">
        
        
        
        
        
  
    <div class="large-12 columns">
    <div class="ventas_anuales min-height-dashboard">
    <div class="cabecera_ventas_globales">
    <p class="titulo dh">TABLAS A REVISAR</p>
    </div>
     <asp:GridView ID="tabla_errores_tablas" runat="server" DataSource='<%# datos_diagnostico() %>'  
            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
            AllowPaging="True"
            PagerSettings-Visible = "false" 
            PageSize="7">
            <HeaderStyle CssClass="GridHeader" />
		    <PagerSettings Visible="False" />
		    <RowStyle CssClass="GridRow" HorizontalAlign="Center" />
		    <AlternatingRowStyle CssClass="GridAlternateRow" />
            <Columns>
                <asp:BoundField HeaderText="Tabla" DataField="tabla">
                </asp:BoundField>
                <asp:BoundField HeaderText="Numero De Errores" DataField="numero_errores">
                </asp:BoundField>
                <asp:BoundField HeaderText="Estado De La Tabla" DataField="estado">
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        </div> 
         <div class="ventas_anuales min-height-dashboard">
    <div class="cabecera_ventas_globales">
    <p class="titulo dh">GRAFICA DE DIAGNOSTICO</p>
    </div>
        <div class="grafica_anual">
            <canvas id="grafica_diagnostico" class="grafica" width="700" height="235"></canvas>
    </div>
    </div>
       <div class="ventas_anuales min-height-dashboard">
    <div class="cabecera_ventas_globales">
    <p class="titulo dh">LOG DE ERRORES</p>
    </div>
    <div class="limitado-dashboard-errores">
     <asp:GridView ID="tabla_errores" runat="server" DataSource='<%# datos_errores() %>'
            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False"
            AllowPaging="True"
            PagerSettings-Visible = "false" 
            PageSize="7">
            <HeaderStyle CssClass="GridHeader" />
		    <PagerSettings Visible="False" />
		    <RowStyle CssClass="GridRow renglon-corto" HorizontalAlign="Center" />
            <Columns>
                <asp:BoundField HeaderText="Fecha" DataField="fecha_error" DataFormatString="{0:dd-MM-yyyy}">
                </asp:BoundField>
                <asp:BoundField HeaderText="Error" DataField="error">
                </asp:BoundField>
                <asp:BoundField HeaderText="Usuario" DataField="usuario">
                </asp:BoundField>
            </Columns>
        </asp:GridView>
        </div>
        </div> 
    </div>
    </form>
        </div>
    
    
    
    <!--#include virtual="footer.aspx"--> 