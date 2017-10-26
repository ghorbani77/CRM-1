<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/almacen.aspx.cs" Inherits="almacen" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script  type="text/javascript" language="javascript">
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
                var boton = window.document.getElementById('actualizar');
                boton.click();
            }
            else {
                mouse = false;
                keyboard = false;
                //   window.opener.document.getElementById('caja_contador').value = "0";
            }
        }, 300000);
    })()
function verificar_enter(e) 
    {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        if (key_press == 13) 
        {
            var boton = document.getElementById('boton_escanear');
            boton.click();
        }
    }
    function mensaje_exito() {
        setTimeout(function () {
            var boton = document.getElementById('cerrar_mensaje');
            boton.click();
        }, 1000);
    }
function cargar(boton) 
    {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        setTimeout(function () {
            document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
            mensaje_exito();
        }, 1000);

    }
    function cargar_actualizacion(boton) {
        document.getElementById("<%= panel_cargando.ClientID %>").style.display = "inline";
        setTimeout(function () {
            document.getElementById("<%= panel_cargando.ClientID %>").style.display = "none";
        }, 2000);
    }
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() {
        window.close();
    }
  </script>
<head id="Head1" runat="server">
<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Almacen</title>
    <link rel="stylesheet" href="css/dashboard.css" />
    <link rel="stylesheet" href="css/crico.css" />
    <script type "text/javascript" src="javascript/funciones.js"></script>
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
     <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
     <asp:Panel ID="panel_cargando" runat="server" Visible="True" Style="text-decoration: none;
                            display: none">
                        <asp:Label ID="loading_rojo" runat="server"><i class="fa fa-spinner fa-spin fa-3x"></i></asp:Label>
                        </asp:Panel>
                          <asp:Panel ID="panel_bloqueo" runat="server" Visible="False">
                 <asp:Panel ID="panel_confirmacion" runat="server" CssClass="panel_confirmacion">
                 <p class="texto"><asp:Label runat="server" ID="Mensaje_confirmacion" Text="Desea eliminar el material"></asp:Label>&nbsp;<i class="fa fa-question-circle rojo"></i></p>
                     <asp:LinkButton ID="si" runat="server" CssClass="boton_confirmacion boton_si" OnClick="boton_si_Click">Si</asp:LinkButton>
                     <asp:LinkButton ID="no" runat="server" CssClass="boton_confirmacion boton_no" OnClick="boton_no_Click">No</asp:LinkButton>
                     <div class="separador_altas"></div>
                        </asp:Panel>
                        </asp:Panel>
         <div id="menu">
           <i class="fa fa-inbox fa-2x blanco"></i><asp:Label ID="vendedor" runat="server" CssClass="nombre_vendedor">Almacen</asp:Label>
        </div>
        
        <div class="a">
            <div class="b">
            </div>
            <div class="c">
                <div class="d">
                     <ul class="lista_prueba">
                       <li><asp:Button ID="Button1" runat="server" Text="Button" CssClass="bu" /></li>
                       <li><asp:Button ID="Button2" runat="server" Text="Button" CssClass="bu" /></li>
                       <li><asp:Button ID="Button3" runat="server" Text="Button" CssClass="bu" /></li>
                       <li><asp:Button ID="Button4" runat="server" Text="Button" CssClass="bu" /></li>
                       <li><asp:Button ID="Button5" runat="server" Text="Button" CssClass="bu" /></li>
                       <li><asp:Button ID="Button6" runat="server" Text="Button" CssClass="bu" /></li>
                     </ul>
                </div>
                <div class="e">
                </div>
            </div>
        </div>
     <div id="main">
     <div class="controles">
                <ul class="lista_almacen">
                    <li>
                        <asp:Label ID="e_pendientes" runat="server" Text="Guias pendientes"></asp:Label>
                    </li>
                    <li>
                        <asp:TextBox ID="pendientes" runat="server" Enabled="False" CssClass="controles_almacen"></asp:TextBox>
                    </li>
                    <li>
                        <asp:Label ID="e_recibidas" runat="server" Text="Guias recibidas"></asp:Label>
                    </li>
                    <li>
                        <asp:TextBox ID="recibidas" runat="server" Enabled="False" CssClass="controles_almacen"></asp:TextBox>
                    </li>
                    <li>
                        <asp:Label ID="e_entregadas" runat="server" Text="Guias entregadas"></asp:Label>
                    </li>
                    <li>
                        <asp:TextBox ID="entregadas" runat="server" Enabled="False" CssClass="controles_almacen"></asp:TextBox>
                    </li>
                    <li>
                        <asp:Label ID="e_escaner" runat="server">Escanear <i class="fa fa-barcode negro"></i></asp:Label>
                    </li>
                    <li>
                        <asp:TextBox ID="escaner" runat="server" Enabled="True" CssClass="controles_almacen sin_centro control_rojo"></asp:TextBox>
                    </li>
                    <li>
                        <asp:DropDownList ID="opciones" CssClass="controles_almacen_listado" 
                            runat="server" AutoPostBack="True" 
                            onselectedindexchanged="opciones_SelectedIndexChanged">
                            <asp:ListItem>RECIBIR</asp:ListItem>
                            <asp:ListItem>ENTREGAR</asp:ListItem>
                        </asp:DropDownList>
                    </li>
                    <li>
                        <asp:DropDownList ID="mensajeria" CssClass="controles_almacen_listado" 
                            runat="server" AutoPostBack="True" 
                            onselectedindexchanged="mensajeria_SelectedIndexChanged">
                        </asp:DropDownList>
                    </li>
                </ul>
            </div>
     <div id="main_izquierdo">
     <p class="negro_grande">Ordenes de compra</p>
     <div class="limitado">
     <asp:GridView ID="tabla_almacen" runat="server" CssClass="tabla" DataSource="<%# datos_almacen() %>"
                            DataKeyNames="numero_guia" OnRowCommand="tabla_almacen_OnRowCommand"
                            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                            <HeaderStyle CssClass="cabecera_tabla" />
                            <PagerSettings Visible="False" />
                            <RowStyle CssClass="renglon_tabla" HorizontalAlign="Left" />
                            <AlternatingRowStyle CssClass="renglon_tabla" />
                                <Columns>
                                    <asp:BoundField HeaderText="ID" DataField="id_numero_guia" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Orden" DataField="clave_orden_compra"></asp:BoundField>
                                    <asp:BoundField HeaderText="Guia" DataField="numero_guia"></asp:BoundField>
                                    <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                    <asp:BoundField HeaderText="Mensajeria" DataField="mensajeria"></asp:BoundField>
                                    <asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                <HeaderStyle CssClass="cabecera_gridview" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="devolver" runat="server" CausesValidation="False" ToolTip="Devolver paquete al stock"
                                        CommandName="devolver" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-mail-forward icono_tabla"></i></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle CssClass="control" />
                            </asp:TemplateField>
                                </Columns>
                        </asp:GridView>
     </div>
      </div>


      <div id="main_derecho">
            <p class="negro_grande">Paquetes sin orden en almacen</p>
   <div class="limitado">
     <asp:GridView ID="tabla_paquetes" runat="server" CssClass="tabla" DataSource="<%# datos_paquetes() %>"
                            DataKeyNames="numero_guia" OnRowCommand="tabla_paquetes_OnRowCommand"
                            ShowHeaderWhenEmpty="True" AutoGenerateColumns="False" PagerSettings-Visible="false">
                            <HeaderStyle CssClass="cabecera_tabla" />
                            <PagerSettings Visible="False" />
                            <RowStyle CssClass="renglon_tabla" HorizontalAlign="Left" />
                            <AlternatingRowStyle CssClass="renglon_tabla" />
                                <Columns>
                                    <asp:BoundField HeaderText="ID" DataField="id_paquete_almacen" Visible="True"></asp:BoundField>
                                    <asp:BoundField HeaderText="Guia" DataField="numero_guia"></asp:BoundField>
                                    <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                                    <asp:BoundField HeaderText="Mensajeria" DataField="mensajeria"></asp:BoundField>
                                    <asp:BoundField HeaderText="Fecha" DataField="fecha"></asp:BoundField>
                                    <asp:TemplateField HeaderText="" ShowHeader="True">
                                <HeaderStyle CssClass="cabecera_gridview" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="eliminar" runat="server" CausesValidation="False" ToolTip="Eliminar paquete del stock"
                                        CommandName="eliminar" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash icono_tabla"></i></asp:LinkButton>
                                </ItemTemplate>
                                <ItemStyle CssClass="control" />
                            </asp:TemplateField>
                                </Columns>
                        </asp:GridView>
     </div>
            </div>
             <asp:Panel ID="mensajes" runat="server" CssClass="mensajes" Visible="False">
                        <asp:Panel ID="simbolo_mensaje" runat="server" CssClass="simbolos_mensajes_verde">
                            <asp:Label ID="icono_mensaje" CssClass="icono_mensaje" runat="server"><i class="fa fa-exclamation"></i></asp:Label>
                        </asp:Panel>
                        <asp:Label ID="mensaje" CssClass="mensaje" runat="server" Text="Error alguno de los campos se encuentra vacio"></asp:Label>
                        <asp:LinkButton ID="cerrar_mensaje" CssClass="cerrar_mensajes" runat="server" OnClick="cerrar_mensaje_Click"><i class="fa fa-close"></i></asp:LinkButton>
                    </asp:Panel>
            </div>
            <asp:LinkButton ID="boton_escanear" runat="server" OnClick="boton_escanear_Click" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
            <asp:LinkButton ID="actualizar" runat="server" OnClick="actualizar_Click" Text="actualizar" Visible="True" Style="visibility: hidden"></asp:LinkButton>
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
    </body>
    </html>