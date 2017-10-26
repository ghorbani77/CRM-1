<%@ Page Language="C#" AutoEventWireup="true" CodeFile="codigo/contratos.aspx.cs" Inherits="contratos" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script src="js/jquery-1.11.3.js" type="text/javascript"></script>
<script src="jquery-ui-1.12.1.custom/jquery-ui.js"></script>
<link href="jquery-ui-1.12.1.custom/jquery-ui.css" rel="stylesheet" type="text/css" />
<script src="jquery-timepicker-1.3.5/jquery.timepicker.js"></script>
<link href="jquery-timepicker-1.3.5/jquery.timepicker.css" rel="stylesheet" type="text/css" />


<script type="text/javascript">

    function salir() {
        window.close();
    }    
    function pageLoad() {
        $(function () {
            $(".fecha").datepicker({ dateFormat: 'yy/mm/dd' }).val();//Esta es para la fecha del gridview de moral y física
            $("#caja_vigencia_contrato").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_fecha_contrato_fisica").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_fecha_ant").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_fecha_escritura").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_fecha_poder").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_vigencia_moral").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_contrato_moral").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_fecha_entrega_ink").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_fecha_ink").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_entrega_comodato").datepicker({ dateFormat: 'yy/mm/dd' }).val();
            $("#caja_fecha_contrato_comodato").datepicker({ dateFormat: 'yy/mm/dd' }).val();
        });
        //*******************  VALIDACIONES DE LOS FORMULARIOS ******************************
        //******************** CONTRATO FÍSICA ********************************************
        $('#boton_contrato_persona_fisica').click(function () {
            var error = 0;
            $(".validacion_fisica").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == '') {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', 'red');
                    error++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });
            if (domicilio_fiscal_instalacion.checked == false) {
                $(".validacion_instalacion_fisica").each(function () {
                    var id = $(this).attr('id');
                    if ($(this).val() == '') {
                        $("#" + id).css('border-width', '2px');
                        $("#" + id).css('border-color', 'red');
                        error++;
                    } else {
                        $("#" + id).css('border-width', '1px');
                        $("#" + id).css('border-color', '#cccccc');
                    }
                });
            }
            if (domicilio_fiscal_dom_rfc.checked == false) {
                $(".validacion_otro_fisica").each(function () {
                    var id = $(this).attr('id');
                    if ($(this).val() == '') {
                        $("#" + id).css('border-width', '2px');
                        $("#" + id).css('border-color', 'red');
                        error++;
                    } else {
                        $("#" + id).css('border-width', '1px');
                        $("#" + id).css('border-color', '#cccccc');
                    }
                });
            }
            if (error == 0) {
            } else {
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo(s) vacío(s)</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
                return false;
            }
            
        });
        //******************** CONTRATO MORAL ********************************************
        $('#boton_contrato_moral').click(function () {
            var error = 0;
            $(".validacion_moral").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == '') {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', 'red');
                    error++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });
            if (dom_fiscal_moral.checked == false) {
                $(".validacion_instalacion_moral").each(function () {
                    var id = $(this).attr('id');
                    if ($(this).val() == '') {
                        $("#" + id).css('border-width', '2px');
                        $("#" + id).css('border-color', 'red');
                        error++;
                    } else {
                        $("#" + id).css('border-width', '1px');
                        $("#" + id).css('border-color', '#cccccc');
                    }
                });
            }
            if (usar_dom_fiscal_moral_final.checked == false) {
                $(".validacion_otro_moral").each(function () {
                    var id = $(this).attr('id');
                    if ($(this).val() == '') {
                        $("#" + id).css('border-width', '2px');
                        $("#" + id).css('border-color', 'red');
                        error++;
                    } else {
                        $("#" + id).css('border-width', '1px');
                        $("#" + id).css('border-color', '#cccccc');
                    }
                });
            }
            if (error == 0) {               
            } else {
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo(s) vacío(s)</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
                return false;
            }
        });
        //******************** CONTRATO IMPRESIÓN ********************************************
        $('#boton_guardar_impresion').click(function () {
            var error = 0;
            $(".validacion_impresion").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == '') {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', 'red');
                    error++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });
            if (error == 0) {
            } else {
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo(s) vacío(s)</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
                return false;
            }
        });
        //******************** CONTRATO INKLASER ********************************************
        $('#boton_comodato_ink').click(function () {
            var error = 0;
            $(".validacion_ink").each(function () {
                var id = $(this).attr('id');
                if ($(this).val() == '') {
                    $("#" + id).css('border-width', '2px');
                    $("#" + id).css('border-color', 'red');
                    error++;
                } else {
                    $("#" + id).css('border-width', '1px');
                    $("#" + id).css('border-color', '#cccccc');
                }
            });
            if (error == 0) {
            } else {                
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Campo(s) vacío(s)</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000); 
                return false;
            }
        });
        /********************************************************************************************/
        $('#domicilio_fiscal_instalacion').change(function () {
            var llave = 0;
            if ($("#domicilio_calle_fisica").val() != '' && $("#domicilio_numero_fisica").val() != '' && $("#domicilio_colonia_fisica").val() != '' && $("#domicilio_ciudad_fisica").val() != '' && $("#domicilio_estado_fisica").val() != '' && $("#domicilio_pais_fisica").val() != '' && $("#domicilio_cp_fisica").val() != '') {
                llave = 1;
            } else {
                $("#domicilio_fiscal_instalacion").prop('checked', false);
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Falta un campo en la dirección</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
            }
            if (this.checked && llave == 1) {
                $("#instalacion_calle_fisica").val($("#domicilio_calle_fisica").val()).attr('disabled', 'disabled');
                $("#instalacion_numero_fisica").val($("#domicilio_numero_fisica").val()).attr('disabled', 'disabled');
                $("#instalacion_colonia_fisica").val($("#domicilio_colonia_fisica").val()).attr('disabled', 'disabled');
                $("#instalacion_ciudad_fisica").val($("#domicilio_ciudad_fisica").val()).attr('disabled', 'disabled');
                $("#instalacion_estado_fisica").val($("#domicilio_estado_fisica").val()).attr('disabled', 'disabled');
                $("#instalacion_pais_fisica").val($("#domicilio_pais_fisica").val()).attr('disabled', 'disabled');
                $("#instalacion_cp_fisica").val($("#domicilio_cp_fisica").val()).attr('disabled', 'disabled');
            } else {
                $("#instalacion_calle_fisica").val("").removeAttr('disabled');
                $("#instalacion_numero_fisica").val("").removeAttr('disabled');
                $("#instalacion_colonia_fisica").val("").removeAttr('disabled');
                $("#instalacion_ciudad_fisica").val("ENSENADA").removeAttr('disabled');
                $("#instalacion_estado_fisica").val("BAJA CALIFORNIA").removeAttr('disabled');
                $("#instalacion_pais_fisica").val("MEXICO").removeAttr('disabled');
                $("#instalacion_cp_fisica").val("").removeAttr('disabled');


            }
        });
        $('#domicilio_fiscal_dom_rfc').change(function () {
            var llave = 0;
            if ($("#domicilio_calle_fisica").val() != '' && $("#domicilio_numero_fisica").val() != '' && $("#domicilio_colonia_fisica").val() != '' && $("#domicilio_ciudad_fisica").val() != '' && $("#domicilio_estado_fisica").val() != '' && $("#domicilio_pais_fisica").val() != '' && $("#domicilio_cp_fisica").val() != '') {
                llave = 1;
            } else {
                $("#domicilio_fiscal_dom_rfc").prop('checked', false)
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Falta un campo en la dirección</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000); 
            }
            if (this.checked && llave == 1) {
                $("#otro_calle_fisica").val($("#domicilio_calle_fisica").val()).attr('disabled', 'disabled');
                $("#otro_numero_fisica").val($("#domicilio_numero_fisica").val()).attr('disabled', 'disabled');
                $("#otro_colonia_fisica").val($("#domicilio_colonia_fisica").val()).attr('disabled', 'disabled');
                $("#otro_ciudad_fisica").val($("#domicilio_ciudad_fisica").val()).attr('disabled', 'disabled');
                $("#otro_estado_fisica").val($("#domicilio_estado_fisica").val()).attr('disabled', 'disabled');
                $("#otro_pais_fisica").val($("#domicilio_pais_fisica").val()).attr('disabled', 'disabled');
                $("#otro_cp_fisica").val($("#domicilio_cp_fisica").val()).attr('disabled', 'disabled');
            } else {
                $("#otro_calle_fisica").val("").removeAttr('disabled');
                $("#otro_numero_fisica").val("").removeAttr('disabled');
                $("#otro_colonia_fisica").val("").removeAttr('disabled');
                $("#otro_ciudad_fisica").val("ENSENADA").removeAttr('disabled');
                $("#otro_estado_fisica").val("BAJA CALIFORNIA").removeAttr('disabled');
                $("#otro_pais_fisica").val("MEXICO").removeAttr('disabled');
                $("#otro_cp_fisica").val("").removeAttr('disabled');


            }
        });
        $('#dom_fiscal_moral').change(function () {
            var llave = 0;
            if ($("#domicilio_calle_moral").val() != '' && $("#domicilio_numero_moral").val() != '' && $("#domicilio_colonia_moral").val() != '' && $("#domicilio_ciudad_moral").val() != '' && $("#domicilio_estado_moral").val() != '' && $("#domicilio_pais_moral").val() != '' && $("#domicilio_cp_moral").val() != '') {
                llave = 1;
            } else {
                $("#dom_fiscal_moral").prop('checked', false)
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Falta un campo en la dirección</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000); 
            }
            if (this.checked && llave == 1) {
                $("#instalacion_calle_moral").val($("#domicilio_calle_moral").val()).attr('disabled', 'disabled');
                $("#instalacion_numero_moral").val($("#domicilio_numero_moral").val()).attr('disabled', 'disabled');
                $("#instalacion_colonia_moral").val($("#domicilio_colonia_moral").val()).attr('disabled', 'disabled');
                $("#instalacion_ciudad_moral").val($("#domicilio_ciudad_moral").val()).attr('disabled', 'disabled');
                $("#instalacion_estado_moral").val($("#domicilio_estado_moral").val()).attr('disabled', 'disabled');
                $("#instalacion_pais_moral").val($("#domicilio_pais_moral").val()).attr('disabled', 'disabled');
                $("#instalacion_cp_moral").val($("#domicilio_cp_moral").val()).attr('disabled', 'disabled');
            } else {
                $("#instalacion_calle_moral").val("").removeAttr('disabled');
                $("#instalacion_numero_moral").val("").removeAttr('disabled');
                $("#instalacion_colonia_moral").val("").removeAttr('disabled');
                $("#instalacion_ciudad_moral").val("ENSENADA").removeAttr('disabled');
                $("#instalacion_estado_moral").val("BAJA CALIFORNIA").removeAttr('disabled');
                $("#instalacion_pais_moral").val("MEXICO").removeAttr('disabled');
                $("#instalacion_cp_moral").val("").removeAttr('disabled');

            }
        });
        $('#usar_dom_fiscal_moral_final').change(function () {
            var llave = 0;
            if ($("#domicilio_calle_moral").val() != "" && $("#domicilio_numero_moral").val() != '' && $("#domicilio_colonia_moral").val() != '' && $("#domicilio_ciudad_moral").val() != '' && $("#domicilio_estado_moral").val() != '' && $("#domicilio_pais_moral").val() != '' && $("#domicilio_cp_moral").val() != '') {
                llave = 1;
            } else {
                $("#usar_dom_fiscal_moral_final").prop('checked', false)
                document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Falta un campo en la dirección</div> ';
                setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000); 
            }
            if (this.checked && llave == 1) {
                $("#otro_calle_moral").val($("#domicilio_calle_moral").val()).attr('disabled', 'disabled');
                $("#otro_numero_moral").val($("#domicilio_numero_moral").val()).attr('disabled', 'disabled');
                $("#otro_colonia_moral").val($("#domicilio_colonia_moral").val()).attr('disabled', 'disabled');
                $("#otro_ciudad_moral").val($("#domicilio_ciudad_moral").val()).attr('disabled', 'disabled');
                $("#otro_estado_moral").val($("#domicilio_estado_moral").val()).attr('disabled', 'disabled');
                $("#otro_pais_moral").val($("#domicilio_pais_moral").val()).attr('disabled', 'disabled');
                $("#otro_cp_moral").val($("#domicilio_cp_moral").val()).attr('disabled', 'disabled');
            } else {
                $("#otro_calle_moral").val("").removeAttr('disabled');
                $("#otro_numero_moral").val("").removeAttr('disabled');
                $("#otro_colonia_moral").val("").removeAttr('disabled');
                $("#otro_ciudad_moral").val("ENSENADA").removeAttr('disabled');
                $("#otro_estado_moral").val("BAJA CALIFORNIA").removeAttr('disabled');
                $("#otro_pais_moral").val("MEXICO").removeAttr('disabled');
                $("#otro_cp_moral").val("").removeAttr('disabled');
            }
        });

        
    }//Final pageLoad
    function numeros_decimal(e, control) {
        var tecla = document.all ? tecla = e.keyCode : e.which;
        var expreg = /^[0-9]+(([\.][0-9]+)?|[\.])$/;
        var prueba = $(control).val(); 
        var nombre = $(control).prop("id"); prueba = prueba + String.fromCharCode(tecla);
        if (expreg.test(prueba)) {
            if (String.fromCharCode(tecla) == '.') {
                $(control).addClass('error');
            } else {
                $(control).removeClass('error');
            }
            return (true)
        } else {
            return (false)
        }
    }
    function nada(e) {
        var key_press = document.all ? key_press = e.keyCode : key_press = e.which;
        return false;
    }
    function sin_direccion() {
        $(".notificacion_div").css('z-index', '999');
        document.getElementById('alrt').innerHTML = '<div class="notificacion_mensaje"><i class="fa fa-info-circle"></i> Faltan direcciones</div> ';
        setTimeout(function () { document.getElementById('alrt').innerHTML = ''; }, 2000);
        $(".notificacion_div").css('z-index', '-99');
    }
   
	</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Contratos - Inklaser</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />     
    <script type="text/javascript" src="js/vendor/modernizr.js"></script>
    <script type="text/javascript" src="javascript/funciones.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Catamaran" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Ubuntu" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,700,800' rel='stylesheet'type='text/css'>
     <link rel="stylesheet" href="font-awesome-4.7.0/css/font-awesome.min.css">
    <link href="css/base.css" rel="stylesheet" type="text/css" />
     <link rel="stylesheet" href="css/melissa.css" /> 
        <style>
         li{
            /* width:17.5em;*/
           /* margin-left:15px;*/
         }
        .notificacion_div{
            left:40%; 
            top:40%;
            position:absolute;
            z-index:99;
        }
        .notificacion_mensaje{
            background: #e81414;
            height: 30px;
            padding: 3px 10px;
            margin-bottom: 20px;
            text-transform: uppercase;
            font-weight: 400;
            font-size: 1.1em;
            text-align: center;
            color: #ffffff;
            /*opacity: 0.8;  */
            border-radius: 20px;
            font-weight: bold;
            z-index:999;
            top: 50%;
            left: 50%;
            width:30em;
           
            margin-top: -9em; 
            margin-left: -15em; 
            position:fixed;
        }       
        input,select{
            height:1.5em;            
            margin-right:1em;
            -webkit-border-radius:2px;
            -moz-border-radius:2px;
            border-radius:2px;
            border:.5px solid #cccccc;
        }
        .Hide{
            display:none; 
        }
        invalid {
        border: 2px solid #ff0000;
        }
        .gv {
            width:90%;
        }
        body{font-family: 'Montserrat' , sans-serif;}

        ul.texto_contratos{
            /*POSICIONAMIENTO*/
            text-align:justify;
            margin:1em;
        }
        ul.texto_contratos li{
            display: inline;
            /*margin:1em;*/
            text-decoration:none;
        }
        .error{ border:2px solid red;}
        

        </style>   

</head>
<body bgcolor="#0080c0">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
     <div class="principal" style="background-color:white;">
     <div class="barra_superior">
                    <div class="espacio_logotipo">
                        <img class="logotipo" src="img/inklaser.jpeg" />
                    </div>
                   <asp:Label CssClass="titulo tipo_texto" ID="titulo" runat="server">Contratos</asp:Label>
                     
                    <asp:LinkButton ID="boton_salir" runat="server" Text="" ToolTip="Salir" CssClass="boton_salir"
                        OnClick="boton_salir_Click"><i class="fa fa-times fa-lg"></i></asp:LinkButton>                
                </div>
    
        <!--FORMULARIO-->
    <div class="separador_altas"></div>
<div class="contenido" style="background-color:white;">
       
       <div class="panel_procesar">  
            <asp:LinkButton ID="boton_contrato_nuevo" runat="server" ToolTip="Crear contrato nuevo" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" OnClick="boton_llenar_contrato_Click" ><i class="fa fa-plus"></i> Contrato nuevo</asp:LinkButton>
       </div>       
       
        <asp:Panel ID="panel_mis_contratos" runat="server" style="" >
          <asp:GridView ID="tabla_mis_contratos" runat="server" AutoGenerateColumns="False" Datakey="id" onrowcommand="tabla_mis_contratos_RowCommand" DataSource='<%# datos_mis_contratos() %>'  CssClass="tabla" ShowHeaderWhenEmpty="True" PageSize="150">
              <HeaderStyle CssClass="GridHeader" />
		      <PagerSettings Visible="true" />
		      <RowStyle CssClass="GridRow" HorizontalAlign="Left" />
              <Columns>
                  <asp:BoundField HeaderText="Id" DataField="id" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" ></asp:BoundField>                 
                  <asp:BoundField HeaderText="Tipo" DataField="tipo" HeaderStyle-CssClass="Hide" ItemStyle-CssClass="Hide" ></asp:BoundField>
                  <asp:BoundField HeaderText="Cliente" DataField="cliente" ></asp:BoundField>
                  <asp:BoundField HeaderText="Fecha de elaboración" DataField="fecha"></asp:BoundField>
                  <asp:BoundField HeaderText="Estado" DataField="estado"></asp:BoundField>
                  
                  <asp:TemplateField HeaderText="" ShowHeader="True" >
                      <ItemTemplate>
                        <asp:LinkButton ID="boton_revisar" runat="server" CausesValidation="False" ToolTip="Revisión/Edición del contrato" CommandName="revision" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-search iconos controles_tablas"></i></asp:LinkButton>
                      </ItemTemplate>
                      <ItemStyle HorizontalAlign="Center" />
                  </asp:TemplateField> 

                  <asp:TemplateField HeaderText="" ShowHeader="True">
                  <ItemTemplate>
                      <asp:LinkButton ID="boton_imprimir" runat="server" CausesValidation="False" ToolTip="Imprimir contrato" CommandName="imprimir" CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-print iconos controles_tablas"></i></asp:LinkButton>
                      </ItemTemplate>
                     <ItemStyle HorizontalAlign="Center" />
                  </asp:TemplateField>                 
                                 
              </Columns>
          </asp:GridView>

        </asp:Panel>
       
        <!------------------------->
<asp:Panel ID="panel_formularios_contratos" runat="server" CssClass="" Visible="false" style="z-index:999;  ">
    <div class="panel_procesar">  
     <asp:LinkButton ID="boton_regresar" runat="server" style="text-decoration:none;" CssClass="botones_requisiciones aprobar"  OnClick="cerrar_panel_contratos_Click" >
       <i class="fa fa-times"></i>&nbsp;Regresar    
     </asp:LinkButton></div>
     <div class="panel_procesar">   
      <asp:LinkButton ID="boton_aprobar" runat="server" Visible="false" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" OnClick="boton_aprobar_Click" >
       <i class="fa fa-check"></i>&nbsp;Aprobar    
     </asp:LinkButton></div>
     <div class="panel_procesar">  
     <asp:LinkButton ID="boton_rechazar" runat="server" Visible="false" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" OnClick="boton_rechazar_Click" >
       <i class="fa fa-times"></i>&nbsp;Rechazar    
     </asp:LinkButton></div>    
     <div class="panel_procesar">  
     <asp:LinkButton ID="boton_imprimir_2" runat="server" Visible="false" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" OnClick="boton_imprimir_Click" >
       <i class="fa fa-print"></i>&nbsp;Imprimir    
     </asp:LinkButton></div>

       <asp:Panel ID="panel_dropdown" runat="server" Visible="true" style="padding:0em 0em 0em 0em;">
        <ul class="lista_banco">
                <li><asp:Label ID="Label1" runat="server"> TIPO DE CONTRATO: </asp:Label></li>
                <li><asp:DropDownList ID="tipo_contrato" runat="server" CssClass="lista micha" AutoPostBack="True" Enabled="True" onselectedindexchanged="contrato_SelectedIndexChanged"  >
                    <asp:ListItem>SELECCIONAR</asp:ListItem>
                    <asp:ListItem>PERSONA FISICA</asp:ListItem>
                    <asp:ListItem>PERSONA MORAL</asp:ListItem>
                    <asp:ListItem>COMODATO INKLASER</asp:ListItem>
                    <asp:ListItem>COMODATO POR IMPRESION</asp:ListItem>
                </asp:DropDownList></li> 
         </ul>
       </asp:Panel>
        
       <asp:Panel ID="panel_tabla" runat="server" Visible="false" style="padding:0em 0em 0em 0em; text-align:justify;">
        <asp:gridview ID="Gridview1" runat="server"  ShowFooter="false" AutoGenerateColumns="false" DataKeyNames="RowNumber" CssClass="tabla " onrowcommand="Gridview1_RowCommand">
                <HeaderStyle CssClass="GridHeader gv" HorizontalAlign="Center" Font-Size=".85em" />
                <PagerSettings Visible="False" />
                <RowStyle CssClass="GridRow gv" HorizontalAlign="Center"  />
                <AlternatingRowStyle CssClass="GridRow gv"/>
                <Columns>
                    <asp:BoundField DataField="RowNumber" HeaderText="#" />
                    <asp:TemplateField HeaderText="Referencia">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%#Eval("Column1")%>' CssClass="gv validacion_fisica validacion_moral" ></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Modelo de equipo">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%#Eval("Column2")%>' CssClass="gv validacion_fisica validacion_moral" ></asp:TextBox>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Fecha">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox3"  runat="server" Text='<%#Eval("Column3")%>' onkeypress="return nada(event);" CssClass="gv fecha validacion_fisica validacion_moral"></asp:TextBox>
                            </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Renta mensual sin IVA">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%#Eval("Column4")%>' onkeypress="return numeros_decimal(event,this);" CssClass="gv validacion_fisica validacion_moral"></asp:TextBox>
                         </ItemTemplate>
                    </asp:TemplateField>
                     <asp:TemplateField HeaderText="Renta mensual sin IVA con letra">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox5" runat="server" Text='<%#Eval("Column5")%>' CssClass="gv validacion_fisica validacion_moral"></asp:TextBox>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Costo por impresión">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%#Eval("Column6")%>' onkeypress="return numeros_decimal(event,this);" CssClass="gv validacion_fisica validacion_moral"></asp:TextBox>
                           </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Volumen de impresión">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%#Eval("Column7")%>' onkeypress="return numeros(event);" CssClass="gv validacion_fisica validacion_moral"></asp:TextBox>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Volumen de impresión con letra">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%#Eval("Column8")%>' CssClass="gv validacion_fisica validacion_moral"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio copia adicional negro">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox9" runat="server" Text='<%#Eval("Column9")%>' onkeypress="return numeros_decimal(event,this);" CssClass="gv validacion_fisica validacion_moral"></asp:TextBox>
                            </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Precio copia adicional negro con letra">
                        <ItemTemplate>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%#Eval("Column10")%>' CssClass="gv validacion_fisica validacion_moral"></asp:TextBox>
                             </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Precio copia adicional color" >
                        <ItemTemplate >
                             <asp:TextBox ID="TextBox11" runat="server" Text='<%#Eval("Column11")%>' onkeypress="return numeros_decimal(event,this);" CssClass="gv validacion_fisica validacion_moral"></asp:TextBox>
                        </ItemTemplate>
                        
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                      <asp:LinkButton ID="boton_eliminar_equipos" runat="server" CausesValidation="False" ToolTip="Revisión/Edición del contrato"  CommandArgument="<%#((GridViewRow)Container).RowIndex%>"><i class="fa fa-trash iconos controles_tablas"></i></asp:LinkButton>
                      </ItemTemplate>
                     <ItemStyle HorizontalAlign="Center" />
                  </asp:TemplateField> 
                </Columns>
            </asp:gridview>
            <div class="panel_procesar" style="margin-top:2.5em;"> 
                <asp:LinkButton ID="ButtonAdd" runat="server" Text="Agregar Equipo" style="text-decoration:none; background:#2471a3;" CssClass="botones_requisiciones aprobar"  OnClick="ButtonAdd_Click" />
            </div>        
      </asp:Panel>

     <!-- <asp:Panel ID="panel_antecedentes" runat="server" Visible="false" style="padding:0em 5em 1em 5em; text-align:justify;">
          <p>Ya tenía equipo pero no tenía contrato<asp:CheckBox ID="antecedentes_checkbox" runat="server" CssClass="caja_mini micha" AutoPostBack="true" OnCheckedChanged="agregar_antecedente_OnCheckedChanged" ></asp:CheckBox></p>
           <asp:Panel ID="antecedentes" runat="server" Visible="false">
                <b>Antecedentes</b><br />
                Previo a la firma del presente contrato se contaba con relación comercial de arrendamiento desde la fecha                 
                <asp:TextBox ID="caja_fecha_ant" runat="server" CssClass="caja_mini micha" Text="FECHA"></asp:TextBox>
           </asp:Panel>
       </asp:Panel> -->    

        <!----------- FORMULARIO DE PERSONA FÍSICA modulo-esp1 ---------->
        <asp:Panel ID="panel_persona_fisica" runat="server" Visible="false" style=""  >
          <ul class="texto_contratos">
            <li><p><center><b>CONTRATO DE ARRENDAMIENTO DE EQUIPO DE COPIADO</center></b></p></li>
            <li><p>CONTRATO DE ARRENDAMIENTO DE EQUIPO DE IMPRESIÓN QUE CELEBRAN POR UNA PARTE INKLASER COMERCIAL, S.R.L. DE C.V. REPRESENTADA EN ESTE ACTO POR EL ING. JUAN CARLOS REYES RIVERA,
            A QUIEN EN LO SUCESIVO SE LE DENOMINARA EL ARRENDADOR Y POR OTRA PARTE 
            <asp:TextBox ID="caja_persona_fisica" runat="server"  placeholder="PERSONA FÍSICA"  CssClass="validacion_fisica caja_busqueda"  ></asp:TextBox> 
            A QUIEN LO SUCESIVO SE DENOMINARA EL ARRENDATARIO, DE CONFORMIDAD CON LAS DECLARACIONES Y CLAUSULAS SIGUIENTES:</p></li>
            <li><p>DECLARACIONES:</p></li>
            <li><p>III.Declara El ARRENDATARIO  manifiesta bajo protesta de decir verdad: ser de nacionalidad <asp:TextBox ID="caja_nacionalidad" runat="server" Text="MEXICANA" placeholder="NACIONALIDAD"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox> 
            con Domicilio en </p></li>
            <li><p><asp:TextBox ID="domicilio_calle_fisica" runat="server"  placeholder="CALLE"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_numero_fisica" runat="server"  placeholder="NÚMERO"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_colonia_fisica" runat="server"  placeholder="FRACC/COLONIA"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_ciudad_fisica" runat="server"  Text="ENSENADA"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_estado_fisica" runat="server"  Text="BAJA CALIFORNIA"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_pais_fisica" runat="server"  Text="MÉXICO"  CssClass="validacion_fisica caja_busqueda " ></asp:TextBox>
            <asp:TextBox ID="domicilio_cp_fisica" runat="server"  placeholder="CÓDIGO POSTAL"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox>.</p></li>
            
            <li><p>b) LUGAR DE LA INSTALACIÓN DEL EQUIPO: 
            Usar domicilio fiscal <asp:CheckBox ID="domicilio_fiscal_instalacion" runat="server" CssClass=" caja_mini micha"  ></asp:CheckBox></p></li>          
            <li><p><asp:TextBox ID="instalacion_calle_fisica" runat="server"  placeholder="CALLE"  CssClass="validacion_instalacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_numero_fisica" runat="server"  placeholder="NÚMERO"  CssClass="validacion_instalacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_colonia_fisica" runat="server"  placeholder="FRACC/COLONIA"  CssClass="validacion_instalacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_ciudad_fisica" runat="server"  Text="ENSENADA"  CssClass="validacion_instalacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_estado_fisica" runat="server"  Text="BAJA CALIFORNIA"  CssClass="validacion_instalacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_pais_fisica" runat="server"  Text="MÉXICO"  CssClass="validacion_instalacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_cp_fisica" runat="server"  placeholder="CÓDIGO POSTAL"  CssClass="validacion_instalacion_fisica caja_busqueda" ></asp:TextBox>
            </p></li>
             <li><p>La vigencia del contrato será de 12 meses obligatorios para ambas partes iniciando a partir de 
             <asp:TextBox ID="caja_vigencia_contrato" runat="server"  Class="fecha" placeholder="FECHA"  CssClass="validacion_fisica caja_busqueda"  ></asp:TextBox></p></li>
           <ul class="lista_banco">
               <li style=" margin-left:15px;"><p>Configuración en equipos adicionales $150 por máquina</p></li>
               <li style=" margin-left:15px;"><p>Servicio a domicilio
                    <asp:DropDownList ID="servicio_domicilio_fisica" runat="server"  placeholder=""  CssClass="caja_busqueda" >
                     <asp:ListItem>$150</asp:ListItem>
                     <asp:ListItem>$250</asp:ListItem>
	                 <asp:ListItem>$0</asp:ListItem>
                    </asp:DropDownList></p>
                </li>
            </ul>
            <li><p>P) DOMICILIO Y RFC: De EL ARRENDATARIO 
            Usar domicilio fiscal <asp:CheckBox ID="domicilio_fiscal_dom_rfc" runat="server" CssClass="caja_mini micha"  ></asp:CheckBox></p></li>
            <li><p><asp:TextBox ID="otro_calle_fisica" runat="server"  placeholder="CALLE"  CssClass="validacion_otro_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_numero_fisica" runat="server"  placeholder="NÚMERO"  CssClass="validacion_otro_fisica  caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_colonia_fisica" runat="server"  placeholder="FRACC/COLONIA"  CssClass="validacion_otro_fisica  caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_ciudad_fisica" runat="server"  Text="ENSENADA"  CssClass="validacion_otro_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_estado_fisica" runat="server"  Text="BAJA CALIFORNIA"  CssClass="validacion_otro_fisica  caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_pais_fisica" runat="server"  Text="MÉXICO"  CssClass="validacion_otro_fisica  caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_cp_fisica" runat="server"  placeholder="CÓDIGO POSTAL"  CssClass="validacion_otro_fisica caja_busqueda" ></asp:TextBox></p></li>
            <li><p>LO RATIFICAN EN TODO SU CLAUSULADO Y CONOCEDORES DE SU ALCANCE LEGAL, LO FIRMAN AL CALCE PARA CONSTANCIA E IMPUESTOS DE SU CONTENIDO LO SUSCRIBEN POR DUPLICADO QUEDANDO EN PODER DE CADA PARTES, 
            ENSENADA BAJA CALIFORNIA A 
            <asp:TextBox ID="caja_fecha_contrato_fisica" runat="server"  placeholder="FECHA"  CssClass="validacion_fisica caja_busqueda"  ></asp:TextBox>.</p></li>
            <li><p> Por "EL ARRENDATARIO" <asp:TextBox ID="caja_representante_legal" runat="server"  placeholder="REPRESENTANTE LEGAL"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox></p></li>
            <li><p>Testigos: <asp:TextBox ID="fisica_testigo_1" runat="server"  Text="Alexandra Patron Barraza"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="fisica_testigo_2" runat="server"  Text="Edgar Tejero Hoyos"  CssClass="validacion_fisica caja_busqueda" ></asp:TextBox>
            <asp:LinkButton ID="boton_contrato_persona_fisica" runat="server" ToolTip="Guardar contrato" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" OnClick="guardar_persona_fisica">Guardar</asp:LinkButton>
            </p></li>
            </ul>
   </asp:Panel>     
  

   <!----------- CONTRATO DE PERSONA MORAL --- EL MÁS LARGO U.U------>
   <asp:Panel ID="panel_persona_moral" runat="server" Visible="false" style="">
        <ul class="texto_contratos" style="    line-height: 2em;">
            <li><p><b><center>CONTRATO DE ARRENDAMIENTO DE EQUIPO DE COPIADO</center></b></p></li>
            <li><p>CONTRATO DE ARRENDAMIENTO DE EQUIPO DE IMPRESIÓN QUE CELEBRAN POR UNA PARTE INKLASER COMERCIAL, S.R.L. DE C.V. REPRESENTADA EN ESTE ACTO POR EL ING. JUAN CARLOS REYES RIVERA, A QUIEN EN LO SUCESIVO SE LE DENOMINARA EL ARRENDADOR Y POR OTRA PARTE 
            <asp:TextBox ID="caja_razon_social" runat="server"  placeholder="RAZÓN SOCIAL"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox> A QUIEN LO SUCESIVO SE DENOMINARA EL ARRENDATARIO, DE CONFORMIDAD CON LAS DECLARACIONES Y CLAUSULAS SIGUIENTES:</p></li>
            <li><p>DECLARACIONES:</p></li>
            <li><p>III.Declara El ARRENDATARIO manifiesta bajo protesta de decir verdad: ser de nacionalidad 
            <asp:TextBox ID="caja_nacionalidad_moral" runat="server" Text="MEXICANA" placeholder="NACIONALIDAD"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox> 
            con Domicilio en  </p></li>
            <li><p><asp:TextBox ID="domicilio_calle_moral" runat="server"  placeholder="CALLE"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_numero_moral" runat="server"  placeholder="NÚMERO"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_colonia_moral" runat="server"  placeholder="FRACC/COLONIA"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_ciudad_moral" runat="server"  Text="ENSENADA"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_estado_moral" runat="server"  Text="BAJA CALIFORNIA"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_pais_moral" runat="server"  Text="MÉXICO"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="domicilio_cp_moral" runat="server"  placeholder="CÓDIGO POSTAL"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox></p></li>
            <li><p>1. Que dentro de su estructura orgánico-administrativa el
            <asp:TextBox ID="caja_puesto_organigrama" runat="server"  placeholder="PUESTO REPRESENTANTE"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox> 
            quien cuenta con la infraestructura y los recursos necesarios para dar cumplimiento al objeto del presente instrumento y cuyo titular es
            <asp:TextBox ID="caja_representante_legal_moral" runat="server"  placeholder="NOMBRE REPRESENTANTE"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            </p></li>
            <li><p>2. Que está constituida como Una Persona Moral UNA SOCIEDAD DE 
            <asp:TextBox ID="caja_responsabilidad" runat="server"  placeholder="RESPONSABILIDAD"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            conforme a las leyes mexicanas, según consta en  la Escritura Pública 
            <asp:TextBox ID="caja_numero_escritura" runat="server"  placeholder="NUMERO ESCRITURA"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            de fecha <asp:TextBox ID="caja_fecha_escritura" runat="server"  placeholder="FECHA"  CssClass="validacion_moral caja_busqueda"  ></asp:TextBox>.
            pasada ante la fe del Notario Público núm. 
            <asp:TextBox ID="caja_numero_notario" runat="server"  placeholder="NÚMERO DE NOTARIO"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            de Ciudad de 
            <asp:TextBox ID="caja_ciudad" runat="server"  placeholder="CIUDAD DEL NOTARIO"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            Lic.
            <asp:TextBox ID="caja_nombre_notario" runat="server"  placeholder="NOMBRE DEL NOTARIO"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>.
            </p></li>

            <li><p>3. Que
            <asp:TextBox ID="caja_representante_turno" runat="server"  placeholder="NOMBRE REPRESENTANTE"  CssClass="caja_busqueda" ></asp:TextBox>
            en su caracter de 
            <asp:TextBox ID="caja_puesto" runat="server"  placeholder="PUESTO EN EMPRESA"  CssClass="caja_busqueda" ></asp:TextBox>
            cuenta con la capacidad jurídica necesaria para celebrar este tipo de actos, como lo demuestra con la Escritura pública
            <asp:TextBox ID="caja_numero_poder" runat="server"  placeholder="#ESCRITURA PODER NOTARIAL"  CssClass="caja_busquedaa" ></asp:TextBox>
            de fecha <asp:TextBox ID="caja_fecha_poder" runat="server"  placeholder="FECHA"  CssClass="caja_busqueda"  ></asp:TextBox> 
            pasada ante la fe del Notario Público núm. 
            <asp:TextBox ID="caja_numero_notario_poder" runat="server"  placeholder="NÚMERO DE NOTARIO"  CssClass="caja_busqueda" ></asp:TextBox>
            de <asp:TextBox ID="caja_ciudad_poder" runat="server"  placeholder="CIUDAD"  CssClass="caja_mini micha" ></asp:TextBox>
            Lic. <asp:TextBox ID="caja_nombre_notario_poder" runat="server"  placeholder="NOMBRE DEL NOTARIO"  CssClass="caja_busqueda" ></asp:TextBox>
            </p></li>
            <li><p>V.- Manifestando El ARRENDADOR que tiene la capacidad Legal para dar en Arrendamiento el equipo materia de este Contrato mismo que se describe como sigue:</p></li>
            <li><p>b) LUGAR DE LA INSTALACION DEL EQUIPO: 
            Usar domicilio fiscal <asp:CheckBox ID="dom_fiscal_moral" runat="server" CssClass="caja_busqueda"></asp:CheckBox> 
            </p></li>
            <li><p>
            <asp:TextBox ID="instalacion_calle_moral" runat="server"  placeholder="CALLE"  CssClass="validacion_instalacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_numero_moral" runat="server"  placeholder="NÚMERO"  CssClass="validacion_instalacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_colonia_moral" runat="server"  placeholder="FRACC/COLONIA"  CssClass="validacion_instalacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_ciudad_moral" runat="server"  Text="ENSENADA"  CssClass="validacion_instalacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_estado_moral" runat="server"  Text="BAJA CALIFORNIA"  CssClass="validacion_instalacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_pais_moral" runat="server"  Text="MÉXICO"  CssClass="validacion_instalacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="instalacion_cp_moral" runat="server"  placeholder="CÓDIGO POSTAL"  CssClass="validacion_instalacion_moral caja_busqueda" ></asp:TextBox>
            </p></li>
            <li><p>H) VIGENCIA DEL CONTRATO:</p></li>
            <li><p>La vigencia del contrato será de 12 meses obligatorios para ambas partes a partir de 
            <asp:TextBox ID="caja_vigencia_moral" runat="server"  placeholder="FECHA"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox></p></li>
        
             <ul class="lista_banco">
               <li style=" margin-left:15px;"><p>Configuración en equipos adicionales $150 por máquina</p></li>
               <li style=" margin-left:15px;"><p>Servicio a domicilio <asp:DropDownList ID="servicio_domicilio_moral" runat="server"  placeholder=""  CssClass="validacion_moral caja_busqueda" >
                     <asp:ListItem>$150</asp:ListItem>
                     <asp:ListItem>$250</asp:ListItem>
                     <asp:ListItem>$0</asp:ListItem>
                    </asp:DropDownList></p>
                </li>
            </ul>

           <li><p>P) DOMICILIO Y RFC:  De EL ARRENDATARIO 
            Usar domicilio fiscal <asp:CheckBox ID="usar_dom_fiscal_moral_final" runat="server" CssClass="caja_busqueda"  ></asp:CheckBox></p></li>
            <li><p>
            <asp:TextBox ID="otro_calle_moral" runat="server"  placeholder="CALLE"  CssClass="validacion_otro_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_numero_moral" runat="server"  placeholder="NÚMERO"  CssClass="validacion_otro_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_colonia_moral" runat="server"  placeholder="FRACC/COLONIA"  CssClass="validacion_otro_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_ciudad_moral" runat="server"  Text="ENSENADA"  CssClass="validacion_otro_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_estado_moral" runat="server"  Text="BAJA CALIFORNIA"  CssClass="validacion_otro_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_pais_moral" runat="server"  Text="MÉXICO"  CssClass="validacion_otro_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="otro_cp_moral" runat="server"  placeholder="CÓDIGO POSTAL"  CssClass="validacion_otro_moral caja_busqueda" ></asp:TextBox>
            </p></li>
           <li><p>LO RATIFICAN EN TODO SU CLAUSULADO Y CONOCEDORES DE SU ALCANCE LEGAL, LO FIRMAN AL CALCE PARA CONSTANCIA E IMPUESTOS DE SU CONTENIDO LO SUSCRIBEN POR DUPLICADO QUEDANDO EN PODER DE CADA PARTES, 
            ENSENADA BAJA CALIFORNIA A  
            <asp:TextBox ID="caja_contrato_moral" runat="server"  placeholder="FECHA"  CssClass="validacion_moral caja_busqueda"  ></asp:TextBox> 
            </p></li>
            <li><p>
            Testigos: <asp:TextBox ID="moral_testigo_1" runat="server"  Text="Alexandra Patron Barraza"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            <asp:TextBox ID="moral_testigo_2" runat="server"  Text="Edgar Tejero Hoyos"  CssClass="validacion_moral caja_busqueda" ></asp:TextBox>
            <asp:LinkButton ID="boton_contrato_moral" runat="server" ToolTip="Guardar Contrato" style="text-decoration:none;"  CssClass="botones_requisiciones aprobar" OnClick="guardar_persona_moral" >Guardar</asp:LinkButton>
            </p></li>
          </ul>  
     </asp:Panel> 

   <!----------- CONTRATO DE COMODATO INKLASER -------->
   <asp:Panel ID="panel_comodato_inklaser" runat="server" Visible="false" style="">
       <ul class="texto_contratos">
            <li><p><center><b>CONTRATO DE COMODATO</b></center></p></li>
            <li><p>CONTRATO DE COMODATO, QUE CELEBRAN POR UN UNA PARTE, LA EMPRESA DENOMINADA Inklaser Comercial S. de R.  L. de C. V., EN LO SUCESIVO "LA COMODANTE", REPRESENTADA EN ESTE ACTO POR SU REPRESENTANTE LEGAL Juan Carlos Reyes Rivera; Y POR LA OTRA, 
            <asp:TextBox ID="caja_razon_social_ink" runat="server" placeholder="RAZÓN SOCIAL"  CssClass="validacion_ink caja_mini micha "  ></asp:TextBox>
            EN LO SUCESIVO "EL COMODATARIO", REPRESENTADO POR 
            <asp:TextBox ID="caja_representante_legal_ink" runat="server"  placeholder="REPRESENTANTE LEGAL"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            AL TENOR DE LAS SIGUIENTES DECLARACIONES Y CLÁUSULAS:</p></li>
            <li><p>DECLARACIONES</p></li>
            <li><p>II. DECLARA "EL COMODATARIO" y manifiesta bajo protesta de decir verdad ser de nacionalidad 
            <asp:TextBox ID="caja_nacionalidad_ink" runat="server" Text="MEXICANA" placeholder="NACIONALIDAD"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            con domicilio en </p></li>
            <li><p>
            <asp:TextBox ID="caja_domicilio_calle_ink" runat="server"  placeholder="CALLE"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_domicilio_numero_ink" runat="server"  placeholder="NÚMERO"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_domicilio_colonia_ink" runat="server"  placeholder="FRACC/COLONIA"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_domicilio_ciudad_ink" runat="server"  Text="ENSENADA"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_domicilio_estado_ink" runat="server"  Text="BAJA CALIFORNIA"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_domicilio_pais_ink" runat="server"  Text="MÉXICO"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_domicilio_cp_ink" runat="server"  placeholder="CÓDIGO POSTAL"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            </p></li>
            <li><p>III. DECLARAN AMBAS PARTES:<br />ÚNICO. Que en atención a lo expuesto, están conformes en sujetar su compromiso a los términos y condiciones insertos en las siguientes;    </p></li>
            <li><p>CLÁUSULAS</p></li>
            <li><p>PRIMERA. "LA COMODANTE" otorga en comodato una impresora
            <asp:TextBox ID="caja_marca_ink" runat="server"  placeholder="MARCA"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_modelo_ink" runat="server"  placeholder="MODELO"  CssClass="validacion_ink caja_mini micha" Enabled="true" ></asp:TextBox>
            <asp:TextBox ID="caja_serie_ink" runat="server"  placeholder="NUMERO DE SERIE"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            </p></li>
            <li><p>Al "COMODATARIO" para la  <asp:TextBox ID="caja_proposito_inklaser" runat="server" Text="impresión y copiado de documentos" placeholder="PROPÓSITO"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox></p></li>
            <li><p>SEGUNDA."LA COMODANTE" entregará a "EL COMODATARIO" los bienes que se describen, lo cual se llevará a cabo el día 
            <asp:TextBox ID="caja_fecha_entrega_ink" runat="server" CssClass="validacion_ink caja_mini micha" placeholder="FECHA" ></asp:TextBox>
            a través de los representantes que cada una de las partes haya designado para tal efecto. </p></li>    
            <li><p>TERCERA. La duración del presente contrato, será de 
            <asp:TextBox ID="caja_numero_meses" runat="server"  placeholder="N SEMANAS/MESES"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            a partir de la firma del presente contrato.</p></li>
            <ul class="lista_banco">
                <li><p>Configuración en equipos adicionales $150 por máquina</li>
                <li><p>Servicio a domicilio <asp:DropDownList ID="servicio_domicilio_ink" runat="server"  placeholder=""  CssClass="caja_mini micha" >
                     <asp:ListItem>$150</asp:ListItem>
                     <asp:ListItem>$250</asp:ListItem>
                     <asp:ListItem>$0</asp:ListItem>
                    </asp:DropDownList></p>
                </li>
            </ul>
            <li><p>Leído el contrato y enteradas las partes de su contenido y alcances, lo firman en la Ciudad de
            <asp:TextBox ID="caja_ciudad_ink" runat="server"  placeholder="CIUDAD" Text="ENSENADA" CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            en el Estado de Baja California, a los <asp:TextBox ID="caja_fecha_ink" runat="server"  placeholder="FECHA"  CssClass="validacion_ink caja_mini micha"  ></asp:TextBox>
            </p></li>
            <li><p>Testigos: <asp:TextBox ID="inklaser_testigo_1" runat="server"  Text="Alexandra Patron Barraza"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="inklaser_testigo_2" runat="server"  Text="Edgar Tejero Hoyos"  CssClass="validacion_ink caja_mini micha" ></asp:TextBox>

            <asp:LinkButton ID="boton_comodato_ink" runat="server" ToolTip="Guardar contrato" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" OnClick="guardar_comodato_inklaser" >Guardar</asp:LinkButton>
            </p></li>
            </ul>
   </asp:Panel> 

    <!----------- CONTRATO DE COMODATO POR IMPRESIÓN -------->
   <asp:Panel ID="panel_contrato_por_impresion" runat="server" Visible="false" style="">
         <ul class="texto_contratos">
            <li><p><b><center>CONTRATO DE COMODATO POR IMPRESIÓN</center></b></p></li>
            <li><p>CONTRATO DE COMODATO, QUE CELEBRAN POR UN UNA PARTE, LA EMPRESA DENOMINADA Inklaser Comercial S. de R.  L. de C. V., EN LO SUCESIVO "LA COMODANTE", REPRESENTADA EN ESTE ACTO POR SU REPRESENTANTE LEGAL Juan Carlos Reyes Rivera; Y POR LA OTRA, 
            <asp:TextBox ID="caja_razon_social_comodato" runat="server"  placeholder="RAZÓN SOCIAL"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            EN LO SUCESIVO "EL COMODATARIO", REPRESENTADO POR 
            <asp:TextBox ID="caja_representante_comodato" runat="server"  placeholder="REPRESENTANTE LEGAL"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            AL TENOR DE LAS SIGUIENTES DECLARACIONES Y CLÁUSULAS:</p></li>
            <li><p>DECLARACIONES</p></li>
            <li><p>II. DECLARA "EL COMODATARIO" y manifiesta bajo protesta de decir verdad ser de nacionalidad 
            <asp:TextBox ID="caja_nacionalidad_comodato" runat="server"  placeholder="NACIONALIDAD"  Text="MEXICANA" CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            con domicilio en</p></li>
            <li><p>
            <asp:TextBox ID="caja_comodato_calle" runat="server"  placeholder="CALLE"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_comodato_numero" runat="server"  placeholder="NÚMERO"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_comodato_colonia" runat="server"  placeholder="FRACC/COLONIA"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_comodato_ciudad" runat="server"  Text="ENSENADA"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_comodato_estado" runat="server"  Text="BAJA CALIFORNIA"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_comodato_pais" runat="server"  Text="MÉXICO"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_comodato_cp" runat="server"  placeholder="CÓDIGO POSTAL"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            </p></li>
            <li><p>III. DECLARAN AMBAS PARTES: ÚNICO. Que en atención a lo expuesto, están conformes en sujetar su compromiso a los términos y condiciones insertos en las siguientes;    
            </p></li>
            <li><p>CLÁUSULAS</p></li>
            <li><p>PRIMERA. "LA COMODANTE" otorga en comodato una impresora
            <asp:TextBox ID="caja_marca_comodato" runat="server"  placeholder="MARCA"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_modelo_comodato" runat="server"  placeholder="MODELO"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_serie_comodato" runat="server"  placeholder="NUMERO DE SERIE"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="caja_contador_comodato" runat="server"  placeholder="CONTADOR"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox></p></li>
            <li><p> Al "COMODATARIO", para  
            <asp:TextBox ID="caja_proposito_comodato" runat="server"  Text="impresión y copiado de documentos"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            </p></li>
            <li><p>SEGUNDA."LA COMODANTE" entregará a "EL COMODATARIO" los bienes que se describen, lo cual se llevará a cabo el día 
             <asp:TextBox ID="caja_entrega_comodato" runat="server" CssClass="validacion_impresion caja_mini micha" placeholder="FECHA"></asp:TextBox>
            a través de los representantes que cada una de las partes haya designado para tal efecto.</p></li> 
            <li><p>TERCERA. La duración del presente contrato, será de 
            <asp:TextBox ID="caja_duracion" runat="server"  placeholder="N SEMANAS/MESES"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            a partir de la firma del presente contrato.</p></li>
            
            <ul class="lista_banco">
               <li><p>Costo por impresión <asp:TextBox ID="caja_costo_impresion" runat="server" CssClass="validacion_impresion  caja_mini micha" placeholder="COSTO IMPRESIÓN" Text=""></asp:TextBox></p> </li>
               <li><p>Configuración en equipos adicionales $150 por máquina</p> </li>
               <li><p>Servicio a domicilio <asp:DropDownList ID="servicio_domicilio_comodato" runat="server"  placeholder=""  CssClass="caja_mini micha" >
                     <asp:ListItem>$150</asp:ListItem>
                     <asp:ListItem>$250</asp:ListItem>
                    <asp:ListItem>$0</asp:ListItem>
                    </asp:DropDownList></p> 
                </li>
            </ul>
            <li><p>Leído el contrato y enteradas las partes de su contenido y alcances, lo firman en la Ciudad de 
            <asp:TextBox ID="caja_ciudad_comodato" runat="server"  placeholder="CIUDAD" Text="ENSENADA"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            en el Estado de Baja California, a los 
             <asp:TextBox ID="caja_fecha_contrato_comodato" runat="server" CssClass="validacion_impresion caja_mini micha" placeholder="FECHA"></asp:TextBox>
             </p></li>
            <li><p>
            Testigos: <asp:TextBox ID="impresion_testigo_1" runat="server"  Text="Alexandra Patron Barraza"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            <asp:TextBox ID="impresion_testigo_2" runat="server"  Text="Edgar Tejero Hoyos"  CssClass="validacion_impresion caja_mini micha" ></asp:TextBox>
            </p></li>
            <asp:LinkButton ID="boton_guardar_impresion" runat="server" ToolTip="Guardar contrato" style="text-decoration:none;" CssClass="botones_requisiciones aprobar" OnClick="guardar_comodato_impresion" >Guardar</asp:LinkButton>
   </asp:Panel> 

      
    </asp:Panel>
    <div id='alrt' class="notificacion_div"></div>
    <br/>
  </div></div>  
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>