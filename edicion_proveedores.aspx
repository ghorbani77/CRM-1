<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/edicion_proveedores.aspx.cs"
    Inherits="edicion_proveedores" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
            } else {
                mouse = false;
                keyboard = false;
                window.opener.document.getElementById('caja_contador').value = "0";
            }
        },
            1000);
    })();
    function abrir() 
    {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    function salir() 
    {
        window.close();
    }
    function tipo_de_cambio_invalido() 
    {
        alert('Error el formato de tipo de cambio no es valido verificar');
    }
    function nombre_repetido() 
    {
        alert('Error ya existe un proveedor con ese nombre');
    }
    function correo_invalido() 
    {
        alert('Error el correo no es valido verificar');
    }
    function campo_vacio() 
    {
        alert('Error algun campo se encuentra vacio');
    }
    function proveedor_modificado() 
    {
        alert('El proveedor fue modificado exitosamente');
    }
    document.onkeypress = stopRKey;
    function activar_boton_fantasma_guardar() 
    {
        document.getElementById("<%= BotonProcesando.ClientID %>").style.visibility = "Visible";
        document.getElementById("<%= BotonGuardar.ClientID %>").style.display = "none";
    }
    function desactivar_boton_fantasma_guardar() 
    {
        document.getElementById("<%= BotonProcesando.ClientID %>").style.visibility = "hidden";
        document.getElementById("<%= BotonGuardar.ClientID %>").style.display = "initial";
    }
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />
    <title>Modificación de proveedores - CRM</title>
    <link rel="stylesheet" href="css/foundation.css" />
    <link rel="stylesheet" href="css/custom.css" />
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800" />
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="css/material-design-font.css" />
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="small-12 header-cotizaciones header-alta header-prom">
                <div class="controles">
                    <span class="titulo left">Modificación de proveedores</span>
                </div>
                <ul class="inline-list right ul-prom">
                    <li>
                        <asp:LinkButton ID="BotonSalir" runat="server" CssClass="boton" OnClick="BotonSalir_Click"
                            ToolTip="Cancelar"><i class="fa fa-sign-out icono_boton" ></i></asp:LinkButton>
                        <span>Salir</span> </li>
                </ul>
            </div>
            <div class="small-12 columns">
                <div class="large-5 columns">
                    <div class="small-12 titulo-circulo">
                        <i class="fa fa-users prod"></i><span>Lista proveedores</span>
                    </div>
                    <div class="modulo-nor">
                        <ul class="small-centered columns">
                            <li>
                                <asp:Label ID="Label1" runat="server">Proveedores</asp:Label>
                                <asp:ListBox ID="ListaProveedores" runat="server" CssClass="lista" Height="410px"
                                    ToolTip="Selecciona el proveedor a modificar" OnSelectedIndexChanged="ListaProveedores_SelectedIndexChanged"
                                    AutoPostBack="True" />
                            </li>
                        </ul>
                    </div>
                    <!-- termina modulo especial -->
                </div>
                <div class="large-7 columns ">
                    <div class="small-12 titulo-circulo">
                        <i class="fa fa-user titulo_clientes"></i><span>Datos del proveedor</span>
                    </div>
                    <div class="modulo-nor">
                        <div class="small-centered columns">
                            <div class="row full-width">
                                <div class="small-12 columns">
                                    <asp:Label ID="nombre" runat="server">Proveedor</asp:Label>
                                    <asp:TextBox ID="CajaNombre" runat="server" CssClass="caja_mediana" MaxLength="200"
                                        Style="text-transform: uppercase" Enabled="False"></asp:TextBox></div>
                            </div>
                            <div class="row full-width">
                                <div class="small-12 columns">
                                    <asp:Label ID="nombre_comercial" runat="server">Comercial</asp:Label>
                                    <asp:TextBox ID="CajaNombreComercial" runat="server" CssClass="caja_mediana" MaxLength="1000"
                                        Style="text-transform: uppercase" Enabled="False"></asp:TextBox></div>
                            </div>
                            <div class="row full-width">
                                <div class="small-12 columns">
                                    <asp:Label ID="direccion" runat="server">Domicilio</asp:Label>&nbsp;&nbsp;<asp:TextBox
                                        ID="CajaDireccion" runat="server" Style="text-transform: uppercase" MaxLength="2000"
                                        Enabled="False"></asp:TextBox></div>
                            </div>
                            <div class="row full-width">
                                <div class="small-12 medium-4 columns">
                                    <asp:Label ID="tipo_cambio" runat="server">Tipo de cambio</asp:Label>
                                    <asp:TextBox ID="CajaTipoCambio" runat="server" Style="text-transform: uppercase"
                                        MaxLength="10" Enabled="False"></asp:TextBox>
                                </div>
                                <div class="small-12 medium-4 columns">
                                    <asp:Label ID="tipo" runat="server">Tipo de proveedor</asp:Label>
                                    <asp:DropDownList ID="ListaTipoProveedor" runat="server" CssClass="lista" 
                                        Enabled="False" 
                                        onselectedindexchanged="ListaTipoProveedor_SelectedIndexChanged" AutoPostBack="true" >
                                        <asp:ListItem>EXTRANJERO</asp:ListItem>
                                        <asp:ListItem>NACIONAL</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                  <div class="small-12 medium-4 columns">
                                    <asp:Label ID="local" runat="server">Proveedor Local</asp:Label>
                                    <asp:DropDownList ID="DDLLocal" runat="server" CssClass="lista" Enabled="False">
                                        <asp:ListItem>NO</asp:ListItem>
                                        <asp:ListItem>SI</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row full-width">
                                <div class="small-12 medium-4 columns">
                                    <asp:Label ID="contacto" runat="server">Contacto</asp:Label>
                                    <asp:TextBox ID="CajaContacto" runat="server" Style="text-transform: uppercase" MaxLength="100"
                                        Enabled="False"></asp:TextBox></div>
                                <div class="small-12 medium-4 columns">
                                    <asp:Label ID="correo" runat="server">Correo</asp:Label>
                                    <asp:TextBox ID="CajaCorreo" runat="server" MaxLength="200" Style="text-transform: lowercase"
                                        Enabled="False"></asp:TextBox></div>
                                <div class="small-12 medium-4 columns">
                                    <asp:Label ID="pago" runat="server">Pago</asp:Label>
                                    <asp:DropDownList ID="ListaPago" runat="server" CssClass="lista" Enabled="False">
                                        <asp:ListItem Text="CONTADO" Value="Contado"></asp:ListItem>
                                        <asp:ListItem Text="CREDITO" Value="Credito"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="row full-width">
                                <div class="small-2 small-centered columns">
                                    <asp:Panel ID="PanelBotonGuardar" runat="server" Visible="true">
                                        <asp:LinkButton ID="BotonGuardar" runat="server" ToolTip="Guardar cambios" Style="text-decoration: none"
                                            CssClass="button small success" OnClick="BotonGuardar_Click" Enabled="False">Guardar</asp:LinkButton>
                                        <asp:LinkButton ID="BotonProcesando" runat="server" Style="text-decoration: none;
                                            visibility: hidden"><i class="fa fa-cog fa-spin"></i>Proceso</asp:LinkButton>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- termina modulo especial -->
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="BotonGuardar" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>
<style>
    .row.full-width
    {
        width: 100%;
        max-width: 100%;
    }
</style>
