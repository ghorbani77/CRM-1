<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/solicitud_factura.aspx.cs" Inherits="solicitud_factura" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet' type='text/css'>
       <link rel="stylesheet" href="css/foundation.css" />
       <link rel="stylesheet" href="css/custom.css" />
       <link rel="stylesheet" href="css/melissa.css" /> 
</head>
<body>
    <form id="form1" runat="server">
        <div style=" width:100%;text-align: left;">
            
            <div style="font-family: 'Montserrat', sans-serif;  text-align: left;">
                <asp:Label ID="label" runat="server" ><p>Buenos días/tardes:</p></asp:Label>
                <asp:Label ID="Label1" runat="server" >Por medio del presente se hace solicitud de factura con la siguiente información:</asp:Label>
            </div>            
            <br />
            <div style="font-family: 'Montserrat', sans-serif;  text-align: left;">
               <asp:Label ID="Label2" runat="server" ><p><b>Datos del cliente:</b></p></asp:Label>
               <p><b>Nombre:</b> <asp:Label ID="lnombre" runat="server" ></asp:Label></p>
               <p><b>Nombre comercial:</b> <asp:Label ID="lnombre_comercial" runat="server" ></asp:Label></p>
               <p><b>Dirección:</b> <asp:Label ID="ldireccion" runat="server" ></asp:Label></p>
               <p><b>Teléfono:</b> <asp:Label ID="ltelefono" runat="server" ></asp:Label></p>
               <p><b>RFC:</b> <asp:Label ID="lrfc" runat="server" ></asp:Label></p>
               <p><b>Correo:</b> <asp:Label ID="lcorreo" runat="server" ></asp:Label></p>
            </div>   
            <br /> 
            <div style="font-family: 'Montserrat', sans-serif;  text-align: left;">
               <asp:Label ID="Label3" runat="server" ><p><b>Información del pago</b></p></asp:Label>
               <p><b>Tipo de venta:</b> <asp:Label ID="ltipo_venta" runat="server" ></asp:Label></p>
               <p><b>Método de pago:</b> <asp:Label ID="lmetodo_pago" runat="server" ></asp:Label></p>
               <p><b>Banco:</b> <asp:Label ID="lbanco" runat="server" ></asp:Label></p>
               <p><b>Últimos 4 dígitos:</b> <asp:Label ID="ldigitos" runat="server" ></asp:Label></p>
            </div>
             <br />
            <!--Aqui va la tabla  -->
            <div style="font-family:'Montserrat', sans-serif;">
                
            <asp:GridView ID="tabla" runat="server" AutoGenerateColumns="False"  DataSource='<%# insertar_tabla_productos() %>' CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="50">
		        <PagerSettings Visible="False" />
		        <RowStyle  CssClass="row2" HorizontalAlign="center" />
                <Columns>
                    <asp:BoundField HeaderText="Código" DataField="codigo">
                     <HeaderStyle CssClass="cabecera_gridview" /> 
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Producto" DataField="producto" >
                     <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Cantidad" DataField="cantidad">
                        <ItemStyle CssClass="textotabla"></ItemStyle>
                     <HeaderStyle CssClass="cabecera_gridview textotabla" />
                    </asp:BoundField>
                    <asp:BoundField HeaderText="Precio" DataField="precio" DataFormatString="${0:c}" >
                     <HeaderStyle CssClass="cabecera_gridview" />
                    </asp:BoundField>                           
                </Columns> 
            </asp:GridView>


                <p><b>Subtotal: </b> <asp:Label ID="lsubtotal" runat="server" ></asp:Label></p>
                <p><b>IVA:</b> <asp:Label ID="liva" runat="server" ></asp:Label></p>
                <p><b>Tota:</b> <asp:Label ID="ltotal" runat="server" ></asp:Label></p>
            </div>
            <br />
            <div style="font-family: 'Montserrat', sans-serif;  text-align: left;">
               <p><b>Comentarios:</b> <asp:Label ID="lcomentario" runat="server" ></asp:Label></p>
               <p>Muchas gracias</p>
               <p>Atentamente </p>
               <p><asp:Label ID="lnombre_vendedor" runat="server" ></asp:Label></p>
               <p><asp:Label ID="lcorreo_vendedor" runat="server" ></asp:Label></p>
            </div>

            
        </div>
        
    </form>
    
</body>
</html>
