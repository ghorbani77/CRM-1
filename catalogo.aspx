<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/catalogo.aspx.cs"
    Inherits="Catalogo" %>

<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js" type="text/javascript"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" language="javascript">
    function cargar(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        if (boton.toString() == 'boton_buscar') {
            setTimeout(function () {
               var boton = document.getElementById('boton_oculto_buscar');
               boton.click();
            }, 600);
        }
    }
    function panel_sobrepuesto() {
        $("#panel_cantidades").dialog({ width: "auto",title: "Cantidad por sucursal" });
    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() {
        window.close();
    }
    function producto_agregado() {
        alert('Producto agregado al carrito exitosamente');
    }
    function carrito_vacio() {
        alert('El carrito de compra se encuentra vacio no es posible realizar cotizacion');
    }
    function articulos_excedidos() {
        alert('Error el numero de articulos permitidos ah sido alcanzado');
    }
    function verificar_enter(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) {
                 var boton = document.getElementById('boton_buscar');
                  boton.click();
        }
          }
          function stopRKey(evt) {
              var evt = (evt) ? evt : ((event) ? event : null);
              var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
              if ((evt.keyCode == 13) && (node.type == "text")) { return false; }
          }
          document.onkeypress = stopRKey;
          function pageLoad() {
              var timeout, click_presionado = false;
              var i, guiones, cadena, identificador_texto, recibir_casilla, cantidad;
              var identificador;
              function disminuir_presionado() {
                  guiones = 0;
                  identificador_texto = "";
                  cadena = "";
                  for (i = 0; i < identificador.length; i++) {
                      if (identificador[i] == '_') {
                          guiones++;
                      }
                      if (guiones < 3) {
                          cadena = cadena + identificador[i];
                      }
                      else {
                          break;
                      }
                  }
                  identificador_texto = cadena + "_cantidad";
                  recibir_casilla = document.getElementById(identificador_texto);
                  cantidad = parseInt(recibir_casilla.value);
                  if (cantidad > 1) {
                      cantidad = cantidad - 1;
                      document.getElementById(identificador_texto).value = cantidad;
                  }
              }
              function aumentar_presionado() {
                  guiones = 0;
                  identificador_texto = "";
                  cadena = "";
                  for (i = 0; i < identificador.length; i++) {
                      if (identificador[i] == '_') {
                          guiones++;
                      }
                      if (guiones < 3) {
                          cadena = cadena + identificador[i];
                      }
                      else {
                          break;
                      }
                  }
                  identificador_texto = cadena + "_cantidad";
                  recibir_casilla = document.getElementById(identificador_texto);
                  cantidad = parseInt(recibir_casilla.value);
                  if (cantidad < 999) {
                      cantidad = cantidad + 1;
                      document.getElementById(identificador_texto).value = cantidad;
                  }
              }
              $('.aumentar').click(function () {
                  return false;
              });
              $('.disminuir').click(function () {
                  return false;
              });
              $('.aumentar').mousedown(function () {
                  click_presionado = true;
                  identificador = $(this).attr("id");
                  if (click_presionado) {
                      timeout = setInterval(function () {
                          aumentar_presionado()
                      }, 100);
                  }
                  return false;
              });
              $('.aumentar').mouseup(function () {
                  click_presionado = false;
                  clearInterval(timeout);
                  return false;
              });
              $('.disminuir').mousedown(function () {
                  click_presionado = true;
                  identificador = $(this).attr("id");
                  if (click_presionado) {
                      timeout = setInterval(function () {
                          disminuir_presionado()
                      }, 100);
                  }
                  return false;
              });
              $('.disminuir').mouseup(function () {
                  click_presionado = false;
                  clearInterval(timeout);
                  return false;
              });
          }
</script>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Catalogo</title>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="css/catalogo.css" rel="stylesheet" type="text/css" />
     <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'type='text/css'>
     <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<body>
    <form id="formulario" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
        <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
                            display: none">
                        <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-pulse fa-3x"></i></asp:Label>
                        </asp:Panel>
            <div class="principal">
                <div class="barra_superior">
                    <div class="espacio_logotipo">
                        <img class="logotipo" src="img/inklaser.jpeg" />
                    </div>
                    <asp:TextBox ID="caja_busqueda" placeholder="Introduce una busqueda" CssClass="caja_buscar" runat="server"></asp:TextBox>
                    <asp:LinkButton ID="boton_buscar" runat="server" CssClass="boton_buscar" ToolTip="Buscar" OnClick="boton_buscar_Click"><i class="fa fa-search"></i></asp:LinkButton>
                    
                    <asp:Label ID="t_busqueda" runat="server" Text="Buscar por" CssClass="etiquetas_barra_superior"></asp:Label>
                    <asp:DropDownList ID="tipo_busqueda" runat="server" CssClass="controles_busqueda"
                        OnSelectedIndexChanged="tipo_busqueda_SelectedIndexChanged" AutoPostBack="True">
                        <asp:ListItem>Modelo</asp:ListItem>
                        <asp:ListItem>Producto</asp:ListItem>
                        <asp:ListItem>Codigo de Proveedor</asp:ListItem>
                    </asp:DropDownList>
                     
                    <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                        OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>
                        <asp:Panel ID="notificaciones" CssClass="boton_principal notificacion"
                    runat="server">

                    

                    <asp:LinkButton ID="cantidad_articulos" runat="server" ToolTip="Volver" OnClick="cantidad_articulos_Click"><i class="fa fa-shopping-cart negro"></i></asp:LinkButton><div
                        class="globo_notificacion globo_verde">
                        <asp:Label ID="numero_articulos" CssClass="texto_globo" runat="server">0</asp:Label></div>
                </asp:Panel>


                <asp:Label CssClass="nombre_usuario tipo_texto" ID="usuario" runat="server"></asp:Label>
                </div>
                <div class="contenido">

               
                   

                    
                    
                        <asp:GridView ID="tabla_inventario" runat="server" AutoGenerateColumns="False" OnRowCommand="tabla_inventario_RowCommand"
                            DataKeyNames="codigo_proveedor" DataSource='<%# datos_inventario() %>' CssClass="tabla">
                            <HeaderStyle CssClass="GridHeader" />
                            <RowStyle CssClass="GridRow" />
                            <AlternatingRowStyle CssClass="GridRow" />
                            <Columns>
                                <asp:BoundField HeaderText="C. Prov" DataField="codigo_proveedor">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Descripcion" DataField="producto">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Modelo" DataField="modelo">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Credito" DataField="precio_credito" DataFormatString="{0:C}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Contado" DataField="precio_contado" DataFormatString="{0:C}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Web" DataField="precio_medio_mayoreo" DataFormatString="{0:C}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Mayoreo" DataField="precio_mayoreo" DataFormatString="{0:C}">
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Distrib" DataField="precio_gobierno" DataFormatString="{0:C}">
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="C. Total" ShowHeader="True">
                                <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="cantidad_productos" CssClass="cantidad_productos" onkeypress="return numeros(event);"
                                            MaxLength="3" runat="server" Width="25px" Text='<%#Eval("cantidad") %>' CommandName="ver_cantidades"
                                            CommandArgument="<%#((GridViewRow)Container).RowIndex%>" ToolTip="Ver cantidad de producto por sucursales"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="C. Solicitar" ShowHeader="True">
                                <ItemStyle CssClass="espacio" HorizontalAlign="Center"/>
                                    <ItemTemplate>
                                        <asp:TextBox ID="cantidad" Enabled="False" CssClass="cantidad" Text='<%#Eval("cantidad_solicitada") %>' MaxLength="10" runat="server" 
                                            Width="80px"></asp:TextBox>
                                            <asp:LinkButton ID="aumentar" runat="server" CssClass="aumentar"><i class="fa fa-plus"></i></asp:LinkButton>
                                            <asp:LinkButton ID="disminuir" runat="server" CssClass="disminuir"><i class="fa fa-minus"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="" ShowHeader="True">
                                <ItemStyle HorizontalAlign="Center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="agregar_carrito" runat="server" CausesValidation="False" ToolTip="Agregar producto a carrito de compra"
                                            CommandName="agregar_carrito" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-cart-plus texto_boton_tabla controles_tablas"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                 <div class="separador"></div>
                    <asp:Panel ID="panel_cantidades" runat="server" CssClass="panel_surtir_inventario modulo-esp" style="display:none">
                        <asp:GridView ID="tabla_cantidades" runat="server" AutoGenerateColumns="False" CssClass="tabla_cantidades"
                            ShowHeaderWhenEmpty="True" DataSource='<%# datos_inventario_sucursal() %>'>
                            <HeaderStyle CssClass="GridHeader" />
                            <PagerSettings Visible="False" />
                            <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
                            <Columns>
                                <asp:BoundField HeaderText="Id Sucursal" DataField="id_sucursal"></asp:BoundField>
                                <asp:BoundField HeaderText="Sucursal" DataField="sucursal"></asp:BoundField>
                                <asp:BoundField HeaderText="Cod. Proveedor" DataField="codigo_proveedor"></asp:BoundField>
                                <asp:BoundField HeaderText="Cantidad" DataField="cantidad"></asp:BoundField>
                            </Columns>
                        </asp:GridView>
                    </asp:Panel>
                    <asp:Panel ID="panel_no_resultados_busqueda" runat="server" CssClass="no_resultados"
                        Visible="False">
                        <asp:Label ID="leyenda" runat="server"
                            CssClass="texto">No se encontraron resultados relacionados con esta busqueda&nbsp;<i class="fa fa-frown-o fa-2x rojo"></i></asp:Label>
                    </asp:Panel>
                </div>
            </div>
            <asp:Button ID="boton_oculto_buscar" runat="server" OnClick="boton_oculto_buscar_Click" Text="actualizar" Visible="True" Style="visibility: hidden" />
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="boton_oculto_buscar" EventName="Click" />
            <asp:AsyncPostBackTrigger ControlID="boton_buscar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>
