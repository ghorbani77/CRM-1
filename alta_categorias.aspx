<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/alta_categorias.aspx.cs"
    Inherits="alta_categorias" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
    function abrir() {
        window.moveTo(0, 0);
        window.resizeTo(screen.availWidth, screen.availHeight);
    }
    onload = abrir();
    document.onkeypress = stopRKey;

    function mismo_nombre_sub_categoria() 
    {
        alert('Error la subcategoria no puede ser igual que la categoria, ingresar una diferente');
    }
    function mismo_nombre_categoria_a() 
    {
        alert('Error la categoria A no puede ser igual que la subcategoria o categoria, ingresar una diferente');
    }
    function campo_vacio() 
    {
        alert('Error algun campo se encuentra vacio, verificar');
    }
    function categoria_existente() 
    {
        alert('Error la categoria ya existe, ingresar una diferente');
    }
    function subcategoria_existente() 
    {
        alert('Error la subcategoria ya existe, ingresar una diferente');
    }
    function categoria_a_existente() 
    {
        alert('Error la categoria a ya existe, ingresar una diferente');
    }
    function categoria_creada() 
    {
        alert('La categoria ha sido creada satisfactoriamente');
    }
    function subcategoria_creada() 
    {
        alert('La subcategoria ha sido creada satisfactoriamente');
    }
    function categoria_a_creada() 
    {
        alert('La categoria A ha sido creada satisfactoriamente');
    }
</script>
<head runat="server">
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
            <div class="large-12 header-cotizaciones header-alta header-prom">
                <div class="controles">
                    <span class="titulo left">Alta de categorías</span>
                </div>
                <ul class="inline-list right ul-prom">
                    <li>
                        <asp:LinkButton ID="boton_cancelar" runat="server" ToolTip="Cancelar" OnClick="salir_Click">
                            <i class="fa fa-sign-out icono_boton" ></i>
                        </asp:LinkButton>
                        <span>Salir</span> </li>
                </ul>
            </div>
            <div class="large-12 titulo-circulo" id="area_titulo_proveedores">
                <asp:Label ID="IconoTitulo" runat="server"><i class="fa fa-bars prod"></i></asp:Label><span><asp:Label
                    ID="Titulo" runat="server">Categorias</asp:Label></span>
            </div>
            <div class="row full-width" style="overflow: auto;">
                <div class="large-4 small-12 medium-12 columns" >
                    <div class="small-11 large-11 small-centered columns" style="display: table; background-color: #EFEFEF">
                        <div class="small-10" style="background-color: #EFEFEF; display: table-cell">
                            <asp:Label ID="Label4" runat="server" Text="Categoría"></asp:Label>
                            <asp:ListBox ID="ListaCategorias" runat="server" Height="300px" AutoPostBack="True"
                                OnSelectedIndexChanged="ListaCategorias_SelectedIndexChanged"></asp:ListBox>
                        </div>
                        <asp:Panel ID="PanelBotonAgregarCategoria" runat="server" CssClass="small-2" Style="display: table-cell;
                                                                                                                                                                                                                                                                                                                                                        vertical-align: middle">
                            <div class="small-11 small-centered columns">
                                <asp:LinkButton ID="BotonAgregarCategoria" CssClass="boton_guardar button tiny" runat="server"
                                    ToolTip="Nueva categoria" OnClick="BotonAgregarCategoria_Click"><i class="fa fa-plus-circle fa-2x"></i></asp:LinkButton>
                            </div>
                        </asp:Panel>
                    </div>
                    <asp:Panel ID="PanelCajaAgregarCategoria" runat="server" Visible="false" CssClass="small-11 small-centered columns"
                        Style="display: table; background-color: #EFEFEF">
                        <div class="small-10 small-centered columns" style="display: table-cell; vertical-align: middle;">
                            <asp:TextBox ID="CajaAgregarCategoria" runat="server" MaxLength="60" style='text-transform:uppercase'  ToolTip="Ingrese nueva categoria"></asp:TextBox>
                        </div>
                        <div class="small-1 " style="display: table-cell; vertical-align: middle;">
                            <div class="small-11 small-centered columns">
                                <asp:LinkButton ID="BotonAceptarAgregarCategoria" OnClick="BotonAceptarAgregarCategoria_Click"
                                    CssClass="boton_guardar button  round success tiny" runat="server" ToolTip="Aceptar"><i class="fa fa-check"></i></asp:LinkButton>
                            </div>
                        </div>
                        <div class="samll-1" style="display: table-cell; vertical-align: middle;">
                            <div class="small-11 small-centered columns">
                                <asp:LinkButton ID="BotonCancelarAgregarCategoria" OnClick="BotonCancelarAgregarCategoria_Click"
                                    CssClass="boton_guardar button round alert tiny" runat="server" ToolTip="Cancelar"><i class="fa fa-times"></i></asp:LinkButton>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="large-4 small-12 medium-12 columns" >
                    <div class="small-11 small-centered columns" style="display: table; background-color: #EFEFEF">
                        <div class="small-10" style="background-color: #EFEFEF; display: table-cell">
                            <asp:Label ID="Label1" runat="server" Text="Subcategoría"></asp:Label>
                            <asp:ListBox ID="ListaSubcategorias" runat="server" Height="300px" Enabled="False"
                                EnableTheming="False" AutoPostBack="True" OnSelectedIndexChanged="ListaSubcategorias_SelectedIndexChanged">
                            </asp:ListBox>
                        </div>
                        <asp:Panel ID="PanelBotonAgregarSubcategoria" runat="server" CssClass="small-2" Style="display: table-cell;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     vertical-align: middle">
                            <div class="small-11 small-centered columns">
                                <asp:LinkButton ID="BotonAgregarSubcategoria" CssClass="boton_guardar button tiny"
                                    runat="server" ToolTip="Nueva subcategoria" Enabled="False" OnClick="BotonAgregarSubcategoria_Click"><i class="fa fa-plus-circle fa-2x"></i></asp:LinkButton>
                            </div>
                        </asp:Panel>
                    </div>
                    <asp:Panel ID="PanelCajaAgregarSubcategoria" runat="server" Visible="false" CssClass="small-11 small-centered columns"
                        Style="display: table; background-color: #EFEFEF">
                        <div class="small-10 small-centered columns" style="display: table-cell; vertical-align: middle;">
                            <asp:TextBox ID="CajaAgregarSubcategoria" runat="server" MaxLength="60" style='text-transform:uppercase'  ToolTip="Ingrese nueva subcategoria"></asp:TextBox>
                        </div>
                        <div class="small-1 " style="display: table-cell; vertical-align: middle;">
                            <div class="small-11 small-centered columns">
                                <asp:LinkButton ID="BotonAceptarAgregarSubcategoria" OnClick="BotonAceptarAgregarSubcategoria_Click"
                                    CssClass="boton_guardar button  round success tiny" runat="server" ToolTip="Aceptar"><i class="fa fa-check"></i></asp:LinkButton>
                            </div>
                        </div>
                        <div class="small-1" style="display: table-cell; vertical-align: middle;">
                            <div class="small-11 small-centered columns">
                                <asp:LinkButton ID="BotonCancelarAgregarSubcategoria" OnClick="BotonCancelarAgregarSubcategoria_Click"
                                    CssClass="boton_guardar button round alert tiny" runat="server" ToolTip="Cancelar"><i class="fa fa-times"></i></asp:LinkButton>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
                <div class="large-4 small-12 medium-12 columns" >
                    <div class="small-11 small-centered columns" style="display: table; background-color: #EFEFEF">
                        <div class="small-10" style="background-color: #EFEFEF; display: table-cell">
                            <asp:Label ID="Label2" runat="server" Text="Categoría A"></asp:Label>
                            <asp:ListBox ID="ListaCategoriasA" runat="server" Enabled="false" Height="300px"
                                AutoPostBack="True"></asp:ListBox>
                        </div>
                        <asp:Panel ID="PanelBotonAgregarCategoriaA" runat="server" CssClass="small-2" Style="display: table-cell;
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     vertical-align: middle">
                            <div class="small-11 small-centered columns">
                                <asp:LinkButton ID="BotonAgregarCategoriaA" CssClass="boton_guardar button tiny"
                                    runat="server" Enabled="false" ToolTip="Nueva categoria a" OnClick="BotonAgregarCategoriaA_Click"><i class="fa fa-plus-circle fa-2x"></i></asp:LinkButton>
                            </div>
                        </asp:Panel>
                    </div>
                    <asp:Panel ID="PanelCajaAgregarCategoriaA" runat="server" Visible="false" CssClass="small-11 small-centered columns"
                        Style="display: table; background-color: #EFEFEF">
                        <div class="small-10 small-centered columns" style="display: table-cell; vertical-align: middle;">
                            <asp:TextBox ID="CajaAgregarCategoriaA" runat="server" style='text-transform:uppercase'  MaxLength="60" ToolTip="Ingrese nueva categoria A"></asp:TextBox>
                        </div>
                        <div class="small-1 " style="display: table-cell; vertical-align: middle;">
                            <div class="small-11 small-centered columns">
                                <asp:LinkButton ID="BotonAceptarAgregarCategoriaA" OnClick="BotonAceptarAgregarCategoriaA_Click"
                                    CssClass="boton_guardar button  round success tiny" runat="server" ToolTip="Aceptar"><i class="fa fa-check"></i></asp:LinkButton>
                            </div>
                        </div>
                        <div class="small-1" style="display: table-cell; vertical-align: middle;">
                            <div class="small-11 small-centered columns">
                                <asp:LinkButton ID="BotonCancelarAgregarCategoriaA" OnClick="BotonCancelarAgregarCategoriaA_Click"
                                    CssClass="boton_guardar button round alert tiny" runat="server" ToolTip="Cancelar"><i class="fa fa-times"></i></asp:LinkButton>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <%--<asp:AsyncPostBackTrigger ControlID="boton_guardar" EventName="Click" />--%>
        </Triggers>
    </asp:UpdatePanel>
    </form>
</body>
</html>
<style>
    .row.full-width {
  width: 100%;
  max-width: 100%; 
}
</style>