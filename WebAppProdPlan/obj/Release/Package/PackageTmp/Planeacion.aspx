<%@  Language="C#" MasterPageFile="~/ProdPlan.Master" AutoEventWireup="true" CodeBehind="Planeacion.aspx.cs" Inherits="WebAppProdPlan.Planeacion" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true"></asp:ScriptManager>
    <div class="container-fluid">
        <br />
        <div class="container">
            <div class="row">
                <div class="col-md-2">
                    <br />
                    <br />
                    <br />
                    <ul class="list-inline">
                        <li>
                            <img src="Media/logo2.png" class="img-responsive" width="150" /></li>
                        <li>
                            <h4 class=""><strong><em>Area de Planeación</em></strong></h4>
                        </li>
                    </ul>
                </div>
                <div class="col-md-5">
                    <div id="lista1" style="overflow: scroll; height: 270px" class="form-control">
                        <ul id="Prin" class="auto-style39 list-unstyled">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <li id="0<%# Eval("contador") %>" draggable="true" style="cursor: move;"><a contador="<%# Eval("contador") %>" id="<%# Eval("cve_dispo") %>" piezas="<%# Eval("piezas") %>" color="<%# Eval("color") %>" peso="<%# Eval("peso") %>" elementos="<%# Eval("ele_cve") %>"><%# Eval("cadena") %></a></li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                    <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
                    <asp:TextBox ID="maximo" runat="server" hidden></asp:TextBox>
                    <input type="hidden" id="maximo2" name="maximo2" value="<%# Eval("maximo") %>" />
                </div>
                <div class="col-md-5">
                    <div id="container" style="height: 320px"></div>
                    <!-- tiene la grafica  -->
                </div>
            </div>

            <div class="row">
                <div class="col-md-6">
                    <h4 class="text-left"><strong>Generando Totales</strong></h4>
                </div>
                <div class="col-md-6">
                    <ul class="list-inline text-right">
                        <li><a href="http://skyhdev3/colorprendas/Pedido.aspx" class="btn btn-info btn-sm">
                            <strong><span class="glyphicon glyphicon-tint" aria-hidden="true"></span>Ir a asignacion pedidos color</strong></a></li>
                        <li>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Button ID="generar" runat="server" Text="Generar" CssClass="btn btn-success btn-sm" OnClientClick="insertar()" OnClick="generar_Click" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="">
            <div class="row">
                <div class="col-md-4">
                    <div class="alert alert-success" role="alert">
                        <h4 class="text-center">TINA 1</h4>
                    </div>
                    <div class="panel panel-success">
                        <div class="row">
                            <input type="hidden" id="Total_fin" name="Total_fin" value="0" disabled="disabled" />
                        </div>
                        <div class="col-md-6">
                            <h5>Piezas</h5>
                            <input type="text" id="Total1" name="Total1" value="0" disabled="disabled" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <h5>Kilos</h5>
                            <input type="text" id="Total4" name="Total4" value="0.00" disabled="disabled" class="form-control" />
                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div style="overflow: scroll; height: 150px;">
                                    <input type="hidden" id="oculto" name="oculto" value="" />
                                    <ul id="c1" onclick="remover0()" class="list-unstyled" style="width: 380px; height: 207px;"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="alert alert-info" role="alert">
                        <h4 class="text-center">TINA 2</h4>
                    </div>
                    <div class="panel panel-primary">
                        <div class="col-md-6">
                            <h5>Piezas</h5>
                            <input type="text" id="Total2" name="Total2" value="0" disabled="disabled" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <h5>Kilos</h5>
                            <input type="text" id="Total5" name="Total5" value="0.00" min="0" disabled="disabled" class="form-control" />
                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div id="cont2" style="overflow: scroll; height: 150px;">
                                    <ul id="c2" onclick="remover1()" class="list-unstyled" style="width: 380px; height: 207px"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="alert alert-warning">
                        <h4 class="text-center">TINA 3</h4>
                    </div>
                    <div class="panel panel-warning">
                        <div class="col-md-6">
                            <h5>Piezas</h5>
                            <input type="text" id="Total3" name="Total3" value="0" disabled="disabled" class="form-control" />
                        </div>
                        <div class="col-md-6">
                            <h5>Kilos</h5>
                            <input type="text" id="Total6" name="Total6" value="0.00" min="0.00" disabled="disabled" class="form-control" />
                        </div>
                        <br />
                        <br />
                        <br />
                        <div class="row">
                            <div class="col-md-12">
                                <div id="cont3" style="overflow: scroll; height: 150px;">
                                    <ul id="c3" onclick="remover2()" class="list-unstyled" style="width: 380px; height: 207px"></ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div id="temp" class="auto-style39 list-unstyled" draggable="true" style="cursor: move;"></div>
            <div id="mensaje" class="ocultar"></div>
            <div class="result"></div>
            <div id="error"></div>

            <input type="hidden" id="envio" name="envio" value="" />
            <input type="hidden" id="recibe" name="recibe" value="" />
            <input type="hidden" id="pieza" name="pieza" value="" />
            <input type="hidden" id="elemento" name="elemento" value="" />
            <input type="hidden" id="tina" name="tina" value="" />

            <div id="bloqueo" class="pantalla_bloqueo">
                <div id="mensaje_bloqueador">
                    <p><b>ESPERA UN MOMENTO.....</b></p>
                </div>
                <div id="imagen_bloqueador">
                    <img src="Media/procesando.gif" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        /* FUNCION PARA ALMACENAR EN ARREGLOS LA INFORMACION PARA ALMACENAR */
        function insertar() {
            var arrayCont = [];
            var arrayCant = [];
            var arraypiezas = [];
            var arrayelementos = [];
            var arraytinas = [];

            for (t = 1; t < 4; t++) {
                var g = "c" + t;

                var arreglito = [];
                var cantidad = [];
                var piezas = [];
                var elementos = [];
                var tinas = [];

                var b = document.getElementById(g);
                for (i = 0; i < b.childElementCount ; i++) {
                    var e = b.childNodes[i];
                    var s = e.firstChild;
                    var r = s.id;
                    var d = s.getAttribute("peso");
                    var a = s.getAttribute("piezas");
                    var z = s.getAttribute("elementos");
                    var y = t;
                    arreglito[i] = r;
                    cantidad[i] = d;
                    piezas[i] = a;
                    elementos[i] = z;
                    tinas[i] = t;
                }
                arrayCont[t] = arreglito;
                arrayCant[t] = cantidad;
                arraypiezas[t] = piezas;
                arrayelementos[t] = elementos;
                arraytinas[t] = tinas;
            }
            var enviar = document.getElementById("envio").value = arrayCont;
            var recibir = document.getElementById("recibe").value = arrayCant;
            var pieza = document.getElementById("pieza").value = arraypiezas;
            var elemento = document.getElementById("elemento").value = arrayelementos;
            var tina = document.getElementById("tina").value = arraytinas;
            var confirmar = confirm("Desea guardar la informacion?");
            if (confirmar == true) {
                $("#bloqueo").show();
                setTimeout(function () {
                    $("#bloqueo").hide();
                }, 1000 * 17);
            }
        }
        /* FUN DE LA FUNCION DE ASIGNACION A ARREGLOS */
    </script>
    <script type="text/javascript">
        function remover0() {
            lis = document.getElementById('c1').getElementsByTagName('li');
            for (var i = 0; i < lis.length; i++) {
                lis[i].onclick = function () {
                    if (confirm('¿Borrar este elemento?')) {
                        var h = document.getElementById("oculto").value;//
                        var g = this.firstChild.getAttribute("color");
                        var u = document.getElementById("Total1").value;
                        var z = this.firstChild.getAttribute("piezas");
                        document.getElementById("Total1").value = parseInt(u, 10) - parseInt(z, 10);
                        var a = document.getElementById("Total4").value;
                        var d = this.firstChild.getAttribute("peso");
                        var ele = this.firstChild.getAttribute("elementos");
                        var n = document.getElementById("Total4").value = parseFloat(a) - parseFloat(d);
                        var l = n.toFixed(2);
                        document.getElementById("Total4").value = l;
                        var z1 = document.getElementById("Total5").value;
                        var z2 = document.getElementById("Total6").value;
                        var z3 = parseFloat(z1) + parseFloat(z2) + parseFloat(l);
                        var z4 = this.firstChild.getAttribute("contador");
                        if (z3 < 1) {
                            document.getElementById("oculto").value = "";
                        }
                        var newItem = document.createElement("li");
                        var newItemA = document.createElement("a");

                        newItem.style.cursor = 'move';
                        newItem.draggable = 'true';
                        newItem.setAttribute("id", "0" + z4);

                        newItemA.setAttribute("id", this.id);
                        newItemA.setAttribute("contador", z4);
                        newItemA.setAttribute("piezas", z);
                        newItemA.setAttribute("color", g);
                        newItemA.setAttribute("peso", d);
                        newItemA.setAttribute("elementos", ele);

                        var textnode = this.firstChild;
                        newItemA.appendChild(textnode);
                        newItem.appendChild(newItemA);

                        var list = document.getElementById("Prin");
                        list.insertBefore(newItem, list.childNodes[z4]);
                    }
                };
            }
        }

        function remover1() {
            lis = document.getElementById('c2').getElementsByTagName('li');
            for (var i = 0; i < lis.length; i++) {
                lis[i].onclick = function () {
                    if (confirm('¿Borrar este elemento?')) {
                        var h = document.getElementById("oculto").value;//
                        var g = this.firstChild.getAttribute("color");
                        var u = document.getElementById("Total2").value;
                        var z = this.firstChild.getAttribute("piezas");
                        document.getElementById("Total2").value = parseInt(u, 10) - parseInt(z, 10);
                        var a = document.getElementById("Total5").value;
                        var d = this.firstChild.getAttribute("peso");
                        var ele = this.firstChild.getAttribute("elementos");
                        var n = document.getElementById("Total5").value = parseFloat(a) - parseFloat(d);
                        var l = n.toFixed(2);
                        document.getElementById("Total5").value = l;
                        var z1 = document.getElementById("Total4").value;
                        var z2 = document.getElementById("Total6").value;
                        var z3 = parseFloat(z1) + parseFloat(z2) + parseFloat(l);
                        var z4 = this.firstChild.getAttribute("contador");
                        if (z3 < 1) {
                            document.getElementById("oculto").value = "";
                        }
                        var newItem = document.createElement("li");
                        var newItemA = document.createElement("a");

                        newItem.style.cursor = 'move';
                        newItem.draggable = 'true';
                        newItem.setAttribute("id", "0" + z4);

                        newItemA.setAttribute("id", this.id);
                        newItemA.setAttribute("contador", z4);
                        newItemA.setAttribute("piezas", z);
                        newItemA.setAttribute("color", g);
                        newItemA.setAttribute("peso", d);
                        newItemA.setAttribute("elementos", ele);

                        var textnode = this.firstChild;
                        newItemA.appendChild(textnode);
                        newItem.appendChild(newItemA);

                        var list = document.getElementById("Prin");
                        list.insertBefore(newItem, list.childNodes[z4]);
                    }
                };
            }
        }

        function remover2() {
            lis = document.getElementById('c3').getElementsByTagName('li');
            for (var i = 0; i < lis.length; i++) {
                lis[i].onclick = function () {
                    if (confirm('¿Borrar este elemento?')) {
                        var g = this.firstChild.getAttribute("color");
                        var u = document.getElementById("Total3").value;
                        var z = this.firstChild.getAttribute("piezas");
                        document.getElementById("Total3").value = parseInt(u, 10) - parseInt(z, 10);
                        var a = document.getElementById("Total6").value;
                        var d = this.firstChild.getAttribute("peso");
                        var ele = this.firstChild.getAttribute("elementos");
                        var n = document.getElementById("Total6").value = parseFloat(a) - parseFloat(d);
                        var l = n.toFixed(2);
                        document.getElementById("Total6").value = l;
                        var z1 = document.getElementById("Total5").value;
                        var z2 = document.getElementById("Total4").value;
                        var z3 = parseFloat(z1) + parseFloat(z2) + parseFloat(l);
                        var z4 = this.firstChild.getAttribute("contador");
                        if (z3 < 1) {
                            document.getElementById("oculto").value = "";
                        }
                        var newItem = document.createElement("li");
                        var newItemA = document.createElement("a");

                        newItem.style.cursor = 'move';
                        newItem.draggable = 'true';
                        newItem.setAttribute("id", "0" + z4);

                        newItemA.setAttribute("id", this.id);
                        newItemA.setAttribute("contador", z4);
                        newItemA.setAttribute("piezas", z);
                        newItemA.setAttribute("color", g);
                        newItemA.setAttribute("peso", d);
                        newItemA.setAttribute("elementos", ele);

                        var textnode = this.firstChild;
                        newItemA.appendChild(textnode);
                        newItem.appendChild(newItemA);

                        var list = document.getElementById("Prin");
                        list.insertBefore(newItem, list.childNodes[z4]);
                    }
                };
            }
        }
    </script>
    <script type="text/javascript">
        /* ESTILO E INFORMACION DE LA GRAFICA */
        $(function () {
            Highcharts.getOptions().colors = Highcharts.map(Highcharts.getOptions().colors, function (color) {
                return {
                    radialGradient: {
                        cx: 0.5,
                        cy: 0.3,
                        r: 0.7
                    },
                    stops: [
                        [0, color],
                        [1, Highcharts.Color(color).brighten(-0.3).get('rgb')] // darken
                    ]
                };
            });
            var $reporting = $('#reporting');
            var $mensaje = $('#mensaje');
            $('#container').highcharts({
                chart: {
                    type: 'pie',
                    options3d: {
                        enabled: true,
                        alpha: 45,
                        beta: 0
                    }
                },
                title: {
                    text: ''
                },
                tooltip: {
                    pointFormat: ''
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        depth: 35,
                        dataLabels: {
                            enabled: true,
                            format: '{point.name}',
                            style: {
                                fontSize: '14px',
                                fontWeight: 'bold',
                                fontFamily: "sans-serif, sans-serif"
                            }
                        }
                    },
                    series: {
                        allowPointSelect: true,
                        point: {
                            events: {
                                mouseOver: function () {
                                    //var serie=this.series.data[this.x];
                                    var serie = this.series.data[this.x];
                                    $reporting.html(serie.name);
                                    var t = serie.name;

                                    var nu = document.getElementById("temp");
                                    if (nu.hasChildNodes() > 0) {
                                        var ult = document.getElementById("temp").lastChild;
                                        var ee = ult.lastChild;
                                        var yy = ee.getAttribute("elementos");
                                        if (yy.match(/NO.NT.*/)) {
                                            var s = document.getElementById("temp").appendChild(ult);
                                            var lista = document.getElementById("Prin");
                                            var z4 = ee.getAttribute("contador");
                                            lista.insertBefore(s, lista.childNodes[z4]);
                                            alert("Ese elemento no tiene norma tecnica");
                                        } else {
                                            if (serie.name == "TINA 1") {
                                                var itm = document.getElementById("temp").lastChild;
                                                var e = itm.lastChild;
                                                var y = e.getAttribute("piezas");
                                                var i = document.getElementById("Total1").value;
                                                document.getElementById("Total1").value = parseInt(i, 10) + parseInt(y, 10);
                                                var g = e.getAttribute("color");
                                                var h = document.getElementById("oculto").value;
                                                if (h == "" || h == g) { //condicion del color
                                                    document.getElementById("oculto").value = g;
                                                    var n = e.getAttribute("peso");
                                                    var c = document.getElementById("Total4").value;
                                                    var t5 = document.getElementById("Total5").value;
                                                    var t6 = document.getElementById("Total6").value;
                                                    var m = document.getElementById("<%=maximo.ClientID%>").value;
                                                    var a = document.getElementById("Total4").value = parseFloat(c) + parseFloat(n);
                                                    var q = a.toFixed(2);

                                                    //GCM no pasar de 90
                                                    var qq = document.getElementById("Total_fin").value = parseFloat(q) + parseFloat(t5) + parseFloat(t6);
                                                    var qr = qq.toFixed(2);
                                                    document.getElementById("Total_fin").value = qr;

                                                    var jm = parseFloat(document.getElementById("Total_fin").value);

                                                    if ((a <= m) && (qq <= 90)) { // condicion de los kilos
                                                        document.getElementById("Total4").value = q;
                                                        var cln = itm.cloneNode(true);
                                                        document.getElementById("c1").appendChild(cln);
                                                        document.getElementById("temp").removeChild(itm);
                                                        this.series.data[2].slice(true);

                                                        this.series.data[1].slice(false);
                                                        this.series.data[0].slice(false);
                                                    } else {
                                                        var n = e.getAttribute("peso");
                                                        var c = document.getElementById("Total4").value;
                                                        var p = document.getElementById("Total4").value = parseFloat(c) - parseFloat(n);
                                                        var a = p.toFixed(2);
                                                        var t5 = document.getElementById("Total5").value;
                                                        var t6 = document.getElementById("Total6").value;

                                                        var f = document.getElementById("Total4").value = a;

                                                        var qq = document.getElementById("Total_fin").value = parseFloat(a) + parseFloat(t5) + parseFloat(t6);
                                                        var qr = qq.toFixed(2);
                                                        document.getElementById("Total_fin").value = qr;

                                                        var g = e.getAttribute("piezas");
                                                        var h = document.getElementById("Total1").value;
                                                        var w = document.getElementById("Total1").value = parseInt(h) - parseInt(g);
                                                        document.getElementById("Total1").value = w;
                                                        var s = document.getElementById("temp").lastChild;
                                                        var d = s.getAttribute('id');
                                                        var lista = document.getElementById("Prin");
                                                        var z4 = e.getAttribute("contador");
                                                        lista.insertBefore(s, lista.childNodes[z4]);
                                                        alert('Sobrepasa el peso maximo');
                                                    }
                                                } else {
                                                    var g = e.getAttribute("piezas");
                                                    var h = document.getElementById("Total1").value;
                                                    var w = document.getElementById("Total1").value = parseInt(h) - parseInt(g);
                                                    document.getElementById("Total1").value = w;
                                                    var s = document.getElementById("temp").appendChild(itm);
                                                    var lista = document.getElementById('Prin');
                                                    var z4 = e.getAttribute("contador");
                                                    lista.insertBefore(s, lista.childNodes[z4]);
                                                    alert('No contiene el mismo color');
                                                }
                                            } else {
                                                if (serie.name == "TINA 2") {
                                                    var itm = document.getElementById("temp").lastChild;
                                                    var e = itm.lastChild;
                                                    var y = e.getAttribute("piezas");
                                                    var i = document.getElementById("Total2").value;
                                                    document.getElementById("Total2").value = parseInt(i, 10) + parseInt(y, 10);
                                                    var g = e.getAttribute("color");
                                                    var h = document.getElementById("oculto").value;

                                                    if (h == "" || g == h) { //condicion del color 
                                                        //document.getElementById("oculto1").value=g;
                                                        document.getElementById("oculto").value = g;
                                                        //document.getElementById("oculto1").value=g;
                                                        var n = e.getAttribute("peso");
                                                        var c = document.getElementById("Total5").value;
                                                        var t5 = document.getElementById("Total4").value;
                                                        var t6 = document.getElementById("Total6").value;
                                                        var m = document.getElementById("<%=maximo.ClientID%>").value;
                                                        var a = document.getElementById("Total5").value = parseFloat(c) + parseFloat(n);
                                                        var q = a.toFixed(2);

                                                        //GCM no pasar de 90
                                                        var qq = document.getElementById("Total_fin").value = parseFloat(q) + parseFloat(t5) + parseFloat(t6);
                                                        var qr = qq.toFixed(2);
                                                        document.getElementById("Total_fin").value = qr;

                                                        if ((a <= m) && (qq <= 90)) { //condicion de los kilos
                                                            document.getElementById("Total5").value = q;
                                                            var cln = itm.cloneNode(true);
                                                            document.getElementById("c2").appendChild(cln);
                                                            document.getElementById("temp").removeChild(itm);
                                                            this.series.data[0].slice(true);

                                                            this.series.data[1].slice(false);
                                                            this.series.data[2].slice(false);
                                                        } else {
                                                            var n = e.getAttribute("peso");
                                                            var c = document.getElementById("Total5").value;
                                                            var p = document.getElementById("Total5").value = parseFloat(c) - parseFloat(n);
                                                            var a = p.toFixed(2);
                                                            var t5 = document.getElementById("Total4").value;
                                                            var t6 = document.getElementById("Total6").value;
                                                            var f = document.getElementById("Total5").value = a;
                                                            var qq = document.getElementById("Total_fin").value = parseFloat(a) + parseFloat(t5) + parseFloat(t6);
                                                            var qr = qq.toFixed(2);
                                                            document.getElementById("Total_fin").value = qr;
                                                            var g = e.getAttribute("piezas");
                                                            var h = document.getElementById("Total2").value;
                                                            var w = document.getElementById("Total2").value = parseInt(h) - parseInt(g);
                                                            document.getElementById("Total2").value = w;
                                                            var s = document.getElementById("temp").appendChild(itm);
                                                            var lista = document.getElementById('Prin');
                                                            var z4 = e.getAttribute("contador");
                                                            lista.insertBefore(s, lista.childNodes[z4]);
                                                            //$mensaje.html('Sobrepasa el peso maximo');  
                                                            alert('Sobrepasa el peso maximo');
                                                        }
                                                    } else {
                                                        var g = e.getAttribute("piezas");
                                                        var h = document.getElementById("Total2").value;
                                                        var w = document.getElementById("Total2").value = parseInt(h) - parseInt(g);
                                                        document.getElementById("Total2").value = w;
                                                        var s = document.getElementById("temp").appendChild(itm);
                                                        var lista = document.getElementById("Prin");
                                                        var z4 = e.getAttribute("contador");
                                                        lista.insertBefore(s, lista.childNodes[z4]);
                                                        alert('No contiene el mismo color');
                                                    }
                                                } else {
                                                    if (serie.name == "TINA 3") {
                                                        var itm = document.getElementById("temp").lastChild;
                                                        var e = itm.lastChild;
                                                        var y = e.getAttribute("piezas");
                                                        var i = document.getElementById("Total3").value;
                                                        document.getElementById("Total3").value = parseInt(i, 10) + parseInt(y, 10);
                                                        var g = e.getAttribute("color");
                                                        var h = document.getElementById("oculto").value;
                                                        if (h == "" || g == h) { //condicion del color 
                                                            //document.getElementById("oculto2").value=g;
                                                            document.getElementById("oculto").value = g;
                                                            var n = e.getAttribute("peso");
                                                            var c = document.getElementById("Total6").value;
                                                            var t5 = document.getElementById("Total4").value;
                                                            var t6 = document.getElementById("Total5").value;
                                                            var m = document.getElementById("<%=maximo.ClientID%>").value;
                                                            var a = document.getElementById("Total6").value = parseFloat(c) + parseFloat(n);
                                                            var q = a.toFixed(2);
                                                            //GCM no pasar de 90
                                                            var qq = document.getElementById("Total_fin").value = parseFloat(q) + parseFloat(t5) + parseFloat(t6);
                                                            var qr = qq.toFixed(2);
                                                            document.getElementById("Total_fin").value = qr;

                                                            if ((a <= m) && (qq <= 90)) { //condicion de los kilos
                                                                document.getElementById("Total6").value = q;
                                                                var cln = itm.cloneNode(true);
                                                                document.getElementById("c3").appendChild(cln);
                                                                document.getElementById("temp").removeChild(itm);
                                                                this.series.data[1].slice(true);

                                                                this.series.data[2].slice(false);
                                                                this.series.data[0].slice(false);
                                                            } else {
                                                                var n = e.getAttribute("peso");
                                                                var c = document.getElementById("Total6").value;
                                                                var p = document.getElementById("Total6").value = parseInt(c) - parseFloat(n);
                                                                var a = p.toFixed(2);
                                                                var t5 = document.getElementById("Total4").value;
                                                                var t6 = document.getElementById("Total5").value;
                                                                var f = document.getElementById("Total6").value = a;
                                                                var qq = document.getElementById("Total_fin").value = parseFloat(a) + parseFloat(t5) + parseFloat(t6);
                                                                var qr = qq.toFixed(2);
                                                                document.getElementById("Total_fin").value = qr;

                                                                var g = e.getAttribute("piezas");
                                                                var h = document.getElementById("Total3").value;
                                                                var w = document.getElementById("Total3").value = parseInt(h) - parseInt(g);
                                                                document.getElementById("Total3").value = w;
                                                                var s = document.getElementById("temp").appendChild(itm);
                                                                var lista = document.getElementById("Prin");
                                                                var z4 = e.getAttribute("contador");
                                                                lista.insertBefore(s, lista.childNodes[z4]);
                                                                alert('Sobrepasa el peso maximo');

                                                            }
                                                        } else {
                                                            var g = e.getAttribute("piezas");
                                                            var h = document.getElementById("Total3").value;
                                                            var w = document.getElementById("Total3").value = parseInt(h) - parseInt(g);
                                                            document.getElementById("Total3").value = w;
                                                            var s = document.getElementById("temp").appendChild(itm);
                                                            var lista = document.getElementById("Prin");
                                                            var z4 = e.getAttribute("contador");
                                                            lista.insertBefore(s, lista.childNodes[z4]);
                                                            alert('No contiene el mismo color');
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    } //Else norma tecnica
                                    //alert(serie.name);
                                },
                                mouseOut: function () {
                                    $reporting.html("Fuera del Contenedor");
                                    //alert('Fuera de Contenedor')
                                }
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    data: [
                        ['TINA 2', 33],
                        ['TINA 3', 33],
                        ['TINA 1', 33]
                    ]
                }]
            });
        });
    </script>
    <script type="text/javascript">
        /* ATRIBUTOS PARA ARRASTRAR Y SOLTAR ELEMENTOS A LA GRAFICA  */
        document.getElementById("Prin").addEventListener('dragstart', drag, false);
        document.getElementById("temp").addEventListener('dragover', permiteDrop, false);
        document.getElementById("container").addEventListener('dragover', permiteDrop, false);
        document.getElementById("temp").addEventListener('drop', drop, false);
        document.getElementById("container").addEventListener('drop', drop, false);

        function drag(ev) {
            ev.dataTransfer.setData("Text", ev.target.id);
        }
        var container = document.querySelector('#container');
        function drop(ev) {
            ev.preventDefault();
            var datos = ev.dataTransfer.getData("Text");
            var resultado = ev.target.appendChild(document.getElementById(datos));
            temp.appendChild(resultado);
        }
        function permiteDrop(ev) {
            ev.preventDefault();
        }
        /* FIN DE LOS ATRIBUTOS */
    </script>

</asp:Content>
