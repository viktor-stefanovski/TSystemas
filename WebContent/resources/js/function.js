//Funciones

//function getdocumenttipusvalue(){
//	var valor1 = document.getElementById('DocumentTipusDocument').options[document.getElementById('DocumentTipusDocument').selectedIndex].text;
//	var valor2 = valor1;
//		document.getElementById('DocumentTipusDocumentValue') = valor2;
//
//}

//Variables por defecto

//La página actual al cargar será la primera
var currentpage = 1;

var dateRegEx = new RegExp(/^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[1,3-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$/);

var showLegalRepresent = $('#showLegalRepresent');
// Todas las variables de validación son falsas por defecto porque es necesario
// validar
var validate = false;
var validatemodi = false;
var validatecanc = false;

$( document ).ready(function() {

  // Variable que identifica cual de los 3 formularios es
  var forinscriure = document.getElementById('inscriure');
  var formodificar = document.getElementById('modificar');
  var forcancelar = document.getElementById('cancelar');

  if ($("#cancelar").length != 1) {
    //Datepicker
    //Aqui se define el calendario en catalan
    $.datepicker.regional['ca'] = {
        closeText: 'Tancar',
        prevText: '< Ant',
        nextText: 'Seg >',
        currentText: 'Avui',
        monthNames: ['Gener ', 'Febrer', 'Mar&ccedil;', 'Abril', 'Maig', 'Juny', 'Juliol', 'Agost', 'Setembre', 'Octubre', 'Novembre', 'Desembre'],
        monthNamesShort: ['Gen','Febr','Març','Abr', 'Maig','Juny','Jul','Ag','Set', 'Oct','Nov','Des'],
        dayNames: ['Diumenge', 'Dilluns', 'Dimarts', 'Dimecres', 'Dijous', 'Divendres', 'Dissabte'],
        dayNamesShort: ['Dg','Dl','Dt','Dc','Dj','Dv','Ds'],
        dayNamesMin: ['Dg','Dl','Dt','Dc','Dj','Dv','Ds'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
        };

  }
});


// funcion para retroceder página
function prev() {

	currentpage = currentpage - 1;

	if (currentpage == 1) {
		$('#pag2errores div').addClass("novisible");
		$("#pag2").addClass("novisible");
		$("#pag1").removeClass("novisible");
		window.parent.scrollTo(0, 0);
		window.scrollTo(0, 0);
	}
	if (currentpage == 2) {
		$('#pag3errores div').addClass("novisible");
		$("#pag3").addClass("novisible");
		$("#pag2").removeClass("novisible");
		window.parent.scrollTo(0, 0);
		window.scrollTo(0, 0);
	}
	if (currentpage == 3) {
		$('#pag4errores div').addClass("novisible");
		$("#pag4").addClass("novisible");
		$("#pag3").removeClass("novisible");
		window.parent.scrollTo(0, 0);
		window.scrollTo(0, 0);
	}
	if (currentpage == 4) {
		$('#pag5errores div').addClass("novisible");
		$("#pag5").addClass("novisible");
		$("#pag4").removeClass("novisible");
		window.parent.scrollTo(0, 0);
		window.scrollTo(0, 0);
	}
	if (currentpage == 5) {
		$('#pag6errores div').addClass("novisible");
		$("#pag6").addClass("novisible");
		$("#pag5").removeClass("novisible");
		window.parent.scrollTo(0, 0);
		window.scrollTo(0, 0);
	}
}

// funcion para avanzar página que también valida
function next() {

  // Primero detecta que formulario es y ajusta la variable a true y lanza la
  // función de validación que corresponda

  if (document.getElementById("inscriure") != undefined) {

    validate = true
    validation();

  }

  else if (document.getElementById("modificar") != undefined) {

    validatemodi = true
    validationmodi();
  }

  else if (document.getElementById("cancelar") != undefined) {

    validatecanc = true
    validationcanc();
  }

  	// Si la validación se ha realizado correctamente avanza de página
  	if (validate == true || validatemodi == true || validatecanc == true)
  	{
		currentpage = currentpage + 1;

		if (currentpage == 2) {
			$('#pag1errores div').addClass("novisible");
			$("#pag1").addClass("novisible");
			$("#pag2").removeClass("novisible");
			window.parent.scrollTo(0, 0);
			window.scrollTo(0, 0);
		}

		else if (currentpage == 3) {
			$('#pag2errores div').addClass("novisible");
			$("#pag2").addClass("novisible");
			$("#pag3").removeClass("novisible");
			window.parent.scrollTo(0, 0);
			window.scrollTo(0, 0);
		}

		else if (currentpage == 4) {
			$('#pag3errores div').addClass("novisible");
			$("#pag3").addClass("novisible");
			$("#pag4").removeClass("novisible");
			window.parent.scrollTo(0, 0);
			window.scrollTo(0, 0);

		} else if (currentpage == 5) {
			$('#pag4errores div').addClass("novisible");
			$("#pag4").addClass("novisible");
			$("#pag5").removeClass("novisible");
			window.parent.scrollTo(0, 0);
			window.scrollTo(0, 0);
		}

		else if (currentpage == 6) {
			$('#pag5errores div').addClass("novisible");
			$("#pag5").addClass("novisible");
			$("#pag6").removeClass("novisible");
			window.parent.scrollTo(0, 0);
			window.scrollTo(0, 0);
		}
	}
}

function onload() {

  if (document.getElementById("modificar") != undefined
      || document.getElementById("inscriure") != undefined) {

    document.getElementById("DadesParticularsTsi1Menor").disabled = true;
    document.getElementById("DadesParticularsTsi2Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu1Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu2Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu3Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu4Menor").disabled = true;

  }
}

function legalrepresent() {

  if ($('#rYoungYes').prop('checked')){
    if ($("#showLegalRepresent").length > 0) $("#showLegalRepresent").removeClass('novisible');
    if ($("#menorDocs").length > 0) $("#menorDocs").removeClass('novisible');
    if ($("#dniReprecheckbox").length > 0) $("#dniReprecheckbox").removeClass('novisible');
    if ($("#passReprecheckbox").length > 0) $("#passReprecheckbox").removeClass('novisible');
    if ($("#docReprecheckbox").length > 0) $("#docReprecheckbox").removeClass('novisible');
  } else {
    if ($("#showLegalRepresent").length > 0) $("#showLegalRepresent").addClass('novisible');
    if ($("#menorDocs").length > 0) $("#menorDocs").addClass('novisible');
    if ($("#dniReprecheckbox").length > 0) $("#dniReprecheckbox").addClass('novisible');
    if ($("#passReprecheckbox").length > 0) $("#passReprecheckbox").addClass('novisible');
    if ($("#docReprecheckbox").length > 0) $("#docReprecheckbox").addClass('novisible');
  }
}

// función para saber si el solicitante ha fallecido y mostrar los fields
// correspondientes
function isdeath() {

  if($('#DadesParticularsRetornCatalunya1').prop('checked')){
    $("#dadespersonasolicitant").removeClass('novisible');
    $("#menorSelector").addClass('novisible');
    $("#showLegalRepresent").addClass('novisible');
    $("#rYoungNo").prop('checked', true);
    $("#dniInscheckbox").addClass('novisible');
    $("#passInscheckbox").addClass('novisible');
    $("#dniReprecheckbox").addClass('novisible');
    $("#passReprecheckbox").addClass('novisible');
    $("#docReprecheckbox").addClass('novisible');
    $("#certDefuncheckbox").removeClass('novisible');
  } else{
    $("#dadespersonasolicitant").addClass('novisible');
    $("#menorSelector").removeClass('novisible');
    $("#dniInscheckbox").removeClass('novisible');
    $("#passInscheckbox").removeClass('novisible');
    $("#certDefuncheckbox").addClass('novisible');
  }
}

//funcion para saber si el check de autorizacion esta marcado y mostrar o no el check correspondiente
function autorizacion() {
  if($('#DadesParticularsAltresDadesAutoritzacio').prop('checked')){
    $("#dnicopy").addClass('novisible');
  } else{
    $("#dnicopy").removeClass('novisible');
  }

}

//Funciones para anidar los checkbox

function enabletsi() {
  if (document.getElementById('DadesParticularsTsiMenor').checked) {
    document.getElementById("DadesParticularsTsi1Menor").disabled = false;
    document.getElementById("DadesParticularsTsi2Menor").disabled = false;
  } else {
    document.getElementById("DadesParticularsTsi1Menor").disabled = true;
    document.getElementById("DadesParticularsTsi2Menor").disabled = true;
    document.getElementById("DadesParticularsTsi1Menor").checked = false;
    document.getElementById("DadesParticularsTsi2Menor").checked = false;
  }
}

function enablelestiu() {
  if (document.getElementById('DadesParticularsEstiuMenor').checked) {
    document.getElementById("DadesParticularsEstiu1Menor").disabled = false;
    document.getElementById("DadesParticularsEstiu4Menor").disabled = false;

  } else {
    document.getElementById("DadesParticularsEstiu1Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu4Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu2Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu3Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu1Menor").checked = false;
    document.getElementById("DadesParticularsEstiu4Menor").checked = false;
    document.getElementById("DadesParticularsEstiu2Menor").checked = false;
    document.getElementById("DadesParticularsEstiu3Menor").checked = false;
  }
}

function enabletorn() {
  if (document.getElementById('DadesParticularsEstiu1Menor').checked) {
    document.getElementById("DadesParticularsEstiu2Menor").disabled = false;
    document.getElementById("DadesParticularsEstiu3Menor").disabled = false;

  } else {
    document.getElementById("DadesParticularsEstiu2Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu3Menor").disabled = true;
    document.getElementById("DadesParticularsEstiu2Menor").checked = false;
    document.getElementById("DadesParticularsEstiu3Menor").checked = false;

  }
}

// Validaciones

// Validacion inscribir
function validation() {

  // ---Variables-----------------

  validate = true;

  // ---Variables campos de texto-----------------

  var Nom = document.getElementById("Nom").value;
  var Cognom1 = document.getElementById("Cognom1").value;
  var DocumentIdentificador = document.getElementById("DocumentIdentificador").value;
  var DadesNaixementDataNaixement = document.getElementById("DadesNaixementDataNaixement").value;
  var NomVia = document.getElementById("NomVia").value;
  var CodiPostal = document.getElementById("CodiPostal").value;
  var EsMenorOincapacitatNom = document.getElementById("EsMenorOincapacitatNom").value;
  var EsMenorOincapacitatCognom1 = document.getElementById("EsMenorOincapacitatCognom1").value;
  var EsMenorOincapacitatDocumentIdentificador = document.getElementById("EsMenorOincapacitatDocumentIdentificador").value;
  var NotificacioNomVia = document.getElementById("NotificacioNomVia").value;
  var NotificacioCodiPostal = document.getElementById("NotificacioCodiPostal").value;
  var DadesParticularsRepresentantEmail = document.getElementById("DadesParticularsRepresentantEmail").value;
  var lopdread = document.getElementById("lopdread");
  var MunicipiNom = document.getElementById("MunicipiNom").value;
  var DadesNaixementMunicipiNom = document.getElementById("DadesNaixementMunicipiNom").value;
  var DadesParticularsAltresDadesMunicipiNom = document.getElementById("DadesParticularsAltresDadesMunicipiNom").value;

  // ---Variables selectores-----------------
  var DocumentTipusDocument = document
      .getElementById("DocumentTipusDocument").selectedIndex;
  var DNI = document.getElementById('DocumentTipusDocument').options[document
      .getElementById('DocumentTipusDocument').selectedIndex]
  var PaisCodiINE = document.getElementById("PaisCodiINE").selectedIndex;
  var DadesNaixementPaisCodiINE = document
      .getElementById("DadesNaixementPaisCodiINE").selectedIndex;
  var Genere = document.getElementById("Genere").selectedIndex;
  var ProvinciaCodiINE = document.getElementById("ProvinciaCodiINE").selectedIndex;
  var MunicipiCodiINE = document.getElementById("MunicipiCodiINE").selectedIndex;
  var DadesParticularsAltresDadesPaisCodiINE = document
      .getElementById("DadesParticularsAltresDadesPaisCodiINE").selectedIndex;
  var EsMenorOincapacitatDocumentTipusDocument = document
      .getElementById("EsMenorOincapacitatDocumentTipusDocument").selectedIndex;
  var Nacionalitat1CodiINE = document.getElementById("Nacionalitat1CodiINE").value;
  var Nacionalitat2CodiINE = document.getElementById("Nacionalitat2CodiINE").value;
  var Nacionalitat3CodiINE = document.getElementById("Nacionalitat3CodiINE").value;
  if (currentpage == "1") {

    if (Nom == null || Nom.length == 0 || /^\s+$/.test(Nom)) {
      document.getElementById("Nom").className += " form-requiredfields";
      document.getElementById("NomMessage").classList.remove("novisible");
      validate = false;
    } else {
      document.getElementById("Nom").classList
          .remove('form-requiredfields');
      document.getElementById("NomMessage").className += " novisible";
    }

    if (Cognom1 == null || Cognom1.length == 0 || /^\s+$/.test(Cognom1)) {
      document.getElementById("Cognom1").className += " form-requiredfields";
      document.getElementById("Cognom1Message").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("Cognom1").classList
          .remove('form-requiredfields');
      document.getElementById("Cognom1Message").className += " novisible";
    }

    if (DocumentTipusDocument == null || DocumentTipusDocument == 0) {
      document.getElementById("DocumentTipusDocument").className += " form-requiredfields";
      document.getElementById("DocumentTipusDocumentMessage").classList
          .remove("novisible");
      validate = false;

    } else {
      document.getElementById("DocumentTipusDocument").classList
          .remove('form-requiredfields');
      document.getElementById("DocumentTipusDocumentMessage").className += " novisible";
    }

    if (DocumentIdentificador == null || DocumentIdentificador.length == 0
        || /^\s+$/.test(DocumentIdentificador)) {
      document.getElementById("DocumentIdentificador").className += " form-requiredfields";
      document.getElementById("DocumentIdentificadorMessage2").className += " novisible";
      document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
      document.getElementById("DocumentIdentificadorMessage").classList
          .remove("novisible");
      validate = false;
    } else if (document.getElementById("DocumentTipusDocument").value == "nif") {

      var numero;
      var letra;
      var letras;
      var expresion = /^[XYZ]?\d{5,8}[A-Z]$/;
      var dni = document.getElementById("DocumentIdentificador").value;

      dni = dni.toUpperCase();

      if (expresion.test(dni) === true) {
        numero = dni.substr(0, dni.length - 1);
        numero = numero.replace('X', 0);
        numero = numero.replace('Y', 1);
        numero = numero.replace('Z', 2);
        letra = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letras = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letras = letras.substring(numero, numero + 1);
        if (letras != letra) {
          validate = false;
          document.getElementById("DocumentIdentificador").className += " form-requiredfields";
          document.getElementById("DocumentIdentificadorMessage").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage2").classList
              .remove("novisible");

        } else {
          validate = true;
          document.getElementById("DocumentIdentificador").classList
              .remove('form-requiredfields');
          document.getElementById("DocumentIdentificadorMessage").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage2").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
        }
      } else {
        validate = false;
        document.getElementById("DocumentIdentificador").className += " form-requiredfields";
        document.getElementById("DocumentIdentificadorMessage").className += " novisible";
        document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
        document.getElementById("DocumentIdentificadorMessage2").classList.remove("novisible");
      }

	  } else if (document.getElementById("DocumentTipusDocument").value == "passaport") {
			//var expresionp = /^[A-Z]{3}[0-9]{6}[A-Z]?$/;
		  	var expressionp = /^\s+$/;
			if (!expressionp.test($("#DocumentIdentificador").val())) {
				if (validate)
					validate = true;
				$("#DocumentIdentificador").removeClass("form-requiredfields");
				$("#DocumentIdentificadorMessage").addClass("novisible");
				$("#DocumentIdentificadorMessage2").addClass("novisible");
//				$("#DocumentIdentificadorMessage3").addClass("novisible");
			} else {
				validate = false;
				$("#DocumentIdentificador").addClass("form-requiredfields");
//				$("#DocumentIdentificadorMessage").addClass("novisible");
				$("#DocumentIdentificadorMessage").removeClass("novisible");
				$("#DocumentIdentificadorMessage2").addClass("novisible");
//				$("#DocumentIdentificadorMessage3").removeClass("novisible");
      }
    }

    if (Genere == null || Genere == 0) {
      document.getElementById("Genere").className += " form-requiredfields";
      document.getElementById("GenereMessage").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("Genere").classList
          .remove('form-requiredfields');
      document.getElementById("GenereMessage").className += " novisible";
    }

    if (DadesNaixementDataNaixement == null
            || DadesNaixementDataNaixement.length == 0
            || /^\s+$/.test(DadesNaixementDataNaixement)) {
          document.getElementById("DadesNaixementDataNaixement").className += " form-requiredfields";
          document.getElementById("DadesNaixementDataNaixementMessage").classList
              .remove("novisible");
          validate = false;
        }
    else {
     var today = new Date();
     if ($("#DadesNaixementDataNaixement").val().match(dateRegEx)) {
         if ($.datepicker.parseDate("dd/mm/yy", DadesNaixementDataNaixement).getTime() > today.getTime()) {
             $("#DadesNaixementDataNaixement").addClass("form-requiredfields");
        	 $("#DadesNaixementDataNaixementMessage").addClass("novisible");
        	 $("#DadesNaixementDataNaixementMessage2").removeClass("novisible");
        	 $("#DadesNaixementDataNaixementMessage3").addClass("novisible");
           validate = false;
         }
         else {
        	 $("#DadesNaixementDataNaixement").removeClass('form-requiredfields');
        	 $("#DadesNaixementDataNaixementMessage").addClass("novisible");
        	 $("#DadesNaixementDataNaixementMessage2").addClass("novisible");
        	 $("#DadesNaixementDataNaixementMessage3").addClass("novisible");
         }
     } else {
    	 $("#DadesNaixementDataNaixement").addClass("form-requiredfields");
    	 $("#DadesNaixementDataNaixementMessage").addClass("novisible");
    	 $("#DadesNaixementDataNaixementMessage2").addClass("novisible");
    	 $("#DadesNaixementDataNaixementMessage3").removeClass("novisible");
         validate = false;
     }
    }

    if (NomVia == null || NomVia.length == 0 || /^\s+$/.test(NomVia)) {
      document.getElementById("NomVia").className += " form-requiredfields";
      document.getElementById("NomViaMessage").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("NomVia").classList
          .remove('form-requiredfields');
      document.getElementById("NomViaMessage").className += " novisible";
    }

    if (CodiPostal == null || CodiPostal.length == 0
        || /^\s+$/.test(CodiPostal)) {
      document.getElementById("CodiPostal").className += " form-requiredfields";
      document.getElementById("CodiPostalMessage").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("CodiPostal").classList
          .remove('form-requiredfields');
      document.getElementById("CodiPostalMessage").className += " novisible";
    }

    if (PaisCodiINE == null || PaisCodiINE == 0) {
      document.getElementById("PaisCodiINE").className += " form-requiredfields";
      document.getElementById("PaisCodiINEMessage").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("PaisCodiINE").classList.remove('form-requiredfields');
      document.getElementById("PaisCodiINEMessage").className += " novisible";

      // validació si país USA (302) o ESP (108)
      if ($("#PaisCodiINE" ).val() == 108) {
        if ($.trim($("#ProvinciaNom").val()) == "") {
          $("#ProvinciaNomESPMessage").removeClass("novisible");
            $("#ProvinciaNomUSAMessage").addClass("novisible");
          $("#ProvinciaComboESP").addClass('form-requiredfields');
          validate = false;
        } else {
          $("#ProvinciaNomESPMessage").addClass("novisible");
          $("#ProvinciaComboESP").removeClass('form-requiredfields');
        }
      } else if ($("#PaisCodiINE" ).val() == 302) {
        if ($.trim($("#ProvinciaNom").val()) == "") {
          $("#ProvinciaNomUSAMessage").removeClass("novisible");
          $("#ProvinciaNomESPMessage").addClass("novisible");
          $("#ProvinciaComboUSA").addClass('form-requiredfields');
          validate = false;
        } else {
          $("#ProvinciaNomUSAMessage").addClass("novisible");
          $("#ProvinciaComboUSA").removeClass('form-requiredfields');
        }
      } else {
         $("#ProvinciaNomUSAMessage").addClass("novisible");
      $("#ProvinciaComboESP").removeClass('form-requiredfields');
      $("#ProvinciaNomESPMessage").addClass("novisible");
      $("#ProvinciaComboUSA").removeClass('form-requiredfields');
     }



    }

    if (MunicipiNom == null || MunicipiNom.length == 0
        || /^\s+$/.test(MunicipiNom)) {
      document.getElementById("MunicipiNom").className += " form-requiredfields";
      document.getElementById("MunicipiNomMessage").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("MunicipiNom").classList
          .remove('form-requiredfields');
      document.getElementById("MunicipiNomMessage").className += " novisible";
    }

    if (DadesNaixementPaisCodiINE == null || DadesNaixementPaisCodiINE == 0) {
      document.getElementById("DadesNaixementPaisCodiINE").className += " form-requiredfields";
      document.getElementById("DadesNaixementPaisCodiINEMessage").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("DadesNaixementPaisCodiINE").classList
          .remove('form-requiredfields');
      document.getElementById("DadesNaixementPaisCodiINEMessage").className += " novisible";

      // validació si país USA (302) o ESP (108)
      if ($("#DadesNaixementPaisCodiINE").val() == 108) {
        if ($.trim($("#DadesNaixementProvinciaNom").val()) == "") {
          $("#DadesNaixementProvinciaNomESPMessage").removeClass("novisible");
             $("#DadesNaixementProvinciaNomUSAMessage").addClass("novisible");
             $("#DadesNaixementProvinciaComboESP").addClass('form-requiredfields');
          validate = false;
        } else {
          $("#DadesNaixementProvinciaNomESPMessage").addClass("novisible");
          $("#DadesNaixementProvinciaComboESP").removeClass('form-requiredfields');
        }
      } else if ($("#DadesNaixementPaisCodiINE").val() == 302) {
        if ($.trim($("#DadesNaixementProvinciaNom").val()) == "") {
          $("#DadesNaixementProvinciaNomUSAMessage").removeClass("novisible");
          $("#DadesNaixementProvinciaNomESPMessage").addClass("novisible");
          $("#DadesNaixementProvinciaComboUSA").addClass('form-requiredfields');
          validate = false;
        } else {
          $("#DadesNaixementProvinciaNomUSAMessage").addClass("novisible");
          $("#DadesNaixementProvinciaComboUSA").removeClass('form-requiredfields');
        }
      } else {
         $("#DadesNaixementProvinciaNomUSAMessage").addClass("novisible");
      $("#DadesNaixementProvinciaComboESP").removeClass('form-requiredfields');
      $("#DadesNaixementProvinciaNomESPMessage").addClass("novisible");
      $("#DadesNaixementProvinciaComboUSA").removeClass('form-requiredfields');
     }


    }

    if (DadesNaixementMunicipiNom == null
        || DadesNaixementMunicipiNom.length == 0
        || /^\s+$/.test(DadesNaixementMunicipiNom)) {
      document.getElementById("DadesNaixementMunicipiNom").className += " form-requiredfields";
      document.getElementById("DadesNaixementMunicipiNomMessage").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("DadesNaixementMunicipiNom").classList
          .remove('form-requiredfields');
      document.getElementById("DadesNaixementMunicipiNomMessage").className += " novisible";
    }

    if (Nacionalitat1CodiINE == Nacionalitat2CodiINE
        && Nacionalitat1CodiINE != "") {
      if (Nacionalitat1CodiINE != Nacionalitat3CodiINE) {
        document.getElementById("Nacionalitat1CodiINE").classList
            .remove("form-requiredfields");
        document.getElementById("Nacionalitat2CodiINE").className += " form-requiredfields";
        document.getElementById("Nacionalitat3CodiINE").classList
            .remove("form-requiredfields");
        document.getElementById("NacionalitatCodiINE").classList
            .remove("novisible");
        validate = false;
      } else {
        document.getElementById("Nacionalitat1CodiINE").classList
            .remove("form-requiredfields");
        document.getElementById("Nacionalitat2CodiINE").className += " form-requiredfields";
        document.getElementById("Nacionalitat3CodiINE").className += " form-requiredfields";
        document.getElementById("NacionalitatCodiINE").classList
            .remove("novisible");
        validate = false;
      }

    } else if (Nacionalitat1CodiINE == Nacionalitat3CodiINE	&& Nacionalitat1CodiINE != "") {
      document.getElementById("Nacionalitat1CodiINE").classList.remove("form-requiredfields");
      document.getElementById("Nacionalitat3CodiINE").className += " form-requiredfields";
      document.getElementById("Nacionalitat2CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("NacionalitatCodiINE").classList
          .remove("novisible");
      validate = false;

    } else if (Nacionalitat2CodiINE == Nacionalitat3CodiINE	&& Nacionalitat2CodiINE != "") {
      document.getElementById("Nacionalitat3CodiINE").className += " form-requiredfields";
      document.getElementById("Nacionalitat1CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("Nacionalitat2CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("NacionalitatCodiINE").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("Nacionalitat1CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("Nacionalitat2CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("Nacionalitat3CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("NacionalitatCodiINE").className += " novisible";
    }


    if (ProvinciaCodiINE == null || ProvinciaCodiINE == 0) {
      document.getElementById("ProvinciaCodiINE").className += " form-requiredfields";
      document.getElementById("ProvinciaCodiINEMessage").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("ProvinciaCodiINE").classList
          .remove('form-requiredfields');
      document.getElementById("ProvinciaCodiINEMessage").className += " novisible";
    }

    if (MunicipiCodiINE == null || MunicipiCodiINE == 0) {
      document.getElementById("MunicipiCodiINE").className += " form-requiredfields";
      document.getElementById("MunicipiCodiINEMessage").classList
          .remove("novisible");
      validate = false;
    } else {
      document.getElementById("MunicipiCodiINE").classList
          .remove('form-requiredfields');
      document.getElementById("MunicipiCodiINEMessage").className += " novisible";
    }
  }

  if (currentpage == "2") {

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatNom == null
            || EsMenorOincapacitatNom.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatNom))) {
      document.getElementById("EsMenorOincapacitatNom").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatNomMessage").classList
          .remove("novisible");
      validate = false
    } else {
      document.getElementById("EsMenorOincapacitatNom").classList
          .remove('form-requiredfields');
      document.getElementById("EsMenorOincapacitatNomMessage").className += " novisible";
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatCognom1 == null
            || EsMenorOincapacitatCognom1.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatCognom1))) {
      document.getElementById("EsMenorOincapacitatCognom1").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatCognom1Message").classList
          .remove("novisible");
      validate = false
    } else {
      document.getElementById("EsMenorOincapacitatCognom1").classList
          .remove('form-requiredfields');
      document.getElementById("EsMenorOincapacitatCognom1Message").className += " novisible";
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatDocumentTipusDocument == null || EsMenorOincapacitatDocumentTipusDocument == 0)) {
      document.getElementById("EsMenorOincapacitatDocumentTipusDocument").className += " form-requiredfields";
      document
          .getElementById("EsMenorOincapacitatDocumentTipusDocumentMessage").classList
          .remove("novisible");
      validate = false
    } else {
      document.getElementById("EsMenorOincapacitatDocumentTipusDocument").classList
          .remove('form-requiredfields');
      document
          .getElementById("EsMenorOincapacitatDocumentTipusDocumentMessage").className += " novisible";
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatDocumentIdentificador == null
            || EsMenorOincapacitatDocumentIdentificador.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatDocumentIdentificador))) {

      document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
      document
          .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").className += " novisible";
      document
          .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").classList
          .remove("novisible");
      validate = false;
    }

    else if (document.getElementById('rYoungYes').checked
        && (document.getElementById("EsMenorOincapacitatDocumentTipusDocument").value == "nif")) {

      var numero;
      var letra;
      var letras;
      var expresion = /^[XYZ]?\d{5,8}[A-Z]$/;
      var dni = document.getElementById("EsMenorOincapacitatDocumentIdentificador").value;

      dni = dni.toUpperCase();

      if (expresion.test(dni) === true) {
        numero = dni.substr(0, dni.length - 1);
        numero = numero.replace('X', 0);
        numero = numero.replace('Y', 1);
        numero = numero.replace('Z', 2);
        letra = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letras = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letras = letras.substring(numero, numero + 1);
        if (letras != letra) {
          validate = false;
          document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").classList.remove("novisible");

        } else {
          validate = true;
          document.getElementById("EsMenorOincapacitatDocumentIdentificador").classList.remove('form-requiredfields');
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
        }
      } else {
        validate = false;
        document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
        document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
        document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
        document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").classList.remove("novisible");
      }

    }else if (document.getElementById('rYoungYes').checked && (document.getElementById("EsMenorOincapacitatDocumentTipusDocument").value == "passaport")){

//      var expresionp = /^[A-Z]{3}[0-9]{6}[A-Z]?$/;
    	var expressionp = /^\s+$/;
      if (!expressionp.test($("#EsMenorOincapacitatDocumentIdentificador").val())){
    	 if (validate) validate = true;
			$("#EsMenorOincapacitatDocumentIdentificador").removeClass("form-requiredfields");
			$("#EsMenorOincapacitatDocumentIdentificadorMessage").addClass("novisible");
			$("#EsMenorOincapacitatDocumentIdentificadorMessage2").addClass("novisible");
//			$("#EsMenorOincapacitatDocumentIdentificadorMessage3").addClass("novisible");
      }
      else{
        validate = false;
		$("#EsMenorOincapacitatDocumentIdentificador").addClass("form-requiredfields");
//		$("#EsMenorOincapacitatDocumentIdentificadorMessage").addClass("novisible");
		$("#EsMenorOincapacitatDocumentIdentificadorMessage").removeClass("novisible");
		$("#EsMenorOincapacitatDocumentIdentificadorMessage2").addClass("novisible");
//		$("#EsMenorOincapacitatDocumentIdentificadorMessage3").removeClass("novisible");
      }
    }else{

      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificador").classList.remove('form-requiredfields');
    }

    if(document.getElementById('rYoungYes').checked && EsMenorOincapacitatDocumentIdentificador != "" && DocumentIdentificador!= "" && EsMenorOincapacitatDocumentIdentificador == DocumentIdentificador){
      validate = false;
      document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage4").classList.remove('novisible');
    }else{
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage4").className += " novisible";
    }

    if (NotificacioNomVia == null || NotificacioNomVia.length == 0
        || /^\s+$/.test(NotificacioNomVia)) {
      document.getElementById("NotificacioNomVia").className += " form-requiredfields";
      document.getElementById("NotificacioNomViaMessage").classList
          .remove("novisible");
      validate = false
    } else {
      document.getElementById("NotificacioNomVia").classList
          .remove('form-requiredfields');
      document.getElementById("NotificacioNomViaMessage").className += " novisible";
    }

    if (NotificacioCodiPostal == null || NotificacioCodiPostal.length == 0
        || /^\s+$/.test(NotificacioCodiPostal)) {
      document.getElementById("NotificacioCodiPostal").className += " form-requiredfields";
      document.getElementById("NotificacioCodiPostalMessage").classList
          .remove("novisible");
      validate = false
    } else {
      document.getElementById("NotificacioCodiPostal").classList
          .remove('form-requiredfields');
      document.getElementById("NotificacioCodiPostalMessage").className += " novisible";
    }

    if (DadesParticularsAltresDadesPaisCodiINE == null
        || DadesParticularsAltresDadesPaisCodiINE == 0) {
      document.getElementById("DadesParticularsAltresDadesPaisCodiINE").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsAltresDadesPaisCodiINEMessage").classList
          .remove("novisible");
      validate = false
    } else {
      document.getElementById("DadesParticularsAltresDadesPaisCodiINE").classList.remove('form-requiredfields');
      document.getElementById("DadesParticularsAltresDadesPaisCodiINEMessage").className += " novisible";

      // validació si país USA (302) o ESP (108)
      if ($("#DadesParticularsAltresDadesPaisCodiINE").val() == 108) {
        if ($.trim($("#DadesParticularsAltresDadesProvinciaNom").val()) == "") {
          $("#DadesParticularsAltresDadesProvinciaNomESPMessage").removeClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").addClass("novisible");
         $("#DadesParticularsAltresDadesProvinciaComboESP").addClass('form-requiredfields');
          validate = false;
        } else {
          $("#DadesParticularsAltresDadesProvinciaNomESPMessage").addClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaComboESP").removeClass('form-requiredfields');
        }
      } else if ($("#DadesParticularsAltresDadesPaisCodiINE").val() == 302) {
        if ($.trim($("#DadesParticularsAltresDadesProvinciaNom").val()) == "") {
          $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").removeClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaNomESPMessage").addClass("novisible");
         $("#DadesParticularsAltresDadesProvinciaComboUSA").addClass('form-requiredfields');
          validate = false;
        } else {
          $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").addClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaComboUSA").removeClass('form-requiredfields');
        }
      } else {
         $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").addClass("novisible");
      $("#DadesParticularsAltresDadesProvinciaComboESP").removeClass('form-requiredfields');
      $("#DadesParticularsAltresDadesProvinciaNomESPMessage").addClass("novisible");
      $("#DadesParticularsAltresDadesProvinciaComboUSA").removeClass('form-requiredfields');
     }

    }

    if (DadesParticularsAltresDadesMunicipiNom == null
        || DadesParticularsAltresDadesMunicipiNom.length == 0
        || /^\s+$/.test(DadesParticularsAltresDadesMunicipiNom)) {
      document.getElementById("DadesParticularsAltresDadesMunicipiNom").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsAltresDadesMunicipiNomMessage").classList
          .remove("novisible");
      validate = false
    } else {
      document.getElementById("DadesParticularsAltresDadesMunicipiNom").classList
          .remove('form-requiredfields');
      document
          .getElementById("DadesParticularsAltresDadesMunicipiNomMessage").className += " novisible";
    }

    if (DadesParticularsRepresentantEmail == null
        || DadesParticularsRepresentantEmail.length == 0
        || /^\s+$/.test(DadesParticularsRepresentantEmail)) {
      document.getElementById("DadesParticularsRepresentantEmail").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsRepresentantEmailMessage2").className += " novisible";
      document.getElementById("DadesParticularsRepresentantEmailMessage").classList
          .remove("novisible");
      validate = false;
    } else if (!(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        .test(DadesParticularsRepresentantEmail))) {
      document.getElementById("DadesParticularsRepresentantEmail").className += " form-requiredfields";
      document.getElementById("DadesParticularsRepresentantEmailMessage").className += " novisible";
      document
          .getElementById("DadesParticularsRepresentantEmailMessage2").classList
          .remove("novisible");

      validate = false;
    } else {

      document.getElementById("DadesParticularsRepresentantEmail").classList
          .remove('form-requiredfields');
      document.getElementById("DadesParticularsRepresentantEmailMessage").className += " novisible";
      document
          .getElementById("DadesParticularsRepresentantEmailMessage2").className += " novisible";
    }
  }
  if (currentpage == "3") {

   if(!document.getElementById('DadesParticularsAltresDadesAutoritzacio').checked){

     if(!document.getElementById('dniIns').checked && !document.getElementById('passIns').checked){
       validate = false;
       document.getElementById('Docsgroup1').className += " form-requiredfields";
       document.getElementById("DocsgroupMessage").classList.remove("novisible");
     }
     else{
       document.getElementById('Docsgroup1').classList.remove("form-requiredfields");
       document.getElementById("DocsgroupMessage").className += " novisible";
     }
   }else{
     document.getElementById('Docsgroup1').classList.remove("form-requiredfields");
     document.getElementById("DocsgroupMessage").className += " novisible";
   }
  if(!document.getElementById('pere').checked && !document.getElementById('solcPere').checked && !document.getElementById('resiExt').checked){
     validate = false;
     document.getElementById('Docsgroup2').className += " form-requiredfields";
     document.getElementById("DocsgroupMessage2").classList.remove("novisible");
  }else{
     document.getElementById('Docsgroup2').classList.remove("form-requiredfields");
     document.getElementById("DocsgroupMessage2").className += " novisible";
   }

   if(document.getElementById('rYoungYes').checked){

     if(!document.getElementById('dniRepre').checked && !document.getElementById('passRepre').checked && !document.getElementById('menorLLf').checked && !document.getElementById('incapacitat').checked){

       document.getElementById('menorDocsgroup').className += " form-requiredfields";
       document.getElementById("menorDocsgroupMessage").classList.remove("novisible");
       validate = false;
     }else{

       document.getElementById('menorDocsgroup').classList.remove("form-requiredfields");
       document.getElementById("menorDocsgroupMessage").className += " novisible";
     }
  }else{
    document.getElementById('menorDocsgroup').classList.remove("form-requiredfields");
    document.getElementById("menorDocsgroupMessage").className += " novisible";
   }

  }

  // VALIDACIONS PAGINA 4
  if (currentpage == "4") {
	  if ($("#DadesParticularsTsiMenor").is(':checked')) {
		  if ($("#DadesParticularsTsi1Menor").is(':checked') || $("#DadesParticularsTsi2Menor").is(':checked')) {
			  $("#DadesParticularsTsiMenorMessage").addClass("novisible");
			  $( "#TSIDeclaracio").removeClass("form-requiredfields");
		  }
		  else {
			  $("#DadesParticularsTsiMenorMessage").removeClass("novisible");
			  $( "#TSIDeclaracio").addClass("form-requiredfields");
			  validate = false;
		  }
	  }

	  if ($("#DadesParticularsEstiuMenor").is(':checked')) {
		  if (!$("#DadesParticularsEstiu1Menor").is(':checked') && !$("#DadesParticularsEstiu4Menor").is(':checked')) {
			  $("#DadesParticularsEstiuMenorMessage").removeClass("novisible");
			  $( "#DadesParticularsEstiuMenorDiv").addClass("form-requiredfields");
			  validate = false;
		  }
		  else if ($("#DadesParticularsEstiu1Menor").is(':checked') && !$("#DadesParticularsEstiu2Menor").is(':checked') && !$("#DadesParticularsEstiu3Menor").is(':checked')) {
				$("#DadesParticularsEstiuMenorMessage").addClass("novisible");
			  $("#DadesParticularsEstiuMenorAlbergMessage").removeClass("novisible");
			  $( "#DadesParticularsEstiuMenorAlbergDiv").addClass("form-requiredfields");
			  validate = false;
		  } else {
			  $("#DadesParticularsEstiuMenorMessage").addClass("novisible");
			  $("#DadesParticularsEstiuMenorAlbergMessage").addClass("novisible");
			  $( "#DadesParticularsEstiuMenorDiv").removeClass("form-requiredfields");
			  $( "#DadesParticularsEstiuMenorAlbergDiv").removeClass("form-requiredfields");
		  }
	  } else {
			$("#DadesParticularsEstiuMenorMessage").addClass("novisible");
			$("#DadesParticularsEstiuMenorAlbergMessage").addClass("novisible");
			$( "#DadesParticularsEstiuMenorDiv").removeClass("form-requiredfields");
			$( "#DadesParticularsEstiuMenorAlbergDiv").removeClass("form-requiredfields");
	  }
  }

  // VALIDACIONS PAGINA 5
  if (currentpage == "5") {
    if (!lopdread.checked) {
      document.getElementById("lopdreadcheckbox").className += " form-requiredfields";
      document.getElementById("lopdreadcheckboxMessage").classList
          .remove("novisible");
      validate = false
    } else {
      document.getElementById("lopdreadcheckbox").classList
          .remove('form-requiredfields');
      document.getElementById("lopdreadcheckboxMessage").className += " novisible";
    }
    if (grecaptcha.getResponse( )=="") {
      $("#nocaptchaMessage").removeClass("novisible");
//      $("#rexCaptcha").addClass("form-requiredfields");
      validate = false;
    } else {
//      $("#rexCaptcha").removeClass("form-requiredfields");
      $("#nocaptchaMessage").addClass("novisible");
    }
  }

  if (validate == true) {
    document.getElementById("validationMessage").className += " novisible";
    return true

  } else {

    window.scrollTo(0, 0);
    document.getElementById("validationMessage").classList
        .remove('novisible');
    return false;

  }

}

// Validaciones

// Validacion modificar
function validationmodi() {

  // ---Variables-----------------

  validatemodi = true;

  // ---Variables campos de texto-----------------

  var Nom = document.getElementById("Nom").value;
  var Cognom1 = document.getElementById("Cognom1").value;
  var DocumentIdentificador = document
      .getElementById("DocumentIdentificador").value;

  var EsMenorOincapacitatNom = document
      .getElementById("EsMenorOincapacitatNom").value;
  var EsMenorOincapacitatCognom1 = document
      .getElementById("EsMenorOincapacitatCognom1").value;
  var EsMenorOincapacitatDocumentIdentificador = document
      .getElementById("EsMenorOincapacitatDocumentIdentificador").value;

  var NotificacioNomVia = document.getElementById("NotificacioNomVia").value;
  var NotificacioCodiPostal = document
      .getElementById("NotificacioCodiPostal").value;
  var DadesParticularsRepresentantEmail = document
      .getElementById("DadesParticularsRepresentantEmail").value;
  var lopdread = document.getElementById("lopdread");
  var Nacionalitat1CodiINE = document.getElementById("Nacionalitat1CodiINE").value;
  var Nacionalitat2CodiINE = document.getElementById("Nacionalitat2CodiINE").value;
  var Nacionalitat3CodiINE = document.getElementById("Nacionalitat3CodiINE").value;

  // ---Variables selectores-----------------
  var DocumentTipusDocument = document
      .getElementById("DocumentTipusDocument").selectedIndex;

  var DadesParticularsAltresDadesPaisCodiINE = document
      .getElementById("DadesParticularsAltresDadesPaisCodiINE").selectedIndex;
  var DadesParticularsAltresDadesMunicipiNom = document
      .getElementById("DadesParticularsAltresDadesMunicipiNom").value;
  var EsMenorOincapacitatDocumentTipusDocument = document
      .getElementById("EsMenorOincapacitatDocumentTipusDocument").selectedIndex;

  if (currentpage == "1") {

    if (Nom == null || Nom.length == 0 || /^\s+$/.test(Nom)) {
      document.getElementById("Nom").className += " form-requiredfields";
      document.getElementById("NomMessage").classList.remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("Nom").classList
          .remove('form-requiredfields');
      document.getElementById("NomMessage").className += " novisible";
    }

    if (Cognom1 == null || Cognom1.length == 0 || /^\s+$/.test(Cognom1)) {
      document.getElementById("Cognom1").className += " form-requiredfields";
      document.getElementById("Cognom1Message").classList
          .remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("Cognom1").classList
          .remove('form-requiredfields');
      document.getElementById("Cognom1Message").className += " novisible";
    }

    if (DocumentTipusDocument == null || DocumentTipusDocument == 0) {
      document.getElementById("DocumentTipusDocument").className += " form-requiredfields";
      document.getElementById("DocumentTipusDocumentMessage").classList
          .remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("DocumentTipusDocument").classList
          .remove('form-requiredfields');
      document.getElementById("DocumentTipusDocumentMessage").className += " novisible";
    }

    if (DocumentIdentificador == null || DocumentIdentificador.length == 0
        || /^\s+$/.test(DocumentIdentificador)) {
      document.getElementById("DocumentIdentificador").className += " form-requiredfields";
      document.getElementById("DocumentIdentificadorMessage2").className += " novisible";
      document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
      document.getElementById("DocumentIdentificadorMessage").classList
          .remove("novisible");
      validatemodi = false;
    } else if (document.getElementById("DocumentTipusDocument").value == "nif") {

      var numero;
      var letra;
      var letras;
      var expresion = /^[XYZ]?\d{5,8}[A-Z]$/;
      var dni = document.getElementById("DocumentIdentificador").value;

      dni = dni.toUpperCase();

      if (expresion.test(dni) === true) {
        numero = dni.substr(0, dni.length - 1);
        numero = numero.replace('X', 0);
        numero = numero.replace('Y', 1);
        numero = numero.replace('Z', 2);
        letra = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letras = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letras = letras.substring(numero, numero + 1);
        if (letras != letra) {
          validatemodi = false;
          document.getElementById("DocumentIdentificador").className += " form-requiredfields";
          document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage2").classList
              .remove("novisible");

        } else {
          if (validatemodi) validatemodi = true;
          document.getElementById("DocumentIdentificador").classList
              .remove('form-requiredfields');
          document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage2").className += " novisible";
        }
      } else {
    	  validatemodi = false;
        document.getElementById("DocumentIdentificador").className += " form-requiredfields";
        document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
        document.getElementById("DocumentIdentificadorMessage").className += " novisible";
        document.getElementById("DocumentIdentificadorMessage2").classList
            .remove("novisible");
      }

    } else if (document.getElementById("DocumentTipusDocument").value == "passaport"){
//      var expresionp = /^[A-Z]{3}[0-9]{6}[A-Z]?$/;
	  	var expressionp = /^\s+$/;
      if (!expressionp.test($("#DocumentIdentificador").val())){
        if (validatemodi) validatemodi = true;
		$("#DocumentIdentificador").removeClass("form-requiredfields");
		$("#DocumentIdentificadorMessage").addClass("novisible");
		$("#DocumentIdentificadorMessage2").addClass("novisible");
//		$("#DocumentIdentificadorMessage3").addClass("novisible");
      }
      else{
        validatemodi = false;
		$("#DocumentIdentificador").addClass("form-requiredfields");
//		$("#DocumentIdentificadorMessage").addClass("novisible");
		$("#DocumentIdentificadorMessage").removeClass("novisible");
		$("#DocumentIdentificadorMessage2").addClass("novisible");
//		$("#DocumentIdentificadorMessage3").removeClass("novisible");
      }
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatNom == null
            || EsMenorOincapacitatNom.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatNom))) {
      document.getElementById("EsMenorOincapacitatNom").className += " form-requiredfields";
      validatemodi = false;
    } else {
      document.getElementById("EsMenorOincapacitatNom").classList
          .remove('form-requiredfields');
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatNom == null
            || EsMenorOincapacitatNom.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatNom))) {
      document.getElementById("EsMenorOincapacitatNom").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatNomMessage").classList
          .remove("novisible");
      validatemodi = false;
    } else {
      document.getElementById("EsMenorOincapacitatNom").classList
          .remove('form-requiredfields');
      document.getElementById("EsMenorOincapacitatNomMessage").className += " novisible";
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatCognom1 == null
            || EsMenorOincapacitatCognom1.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatCognom1))) {
      document.getElementById("EsMenorOincapacitatCognom1").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatCognom1Message").classList
          .remove("novisible");
      validatemodi = false;
    } else {
      document.getElementById("EsMenorOincapacitatCognom1").classList
          .remove('form-requiredfields');
      document.getElementById("EsMenorOincapacitatCognom1Message").className += " novisible";
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatDocumentTipusDocument == null || EsMenorOincapacitatDocumentTipusDocument == 0)) {
      document.getElementById("EsMenorOincapacitatDocumentTipusDocument").className += " form-requiredfields";
      document
          .getElementById("EsMenorOincapacitatDocumentTipusDocumentMessage").classList
          .remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("EsMenorOincapacitatDocumentTipusDocument").classList
          .remove('form-requiredfields');
      document
          .getElementById("EsMenorOincapacitatDocumentTipusDocumentMessage").className += " novisible";
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatDocumentIdentificador == null
            || EsMenorOincapacitatDocumentIdentificador.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatDocumentIdentificador))) {
      document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
      document
          .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").className += " novisible";
      document
          .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").classList
          .remove("novisible");
      validatemodi = false;
    }

    else if (document.getElementById('rYoungYes').checked
        && (document
            .getElementById("EsMenorOincapacitatDocumentTipusDocument").value == "nif")) {

      var numero;
      var letra;
      var letras;
      var expresion = /^[XYZ]?\d{5,8}[A-Z]$/;
      var dni = document
          .getElementById("EsMenorOincapacitatDocumentIdentificador").value;

      dni = dni.toUpperCase();

      if (expresion.test(dni) === true) {
        numero = dni.substr(0, dni.length - 1);
        numero = numero.replace('X', 0);
        numero = numero.replace('Y', 1);
        numero = numero.replace('Z', 2);
        letra = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letras = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letras = letras.substring(numero, numero + 1);
        if (letras != letra) {
          validatemodi = false;
          document
              .getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
          document
              .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
          document
              .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").classList
              .remove("novisible");

        } else {
          validatemodi = true;
          document
              .getElementById("EsMenorOincapacitatDocumentIdentificador").classList
              .remove('form-requiredfields');
          document
              .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
          document
              .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").className += " novisible";
        }
      } else {
        validatemodi = false;
        document
            .getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
        document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
        document
            .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
        document
            .getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").classList
            .remove("novisible");
      }

    }else if (document.getElementById('rYoungYes').checked && (document.getElementById("EsMenorOincapacitatDocumentTipusDocument").value == "passaport")){

//      var expresionp = /^[A-Z]{3}[0-9]{6}[A-Z]?$/;
    	var expressionp = /^\s+$/;
    	if (!expressionp.test($("#EsMenorOincapacitatDocumentIdentificador").val())){
    	 if (validatemodi) validatemodi = true;
 		$("#EsMenorOincapacitatDocumentIdentificador").removeClass("form-requiredfields");
		$("#EsMenorOincapacitatDocumentIdentificadorMessage").addClass("novisible");
		$("#EsMenorOincapacitatDocumentIdentificadorMessage2").addClass("novisible");
//		$("#EsMenorOincapacitatDocumentIdentificadorMessage3").addClass("novisible");
      }
      else{

        validatemodi = false;
		$("#EsMenorOincapacitatDocumentIdentificador").addClass("form-requiredfields");
//		$("#EsMenorOincapacitatDocumentIdentificadorMessage").addClass("novisible");
		$("#EsMenorOincapacitatDocumentIdentificadorMessage").removeClass("novisible");
		$("#EsMenorOincapacitatDocumentIdentificadorMessage2").addClass("novisible");
//		$("#EsMenorOincapacitatDocumentIdentificadorMessage3").removeClass("novisible");
      }
    }


    else{

      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificador").classList.remove('form-requiredfields');
    }
    if(document.getElementById('rYoungYes').checked && EsMenorOincapacitatDocumentIdentificador != "" && DocumentIdentificador!= "" && EsMenorOincapacitatDocumentIdentificador == DocumentIdentificador){
      validatemodi = false;
      document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
      document.getElementById("DocumentIdentificador").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage4").classList.remove('novisible');
    }else{
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage4").className += " novisible";
    }

	if ($("#DadesParticularsTsiMenor").is(':checked')) {
		if ($("#DadesParticularsTsi1Menor").is(':checked')
				|| $("#DadesParticularsTsi2Menor").is(':checked')) {
			$("#DadesParticularsTsiMenorMessage").addClass("novisible");
			$("#TSIDeclaracio").removeClass("form-requiredfields");
		} else {
			$("#DadesParticularsTsiMenorMessage").removeClass("novisible");
			$("#TSIDeclaracio").addClass("form-requiredfields");
			validatemodi = false;
		}
	}
	if ($("#DadesParticularsEstiuMenor").is(':checked')) {
		if (!$("#DadesParticularsEstiu1Menor").is(':checked') && !$("#DadesParticularsEstiu4Menor").is(':checked')) {
			$("#DadesParticularsEstiuMenorMessage").removeClass("novisible");
			$( "#DadesParticularsEstiuMenorDiv").addClass("form-requiredfields");
			validatemodi = false;
		}
		else if ($("#DadesParticularsEstiu1Menor").is(':checked') && !$("#DadesParticularsEstiu2Menor").is(':checked') && !$("#DadesParticularsEstiu3Menor").is(':checked')) {
			$("#DadesParticularsEstiuMenorMessage").addClass("novisible");
			$("#DadesParticularsEstiuMenorAlbergMessage").removeClass("novisible");
			$( "#DadesParticularsEstiuMenorAlbergDiv").addClass("form-requiredfields");
			validatemodi = false;
		} else {
			$("#DadesParticularsEstiuMenorMessage").addClass("novisible");
			$("#DadesParticularsEstiuMenorAlbergMessage").addClass("novisible");
			$( "#DadesParticularsEstiuMenorDiv").removeClass("form-requiredfields");
			$( "#DadesParticularsEstiuMenorAlbergDiv").removeClass("form-requiredfields");
		}
	} else {
		$("#DadesParticularsEstiuMenorMessage").addClass("novisible");
		$("#DadesParticularsEstiuMenorAlbergMessage").addClass("novisible");
		$( "#DadesParticularsEstiuMenorDiv").removeClass("form-requiredfields");
		$( "#DadesParticularsEstiuMenorAlbergDiv").removeClass("form-requiredfields");
	}
  }

  if (currentpage == "2") {

    var DadesNaixementDataNaixement = $("#DadesNaixementDataNaixement").val();
    if (DadesNaixementDataNaixement != null && DadesNaixementDataNaixement.length > 0) {
      var today = new Date();
      if (DadesNaixementDataNaixement.match(dateRegEx)) {
    	  if ($.datepicker.parseDate("dd/mm/yy", DadesNaixementDataNaixement).getTime() > today.getTime()) { // data superior a l'actual
    		  $("#DadesNaixementDataNaixement").addClass("form-requiredfields");
	          $("#DadesNaixementDataNaixementMessage").addClass("novisible")
	          $("#DadesNaixementDataNaixementMessage2").removeClass("novisible");
	          validatemodi = false;
	      } else {
	          $("#DadesNaixementDataNaixement").removeClass("form-requiredfields");
	          $("#DadesNaixementDataNaixementMessage").addClass("novisible")
	          $("#DadesNaixementDataNaixementMessage2").addClass("novisible");
	      }
      } else {
		  $("#DadesNaixementDataNaixement").addClass("form-requiredfields");
          $("#DadesNaixementDataNaixementMessage2").addClass("novisible");
          $("#DadesNaixementDataNaixementMessage").removeClass("novisible");
          validatemodi = false;
      }

    }

    if (Nacionalitat1CodiINE == Nacionalitat2CodiINE && Nacionalitat1CodiINE != "") {
        if(Nacionalitat1CodiINE != Nacionalitat3CodiINE){
          document.getElementById("Nacionalitat1CodiINE").classList.remove("form-requiredfields");

          document.getElementById("Nacionalitat2CodiINE").className += " form-requiredfields";
          document.getElementById("Nacionalitat3CodiINE").classList.remove("form-requiredfields");
          document.getElementById("NacionalitatCodiINE").classList.remove("novisible");
          validatemodi = false
        } else {
          document.getElementById("Nacionalitat1CodiINE").classList
              .remove("form-requiredfields");
          document.getElementById("Nacionalitat2CodiINE").className += " form-requiredfields";
          document.getElementById("Nacionalitat3CodiINE").className += " form-requiredfields";
          document.getElementById("NacionalitatCodiINE").classList
              .remove("novisible");
          validatemodi = false
        }

    } else if (Nacionalitat1CodiINE == Nacionalitat3CodiINE && Nacionalitat1CodiINE != "") {
      document.getElementById("Nacionalitat1CodiINE").classList.remove("form-requiredfields");
      document.getElementById("Nacionalitat3CodiINE").className += " form-requiredfields";
      document.getElementById("Nacionalitat2CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("NacionalitatCodiINE").classList
          .remove("novisible");
      validatemodi = false

    } else if (Nacionalitat2CodiINE == Nacionalitat3CodiINE && Nacionalitat2CodiINE != "") {
      document.getElementById("Nacionalitat3CodiINE").className += " form-requiredfields";
      document.getElementById("Nacionalitat1CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("Nacionalitat2CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("NacionalitatCodiINE").classList
          .remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("Nacionalitat1CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("Nacionalitat2CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("Nacionalitat3CodiINE").classList
          .remove("form-requiredfields");
      document.getElementById("NacionalitatCodiINE").className += " novisible";
    }

  }

  if (currentpage == "3") {
    if (NotificacioNomVia == null || NotificacioNomVia.length == 0
        || /^\s+$/.test(NotificacioNomVia)) {
      document.getElementById("NotificacioNomVia").className += " form-requiredfields";
      document.getElementById("NotificacioNomViaMessage").classList
          .remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("NotificacioNomVia").classList
          .remove('form-requiredfields');
      document.getElementById("NotificacioNomViaMessage").className += " novisible";
    }

    if (NotificacioCodiPostal == null || NotificacioCodiPostal.length == 0
        || /^\s+$/.test(NotificacioCodiPostal)) {
      document.getElementById("NotificacioCodiPostal").className += " form-requiredfields";
      document.getElementById("NotificacioCodiPostalMessage").classList
          .remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("NotificacioCodiPostal").classList
          .remove('form-requiredfields');
      document.getElementById("NotificacioCodiPostalMessage").className += " novisible";
    }

    if (DadesParticularsAltresDadesPaisCodiINE == null
        || DadesParticularsAltresDadesPaisCodiINE == 0) {
      document.getElementById("DadesParticularsAltresDadesPaisCodiINE").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsAltresDadesPaisCodiINEMessage").classList
          .remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("DadesParticularsAltresDadesPaisCodiINE").classList
          .remove('form-requiredfields');
      document
          .getElementById("DadesParticularsAltresDadesPaisCodiINEMessage").className += " novisible";

      // validació si país USA (302) o ESP (108)
      if ($("#DadesParticularsAltresDadesPaisCodiINE").val() == 108) {
        if ($.trim($("#DadesParticularsAltresDadesProvinciaNom").val()) == "") {
          $("#DadesParticularsAltresDadesProvinciaNomESPMessage").removeClass("novisible");
             $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").addClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaComboESP").addClass('form-requiredfields');
          validatemodi = false;
        } else {
          $("#DadesParticularsAltresDadesProvinciaNomESPMessage").addClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaComboESP").removeClass('form-requiredfields');
        }
      } else if ($("#DadesParticularsAltresDadesPaisCodiINE").val() == 302) {
        if ($.trim($("#DadesParticularsAltresDadesProvinciaNom").val()) == "") {
          $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").removeClass("novisible");
             $("#DadesParticularsAltresDadesProvinciaNomESPMessage").addClass("novisible");
             $("#DadesParticularsAltresDadesProvinciaComboUSA").addClass('form-requiredfields');
             validatemodi = false;
        } else {
          $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").addClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaComboUSA").removeClass('form-requiredfields');
        }
      } else {
         $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").addClass("novisible");
      $("#DadesParticularsAltresDadesProvinciaComboESP").removeClass('form-requiredfields');
      $("#DadesParticularsAltresDadesProvinciaNomESPMessage").addClass("novisible");
      $("#DadesParticularsAltresDadesProvinciaComboUSA").removeClass('form-requiredfields');
     }


    }

    if (DadesParticularsAltresDadesMunicipiNom == null
        || DadesParticularsAltresDadesMunicipiNom.length == 0
        || /^\s+$/.test(DadesParticularsAltresDadesMunicipiNom)) {
      document.getElementById("DadesParticularsAltresDadesMunicipiNom").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsAltresDadesMunicipiNomMessage").classList
          .remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("DadesParticularsAltresDadesMunicipiNom").classList
          .remove('form-requiredfields');
      document
          .getElementById("DadesParticularsAltresDadesMunicipiNomMessage").className += " novisible";
    }

    if (DadesParticularsRepresentantEmail == null
        || DadesParticularsRepresentantEmail.length == 0
        || /^\s+$/.test(DadesParticularsRepresentantEmail)) {
      document.getElementById("DadesParticularsRepresentantEmail").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsRepresentantEmailMessage2").className += " novisible";
      document.getElementById("DadesParticularsRepresentantEmailMessage").classList
          .remove("novisible");
      validatemodi = false
    } else if (!(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        .test(DadesParticularsRepresentantEmail))) {
      document.getElementById("DadesParticularsRepresentantEmail").className += " form-requiredfields";
      document.getElementById("DadesParticularsRepresentantEmailMessage").className += " novisible";
      document
          .getElementById("DadesParticularsRepresentantEmailMessage2").classList
          .remove("novisible");

      validatemodi = false;
    } else {

      document.getElementById("DadesParticularsRepresentantEmail").classList
          .remove('form-requiredfields');
      document.getElementById("DadesParticularsRepresentantEmailMessage").className += " novisible";
      document
          .getElementById("DadesParticularsRepresentantEmailMessage2").className += " novisible";
    }

    if(document.getElementById('rYoungYes').checked){
      if(!document.getElementById('DadesParticularsDniPassRepre').checked && !document.getElementById('DadesParticularsDniPassRepre2').checked){
        document.getElementById('menorDocsgroup').className += " form-requiredfields";
        document.getElementById('menorDocsgroupMessage').classList.remove("novisible");
        validatemodi = false;
      }else{
        document.getElementById('menorDocsgroup').classList.remove("form-requiredfields");
        document.getElementById('menorDocsgroupMessage').className += " novisible";
      }

    }else{
      document.getElementById('menorDocsgroup').classList.remove("form-requiredfields");
    document.getElementById('menorDocsgroupMessage').className += " novisible";
    if(!document.getElementById('dniPassIns').checked && !document.getElementById('dniPassIns2').checked){
      document.getElementById('Docsgroup').className += " form-requiredfields";
        document.getElementById('DocsgroupMessage').classList.remove("novisible");
        validatemodi = false;
    }else{
      document.getElementById('Docsgroup').classList.remove("form-requiredfields");
        document.getElementById('DocsgroupMessage').className += " novisible";
    }
    }

  }

  if (currentpage == "4") {

    if (!lopdread.checked) {
      document.getElementById("lopdreadcheckbox").className += " form-requiredfields";
      document.getElementById("lopdreadcheckboxMessage").classList
          .remove("novisible");
      validatemodi = false
    } else {
      document.getElementById("lopdreadcheckbox").classList
          .remove('form-requiredfields');
      document.getElementById("lopdreadcheckboxMessage").className += " novisible";
    }
    if (grecaptcha.getResponse( )=="") {
      $("#nocaptchaMessage").removeClass("novisible");
//      $("#rexCaptcha").addClass("form-requiredfields");
      validatemodi = false;
    } else {
//      $("#rexCaptcha").removeClass("form-requiredfields");
      $("#nocaptchaMessage").addClass("novisible");
    }
  }

  if (validatemodi == true) {
    document.getElementById("validationMessage").className += " novisible";
    return true
  } else {

    window.scrollTo(0, 0);

    document.getElementById("validationMessage").classList
        .remove('novisible');
    return false;
  }

}

// Validacion cancelar
function validationcanc() {

  // ---Variables-----------------

  validatecanc = true;

  // ---Variables campos de texto-----------------
  var DadesParticularsSolicitantDadesSolicitantNom = document.getElementById("DadesParticularsSolicitantDadesSolicitantNom").value;
  var DadesParticularsSolicitantDadesSolicitantCognom1 = document.getElementById("DadesParticularsSolicitantDadesSolicitantCognom1").value;
  var DadesParticularsSolicitantDadesSolicitantDocumentIdentificador = document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").value;
  //var DadesParticularsSolicitantDadesSolicitantDocumentTipusDocument = document.getElementById("DadesParticularsSolicitantDadesSolicitantTipusDocument").selectedIndex;

  var Nom = document.getElementById("Nom").value
  var Cognom1 = document.getElementById("Cognom1").value;
  var DocumentIdentificador = document
      .getElementById("DocumentIdentificador").value;
  var EsMenorOincapacitatNom = document
      .getElementById("EsMenorOincapacitatNom").value;
  var EsMenorOincapacitatCognom1 = document
      .getElementById("EsMenorOincapacitatCognom1").value;
  var EsMenorOincapacitatDocumentIdentificador = document
      .getElementById("EsMenorOincapacitatDocumentIdentificador").value;
  var NotificacioNomVia = document.getElementById("NotificacioNomVia").value;
  var NotificacioCodiPostal = document
      .getElementById("NotificacioCodiPostal").value;
  var DadesParticularsRepresentantEmail = document
      .getElementById("DadesParticularsRepresentantEmail").value;
  var lopdread = document.getElementById("lopdread");

  // ---Variables selectores-----------------
  var DocumentTipusDocument = document
      .getElementById("DocumentTipusDocument").selectedIndex;
  var DadesParticularsSolicitantDadesSolicitantTipusDocument = document
      .getElementById("DadesParticularsSolicitantDadesSolicitantTipusDocument").selectedIndex;
  var EsMenorOincapacitatDocumentTipusDocument = document
      .getElementById("EsMenorOincapacitatDocumentTipusDocument").selectedIndex;
  var DadesParticularsAltresDadesPaisCodiINE = document
      .getElementById("DadesParticularsAltresDadesPaisCodiINE").selectedIndex;
  var DadesParticularsAltresDadesMunicipiNom = document
      .getElementById("DadesParticularsAltresDadesMunicipiNom").value;

  if (currentpage == "1") {
    if(!document.getElementById('DadesParticularsRetornCatalunya0').checked && !document.getElementById('DadesParticularsRetornCatalunya1').checked && !document.getElementById('DadesParticularsRetornCatalunya2').checked){
      document.getElementById('motiucanc').className += " form-requiredfields";
      document.getElementById("motiucancMessage").classList.remove("novisible");
      validatecanc = false;
    }
    else{
      document.getElementById('motiucanc').classList.remove("form-requiredfields");
      document.getElementById('motiucancMessage').className += " novisible";
    }
    if ((document.getElementById('DadesParticularsRetornCatalunya1').checked)
        && (DadesParticularsSolicitantDadesSolicitantNom == null
            || DadesParticularsSolicitantDadesSolicitantNom.length == 0 || /^\s+$/
            .test(DadesParticularsSolicitantDadesSolicitantNom))) {
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantNom").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantNomMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else {
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantNom").classList
          .remove('form-requiredfields');
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantNomMessage").className += " novisible";
    }
    if ((document.getElementById('DadesParticularsRetornCatalunya1').checked)
        && (DadesParticularsSolicitantDadesSolicitantCognom1 == null
            || DadesParticularsSolicitantDadesSolicitantCognom1.length == 0 || /^\s+$/
            .test(DadesParticularsSolicitantDadesSolicitantCognom1))) {
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantCognom1").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantCognom1Message").classList
          .remove("novisible");
      validatecanc = false;
    } else {
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantCognom1").classList
          .remove('form-requiredfields');
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantCognom1Message").className += " novisible";
    }

    if ((document.getElementById('DadesParticularsRetornCatalunya1').checked)
        && (DadesParticularsSolicitantDadesSolicitantTipusDocument == null || DadesParticularsSolicitantDadesSolicitantTipusDocument == 0)) {
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantTipusDocument").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantTipusDocumentMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else {
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantTipusDocument").classList
          .remove('form-requiredfields');
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantTipusDocumentMessage").className += " novisible";
    }

    if ((document.getElementById('DadesParticularsRetornCatalunya1').checked)
        && (DadesParticularsSolicitantDadesSolicitantDocumentIdentificador == null
            || DadesParticularsSolicitantDadesSolicitantDocumentIdentificador.length == 0 || /^\s+$/
            .test(DadesParticularsSolicitantDadesSolicitantDocumentIdentificador))) {
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").className += " form-requiredfields";
      document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage3").className += " novisible";
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage2").className += " novisible";
      document
          .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage").classList
          .remove("novisible");
      validatecanc = false;
    }


    else if ((document.getElementById('DadesParticularsRetornCatalunya1').checked)
        && (document
            .getElementById("DadesParticularsSolicitantDadesSolicitantTipusDocument").value == "nif")) {

      var numero;
      var letra;
      var letras;
      var expresion = /^[XYZ]?\d{5,8}[A-Z]$/;
      var dni = document
          .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").value;

      dni = dni.toUpperCase();

      if (expresion.test(dni) === true) {
        numero = dni.substr(0, dni.length - 1);
        numero = numero.replace('X', 0);
        numero = numero.replace('Y', 1);
        numero = numero.replace('Z', 2);
        letra = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letras = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letras = letras.substring(numero, numero + 1);
        if (letras != letra) {
          validatecanc = false;
          document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage3").className += " novisible";
          document
              .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").className += " form-requiredfields";
          document
              .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage").className += " novisible";
          document
              .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage2").classList
              .remove("novisible");
        } else {
          if (validatecanc) validatecanc = true;
          document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage3").className += " novisible";
          document
              .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").classList
              .remove('form-requiredfields');
          document
              .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage").className += " novisible";
          document
              .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage2").className += " novisible";
        }
      } else {
        validatecanc = false;
        document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage3").className += " novisible";
        document
            .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").className += " form-requiredfields";
        document
            .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage").className += " novisible";
        document
            .getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage2").classList
            .remove("novisible");
      }

    } else if ((document.getElementById('DadesParticularsRetornCatalunya1').checked)
        && (document.getElementById("DadesParticularsSolicitantDadesSolicitantTipusDocument").value == "passaport")) {
//      var expresionp = /^[A-Z]{3}[0-9]{6}[A-Z]?$/;
    	var expressionp = /^\s+$/;
    	if (!expressionp.test($("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").val())){
        if (validatecanc) validatecanc = true;
	  		$("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").removeClass("form-requiredfields");
	  		$("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage").addClass("novisible");
	  		$("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage2").addClass("novisible");
//  		$("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage3").addClass("novisible");
      }
      else{
        validatecanc = false;
  		$("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").addClass("form-requiredfields");
//		$("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage").addClass("novisible");
		$("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage").removeClass("novisible");
		$("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage2").addClass("novisible");
//		$("#DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage3").removeClass("novisible");
      }
    } else if (document.getElementById('DadesParticularsRetornCatalunya0').checked || (document.getElementById('DadesParticularsRetornCatalunya2').checked)) {
      if (validatecanc) validatecanc = true;
    document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").classList.remove('form-requiredfields');
    document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage").className += " novisible";
    document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage2").className += " novisible";
    document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificadorMessage3").className += " novisible";
    }



    if (Nom == null || Nom.length == 0 || /^\s+$/.test(Nom)) {
      document.getElementById("Nom").className += " form-requiredfields";
      document.getElementById("NomMessage").classList.remove("novisible");
      validatecanc = false;
    } else {
      document.getElementById("Nom").classList
          .remove('form-requiredfields');
      document.getElementById("NomMessage").className += " novisible";
    }

    if (Cognom1 == null || Cognom1.length == 0 || /^\s+$/.test(Cognom1)) {
      document.getElementById("Cognom1").className += " form-requiredfields";
      document.getElementById("Cognom1Message").classList
          .remove("novisible");
      validatecanc = false;
    } else {
      document.getElementById("Cognom1").classList
          .remove('form-requiredfields');
      document.getElementById("Cognom1Message").className += " novisible";
    }

    if (DocumentTipusDocument == null || DocumentTipusDocument == 0) {
      document.getElementById("DocumentTipusDocument").className += " form-requiredfields";
      document.getElementById("DocumentTipusDocumentMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else {
      document.getElementById("DocumentTipusDocument").classList
          .remove('form-requiredfields');
      document.getElementById("DocumentTipusDocumentMessage").className += " novisible";
    }

    if (DocumentIdentificador == null || DocumentIdentificador.length == 0
        || /^\s+$/.test(DocumentIdentificador)) {
      document.getElementById("DocumentIdentificador").className += " form-requiredfields";
      document.getElementById("DocumentIdentificadorMessage2").className += " novisible";
      document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
      document.getElementById("DocumentIdentificadorMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else if (document.getElementById("DocumentTipusDocument").value == "nif") {

      var numero;
      var letra;
      var letras;
      var expresion = /^[XYZ]?\d{5,8}[A-Z]$/;
      var dni = document.getElementById("DocumentIdentificador").value;

      dni = dni.toUpperCase();

      if (expresion.test(dni) === true) {
        numero = dni.substr(0, dni.length - 1);
        numero = numero.replace('X', 0);
        numero = numero.replace('Y', 1);
        numero = numero.replace('Z', 2);
        letra = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letras = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letras = letras.substring(numero, numero + 1);
        if (letras != letra) {
          validatecanc = false;
          document.getElementById("DocumentIdentificador").className += " form-requiredfields";
          document.getElementById("DocumentIdentificadorMessage").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage2").classList
              .remove("novisible");

        } else {
          if (validatecanc) validatecanc = true;
          document.getElementById("DocumentIdentificador").classList
              .remove('form-requiredfields');
          document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage").className += " novisible";
          document.getElementById("DocumentIdentificadorMessage2").className += " novisible";
        }
      } else {
        validatecanc = false;
        document.getElementById("DocumentIdentificador").className += " form-requiredfields";
        document.getElementById("DocumentIdentificadorMessage").className += " novisible";
        document.getElementById("DocumentIdentificadorMessage3").className += " novisible";
        document.getElementById("DocumentIdentificadorMessage2").classList
            .remove("novisible");
      }

    }else if (document.getElementById("DocumentTipusDocument").value == "passaport"){
//      var expresionp = /^[A-Z]{3}[0-9]{6}[A-Z]?$/;
    	var expressionp = /^\s+$/;
      if (!expressionp.test($("#DocumentIdentificador").val())){
        if (validatecanc) validatecanc = true;
  		$("#DocumentIdentificador").removeClass("form-requiredfields");
  		$("#DocumentIdentificadorMessage").addClass("novisible");
  		$("#DocumentIdentificadorMessage2").addClass("novisible");
//  		$("#DocumentIdentificadorMessage3").addClass("novisible");
      }
      else{
        validatecanc = false;
 		$("#DocumentIdentificador").addClass("form-requiredfields");
//		$("#DocumentIdentificadorMessage").addClass("novisible");
		$("#DocumentIdentificadorMessage").removeClass("novisible");
		$("#DocumentIdentificadorMessage2").addClass("novisible");
//		$("#DocumentIdentificadorMessage3").removeClass("novisible");
      }
    }
    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatNom == null
            || EsMenorOincapacitatNom.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatNom))) {
      document.getElementById("EsMenorOincapacitatNom").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatNomMessage").classList
          .remove("novisible");
      validatecanc = false
    } else {
      document.getElementById("EsMenorOincapacitatNom").classList
          .remove('form-requiredfields');
      document.getElementById("EsMenorOincapacitatNomMessage").className += " novisible";
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatCognom1 == null
            || EsMenorOincapacitatCognom1.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatCognom1))) {
      document.getElementById("EsMenorOincapacitatCognom1").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatCognom1Message").classList
          .remove("novisible");
      validatecanc = false
    } else {
      document.getElementById("EsMenorOincapacitatCognom1").classList
          .remove('form-requiredfields');
      document.getElementById("EsMenorOincapacitatCognom1Message").className += " novisible";
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatDocumentTipusDocument == null || EsMenorOincapacitatDocumentTipusDocument == 0)) {
      document.getElementById("EsMenorOincapacitatDocumentTipusDocument").className += " form-requiredfields";
      document
          .getElementById("EsMenorOincapacitatDocumentTipusDocumentMessage").classList
          .remove("novisible");
      validatecanc = false
    } else {
      document.getElementById("EsMenorOincapacitatDocumentTipusDocument").classList
          .remove('form-requiredfields');
      document
          .getElementById("EsMenorOincapacitatDocumentTipusDocumentMessage").className += " novisible";
    }

    if (document.getElementById('rYoungYes').checked
        && (EsMenorOincapacitatDocumentIdentificador == null
            || EsMenorOincapacitatDocumentIdentificador.length == 0 || /^\s+$/
            .test(EsMenorOincapacitatDocumentIdentificador))) {
      document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else if (document.getElementById('rYoungYes').checked
        && (document
            .getElementById("EsMenorOincapacitatDocumentTipusDocument").value == "nif")) {

      var numero;
      var letra;
      var letras;
      var expresion = /^[XYZ]?\d{5,8}[A-Z]$/;
      var dni = document
          .getElementById("EsMenorOincapacitatDocumentIdentificador").value;

      dni = dni.toUpperCase();

      if (expresion.test(dni) === true) {
        numero = dni.substr(0, dni.length - 1);
        numero = numero.replace('X', 0);
        numero = numero.replace('Y', 1);
        numero = numero.replace('Z', 2);
        letra = dni.substr(dni.length - 1, 1);
        numero = numero % 23;
        letras = 'TRWAGMYFPDXBNJZSQVHLCKET';
        letras = letras.substring(numero, numero + 1);
        if (letras != letra) {
          validatecanc = false;
          document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").classList.remove("novisible");

        } else {
          if (validatecanc) validatecanc = true;
          document.getElementById("EsMenorOincapacitatDocumentIdentificador").classList.remove('form-requiredfields');
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").className += " novisible";
          document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
        }
      } else {
        validatecanc = false;
        document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
        document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
        document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
        document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").classList.remove("novisible");
      }

    }else if (document.getElementById('rYoungYes').checked && (document.getElementById("EsMenorOincapacitatDocumentTipusDocument").value == "passaport")){

//      var expresionp = /^[A-Z]{3}[0-9]{6}[A-Z]?$/;
    	var expressionp = /^\s+$/;
      if (!expressionp.test($("#EsMenorOincapacitatDocumentIdentificador").val())){

        if (validatecanc) validatecanc = true;
  		$("#EsMenorOincapacitatDocumentIdentificador").removeClass("form-requiredfields");
  		$("#EsMenorOincapacitatDocumentIdentificadorMessage").addClass("novisible");
  		$("#EsMenorOincapacitatDocumentIdentificadorMessage2").addClass("novisible");
//  		$("#EsMenorOincapacitatDocumentIdentificadorMessage3").addClass("novisible");
      }
      else{

        validatecanc = false;
 		$("#EsMenorOincapacitatDocumentIdentificador").addClass("form-requiredfields");
//		$("#EsMenorOincapacitatDocumentIdentificadorMessage").addClass("novisible");
		$("#EsMenorOincapacitatDocumentIdentificadorMessage").removeClass("novisible");
		$("#EsMenorOincapacitatDocumentIdentificadorMessage2").addClass("novisible");
//		$("#EsMenorOincapacitatDocumentIdentificadorMessage3").removeClass("novisible");
      }
    }else{
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage3").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage2").className += " novisible";
      document.getElementById("EsMenorOincapacitatDocumentIdentificador").classList.remove('form-requiredfields');
    }
    if(document.getElementById('rYoungYes').checked && EsMenorOincapacitatDocumentIdentificador != "" && DocumentIdentificador!= "" && EsMenorOincapacitatDocumentIdentificador == DocumentIdentificador){
      validatecanc = false;
      document.getElementById("EsMenorOincapacitatDocumentIdentificador").className += " form-requiredfields";
      document.getElementById("DocumentIdentificador").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage4").classList.remove('novisible');
    }else{
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage4").className += " novisible";
    }

    if(document.getElementById('DadesParticularsRetornCatalunya1').checked && DadesParticularsSolicitantDadesSolicitantDocumentIdentificador != "" && DocumentIdentificador!= "" && DadesParticularsSolicitantDadesSolicitantDocumentIdentificador == DocumentIdentificador){
      validatecanc = false;
      document.getElementById("DadesParticularsSolicitantDadesSolicitantDocumentIdentificador").className += " form-requiredfields";
      document.getElementById("DocumentIdentificador").className += " form-requiredfields";
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage5").classList.remove('novisible');
    }else{
      document.getElementById("EsMenorOincapacitatDocumentIdentificadorMessage5").className += " novisible";
    }
  }



  else if (currentpage == "2") {

    if (NotificacioNomVia == null || NotificacioNomVia.length == 0
        || /^\s+$/.test(NotificacioNomVia)) {
      document.getElementById("NotificacioNomVia").className += " form-requiredfields";
      document.getElementById("NotificacioNomViaMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else {
      document.getElementById("NotificacioNomVia").classList
          .remove('form-requiredfields');
      document.getElementById("NotificacioNomViaMessage").className += " novisible";
    }

    if (NotificacioCodiPostal == null || NotificacioCodiPostal.length == 0
        || /^\s+$/.test(NotificacioCodiPostal)) {
      document.getElementById("NotificacioCodiPostal").className += " form-requiredfields";
      document.getElementById("NotificacioCodiPostalMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else {
      document.getElementById("NotificacioCodiPostal").classList
          .remove('form-requiredfields');
      document.getElementById("NotificacioCodiPostalMessage").className += " novisible";
    }

    if (DadesParticularsAltresDadesPaisCodiINE == null
        || DadesParticularsAltresDadesPaisCodiINE == 0) {
      document.getElementById("DadesParticularsAltresDadesPaisCodiINE").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsAltresDadesPaisCodiINEMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else {
      document.getElementById("DadesParticularsAltresDadesPaisCodiINE").classList
          .remove('form-requiredfields');
      document
          .getElementById("DadesParticularsAltresDadesPaisCodiINEMessage").className += " novisible";


      // validació si país USA (302) o ESP (108)
      if ($("#DadesParticularsAltresDadesPaisCodiINE").val() == 108) {
        if ($.trim($("#DadesParticularsAltresDadesProvinciaNom").val()) == "") {
          $("#DadesParticularsAltresDadesProvinciaNomESPMessage").removeClass("novisible");
             $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").addClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaComboESP").addClass('form-requiredfields');
          validatecanc = false;
        } else {
          $("#DadesParticularsAltresDadesProvinciaNomESPMessage").addClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaComboESP").removeClass('form-requiredfields');
        }
      } else if ($("#DadesParticularsAltresDadesPaisCodiINE").val() == 302) {
        if ($.trim($("#DadesParticularsAltresDadesProvinciaNom").val()) == "") {
          $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").removeClass("novisible");
             $("#DadesParticularsAltresDadesProvinciaNomESPMessage").addClass("novisible");
             $("#DadesParticularsAltresDadesProvinciaComboUSA").addClass('form-requiredfields');
             validatecanc = false;
        } else {
          $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").addClass("novisible");
          $("#DadesParticularsAltresDadesProvinciaComboUSA").removeClass('form-requiredfields');
        }
      } else {
         $("#DadesParticularsAltresDadesProvinciaNomUSAMessage").addClass("novisible");
      $("#DadesParticularsAltresDadesProvinciaComboESP").removeClass('form-requiredfields');
      $("#DadesParticularsAltresDadesProvinciaNomESPMessage").addClass("novisible");
      $("#DadesParticularsAltresDadesProvinciaComboUSA").removeClass('form-requiredfields');
     }


    }

    if (DadesParticularsAltresDadesMunicipiNom == null
        || DadesParticularsAltresDadesMunicipiNom.length == 0
        || /^\s+$/.test(DadesParticularsAltresDadesMunicipiNom)) {
      document.getElementById("DadesParticularsAltresDadesMunicipiNom").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsAltresDadesMunicipiNomMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else {
      document.getElementById("DadesParticularsAltresDadesMunicipiNom").classList
          .remove('form-requiredfields');
      document
          .getElementById("DadesParticularsAltresDadesMunicipiNomMessage").className += " novisible";
    }

    if (DadesParticularsRepresentantEmail == null
        || DadesParticularsRepresentantEmail.length == 0
        || /^\s+$/.test(DadesParticularsRepresentantEmail)) {
      document.getElementById("DadesParticularsRepresentantEmail").className += " form-requiredfields";
      document
          .getElementById("DadesParticularsRepresentantEmailMessage2").className += " novisible";
      document.getElementById("DadesParticularsRepresentantEmailMessage").classList
          .remove("novisible");
      validatecanc = false;
    } else if (!(/^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/
        .test(DadesParticularsRepresentantEmail))) {
      document.getElementById("DadesParticularsRepresentantEmail").className += " form-requiredfields";
      document.getElementById("DadesParticularsRepresentantEmailMessage").className += " novisible";
      document
          .getElementById("DadesParticularsRepresentantEmailMessage2").classList
          .remove("novisible");

      validatecanc = false;
    } else {

      document.getElementById("DadesParticularsRepresentantEmail").classList
          .remove('form-requiredfields');
      document.getElementById("DadesParticularsRepresentantEmailMessage").className += " novisible";
      document
          .getElementById("DadesParticularsRepresentantEmailMessage2").className += " novisible";
    }

    if(document.getElementById('rYoungYes').checked){
      if(!document.getElementById('dniRepre').checked && !document.getElementById('passRepre').checked){
        document.getElementById('menorDocsgroup').className += " form-requiredfields";
        document.getElementById('menorDocsgroupMessage').classList.remove("novisible");
        validatecanc = false;
      }else{
        document.getElementById('menorDocsgroup').classList.remove("form-requiredfields");
        document.getElementById('menorDocsgroupMessage').className += " novisible";
      }

    }else if (!document.getElementById('rYoungYes').checked && !document.getElementById('DadesParticularsRetornCatalunya1').checked){
      document.getElementById('menorDocsgroup').classList.remove("form-requiredfields");
    document.getElementById('menorDocsgroupMessage').className += " novisible";
    if(!document.getElementById('dniIns').checked && !document.getElementById('passIns').checked){
      document.getElementById('Docsgroup').className += " form-requiredfields";
        document.getElementById('DocsgroupMessage').classList.remove("novisible");
        validatecanc = false;
    }else{
      document.getElementById('Docsgroup').classList.remove("form-requiredfields");
        document.getElementById('DocsgroupMessage').className += " novisible";
    }
  }else if(document.getElementById('DadesParticularsRetornCatalunya1').checked){
    if(!document.getElementById('certDefun').checked){
    document.getElementById('certDefuncheckbox').className += " form-requiredfields";
    document.getElementById('docRepreMessage').classList.remove("novisible");
    validatecanc = false;
    }else{
      document.getElementById('certDefuncheckbox').classList.remove("form-requiredfields");
        document.getElementById('docRepreMessage').className += " novisible";

    }
  }

  }

  else if (currentpage == "3") {

    if (!lopdread.checked) {
      document.getElementById("lopdreadcheckbox").className += " form-requiredfields";
      document.getElementById("lopdreadcheckboxMessage").classList.remove("novisible");
      validatecanc = false;
    } else {
      document.getElementById("lopdreadcheckbox").classList.remove('form-requiredfields');
      document.getElementById("lopdreadcheckboxMessage").className += " novisible";
    }

    if (grecaptcha.getResponse( )=="") {
      $("#nocaptchaMessage").removeClass("novisible");
//      $("#rexCaptcha").addClass("form-requiredfields");
      validatecanc = false;
    } else {
//      $("#rexCaptcha").removeClass("form-requiredfields");
      $("#nocaptchaMessage").addClass("novisible");
    }


  }

  if (validatecanc == true) {
    document.getElementById("validationMessage").className += " novisible";
    return true;

  } else {

    window.scrollTo(0, 0);
    document.getElementById("validationMessage").classList
        .remove('novisible');
    return false;
  }

}

// Netejar avisos
function resetfields() {
	$('.error-msg').addClass("novisible");
	if (document.getElementById("cancelar") != undefined) {
		$('#validationMessage').addClass("novisible");
		if (currentpage == "1") {
			$('#pag1errores div').addClass("novisible");
			$('#pag1 input:text').val("");
			$('#pag1 select').val("");
			$('#pag1 select').removeClass("form-requiredfields");
			$('#pag1 input:text').removeClass("form-requiredfields");
		}
		if (currentpage == "2") {
			$('#pag2errores div').addClass("novisible");
			$('#pag2 input:text').val("");
			$('#pag2 input[type="number"]').val("");
			$('#pag2 input:text').removeClass("form-requiredfields");
			$('#pag2 input[type="number"]').removeClass("form-requiredfields");
			$("#pag2 input:checkbox").removeAttr('checked');
			$('#pag2 select').val("");
			$('#pag2 select').removeClass("form-requiredfields");
			$('#pag2 textarea').val("");

			$("#estat-provincia" ).removeClass("required");
			$("#DadesParticularsAltresDadesProvinciaNom" ).val("");
			$("#DadesParticularsAltresDadesProvinciaNom" ).removeClass("novisible");
			$("#DadesParticularsAltresDadesProvinciaComboESP" ).addClass("novisible");
			$("#DadesParticularsAltresDadesProvinciaComboUSA" ).addClass("novisible");
			$("#DadesParticularsAltresDadesMunicipiNom" ).val("");
			$("#DadesParticularsAltresDadesMunicipiNom" ).removeClass("novisible");
			$("#DadesParticularsAltresDadesMunicipiComboESP" ).addClass("novisible");

		}
		if (currentpage == "3") {
			$('#pag3errores div').addClass("novisible");
			$('#lopdreadcheckbox').removeClass("form-requiredfields");
			$("#pag3 input:checkbox").removeAttr('checked');
		}
	}


	if (document.getElementById("inscriure") != undefined) {
		$('.error-msg').addClass("novisible");
		$('#validationMessage').addClass("novisible");
		if (currentpage == "1") {
			$('#pag1errores div').addClass("novisible");
			$('#pag1 input:text').val("");
			$('#pag1 select').val("");
			$('#pag1 select').removeClass("form-requiredfields");
			$('#pag1 input:text').removeClass("form-requiredfields");
			$('#pag1 input[type="number"]').val("");
			$('#pag1 input[type="number"]').removeClass("form-requiredfields");
			$('#pag1 input[type="date"]').val("");
			$('#pag1 input[type="date"]').removeClass("form-requiredfields");

			$("#estat-provincia").removeClass("required");
			$("#ProvinciaNom").val("");
			$("#ProvinciaNom").removeClass("novisible");
			$("#ProvinciaComboESP").addClass("novisible");
			$("#ProvinciaComboUSA").addClass("novisible");
			$("#MunicipiNom").val("");
			$("#MunicipiNom").removeClass("novisible");
			$("#MunicipiComboESP").addClass("novisible");
			$("#estat-provincia-naixement").removeClass("required");
			$("#DadesNaixementProvinciaNom").val("");
			$("#DadesNaixementProvinciaNom").removeClass("novisible");
			$("#DadesNaixementProvinciaComboESP").addClass("novisible");
			$("#DadesNaixementProvinciaComboUSA").addClass("novisible");
			$("#DadesNaixementMunicipiNom").val("");
			$("#DadesNaixementMunicipiNom").removeClass("novisible");
			$("#DadesNaixementMunicipiComboESP").addClass("novisible");

		}
		if (currentpage == "2") {
			$('#pag2errores div').addClass("novisible");
			$('#pag2 input:text').val("");
			$('#pag2 input[type="number"]').val("");
			$('#pag2 input:text').removeClass("form-requiredfields");
			$('#pag2 input[type="number"]').removeClass("form-requiredfields");
			$("#pag2 input:checkbox").removeAttr('checked');
			$('#pag2 select').val("");
			$('#pag2 select').removeClass("form-requiredfields");

			$("#estat-provincia-DadesParticularsAltresDades" ).removeClass("required");
			$("#DadesParticularsAltresDadesProvinciaNom" ).val("");
			$("#DadesParticularsAltresDadesProvinciaNom" ).removeClass("novisible");
			$("#DadesParticularsAltresDadesProvinciaComboESP" ).addClass("novisible");
			$("#DadesParticularsAltresDadesProvinciaComboUSA" ).addClass("novisible");
			$("#DadesParticularsAltresDadesMunicipiNom" ).val("");
			$("#DadesParticularsAltresDadesMunicipiNom" ).removeClass("novisible");
			$("#DadesParticularsAltresDadesMunicipiComboESP" ).addClass("novisible");

		}
		if (currentpage == "3") {
			$("#pag3 input:checkbox").removeAttr('checked');
			$('#pag3errores div').addClass("novisible");
			$('#menorDocsgroup').removeClass("form-requiredfields");
			$('#Docsgroup1').removeClass("form-requiredfields");
			$('#Docsgroup2').removeClass("form-requiredfields");

		}
		if (currentpage == "4") {
			$("#pag4 input:checkbox").removeAttr('checked');
			enabletsi();
			enablelestiu();
		}
		if (currentpage == "5") {
			$('#pag5errores div').addClass("novisible");
			$('#lopdreadcheckbox').removeClass("form-requiredfields");
			$('#pag5 textarea').val("");
			$("#pag5 input:checkbox").removeAttr('checked');
		}

	}


	if (document.getElementById("modificar") != undefined) {
		$('.error-msg').addClass("novisible");
		$('#validationMessage').addClass("novisible");
		if (currentpage == "1") {
			$('#pag1errores div').addClass("novisible");
			$('#pag1 input:text').val("");
			$('#pag1 input:text').removeClass("form-requiredfields");

			$('#pag1 select').val("");
			$('#pag1 select').removeClass("form-requiredfields");

			$("#pag1 input:checkbox").removeAttr('checked');
			enabletsi();
			enablelestiu();
		}
		if (currentpage == "2") {

			$('#pag2 input[type="date"]').val("");
			$('#pag2 input[type="date"]').removeClass("form-requiredfields");

			$('#pag2 input[type="number"]').val("");
			$('#pag2 input[type="number"]').removeClass("form-requiredfields");

			$('#pag2errores div').addClass("novisible");

			$('#pag2 input:text').val("");
			$('#pag2 input:text').removeClass("form-requiredfields");

			$("#pag2 input:checkbox").removeAttr('checked');

			$('#pag2 select').val("");
			$('#pag2 select').removeClass("form-requiredfields");

			$("#ProvinciaNom" ).val("");
			$("#ProvinciaNom" ).removeClass("novisible");
			$("#ProvinciaComboESP" ).addClass("novisible");
			$("#ProvinciaComboUSA" ).addClass("novisible");
			$("#MunicipiNom" ).val("");
			$("#MunicipiNom" ).removeClass("novisible");
			$("#MunicipiComboESP" ).addClass("novisible");

			$("#DadesNaixementProvinciaNom" ).val("");
			$("#DadesNaixementProvinciaNom" ).removeClass("novisible");
			$("#DadesNaixementProvinciaComboESP" ).addClass("novisible");
			$("#DadesNaixementProvinciaComboUSA" ).addClass("novisible");
			$("#DadesNaixementMunicipiNom" ).val("");
			$("#DadesNaixementMunicipiNom" ).removeClass("novisible");
			$("#DadesNaixementMunicipiComboESP" ).addClass("novisible");

		}
		if (currentpage == "3") {
			$("#pag3 input:checkbox").removeAttr('checked');

			$('#pag3errores div').addClass("novisible");

			$('#pag3 select').val("");
			$('#pag3 select').removeClass("form-requiredfields");
			$('#Docsgroup').removeClass("form-requiredfields");
			$('#menorDocsgroup').removeClass("form-requiredfields");

			$('#pag3 input:text').val("");
			$('#pag3 input:text').removeClass("form-requiredfields");

			$('#pag3 input[type="number"]').val("");
			$('#pag3 input[type="number"]').removeClass("form-requiredfields");

			$('#pag3 textarea').val("");

			$("#estat-provincia-DadesParticularsAltresDades" ).removeClass("required");
			$("#DadesParticularsAltresDadesProvinciaNom" ).val("");
			$("#DadesParticularsAltresDadesProvinciaNom" ).removeClass("novisible");
			$("#DadesParticularsAltresDadesProvinciaComboESP" ).addClass("novisible");
			$("#DadesParticularsAltresDadesProvinciaComboUSA" ).addClass("novisible");
			$("#DadesParticularsAltresDadesMunicipiNom" ).val("");
			$("#DadesParticularsAltresDadesMunicipiNom" ).removeClass("novisible");
			$("#DadesParticularsAltresDadesMunicipiComboESP" ).addClass("novisible");

		}
		if (currentpage == "4") {
			$('#lopdreadcheckbox').removeClass("form-requiredfields");
			$("#pag4 input:checkbox").removeAttr('checked');
			$('#pag4errores div').addClass("novisible");
		}

	}

}





//
// function resetform(){
// $('#fail').addClass('novisible');
// $('#success').addClass('novisible');
//	$('form').removeClass('novisible');
//}
