<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Baja da lista</title>

	<style>
		.paragraf_contacte {width:100%;}
		.main {height:80vh;}
		h1 {
		text-align: center;
		position: relative;
		top: 50%;
		transform: translateY(-50%); 
		}
		.button {
		    display:block;
		    margin: 0 auto;
		}
	</style>
	
	<%-- <%@ page import="com.aticser.dao.CiutadanoDAO" %> --%>
	
	<spring:url value="/resources/FW_Generic.css" var="FW_GenericCSS" />
	<spring:url value="/resources/FW_bootStarp_Generic.css" var="FW_bootStarp_GenericCSS" />
	<spring:url value="/resources/master.responsive.css" var="masterResponsiveCSS" />
	<spring:url value="/resources/styles.css" var="stylesCSS" />
	
	<link href="${FW_bootStarp_GenericCSS}" rel="stylesheet" />
	<link href="${FW_GenericCSS}" rel="stylesheet" />
	<link href="${masterResponsiveCSS}" rel="stylesheet" />
	<link href="${stylesCSS}" rel="stylesheet" />
	
	<script type="text/javascript" src="https://code.jquery.com/jquery.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	
	<spring:url value="/resources/generic_responsive.js" var="generic_responsiveJS" />
	<spring:url value="/resources/jquery.min.js" var="jqueryminJS" />
	<spring:url value="/resources/master.min.js" var="masterminJS" />
	<spring:url value="/resources/master.responsive.js" var="masterResponsiveJS" />
	<spring:url value="/resources/bootstrap.min.js" var="bootstrapminJS" />
	<spring:url value="/resources/components.js" var="componentsJS" />
	<spring:url value="/resources/jquery.customSelect.min.css" var="jqueryCustomSelectminJS" />
	<spring:url value="/resources/jquery.touchSwipe.min.js" var="jqueryTouchSwipeminJS" />
	<spring:url value="/resources/jquerry.js" var="jqueryJS" />
	<spring:url value="/resources/jquerry-ui.js" var="jqueryUIJS" />
	<spring:url value="/resources/jjquery-1.12.4.js" var="jquery1124JS" />
	
	<script src="${generic_responsiveJS}"></script>
    <script src="${jqueryminJS}"></script>
    <script src="${masterminJS}"></script>
    <script src="${masterResponsiveJS}"></script>
    <script src="${bootstrapminJS}"></script>
    <script src="${componentsJS}"></script>
    <script src="${jqueryCustomSelectminJS}"></script>
    <script src="${jqueryTouchSwipeminJS}"></script>
    <script src="${jqueryJS}"></script>
    <script src="${jqueryUIJS}"></script>
    <script src="${jquery1124JS}"></script>
    
    <link rel="shortcut icon" type="image/png" href="http://aticserver.com/aticser/logo_gene2.ico"/>
		<link rel="shortcut icon" type="image/png" href="http://aticserver.com/aticser/logo_gene2.ico"/>
    
	
<%-- 	<script type="text/javascript">
			<% 
				System.out.println("ARE YOU ENTERING HERE");
			
				String hash = (String)request.getAttribute("hash");
				System.out.println("hash is " + hash);
				
				CiutadanoDAO.updateEncuestado(hash);
			
			%>
	</script> --%>
	
</head>
<body>

	<div class="contenidor unfixed">
	<header class="fons_header navbar navbar-default z-index-menu negre">
		<div class="logo_header">
		  <a href="http://web.gencat.cat" title="Generalitat de Catalunya" alt="Generalitat de Catalunya" ><img src="http://aticserver.com/aticser/logo_geneb.png" alt="Logo Generalitat de Catalunya" title="Logo Generalitat de Catalunya"></a>
		</div>	
		<div class="titol">
			<h1 class="blanc">Departament d'Afers i Relacions Insitucionals i Exteriors i Transparència</h1>
		</div>
		<div class="lupa">
			<input type="text">&nbsp;<img src="http://aticserver.com/aticser/lupa.png" alt="Cercador" title="Cercar">
		</div>	
	</header>
	</div>
	
	<div class = "main bgGrey" ">
			<h1 style="font-size:30pt; ">Gràcies per donar-se de baixa, ha sigut eliminat de la nostra base de dades.</h1>
	</div>
	
	<form name="myRedirectForm" id="myRedirectForm" action="https://es.surveymonkey.com/r/MZ8LJPJ">
		<noscript>
		
	        <input type="submit" value="Click here to continue" />
	    </noscript>
	
	</form>
    
    <!-- <script type="text/javascript">
    window.onload=function(){
        var auto = setTimeout(function(){ autoRefresh(); }, 100);

        function submitform(){
          /* alert('test'); */
          document.forms["myRedirectForm"].submit();
        }

        function autoRefresh(){
           clearTimeout(auto);
           auto = setTimeout(function(){ submitform(); autoRefresh(); }, 500);
        }
    }
	</script> -->
	
	<div class="fons_footer ">
  <footer class="container center-block shadowBox2">
  
    <div class="avis_legal"> 
        
        <a href="http://web.gencat.cat" title="Generalitat de Catalunya" alt="Generalitat de Catalunya" ><img src="http://aticserver.com/aticser/logo_gene.png<%-- ${imageLogoGencat} --%>" alt="Generalitat de Catalunya" title="Generalitat de Catalunya"></a>
          <p ><a title="Av&iacute;s legal" href="http://web.gencat.cat/ca/ajuda/avis_legal"><span>Av&iacute;s legal:</span></a>La &#169;Generalitat de Catalunya permet la reutilitzaci&#243; de les dades sempre que se'n citi la font i la data d&apos;actualitzaci&#243;, que no es desnaturalitzi la informaci&#243; i que no es contradigui amb una llic&#232;ncia espec&#237;fica.</p>
        </div>
        
  </footer>
	</div>
    
    
    
</body>
</html>