    

    
    /* FIN DE LA FUNCION DE GRAFICO Y TINAS(DIV) */ 


    /* FUNCION DE BORRAR UN ELEMENTO */
    
    
    /*function remover1(){
        var s= document.getElementById("c2").lastChild;
        var r=s.lastChild;
       // var h=document.getElementById("oculto1").value;
        var g=r.getAttribute("color");
        //document.getElementById("oculto1").value=parseInt(h,10)-parseInt(g,10);
        //document.getElementById("oculto1").value="";                    
        var u= document.getElementById("Total2").value;
        var z=r.getAttribute("piezas");
        document.getElementById("Total2").value=parseInt(u,10)-parseInt(z,10);
        var a=document.getElementById("Total5").value;
        var d=r.getAttribute("peso");
        var n=document.getElementById("Total5").value=parseFloat(a)-parseFloat(d);
        var l=n.toFixed(1);
        document.getElementById("Total5").value=l;
        var z1=document.getElementById("Total4").value;
        var z2=document.getElementById("Total6").value;
        var z3=parseFloat(z1)+parseFloat(z2)+parseFloat(l);
        var z4=r.getAttribute("contador"); 
        if(z3<1){
            document.getElementById("oculto").value="";
        }                    
        var list=document.getElementById("Prin");
        list.insertBefore(s,list.childNodes[z4]);
    }*/

    /*function remover2(){
        var s=document.getElementById("c3").lastChild;
        var r=s.lastChild;
        // var h=document.getElementById("oculto2").value;
        var g=r.getAttribute("color");
        //document.getElementById("oculto2").value=parseInt(h,10)-parseInt(g,10);
        //document.getElementById("oculto2").value="";
        var u=document.getElementById("Total3").value;
        var z=r.getAttribute("piezas");
        document.getElementById("Total3").value=parseInt(u,10)-parseInt(z,10);
        var a=document.getElementById("Total6").value;
        var d=r.getAttribute("peso");
        var n=document.getElementById("Total6").value=parseFloat(a)-parseFloat(d);
        var l=n.toFixed(1);
        document.getElementById("Total6").value=l;
        var z1=document.getElementById("Total5").value;
        var z2=document.getElementById("Total4").value;
        var z3=parseFloat(z1)+parseFloat(z2)+parseFloat(l);
        var z4=r.getAttribute("contador"); 
        if(z3<1){
            document.getElementById("oculto").value="";
        }                    
        var list=document.getElementById("Prin");
        list.insertBefore(s,list.childNodes[z4]);
    }*/

    /* FIN DE LAS FUNCIONES PARA ELIMINAR DATOS DE LAS LISTAS */

    /* FUNCION PARA PERSONALIZAR EL MENSAJE QUE SE MUESTRA EN LA PANTALLA DE CARGA */
    
    /* FIN DE LA FUNCION DE PERSONALIZACION */

    <!-- ********* ocultar mensaje ********-->
    /*var strCmd = "document.getElementById('mensaje').style.display = 'none'"; 
    var waitseconds = 20;
    // Calculas el tiempo en milisegundos y ejecutas la accion 
    var timeOutPeriod = waitseconds * 1000; 
    var hideTimer = setTimeout(strCmd, timeOutPeriod); */
    <!-- *********fin del ocultar mensaje ******-->