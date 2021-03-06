<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html">
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<meta name="description" content="Demo front end">
		<meta name="keywords" content="demo html css bootstrap taln">
		<meta name="author" content="Viktor Stefanovski">
	<title>Generalitat de Catalunya</title>
	<style>
	.paragraf_contacte {width:100%;}
	</style>
	
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<!-- <script src='https://www.google.com/recaptcha/api.js'></script> -->
	
	<script type="text/javascript">
	  var onloadCallback = function() {
	    alert("grecaptcha is ready!");
	  };
	</script>
	
<%-- 	<%@ page import="net.tanesha.recaptcha.ReCaptcha"%>
	<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory"%> --%>
	
	<%@ page import="java.util.List" %>
	
<%-- 	<%@page import="com.captcha.botdetect.web.servlet.Captcha"%> --%>
	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	  <link rel="stylesheet" href="/resources/demos/style.css">
	  <link href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	  
	  
	  <link rel="shortcut icon" type="image/png" href="http://aticserver.com/aticser/logo_gene2.ico"/>
		<link rel="shortcut icon" type="image/png" href="http://aticserver.com/aticser/logo_gene2.ico"/>
		

	  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	  <script>
	  $( function() {
	    $( "#datepicker" ).datepicker();
	  } );
	  </script>
	
	<!-- CSS Custom -->
	
	<spring:url value="/resources/FW_Generic.css" var="FW_GenericCSS" />
	<spring:url value="/resources/FW_bootStarp_Generic.css" var="FW_bootStarp_GenericCSS" />
	<spring:url value="/resources/master.responsive.css" var="masterResponsiveCSS" />
	<spring:url value="/resources/styles.css" var="stylesCSS" />
	<spring:url value="/resources/images/logo_generalitat_gris.png" var="imageLogoGencat" />
	<spring:url value="/resources/jquerry-ui.css" var="jquerryUICSS" />
	<spring:url value="/resources/errors.css" var="errorsCSS" />
	<spring:url value="/resources/calendar.css" var="calendarCSS" />

	<link href="${FW_bootStarp_GenericCSS}" rel="stylesheet" />
	<link href="${FW_GenericCSS}" rel="stylesheet" />
	<link href="${masterResponsiveCSS}" rel="stylesheet" />
	<link href="${stylesCSS}" rel="stylesheet" />
	<link href="${jquerryUICSS}" rel="stylesheet" />
	<link href="${errorsCSS}" rel="stylesheet" />
	<link href="${calendarCSS}" rel="stylesheet" />
	
	<!-- JS Custom -->
	
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


	<script>
	$(function () {
		$(function () {
			$.datepicker.setDefaults($.datepicker.regional["ca"]);
			$('#DadesNaixementDataNaixement').datepicker('option', 'dateFormat', 'yyyy-mm-dd');
			$("#DadesNaixementDataNaixement").datepicker({
				firstDay: 1,
				maxDate: "+0D",
				yearRange: "1900:+0",
				changeYear: true
			});
		});

	});
	</script>

<link rel="shortcut icon" type="image/x-icon" href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/img/favicon.ico" />
		
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_capcalera/css/capcalera.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_subcapcalera/css/fpca_subcapcalera.css" rel="stylesheet" type="text/css"/>
	
</head>
<body>

			<%
			String hash = (String)request.getAttribute("hash");
			%>
			<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({"gtm.start":new Date().getTime(),event:"gtm.js"});var f=d.getElementsByTagName(s)[0],j=d.createElement(s),dl=l!="dataLayer"?"&l="+l:"";j.async=true;j.src="//www.googletagmanager.com/gtm.js?id="+i+dl;f.parentNode.insertBefore(j,f);})(window,document,"script","dataLayer","GTM-NH8MVLN");</script>
			<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-NH8MVLN" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>			
			<div class="contenidor unfixed">
				<header class="fons_header navbar navbar-default z-index-menu negre">
					<!-- <div class="container">  -->
		<div  id="hTContainer" ><div class="fpca_capcalera container">
			<!--UNO-->
			<div class="row menuNav negre capcaleraFixed">
				<div class="col-md-3 col-xs-2 column visible-xs coloca">
					<button type="button" onclick="amunt();" title="Menú" class="navbar-toggle pull-left collapsed" data-toggle="collapse" data-target=".navbar-collapse">
						<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>
					</button>
				</div>
				<div class="col-md-3 col-xs-8 col-offset-2 column visible-xs">
								<a href="/ca/" class="mvlogo titol-cap-nou car70" title="Departament d'Afers i Relacions Institucionals i Exteriors i Transparència">
											Departament d'Afers i Relacions Institucionals i Exteriors i Transparència</a>										
										</div>
							<div class="col-md-3 col-xs-2 column visible-xs coloca1">
						<button onclick="amunt();" type="button"
							title="Cerca" class="ico_cerca"
							data-toggle="collapse" data-target=".dos"></button>
					</div>
				</div>
		<div class="visible-xs pt_capcalera">&nbsp;</div>
		<!--DOS-->
		<div class="collapse dos">
				<div class="shadowBox">
					<form class="navbar-form navbar-left primer"
						action="/ca/cercador/" method="get">
						<div class="form-group">
							<label class="hidden" for="cercaMobil">Cerca</label> <input type="text"
								class="form-control" name="q" id="cercaMobil"
								title="Tràmits, departaments, serveis..."
								value="" >
							<button type="reset"
								title="Esborra"
								class="btn btn-default"></button>
							<input type="submit" class="ocult"
								name="Cerca"
								value="Cerca">
							<input type="hidden" value="exteriors" name="site">
								</div>
					</form>
				</div>
			</div>
		<!--Tres-->
		<nav class="navbar-collapse navbar-ex1-collapse collapse"
			id="topRight">
			<div class="row">
				<div class="col-md-6 col-sm-4 column">
					<a class="img-responsive logo" title="Generalitat de Catalunya" href="http://web.gencat.cat/">gencat.cat</a>
						<button class="menu_tancar visible-xs collapsed"
						data-target=".navbar-collapse" data-toggle="collapse"
						title="Tanca"></button>
				</div>

				<div class="col-md-6 col-sm-8 column hidden-xs hidden-mg">
					<form class="navbar-form cercador_vermell hidden-xs pull-right"
							action="/ca/cercador/" method="get">
							<div class="form-group">
								<label class="hidden" for="cerca2">Cerca</label> <input id="cerca2"
									class="form-control" type="text"
									value="" name="q" 
									title="Cerca"> <input
									class="btn btn-default" type="submit"
									title="Cerca" value="">
									<input type="hidden" value="exteriors" name="site">
										</div>
						</form>
					<ul class="idioma">
							<li><a title="Castellano" href="/sites/exteriors/es/ambits-dactuacio/afers_exteriors/catalans-i-catalanes-exterior/registre/index.html">es</a></li>
						</ul>
					</div>

			</div>
			
			<div class="row hidden-xs">
							<div class="col-xs-12" id="nomPortal">
									<a 
										href="/ca/"
										class="titol-cap-nou car61-78">Departament d'Afers i Relacions Institucionals i Exteriors i Transparència</a>
								</div>
						</div>
					<ul class="nav navbar-nav">
				<li class="">
						<a 
							target="_self" 
							class="dropdown-toggle" 
							href="/ca/inici/"
							data-toggle="" 
							title="Menú&nbsp;Inici">
							Inici</a>
						<div class="dropdown-menu">
							<div class="shadowBox">
								<!-- <div class="shadow"></div> -->
								<div class="centrat">
									<a title="Tanca" class="pull_right tancar hidden-xs"><img
										src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_capcalera/img/NG_boto_tancar.png"
										alt="Tanca"></a>
										
										</div>
							</div>
						</div>
					</li>
			<li class="dropdown">
						<a 
							target="_self" 
							class="dropdown-toggle" 
							href="/ca/departament/"
							data-toggle="dropdown" 
							title="Menú&nbsp;Departament">
							Departament<div class="caret"></div></a>
						<div class="dropdown-menu">
							<div class="shadowBox">
								<!-- <div class="shadow"></div> -->
								<div class="centrat">
									<a title="Tanca" class="pull_right tancar hidden-xs"><img
										src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_capcalera/img/NG_boto_tancar.png"
										alt="Tanca"></a>
										
										<ul class="col-sm-4 col-md-3 col_left">
											<li class="dropdown dropdown-submenu first ">
												<a
													target="_self" 
													title="Departament"
													class="dropdown-toggle first" 
													href="/ca/departament/">
													Departament</a>
												</li>
												
												<li class="dropdown dropdown-submenu ">
															<a
																title="Adreces i telèfons" 
																class="dropdown-toggle"
																href="/ca/departament/adreces-i-telefons/">
																Adreces i telèfons</a> 
															</li>
												<li class="dropdown dropdown-submenu ">
															<a
																title="El conseller d&#039;Afers Exteriors, Relacions Institucionals i Transparència" 
																class="dropdown-toggle"
																href="/ca/departament/el-conseller/">
																El conseller d'Afers Exteriors, Relacions Institucionals i Transparència</a> 
															</li>
												<li class="dropdown dropdown-submenu ">
															<a
																title="Organització" 
																class="dropdown-toggle"
																href="/ca/departament/organitzacio/">
																Organització</a> 
															</li>
												<li class="dropdown dropdown-submenu ">
															<a
																title="Ofertes de treball" 
																class="dropdown-toggle"
																href="/ca/departament/ofertes-treball/">
																Ofertes de treball</a> 
															</li>
												<li class="dropdown dropdown-submenu ">
															<a
																title="Sector públic" 
																class="dropdown-toggle"
																href="/ca/departament/sector-public/">
																Sector públic</a> 
															</li>
												</ul>
										<div class="col-sm-4 col-md-6 col_left no-pd">
												<ul class="col-sm-12 col-md-6">
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Codi de conducta dels alts càrrecs" 
																	class="dropdown-toggle"
																	href="/ca/departament/codi-conducta-alts-carrecs/">
																		Codi de conducta dels alts càrrecs</a> 
																</li>
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Convenis" 
																	class="dropdown-toggle"
																	href="/ca/departament/convenis/">
																		Convenis</a> 
																</li>
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Memòries" 
																	class="dropdown-toggle"
																	href="/ca/departament/memories/">
																		Memòries</a> 
																</li>
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Normativa" 
																	class="dropdown-toggle"
																	href="/ca/departament/normativa/">
																		Normativa</a> 
																</li>
													</ul>
												<ul class="col-sm-12 col-md-6">
												<li class="dropdown dropdown-submenu ">
																<a
																	title="Plans" 
																	class="dropdown-toggle"
																	href="/ca/departament/plans/">
																		Plans</a> 
																</li>
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Premis" 
																	class="dropdown-toggle"
																	href="/ca/departament/premis/">
																		Premis</a> 
																</li>
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Publicacions" 
																	class="dropdown-toggle"
																	href="/ca/departament/publicacions/">
																		Publicacions</a> 
																</li>
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Subvencions" 
																	class="dropdown-toggle"
																	href="/ca/departament/subvencions/">
																		Subvencions</a> 
																</li>
													</ul>
											</div>
										</div>
							</div>
						</div>
					</li>
			<li class="dropdown actiu">
						<a 
							target="_self" 
							class="dropdown-toggle actiu" 
							href="/ca/ambits-dactuacio/"
							data-toggle="dropdown" 
							title="Menú&nbsp;Àmbits d&#039;actuació">
							Àmbits d'actuació<div class="caret"></div></a>
						<div class="dropdown-menu">
							<div class="shadowBox">
								<!-- <div class="shadow"></div> -->
								<div class="centrat">
									<a title="Tanca" class="pull_right tancar hidden-xs"><img
										src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_capcalera/img/NG_boto_tancar.png"
										alt="Tanca"></a>
										
										<ul class="col-sm-4 col-md-3 col_left">
											<li class="dropdown dropdown-submenu first ">
												<a
													target="_self" 
													title="Àmbits d&#039;actuació"
													class="dropdown-toggle first" 
													href="/ca/ambits-dactuacio/">
													Àmbits d'actuació</a>
												</li>
												
												<li class="dropdown dropdown-submenu actiu open">
															<a
																title="Afers exteriors" 
																class="dropdown-toggle"
																href="/ca/ambits-dactuacio/afers_exteriors/">
																Afers exteriors</a> 
															</li>
												<li class="dropdown dropdown-submenu ">
															<a
																title="Contractació pública" 
																class="dropdown-toggle"
																href="/ca/ambits-dactuacio/contractacio-publica/">
																Contractació pública</a> 
															</li>
												<li class="dropdown dropdown-submenu ">
															<a
																title="Cooperació al desenvolupament" 
																class="dropdown-toggle"
																href="http://cooperaciocatalana.gencat.cat/ca/">
																Cooperació al desenvolupament</a> 
															</li>
												</ul>
										<div class="col-sm-4 col-md-6 col_left no-pd">
												<ul class="col-sm-12 col-md-6">
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Govern obert" 
																	class="dropdown-toggle"
																	href="/ca/ambits-dactuacio/govern-obert/">
																		Govern obert</a> 
																</li>
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Memòria i història, pau i drets humans" 
																	class="dropdown-toggle"
																	href="/ca/ambits-dactuacio/memoria-pau-i-drets-humans/">
																		Memòria i història, pau i drets humans</a> 
																</li>
													</ul>
												<ul class="col-sm-12 col-md-6">
												<li class="dropdown dropdown-submenu ">
																<a
																	title="Sostenibilitat" 
																	class="dropdown-toggle"
																	href="http://cads.gencat.cat">
																		Sostenibilitat</a> 
																</li>
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Relacions institucionals" 
																	class="dropdown-toggle"
																	href="/ca/ambits-dactuacio/relacions-institucionals/">
																		Relacions institucionals</a> 
																</li>
													</ul>
											</div>
										</div>
							</div>
						</div>
					</li>
			<li class="dropdown">
						<a 
							target="_self" 
							class="dropdown-toggle" 
							href="/ca/tramits/"
							data-toggle="dropdown" 
							title="Menú&nbsp;Tràmits">
							Tràmits<div class="caret"></div></a>
						<div class="dropdown-menu">
							<div class="shadowBox">
								<!-- <div class="shadow"></div> -->
								<div class="centrat">
									<a title="Tanca" class="pull_right tancar hidden-xs"><img
										src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_capcalera/img/NG_boto_tancar.png"
										alt="Tanca"></a>
										
										<ul class="col-sm-4 col-md-3 col_left">
											<li class="dropdown dropdown-submenu first ">
												<a
													target="_self" 
													title="Tràmits"
													class="dropdown-toggle first" 
													href="/ca/tramits/">
													Tràmits</a>
												</li>
												
												<li class="dropdown dropdown-submenu ">
															<a
																title="Cercador" 
																class="dropdown-toggle"
																href="/ca/tramits/cercador/">
																Cercador</a> 
															</li>
												<li class="dropdown dropdown-submenu ">
															<a
																title="Tràmits per temes" 
																class="dropdown-toggle"
																href="/ca/tramits/tramits-temes/">
																Tràmits per temes</a> 
															</li>
												</ul>
										<div class="col-sm-4 col-md-6 col_left no-pd">
												<ul class="col-sm-12 col-md-6">
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Tràmits per perfils" 
																	class="dropdown-toggle"
																	href="/ca/tramits/tramits-temes/?filtreResp=p">
																		Tràmits per perfils</a> 
																</li>
													</ul>
												<ul class="col-sm-12 col-md-6">
												<li class="dropdown dropdown-submenu ">
																<a
																	title="Tràmits per tipus" 
																	class="dropdown-toggle"
																	href="/ca/tramits/tramits-temes/?filtreResp=t">
																		Tràmits per tipus</a> 
																</li>
													</ul>
											</div>
										</div>
							</div>
						</div>
					</li>
			<li class="dropdown">
						<a 
							target="_self" 
							class="dropdown-toggle" 
							href="/ca/actualitat/"
							data-toggle="dropdown" 
							title="Menú&nbsp;Actualitat">
							Actualitat<div class="caret"></div></a>
						<div class="dropdown-menu">
							<div class="shadowBox">
								<!-- <div class="shadow"></div> -->
								<div class="centrat">
									<a title="Tanca" class="pull_right tancar hidden-xs"><img
										src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_capcalera/img/NG_boto_tancar.png"
										alt="Tanca"></a>
										
										<ul class="col-sm-4 col-md-3 col_left">
											<li class="dropdown dropdown-submenu first ">
												<a
													target="_self" 
													title="Actualitat"
													class="dropdown-toggle first" 
													href="/ca/actualitat/">
													Actualitat</a>
												</li>
												
												<li class="dropdown dropdown-submenu ">
															<a
																title="Butlletins" 
																class="dropdown-toggle"
																href="/ca/actualitat/butlletins/">
																Butlletins</a> 
															</li>
												<li class="dropdown dropdown-submenu ">
															<a
																title="Notes de context" 
																class="dropdown-toggle"
																href="/ca/actualitat/notes-de-context/">
																Notes de context</a> 
															</li>
												</ul>
										<div class="col-sm-4 col-md-6 col_left no-pd">
												<ul class="col-sm-12 col-md-6">
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Xarxes socials" 
																	class="dropdown-toggle"
																	href="/ca/actualitat/xarxes-socials/">
																		Xarxes socials</a> 
																</li>
													</ul>
												<ul class="col-sm-12 col-md-6">
												<li class="dropdown dropdown-submenu ">
																<a
																	title="RSS" 
																	class="dropdown-toggle"
																	href="/ca/actualitat/rss/">
																		RSS</a> 
																</li>
													</ul>
											</div>
										</div>
							</div>
						</div>
					</li>
			<li class="dropdown">
						<a 
							target="_self" 
							class="dropdown-toggle" 
							href="https://ovt.gencat.cat/gsitfc/AppJava/generic/conqxsGeneric.do?set-locale=ca_ES&amp;webFormId=551"
							data-toggle="dropdown" 
							title="Menú&nbsp;Contacte">
							Contacte<div class="caret"></div></a>
						<div class="dropdown-menu">
							<div class="shadowBox">
								<!-- <div class="shadow"></div> -->
								<div class="centrat">
									<a title="Tanca" class="pull_right tancar hidden-xs"><img
										src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_capcalera/img/NG_boto_tancar.png"
										alt="Tanca"></a>
										
										<ul class="col-sm-4 col-md-3 col_left">
											<li class="dropdown dropdown-submenu first ">
												<a
													target="_self" 
													title="Contacte"
													class="dropdown-toggle first" 
													href="https://ovt.gencat.cat/gsitfc/AppJava/generic/conqxsGeneric.do?set-locale=ca_ES&amp;webFormId=551">
													Contacte</a>
												</li>
												
												<li class="dropdown dropdown-submenu ">
															<a
																title="Bústia de contacte" 
																class="dropdown-toggle"
																href="https://ovt.gencat.cat/gsitfc/AppJava/generic/conqxsGeneric.do?set-locale=ca_ES&amp;webFormId=551">
																Bústia de contacte</a> 
															</li>
												</ul>
										<div class="col-sm-4 col-md-6 col_left no-pd">
												<ul class="col-sm-12 col-md-6">
													<li class="dropdown dropdown-submenu ">
																<a
																	title="Adreces i telèfons" 
																	class="dropdown-toggle"
																	href="/ca/departament/adreces-i-telefons/index.html">
																		Adreces i telèfons</a> 
																</li>
													</ul>
												</div>
										</div>
							</div>
						</div>
					</li>
			</ul>
			
			</nav>
		</div>
	</div><!-- </div> -->
</header>
			</div>
			<div class="border-start bgGrey">
				<div  id="impacteContainer" >
<!--  texto  -->		
			<div class="fpca_subcapcalera bgGrey">
			
				<div class="container">
			    	<div class="row">
			        	<div class="capcelera_basica col-sm-12">
			            	<div class="capcelera_basica_cont">
			            		
									<ul class="list-group llistat_xarxes_socials header col-xs-3 col-md-12 clearfix-md">
										<li class="list-group-item social_text comparteix visible-xs"><strong>Comparteix a:</strong></li>
				                		<li class="list-group-item"><a class="twitter eventTwitter" href="#" title="Comparteix a Twitter"><img alt="Comparteix a Twitter" src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_subcapcalera/img/NG_ico_twitter.png"></a></li>
				                  		<li class="list-group-item"><a class="facebook eventFacebook" href="#" title="Comparteix a Facebook"><img alt="Comparteix a Facebook" src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_subcapcalera/img/NG_ico_facebook.png"></a></li>
				                  		
											
											
												<li class="list-group-item hidden-lg"><a class="whatsapp" href="whatsapp://send?text=http://exteriors.gencat.cat/ca/ambits-dactuacio/afers_exteriors/catalans-i-catalanes-exterior/registre/index.html" title="Comparteix a WhatsApp"><img alt="Comparteix a WhatsApp" src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_subcapcalera/img/NG_ico_whatsapp.png"></a></li>
											
										
										<li class="list-group-item hidden-xs" id="e-amic">
									<div class="menu_flotant menu_enviar_amic">
							               <button class="collapsed" type="button" data-toggle="collapse" data-target="#formulari_envia" id="enviarAmicTab">						
							                       <img src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_subcapcalera/img/NG_ico_enviaemail.png" alt="Envia" title="Envia">
							              </button>                      
							               <div class="collapse" id="formulari_envia">
							                   <div class="panel-group" id="acordio_menu_flotant">
							                   <div id="resultMailAmic" style="display:none">
													<div id="msgOK" style="display:none">El missatge s'ha enviat correctament.</div>
													<div id="msgKO" style="display:none">No s'ha pogut realitzar l'enviament. Si us plau, proveu-ho més tard.</div>
													<button class="btn bgRed white margin_top_xs" type="button" id="OKMailAmic" title="Tancar">Tancar</button>
												</div>
							                       <form class="formAmic1" role="form" action="http://formularis.gencat.cat/gencat_forms/AppJava/submitFormulari.do" method="post">
							                       <div class="panel panel-default">
							                       		<input type="hidden" value="" name="url" id="urlPage">
							                       		<input type="hidden" value="Registre de catalans i catalanes residents a l'exterior" name="titol" id="titolpagina">
							                           <div class="panel-heading">
							                           		<span>Envia per correu electrònic</span>
							                       			<div class="clarification"><p>* Camps obligatoris</p></div>
							                              	<ul>
							                                   <li>
							                                       <label for="nomF">El vostre nom </label>
							                                       <input class="form-control" type="text" value="" name="nom" title="El vostre nom" id="nomF">
							                                       <div class="displaynone red clarification" id="msgNameError">Cal introduir el nom</div>
							                                   </li>
							                                   <li>
							                                       <label for="mailClientF">Adreça de correu electrònic del destinatari </label>
							                                       <input class="form-control" type="email" value="" name="correu_destinatari" title="Adreça de correu electrònic del destinatari" id="mailClientF">
							                                        <div class="displaynone red clarification" id="msgEmailError">El correu no és vàlid</div>
							                                   </li>
							                                   <li>
							                                      <label for="misatgeF">Missatge</label>
							                                      <textarea name="text" rows="2" class="form-control" id="misatgeF" title="Missatge"></textarea>
							                                   </li>
															  <li>
															   		<input id="codeCaptchaAmic" type="hidden" value="#" name="captchaCode"/>
																	<img alt="captcha refresh" id="refreshKaptchaImageAmic" src="http://formularis.gencat.cat/gencat_forms/images/refrescar.png" style="vertical-align: top; cursor:pointer;"/>
																	<div id="myCaptcha">
																		<!-- <img alt="captcha image" id="kaptchaImageAmic" src="#" width="200"/> -->
																		<label for="captchaAnswerAmic">Introduïu el text de la imatge </label>
																		<input type="text" id="captchaAnswerAmic" name="captchaAnswer"/>
																		<div class="displaynone red clarification" id="msgCaptchaError">Introduïu el text de la imatge</div>
																	</div>
																	<script type="text/javascript">$(function(){$("#refreshKaptchaImageAmic").click(function () {var valor=Math.floor(Math.random()*1000000000);$("#codeCaptchaAmic").attr("value",valor);$("#kaptchaImageAmic").hide().attr("src", "http://formularis.gencat.cat/gencat_forms/AppJava/generarKaptcha?kaptchaCode="+valor).fadeIn();$("#captchaAnswerAmic").attr("value","");});});</script>
															   </li>
							                                   <li>
							                                       <button type="submit" class="btn bgRed white margin_top_xs" title="Envia" id="sendMailAmic">Envia</button>
							                                   </li>
							                                </ul>
							                           </div>
							                       </div>
												   <input type="hidden" value="ca" name="idioma" id="idioma">
												   <input type="hidden" value="44457" name="idFormulari" id="idFormulari">
							                       </form>
							                   </div>
							               </div>
							           </div>
							   		 </li>
				                  		<li class="list-group-item"><a class="print" href="#" onclick="window.print();return false;" title="Imprimeix"><img alt="Imprimeix" src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_subcapcalera/img/NG_ico_print.png"></a></li>
				               		</ul>
	
										<ol class="breadcrumb filariana hidden-xs">

												 			<li><a title="Torna: Inici" href="/ca/">Inici</a></li>
					
												 			<li><a title="Torna: Àmbits d'actuació" href="/ca/ambits-dactuacio/">Àmbits d'actuació</a></li>
					
												 			<li><a title="Torna: Afers exteriors" href="/ca/ambits-dactuacio/afers_exteriors/">Afers exteriors</a></li>
						
												 			<li><a title="Torna: Catalans i catalanes a l'exterior" href="/ca/ambits-dactuacio/afers_exteriors/catalans-i-catalanes-exterior/">Catalans i catalanes a ...</a></li>
												
															<li>Catalans i catalanes residents a l&#039;exterior: Enquestes</li>
				
					               		</ol>
				               		
			            	</div>
			         	</div>
			      	</div>
			   	</div>
		   	</div>
			
	
		

	
<script>//Para cambiar el enlace de compartir por Whatsapp en p�ginas de detalle
	 $(document).ready(function() {
		 var nameUrl = window.location.href;
		 $('.whatsapp').prop('href','whatsapp://send?text='+nameUrl);
	 });
</script>
	
</div></div>
			<section class="padding-xs padding-sm padding-md colorSectionEven">
							<article class="container fullcontainer-xs">
								<div class="row">
									<div>
									

	<%

   		String classListBirthDate = "form-control ";
		String classListSelectDoc = "form-control custom_select ";
		String classListSelectMun = "form-control custom_select ";
		String classListInputFirstName = "form-control ";
		String classListInputLastName = "form-control ";
		String classListInputLastName2 = "form-control ";
		String classListInputNumDoc = "form-control ";
		
		boolean isFirstName = false;
		boolean isLastName = false;
		boolean isLastName2 = false;
		boolean isTypeDocument = false;
		boolean isDocNumber = false;
		boolean isBirthData = false;
		boolean isMunicipio = false;
		
		isFirstName = (Boolean)request.getAttribute("isFirstName");
		isLastName = (Boolean)request.getAttribute("isLastName");
		isLastName2 = (Boolean)request.getAttribute("isLastName2");
		isTypeDocument = (Boolean)request.getAttribute("isTypeDocument");
		isDocNumber = (Boolean)request.getAttribute("isDocNumber");
		isBirthData = (Boolean)request.getAttribute("isBirthData");
		isMunicipio = (Boolean)request.getAttribute("isMunicipio");
		
		String firstName = "";
		String lastName = "";
		String lastName2 = "";
		int typoDocument = 0;
		String documentNumber = "";
		String birthDate = "";
		String municipio = "";
		
		firstName = (String)request.getAttribute("firstName");
		lastName = (String)request.getAttribute("lastName1");
		lastName2 = (String)request.getAttribute("lastName2");
		typoDocument = (Integer)request.getAttribute("authDocType1");
		documentNumber = (String)request.getAttribute("authDoc1Value");
		birthDate = (String)request.getAttribute("birthDate");
		municipio = (String)request.getAttribute("municipo");
		
		String valueFirstName = "";
		String valueLastName = "";
		String valueLastName2 = "";
		int valueTypoDocument = 0;
		String valueDocNumber = "";
		String valueBirthDate = "";
		String valueMunicipality = "";
		
		System.out.println("First name " + isFirstName);
		System.out.println("Last name " + isLastName);
		System.out.println("Last name 2" + isLastName);
		System.out.println("Type Document " + isTypeDocument);
		System.out.println("Type Document value " + typoDocument);
		System.out.println("Number Document " + isDocNumber);
		System.out.println("Birth date " + isBirthData);
		System.out.println("Municipality " + isMunicipio);
		System.out.println("Municipality value " + municipio);
		
   		if (isFirstName == false) {
   			classListInputFirstName += "error-form item-error";
   			System.out.println("Classes of first name in " + classListInputFirstName);
   		}else {
   			valueFirstName = firstName;
   		}
   		
   		System.out.println("Classes of first name " + classListInputFirstName);
   		
   		if (isLastName == false) {
   			classListInputLastName += "error-form item-error";
   		} else {
   			valueLastName = lastName;
   		}
   		
   		if (isLastName2 == false) {
   			classListInputLastName2 += "error-form item-error";
   		} else if (lastName2 == "empty"){
   			valueLastName2 = "";
   		} else {
   			valueLastName2 = lastName2;
   		}
   		
   		if (isTypeDocument == false) {
   			classListSelectDoc += "error-form item-error";
   		} else {
   			valueTypoDocument = typoDocument;
   		}
   		
   		if (isDocNumber == false) {
   			classListInputNumDoc += "error-form item-error";
   		} else {
   			valueDocNumber = documentNumber;
   		}
   		
   		if (isBirthData == false) {
   			classListBirthDate += "error-form item-error";
   		} else {
   			valueBirthDate = birthDate;
   		}
   		
   		if (isMunicipio == false) {
   			classListSelectMun += "error-form item-error";
   		} else {
   			valueMunicipality = municipio;
   		}
	%>

	
	<div class="validacion">
		<div class="validacion clearfix container">
		<h1 class="title_left">Benvingut/da al nostre portal d'identificació</h1>
		
	</div>	
	
	<form action="survey" commandName="userForm" accept-charset="UTF-8"> <!-- action="process.jsp" -->
	
	<div class="bgGrey clearfix container">
	
	<div class="bgGrey2">
		<p> Per validar-se s'ha d'omplir el formulari correctament, amb els camps obligatoris especificats amb un * i  en cas d'error es marcarà  en color vermell. </p>
		<p><small><em>Tindreu 4 intents per validar les vostres dades. En cas d'error tots els camps sortiran ressaltats en vermell.</em></small></p>
		<p><small><em>En el cas que no recordeu les vostres dades amb les auqls et vas inscriure al registre, pots demanar un certificat d'inscripció a registrecatalans.exteriors@gencat.cat</em></small></p>
	</div>	
	
	<div class="form col-xs-col-sm-9">

		<div class="col-xs-12 reset-only-xs clearfix">
                	<div class="col-xs-12 col-sm-12 clearfix-xs">
	                   
	                   	<div id="webForm.lastName1">
	                	<div id="webForm.firstName">
		                <div id="webForm.lastName2">
	                   	          
		             		<div  class="col-xs-12 col-md-4 a">
			              		<label for="nom">
									Nom
				                  	
				                  		 
				                  	
			                  	</label> 
			                  	<div id="error.form">
			                  		<input type="text" name="firstName" maxlength="100" value="<%=valueFirstName%>" id="nom" class="<%=classListInputFirstName%> a" />
								</div>
							</div>
							
			              	<div  class="col-xs-12 col-md-4 a">
			            		<label for="primercognom">
									Primer cognom
			                   		
										 
									
								</label> 
								
									<div id="error.form">
			             				<input type="text" name="lastName1" maxlength="200" value="<%=valueLastName%>" id="primercognom" class="<%=classListInputLastName%>" />
			             			</div>			             		

			             	</div>

							<div  class="col-xs-12 col-md-4 ">                  	
								<label for="segoncognom">
									Segon cognom
									
										 
			                      	
								</label> 
								
									<div id="error.form">
			             				<input type="text" name="lastName2" maxlength="200" value="<%=valueLastName2%>" id="segoncognom" class="<%=classListInputLastName2%>" />
			             			</div>
			            	</div>
			         	
         				</div></div></div>
					</div>
					
					<div id="doc.validate.error.no.doc.value">
				        	<div id="webForm.personal.doc">
				        	<div id="conqxsmanager.authDoc1Type.value">
				        	<div id="errors.doc.validate"> 
				        	<div id="conqxsmanager.error.only.cif"> 
						    	
					         		<div id="labelCountrySelectDiv" class="hidden">
									</div>
						        
							        <div id="error.form" class="col-xs-12 col-md-6">
							        	<label for="descIdentSelect">
							    			Tipus de document d'identitat personal
								    	
								    		 
								    	
						       			</label>
							            <select name="authDocType1" id="descIdentSelect" class="<%=classListSelectDoc%>">
							            	<option value="0" ${role == selectedRole ? 'selected' : ''}>[Seleccioneu]</option>
											<option value="11">DNI</option>
											<option value="22">Passaport</option>
										</select>
							        </div>
						      
						         
						        <div id="error.div" class="col-xs-12 col-md-6" >
						        	<label for="docidentif">Número de document  </label>
						            <input type="text" name="authDoc1Value" maxlength="50" value="<%=valueDocNumber%>" id="docIdentValue" class="<%=classListInputNumDoc%>" />
								</div>
					            </div>
				            </div>
				            </div>
				            </div>
				            </div>
				            </div>
				    
				      	
				      	<div class="col-xs-12 col-md-6">
							<div class="form-group">
								<label class="form-label required">Data de naixement </label> <input
									id="DadesNaixementDataNaixement"
									name="birthDate"
									class="<%=classListBirthDate%>" maxlength="10">
							</div>
						</div>
				      	
				    
				    <div id="munic.form" class="col-xs-12 col-md-6 municip">
							        	<label for="municSelect">
							    			Últim municipi de residència a Catalunya
								    		 
						       			</label>
							            <select name="municipo" id="municSelect" class="<%=classListSelectMun%>">
							            	<option value="0">[Seleccioneu]</option>
							            	
							            	<% 
												List<String> listMun = (List<String>)request.getAttribute("listMun");
							        			List<String> listMunCP = (List<String>)request.getAttribute("listMunCP");
							        			
							        			
												for (int i = 0; i< listMun.size(); i++) {
														String currentName = listMun.get(i);
														String currentMunCP = listMunCP.get(i);
													%>
													<option value=<%=currentMunCP%>><%=currentName%></option>
													<%
												}
											%>
							            
										</select>
										
										<%-- <select name="municipo2" id="municSelect2" class="form-control custom_select">
							            	<option value="0">[Selecciona]</option>

											<% 
												
							        			List<String> listMunCP = (List<String>)request.getAttribute("listMunCP");
							        			
												for (int i = 0; i< listMunCP.size(); i++) {
													
													String currentMunCP = listMunCP.get(i);
													%>
													<option value=<%=currentMunCP%>><%=currentMunCP%></option>
													<%
												}
											%>
							            	
										</select> --%>
										
										<!-- <div class="g-recaptcha" data-sitekey="6LdiXyQUAAAAAPYuf-_yprmAJjRdwjWIXatgRNkP"></div> -->
										
										<%-- <%
										  // Adding BotDetect Captcha to the page
										  Captcha captcha = Captcha.load(request, "exampleCaptcha");
										  captcha.setUserInputID("captchaCode");
										
										  String captchaHtml = captcha.getHtml();
										  out.write(captchaHtml);
										%>
										
										<%-- <input id="captchaCode" type="text" name="captchaCode" /> --%>
										</br>
<%-- 										<%
								          //ReCaptcha c = ReCaptchaFactory.newReCaptcha("your_public_key", "your_private_key", false);
								          ReCaptcha captcha = ReCaptchaFactory.newReCaptcha("6LeqYiQUAAAAAKPl8sDcE9KV3yjycpYG9B0Y0lY2", "6LeqYiQUAAAAADjSY3_fq-dN0BvgLfQ_F_JqSFwD", false);
								          out.print(captcha.createRecaptchaHtml(null, null));
								        %> --%>
										
										<!-- <div class="g-recaptcha" data-sitekey="your_site_key"></div>
										 -->
							        </div>
							        
					<!-- <div class="form col-xs-12 col-md-12 padding-xs bgWhite">
                    	
                        <div class="padding-bot-xs">
                        	
                            <input type="checkbox" name="solBaja" value="on" id="baja" />
                            <input type="hidden" name="solBaja" value="off" id="bajaHidden" checked/>
                            
                            <div class="checkbox p15-13">
                            	Sol·licitar la baixa de la llista de distribució<sup>1</sup>
                            </div>
                            <br>
                        </div>
                    </div>		 -->	        

				    <div class="form col-xs-12 col-md-12 padding-xs bgWhite">
                    	
                        <!-- <div class="padding-bot-xs">
                        	
                            <input type="checkbox" name="acceptLopd" value="on" onclick="checkLOPD_acceptemSubmitSignat();" id="lopd" />
                            <div class="checkbox p15-13">
                            	Accepto les condicions
                            </div>
                            <br>
                        </div>  -->
                        <input type="text" name="hash" value="<%=hash%>" class="hidden">
                        <input type="submit" name="acceptem" value="Envieu" onclick="" id="acceptemSubmit" class="btn bgRed white margin_top_xs" title="Envia" />  
                        	<% 
								int tryNumber = (Integer)request.getAttribute("counterSur");
								System.out.println("Try number survey is " + tryNumber);
							
								if (tryNumber == 2) {
							%>
								<label for="acceptem" style="font-size: 12pt; color: #c00000">
							    	Teniu 3 intents per a verificar correctament les vostres dades
								    	
								     
								    	
						       	</label>
							
							<% 
								} else if (tryNumber == 3) {
							%>
								<label for="acceptem" style="font-size: 16pt; color: #c00000">
							    	Teniu 2 intents per a verificar correctament les vostres dades
								     
								    	
						       	</label>
							<% 
								} else if (tryNumber == 4) {
							%>
								<label for="acceptem" style="font-size: 20pt; color: #c00000">
							    	Teniu un Últim intent per a verificar correctament les vostres dades
								    	
								     
								    	
						       	</label>
							
								<!-- <p>Tenim una ultima ves para verificar se correctamente</h1>
								
								  -->
							<% 
								} 
							%>
                    </div>
		        
		</div>
		
	</form>
	
	<!-- <div class="col-xs-12 col-md-12 padding-xs bgWhite">
	 <p style="font-size:10pt">
  		<sup>1</sup> Si no voleu participar en futures campanyes, marqueu aquest camp i valideu les vostres dades. 
  	</p>
	</div>	 -->


	
<%-- <div class="fons_footer ">
  <footer class="container center-block shadowBox2">
  
    <div class="avis_legal"> 
        
        <a href="http://web.gencat.cat" title="Generalitat de Catalunya" alt="Generalitat de Catalunya" ><img src="http://aticserver.com/aticser/logo_gene.png${imageLogoGencat}" alt="Generalitat de Catalunya" title="Generalitat de Catalunya"></a>
          <p ><a title="Av&iacute;s legal" href="http://web.gencat.cat/ca/ajuda/avis_legal"><span>Av&iacute;s legal:</span></a>La &#169;Generalitat de Catalunya permet la reutilitzaci&#243; de les dades sempre que se'n citi la font i la data d&apos;actualitzaci&#243;, que no es desnaturalitzi la informaci&#243; i que no es contradigui amb una llic&#232;ncia espec&#237;fica.</p>
        </div>
        
  </footer>
	</div> --%>
	
	
							
						
					
					
					
				
			
		
	
	</div>








    
        </div>
										</div>
							</article>
						</section>
					<section class="padding-xs padding-sm padding-md colorSectionEven">
							<article class="container fullcontainer-xs">
								<div class="row">
									<div>
												<div  id="center_2R" >



















	
	
		
		
			
			

										</div>
							</article>
						</section>
					<div class="container visible-xs oculta_xarxes">
				<div class="row padding-xs">
					<div class="footer-xarxes">
					
					</div>
				</div>
			</div>
			<div class="fons_footer">
				<footer class="container center-block shadowBox2">
					<div class="shadow2"></div>
					<div class="row footer_tab_ord">
						<div  id="fAvisLegal" ><div>
<div class="footer_tab_top">
		

<div class="col-sm-4 col-md-3">
<div >

<div class="fpca_peu_faldoLlista">

		<script>
			function loadOption(url,target){
				if(url!=""){
					setTimeout(function(){window.open(url,target);});	
				}
			}
		</script>

				
					<div class="hidden-xs">
						<select title='Organismes del Departament' class='form-control custom_select hasCustomSelect'><option value= "">Organismes del Departament</option><option value='http://cooperaciocatalana.gencat.cat/ca/'>Agència Catalana de Cooperació al Desenvolupament</option><option value='http://www.idees.net/'>Centre d’Estudis de Temes Contemporanis</option><option value='http://www.en.mhcat.cat/monuments_and_territory/centre_d_historia_contemporania_de_catalunya'>Centre d’Història Contemporània de Catalunya</option><option value='http://cads.gencat.cat/'>Consell Assessor per al Desenvolupament Sostenible</option><option value='http://www.diplocat.cat/ca/'>Diplocat</option><option value='http://icip.gencat.cat/ca/'>Institut Català Internacional per la Pau</option><option value='http://www.iemed.org/'>Institut Europeu de la Mediterrània</option><option value='http://memorialdemocratic.gencat.cat/ca/'>Memorial Democràtic</option><option value='http://www.museuexili.cat/'>Museu Memorial de l'Exili (MUME)</option><option value='/ca/ambits-dactuacio/contractacio-publica/tribunal-catala-de-contractes-del-sector-public/'>Tribunal Català de Contractes del Sector Públic</option></select>
					</div>
					<div class="panel panel-default content_desplegable visible-xs">
						<div class="panel-heading desplegable1">
							<div class="form-group">
								<select title='Organismes del Departament' class='form-control custom_select hasCustomSelect'><option value= "">Organismes del Departament</option><option value='http://cooperaciocatalana.gencat.cat/ca/'>Agència Catalana de Cooperació al Desenvolupament</option><option value='http://www.idees.net/'>Centre d’Estudis de Temes Contemporanis</option><option value='http://www.en.mhcat.cat/monuments_and_territory/centre_d_historia_contemporania_de_catalunya'>Centre d’Història Contemporània de Catalunya</option><option value='http://cads.gencat.cat/'>Consell Assessor per al Desenvolupament Sostenible</option><option value='http://www.diplocat.cat/ca/'>Diplocat</option><option value='http://icip.gencat.cat/ca/'>Institut Català Internacional per la Pau</option><option value='http://www.iemed.org/'>Institut Europeu de la Mediterrània</option><option value='http://memorialdemocratic.gencat.cat/ca/'>Memorial Democràtic</option><option value='http://www.museuexili.cat/'>Museu Memorial de l'Exili (MUME)</option><option value='/ca/ambits-dactuacio/contractacio-publica/tribunal-catala-de-contractes-del-sector-public/'>Tribunal Català de Contractes del Sector Públic</option></select>
							</div>
						</div>
					</div>
				
				
			
		
	
	
	
</div>


<div class="fpca_peu_faldoLlista">

		<script>
			function loadOption(url,target){
				if(url!=""){
					setTimeout(function(){window.open(url,target);});	
				}
			}
		</script>
		
			
					<div class="hidden-xs">
						<ul class="list-group llistat_peu col-md-12">
							
								<li class="list-group-item"><p class="title_list">Directe a</p></li>
							
							<li class="list-group-item bullet"><a title="Delegacions del Govern a l'exterior" href="/ca/ambits-dactuacio/afers_exteriors/delegacions_govern/" target="_self">Delegacions del Govern a l'exterior</a></li><li class="list-group-item bullet"><a title="Dades obertes" href="http://dadesobertes.gencat.cat/ca/" target="_blank">Dades obertes</a></li><li class="list-group-item bullet"><a title="Participa gencat" href="http://participa.gencat.cat/" target="_blank">Participa gencat</a></li><li class="list-group-item bullet"><a title="Cooperació institucional Generalitat – Estat" href="http://governacio.gencat.cat/ca/pgov_ambits_d_actuacio/autogovern/organismes_bilaterals_generalitat-estat/" target="_blank">Cooperació institucional Generalitat – Estat</a></li><li class="list-group-item bullet"><a title="Registre de convenis" href="http://exteriors.gencat.cat/ca/ambits-dactuacio/relacions-institucionals-i-amb-el-parlament/relacions-intergovernamentals/registre-de-convenis-de-collaboracio-i-cooperacio/" target="_self">Registre de convenis</a></li><li class="list-group-item bullet"><a title="Registre de traspassos" href="http://traspassosestat.governacio.gencat.cat/drep_teg/public/portlet.html#/" target="_blank">Registre de traspassos</a></li><li class="list-group-item bullet"><a title="Mapa de fosses i repressió" href="http://fossesirepressio.cat/" target="_blank">Mapa de fosses i repressió</a></li><li class="list-group-item bullet"><a title="El cost humà de la Guerra Civil a Catalunya" href="http://chcc.gencat.cat/ca/projectes_de_recerca/el_cost_huma_de_la_guerra_civil_a_catalunya/" target="_blank">El cost humà de la Guerra Civil a Catalunya</a></li>
						</ul>
					</div>
					<div class="panel-group visible-xs accordionFoot" id="accordionFoot_8798007a-ce4c-11e5-a594-0dca59a3c28a">
						<div class="panel panel-default">
							<div class="panel-heading">
								
									<span class="panel-title nou-peu">
										<a data-toggle="collapse" data-parent="#accordionFoot_8798007a-ce4c-11e5-a594-0dca59a3c28a" class="collapsed acc-peu" href="#collapseFoot_8798007a-ce4c-11e5-a594-0dca59a3c28a">Directe a</a>
							 		 </span>
								
							</div>
							<div id="collapseFoot_8798007a-ce4c-11e5-a594-0dca59a3c28a" class="panel-collapse collapse">
								<div class="panel-body">
									<ul>
									<li><a title="Delegacions del Govern a l'exterior" href="/ca/ambits-dactuacio/afers_exteriors/delegacions_govern/" target="_self">Delegacions del Govern a l'exterior</a></li><li><a title="Dades obertes" href="http://dadesobertes.gencat.cat/ca/" target="_blank">Dades obertes</a></li><li><a title="Participa gencat" href="http://participa.gencat.cat/" target="_blank">Participa gencat</a></li><li><a title="Cooperació institucional Generalitat – Estat" href="http://governacio.gencat.cat/ca/pgov_ambits_d_actuacio/autogovern/organismes_bilaterals_generalitat-estat/" target="_blank">Cooperació institucional Generalitat – Estat</a></li><li><a title="Registre de convenis" href="http://exteriors.gencat.cat/ca/ambits-dactuacio/relacions-institucionals-i-amb-el-parlament/relacions-intergovernamentals/registre-de-convenis-de-collaboracio-i-cooperacio/" target="_self">Registre de convenis</a></li><li><a title="Registre de traspassos" href="http://traspassosestat.governacio.gencat.cat/drep_teg/public/portlet.html#/" target="_blank">Registre de traspassos</a></li><li><a title="Mapa de fosses i repressió" href="http://fossesirepressio.cat/" target="_blank">Mapa de fosses i repressió</a></li><li><a title="El cost humà de la Guerra Civil a Catalunya" href="http://chcc.gencat.cat/ca/projectes_de_recerca/el_cost_huma_de_la_guerra_civil_a_catalunya/" target="_blank">El cost humà de la Guerra Civil a Catalunya</a></li>
									</ul>	
								</div>
							</div>
						</div>
					</div>
				
			
		
	
	
	
</div>

</div>
</div>
<div class="col-xs-7 col-sm-4 col-md-3 col-md-offset-1">
<div >


<div class="fpca_peu_faldoLlista">

	
		<script>
			function loadOption(url,target){
				if(url!=""){
					setTimeout(function(){window.open(url,target);});	
				}
			}
		</script>
		
		
					<div class="hidden-xs">
						<ul class="list-group llistat_peu col-md-12">
							
								<li class="list-group-item"><p class="title_list">Webs més vistos</p></li>
							
							<li class="list-group-item bullet"><a title="Contractació pública" href="/ca/ambits-dactuacio/contractacio-publica/" target="_blank">Contractació pública</a></li><li class="list-group-item bullet"><a title="Fons europeus" href="/ca/ambits-dactuacio/afers_exteriors/ue/fons_europeus/" target="_blank">Fons europeus</a></li><li class="list-group-item bullet"><a title="Portal de la Transparència" href="http://transparencia.gencat.cat/ca/inici/" target="_blank">Portal de la Transparència</a></li><li class="list-group-item bullet"><a title="Transparència de Catalunya" href="http://www.transparenciacatalunya.cat/es/inici/" target="_blank">Transparència de Catalunya</a></li>
						</ul>
					</div>
					<div class="panel-group visible-xs accordionFoot" id="accordionFoot_8798007b-ce4c-11e5-a594-0dca59a3c28a">
						<div class="panel panel-default">
							<div class="panel-heading">
								
									<span class="panel-title nou-peu">
										<a data-toggle="collapse" data-parent="#accordionFoot_8798007b-ce4c-11e5-a594-0dca59a3c28a" class="collapsed acc-peu" href="#collapseFoot_8798007b-ce4c-11e5-a594-0dca59a3c28a">Webs més vistos</a>
							 		 </span>
								
							</div>
							<div id="collapseFoot_8798007b-ce4c-11e5-a594-0dca59a3c28a" class="panel-collapse collapse">
								<div class="panel-body">
									<ul>
									<li><a title="Contractació pública" href="/ca/ambits-dactuacio/contractacio-publica/" target="_blank">Contractació pública</a></li><li><a title="Fons europeus" href="/ca/ambits-dactuacio/afers_exteriors/ue/fons_europeus/" target="_blank">Fons europeus</a></li><li><a title="Portal de la Transparència" href="http://transparencia.gencat.cat/ca/inici/" target="_blank">Portal de la Transparència</a></li><li><a title="Transparència de Catalunya" href="http://www.transparenciacatalunya.cat/es/inici/" target="_blank">Transparència de Catalunya</a></li>
									</ul>	
								</div>
							</div>
						</div>
					</div>	
	
</div>


<div class="fpca_peu_faldoLlista">

		<script>
			function loadOption(url,target){
				if(url!=""){
					setTimeout(function(){window.open(url,target);});	
				}
			}
		</script>

					<div class="hidden-xs">
						<ul class="list-group llistat_peu col-md-12">
							
								<li class="list-group-item"><p class="title_list">Ajuda</p></li>
							
							<li class="list-group-item bullet"><a title="Mapa web" href="/ca/mapa-web/" target="_self">Mapa web</a></li><li class="list-group-item bullet"><a title="Accessibilitat" href="http://web.gencat.cat/ca/menu-ajuda/ajuda/accessibilitat/" target="_blank">Accessibilitat</a></li><li class="list-group-item bullet"><a title="Sobre gencat" href="http://web.gencat.cat/ca/menu-ajuda/ajuda/sobre_gencat/" target="_blank">Sobre gencat</a></li>
						</ul>
					</div>
					<div class="panel-group visible-xs accordionFoot" id="accordionFoot_8798007c-ce4c-11e5-a594-0dca59a3c28a">
						<div class="panel panel-default">
							<div class="panel-heading">
								
									<span class="panel-title nou-peu">
										<a data-toggle="collapse" data-parent="#accordionFoot_8798007c-ce4c-11e5-a594-0dca59a3c28a" class="collapsed acc-peu" href="#collapseFoot_8798007c-ce4c-11e5-a594-0dca59a3c28a">Ajuda</a>
							 		 </span>
								
							</div>
							<div id="collapseFoot_8798007c-ce4c-11e5-a594-0dca59a3c28a" class="panel-collapse collapse">
								<div class="panel-body">
									<ul>
									<li><a title="Mapa web" href="/ca/mapa-web/" target="_self">Mapa web</a></li><li><a title="Accessibilitat" href="http://web.gencat.cat/ca/menu-ajuda/ajuda/accessibilitat/" target="_blank">Accessibilitat</a></li><li><a title="Sobre gencat" href="http://web.gencat.cat/ca/menu-ajuda/ajuda/sobre_gencat/" target="_blank">Sobre gencat</a></li>
									</ul>	
								</div>
							</div>
						</div>
					</div>
				
			
		
	
	
	
</div>

</div>
</div>
<div class="connecta col-xs-12 col-md-4 col-md-offset-1">
<div >

<div class="formatter_body fpca_peu_faldoGiny">

<div class="hidden-xs">
	<div class="clearfix-md">	
		<ul class="list-group"><li class="list-group-item"><p class="title_list">Connecta</p></li></ul><input type="hidden" value="exteriorscat" id="usTwitt">
	<!-- -->
	<div class="twitter hidden-xs formatter_body fpca_peu_faldoGiny">
		<script>
			if (PluginGencat != null) {
				PluginGencat.include("twitter");
				var usu=$("#usTwitt").val();
				PluginGencat.ready(function(){
					PluginGencat.twitter.gets("#twitterFaldo",{
						"username": usu,
						"count":1,
						"template":"{text}",
						"scrollbar":false,
						"height":"auto",
						"retweets":false,
						"header":false,
						"footer":false,
						"fetch": 1,
						"filter":function(tweet){ return ! /^@\w+/.test(tweet.tweet_raw_text) &&  ! /\brt\b/i.test(tweet.tweet_raw_text)}
					});
				});
			};
		</script>
		<div class="twitterBox" id="twitterFaldo">
		</div>
		<div class="neteja">
		</div>
	</div>
	<!-- --><div class="cerca_xarxes"><div class="input-group"><form action="http://web.gencat.cat/ca/generalitat/cercador_organismes/" method="post"><input type="search" class="form-control" title="Cerca" name="Query" onfocus="javascript:this.placeholder='';" onblur="this.placeholder='Cercador d\u0027organismes';" placeholder="Cercador d'organismes"><input type="hidden" class="form-control" name="Nom" value="-1"><input type="hidden" class="form-control" name="Responsable" value="-1"><input type="hidden" class="form-control" name="Poblacio" value="-1"><input type="hidden" class="form-control" name="Cp" value="-1"><input type="hidden" class="form-control" name="Comarca" value="-1"><span class="input-group-btn"><button title="Cerca" class="ico_lupa" type="submit"></button></span></form></div><ul class="list-group llistat_peu list-group1"><li class="list-group-item bullet"><a title="Xarxes socials" href="/ca/actualitat/xarxes-socials/" target='_self'>Xarxes socials</a></li><li class="list-group-item bullet"><a title="Serveis mòbils" href="http://www.gencat.cat/mobils" target='_blank'>Serveis mòbils</a></li><li class="list-group-item bullet"><a title="Butlletins" href="/ca/actualitat/butlletins/" target='_self'>Butlletins</a></li><li class="list-group-item bullet"><a title="Bústia contacte" href="https://ovt.gencat.cat/gsitfc/AppJava/generic/conqxsGeneric.do?set-locale=ca_ES&amp;webFormId=551" target='_self'>Bústia contacte</a></li></ul></div>
	</div>	
</div>




<div class="panel-group visible-xs accordionFoot" id="accordionFoot_8798007e-ce4c-11e5-a594-0dca59a3c28a">
	<div class="panel panel-default">
		<div class="panel-heading">
			
				<span class="panel-title nou-peu">
					<a data-toggle="collapse" data-parent="#accordionFoot_8798007e-ce4c-11e5-a594-0dca59a3c28a" class="collapsed acc-peu" href="#collapseFoot_8798007e-ce4c-11e5-a594-0dca59a3c28a">Connecta</a>
		 		 </span>
			
		</div>
		<div id="collapseFoot_8798007e-ce4c-11e5-a594-0dca59a3c28a" class="conectaFoot panel-collapse collapse">
			<div class="panel-body">
				<div class="input-group"><form action="http://web.gencat.cat/ca/generalitat/cercador_organismes/" method="post"><input type="search" class="form-control" title="Cerca" name="Query" onfocus="javascript:this.placeholder='';" onblur="this.placeholder='Cercador d\u0027organismes';" placeholder="Cercador d'organismes"><input type="hidden" class="form-control" name="Nom" value="-1"><input type="hidden" class="form-control" name="Responsable" value="-1"><input type="hidden" class="form-control" name="Poblacio" value="-1"><input type="hidden" class="form-control" name="Cp" value="-1"><input type="hidden" class="form-control" name="Comarca" value="-1"><span class="input-group-btn"><button title="Cerca" class="ico_lupa" type="submit"></button></span></form></div><ul><li><a title="Xarxes socials" href="/ca/actualitat/xarxes-socials/" target='_self'>Xarxes socials</a></li><li><a title="Serveis mòbils" href="http://www.gencat.cat/mobils" target='_blank'>Serveis mòbils</a></li><li><a title="Butlletins" href="/ca/actualitat/butlletins/" target='_self'>Butlletins</a></li><li><a title="Bústia contacte" href="https://ovt.gencat.cat/gsitfc/AppJava/generic/conqxsGeneric.do?set-locale=ca_ES&amp;webFormId=551" target='_self'>Bústia contacte</a></li></ul>
			</div>
		</div>
	</div>
</div>

</div>


<div class="fpca_peu_faldoSocial formatter_body">
	
				
						<ul class="list-group llistat_xarxes_socials col-xs-3 col-md-12 clearfix-md">
							<li class='list-group-item'><a title='Twitter' target='_blank' class='twitter' href='https://twitter.com/exteriorscat'><img alt="Twitter" src="http://exteriors.gencat.cat/web/resources/webgencat/comuns/img/NG_ico_twitter.png_196546587.png"></a></li><li class='list-group-item'><a title='Facebook' target='_blank' class='facebook' href='https://www.facebook.com/exteriorscat/?fref=ts'><img alt="Facebook" src="http://exteriors.gencat.cat/web/resources/webgencat/comuns/img/NG_ico_facebook.png_196546587.png"></a></li>
							<li class='list-group-item'><a title='Més xarxes' target='_self' href='http://xarxessocials.gencat.cat' class='xarxes'><img alt="Més xarxes" src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_peu_faldoSocial/img/NG_ico_compartir.png_196546587.png"></a></li>
						</ul>
				
			
</div>

</div>
</div>
</div>
<div class="footer_tab_bot col-sm-12">
	<div class="avis_legal">
		<div class="hidden-xs">
			<div class="col-md-2" id="peuImatge">
						<a accesskey="5" target="_self" title="gencat.cat" href="http://gencat.cat">
						<img src="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/img/logo_generalitat_gris.png_679097835.png" width="101" height="27" alt="gencat.cat" class="adaptImage" /></a>
					</div>
				<div class="col-sm-10" id="peuAvis">
					<p><strong><a href="http://web.gencat.cat/ca/menu-ajuda/ajuda/avis_legal/">Avís legal</a></strong>: D’acord amb l’article 17.1 de la Llei 19/2014, la ©Generalitat de Catalunya permet la reutilització dels continguts i de les dades sempre que se'n citi la font i la data d'actualització i que no es desnaturalitzi la informació (article 8 de la Llei 37/2007) i també que no es contradigui amb una llicència específica.</p></div>
			</div>
		<div class="visible-xs avis_legal">
			<p><strong><a href="http://web.gencat.cat/ca/menu-ajuda/ajuda/avis_legal/">Avís legal</a></strong>: D’acord amb l’article 17.1 de la Llei 19/2014, la ©Generalitat de Catalunya permet la reutilització dels continguts i de les dades sempre que se'n citi la font i la data d'actualització i que no es desnaturalitzi la informació (article 8 de la Llei 37/2007) i també que no es contradigui amb una llicència específica.</p></div>
		<div class="visible-xs" id="idiomes-peu">
			</div>
		<div class="fi_peu visible-xs">
			<a title="gencat.cat" target="_self" href="http://gencat.cat">
					<img src="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/img/logo_generalitat_gris.png_679097835.png" width="101" height="27" alt="gencat.cat" class="checkImage" /></a>
				<p><a class="torna_amunt pull-right" href=" javascript:tornarAmunt();" title="Torna amunt" >Torna amunt</a></p>
		</div>
	</div>
</div>
</div>
</div></div>
				</footer>
			</div>
	
	
	
<!-- 	<script type="text/javascript">

	function dniPassparoteCheck() {
	    if (document.getElementById('dni').checked) {
	        document.getElementById('dniTxt').style.display = 'block';
	        document.getElementById('passportTxt').value = '';
	    } else {
	        document.getElementById('dniTxt').style.display = 'none';
	    }
	    if (document.getElementById('passport').checked) {
	        document.getElementById('passportTxt').style.display = 'block';
	        document.getElementById('dniTxt').value = '';
	    } else {
	        document.getElementById('passportTxt').style.display = 'none';
	    }
	}
	
	</script> -->
	
	<script type="text/javascript">
	
		if(document.getElementById("baja").checked) {
		    document.getElementById('bajaHidden').disabled = true;
		}
	
		function SelectElement()
		{    
		    var element = document.getElementById('descIdentSelect');
		    element.value = <%=typoDocument%>;
		}
		
		$("#descIdentSelect").val(<%=typoDocument%>);
		<%-- $("#municSelect").val(<%=currentMunCP%> =<%=municipio%>); --%>
	</script>

	<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
        async defer>
    </script>
    
    <script type="text/javascript">
   
    
    
	</script>
	
	<script type="text/javascript">
	$.extend( $.ui, { datepicker: { version: "1.12.1" } } );

	var datepicker_instActive;

	function datepicker_getZindex( elem ) {
		var position, value;
		while ( elem.length && elem[ 0 ] !== document ) {

			// Ignore z-index if position is set to a value where z-index is ignored by the browser
			// This makes behavior of this function consistent across browsers
			// WebKit always returns auto if the element is positioned
			position = elem.css( "position" );
			if ( position === "absolute" || position === "relative" || position === "fixed" ) {

				// IE returns 0 when zIndex is not specified
				// other browsers return a string
				// we ignore the case of nested elements with an explicit value of 0
				// <div style="z-index: -10;"><div style="z-index: 0;"></div></div>
				value = parseInt( elem.css( "zIndex" ), 10 );
				if ( !isNaN( value ) && value !== 0 ) {
					return value;
				}
			}
			elem = elem.parent();
		}

		return 0;
	}
	/* Date picker manager.
	   Use the singleton instance of this class, $.datepicker, to interact with the date picker.
	   Settings for (groups of) date pickers are maintained in an instance object,
	   allowing multiple different settings on the same page. */

	function Datepicker() {
		this._curInst = null; // The current instance in use
		this._keyEvent = false; // If the last event was a key event
		this._disabledInputs = []; // List of date picker inputs that have been disabled
		this._datepickerShowing = false; // True if the popup picker is showing , false if not
		this._inDialog = false; // True if showing within a "dialog", false if not
		this._mainDivId = "ui-datepicker-div"; // The ID of the main datepicker division
		this._inlineClass = "ui-datepicker-inline"; // The name of the inline marker class
		this._appendClass = "ui-datepicker-append"; // The name of the append marker class
		this._triggerClass = "ui-datepicker-trigger"; // The name of the trigger marker class
		this._dialogClass = "ui-datepicker-dialog"; // The name of the dialog marker class
		this._disableClass = "ui-datepicker-disabled"; // The name of the disabled covering marker class
		this._unselectableClass = "ui-datepicker-unselectable"; // The name of the unselectable cell marker class
		this._currentClass = "ui-datepicker-current-day"; // The name of the current day marker class
		this._dayOverClass = "ui-datepicker-days-cell-over"; // The name of the day hover marker class
		this.regional = []; // Available regional settings, indexed by language code
		this.regional[ "" ] = { // Default regional settings
			closeText: "Done", // Display text for close link
			prevText: "Prev", // Display text for previous month link
			nextText: "Next", // Display text for next month link
			currentText: "Today", // Display text for current month link
			monthNames: [ "January","February","March","April","May","June",
				"July","August","September","October","November","December" ], // Names of months for drop-down and formatting
			monthNamesShort: [ "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" ], // For formatting
			dayNames: [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ], // For formatting
			dayNamesShort: [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ], // For formatting
			dayNamesMin: [ "Su","Mo","Tu","We","Th","Fr","Sa" ], // Column headings for days starting at Sunday
			weekHeader: "Wk", // Column header for week of the year
			dateFormat: "mm/dd/yy", // See format options on parseDate
			firstDay: 0, // The first day of the week, Sun = 0, Mon = 1, ...
			isRTL: false, // True if right-to-left language, false if left-to-right
			showMonthAfterYear: false, // True if the year select precedes month, false for month then year
			yearSuffix: "" // Additional text to append to the year in the month headers
		};
		this._defaults = { // Global defaults for all the date picker instances
			showOn: "focus", // "focus" for popup on focus,
				// "button" for trigger button, or "both" for either
			showAnim: "fadeIn", // Name of jQuery animation for popup
			showOptions: {}, // Options for enhanced animations
			defaultDate: null, // Used when field is blank: actual date,
				// +/-number for offset from today, null for today
			appendText: "", // Display text following the input box, e.g. showing the format
			buttonText: "...", // Text for trigger button
			buttonImage: "", // URL for trigger button image
			buttonImageOnly: false, // True if the image appears alone, false if it appears on a button
			hideIfNoPrevNext: false, // True to hide next/previous month links
				// if not applicable, false to just disable them
			navigationAsDateFormat: false, // True if date formatting applied to prev/today/next links
			gotoCurrent: false, // True if today link goes back to current selection instead
			changeMonth: false, // True if month can be selected directly, false if only prev/next
			changeYear: false, // True if year can be selected directly, false if only prev/next
			yearRange: "c-10:c+10", // Range of years to display in drop-down,
				// either relative to today's year (-nn:+nn), relative to currently displayed year
				// (c-nn:c+nn), absolute (nnnn:nnnn), or a combination of the above (nnnn:-n)
			showOtherMonths: false, // True to show dates in other months, false to leave blank
			selectOtherMonths: false, // True to allow selection of dates in other months, false for unselectable
			showWeek: false, // True to show week of the year, false to not show it
			calculateWeek: this.iso8601Week, // How to calculate the week of the year,
				// takes a Date and returns the number of the week for it
			shortYearCutoff: "+10", // Short year values < this are in the current century,
				// > this are in the previous century,
				// string value starting with "+" for current year + value
			minDate: null, // The earliest selectable date, or null for no limit
			maxDate: null, // The latest selectable date, or null for no limit
			duration: "fast", // Duration of display/closure
			beforeShowDay: null, // Function that takes a date and returns an array with
				// [0] = true if selectable, false if not, [1] = custom CSS class name(s) or "",
				// [2] = cell title (optional), e.g. $.datepicker.noWeekends
			beforeShow: null, // Function that takes an input field and
				// returns a set of custom settings for the date picker
			onSelect: null, // Define a callback function when a date is selected
			onChangeMonthYear: null, // Define a callback function when the month or year is changed
			onClose: null, // Define a callback function when the datepicker is closed
			numberOfMonths: 1, // Number of months to show at a time
			showCurrentAtPos: 0, // The position in multipe months at which to show the current month (starting at 0)
			stepMonths: 1, // Number of months to step back/forward
			stepBigMonths: 12, // Number of months to step back/forward for the big links
			altField: "", // Selector for an alternate field to store selected dates into
			altFormat: "", // The date format to use for the alternate field
			constrainInput: true, // The input is constrained by the current date format
			showButtonPanel: false, // True to show button panel, false to not show it
			autoSize: false, // True to size the input for the date format, false to leave as is
			disabled: false // The initial disabled state
		};
		$.extend( this._defaults, this.regional[ "" ] );
		this.regional.en = $.extend( true, {}, this.regional[ "" ] );
		this.regional[ "en-US" ] = $.extend( true, {}, this.regional.en );
		this.dpDiv = datepicker_bindHover( $( "<div id='" + this._mainDivId + "' class='ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'></div>" ) );
	}

	$.extend( Datepicker.prototype, {
		/* Class name added to elements to indicate already configured with a date picker. */
		markerClassName: "hasDatepicker",

		//Keep track of the maximum number of rows displayed (see #7043)
		maxRows: 4,

		// TODO rename to "widget" when switching to widget factory
		_widgetDatepicker: function() {
			return this.dpDiv;
		},

		/* Override the default settings for all instances of the date picker.
		 * @param  settings  object - the new settings to use as defaults (anonymous object)
		 * @return the manager object
		 */
		setDefaults: function( settings ) {
			datepicker_extendRemove( this._defaults, settings || {} );
			return this;
		},

		/* Attach the date picker to a jQuery selection.
		 * @param  target	element - the target input field or division or span
		 * @param  settings  object - the new settings to use for this date picker instance (anonymous)
		 */
		_attachDatepicker: function( target, settings ) {
			var nodeName, inline, inst;
			nodeName = target.nodeName.toLowerCase();
			inline = ( nodeName === "div" || nodeName === "span" );
			if ( !target.id ) {
				this.uuid += 1;
				target.id = "dp" + this.uuid;
			}
			inst = this._newInst( $( target ), inline );
			inst.settings = $.extend( {}, settings || {} );
			if ( nodeName === "input" ) {
				this._connectDatepicker( target, inst );
			} else if ( inline ) {
				this._inlineDatepicker( target, inst );
			}
		},

		/* Create a new instance object. */
		_newInst: function( target, inline ) {
			var id = target[ 0 ].id.replace( /([^A-Za-z0-9_\-])/g, "\\\\$1" ); // escape jQuery meta chars
			return { id: id, input: target, // associated target
				selectedDay: 0, selectedMonth: 0, selectedYear: 0, // current selection
				drawMonth: 0, drawYear: 0, // month being drawn
				inline: inline, // is datepicker inline or not
				dpDiv: ( !inline ? this.dpDiv : // presentation div
				datepicker_bindHover( $( "<div class='" + this._inlineClass + " ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all'></div>" ) ) ) };
		},

		/* Attach the date picker to an input field. */
		_connectDatepicker: function( target, inst ) {
			var input = $( target );
			inst.append = $( [] );
			inst.trigger = $( [] );
			if ( input.hasClass( this.markerClassName ) ) {
				return;
			}
			this._attachments( input, inst );
			input.addClass( this.markerClassName ).on( "keydown", this._doKeyDown ).
				on( "keypress", this._doKeyPress ).on( "keyup", this._doKeyUp );
			this._autoSize( inst );
			$.data( target, "datepicker", inst );

			//If disabled option is true, disable the datepicker once it has been attached to the input (see ticket #5665)
			if ( inst.settings.disabled ) {
				this._disableDatepicker( target );
			}
		},

		/* Make attachments based on settings. */
		_attachments: function( input, inst ) {
			var showOn, buttonText, buttonImage,
				appendText = this._get( inst, "appendText" ),
				isRTL = this._get( inst, "isRTL" );

			if ( inst.append ) {
				inst.append.remove();
			}
			if ( appendText ) {
				inst.append = $( "<span class='" + this._appendClass + "'>" + appendText + "</span>" );
				input[ isRTL ? "before" : "after" ]( inst.append );
			}

			input.off( "focus", this._showDatepicker );

			if ( inst.trigger ) {
				inst.trigger.remove();
			}

			showOn = this._get( inst, "showOn" );
			if ( showOn === "focus" || showOn === "both" ) { // pop-up date picker when in the marked field
				input.on( "focus", this._showDatepicker );
			}
			if ( showOn === "button" || showOn === "both" ) { // pop-up date picker when button clicked
				buttonText = this._get( inst, "buttonText" );
				buttonImage = this._get( inst, "buttonImage" );
				inst.trigger = $( this._get( inst, "buttonImageOnly" ) ?
					$( "<img/>" ).addClass( this._triggerClass ).
						attr( { src: buttonImage, alt: buttonText, title: buttonText } ) :
					$( "<button type='button'></button>" ).addClass( this._triggerClass ).
						html( !buttonImage ? buttonText : $( "<img/>" ).attr(
						{ src:buttonImage, alt:buttonText, title:buttonText } ) ) );
				input[ isRTL ? "before" : "after" ]( inst.trigger );
				inst.trigger.on( "click", function() {
					if ( $.datepicker._datepickerShowing && $.datepicker._lastInput === input[ 0 ] ) {
						$.datepicker._hideDatepicker();
					} else if ( $.datepicker._datepickerShowing && $.datepicker._lastInput !== input[ 0 ] ) {
						$.datepicker._hideDatepicker();
						$.datepicker._showDatepicker( input[ 0 ] );
					} else {
						$.datepicker._showDatepicker( input[ 0 ] );
					}
					return false;
				} );
			}
		},

		/* Apply the maximum length for the date format. */
		_autoSize: function( inst ) {
			if ( this._get( inst, "autoSize" ) && !inst.inline ) {
				var findMax, max, maxI, i,
					date = new Date( 2009, 12 - 1, 20 ), // Ensure double digits
					dateFormat = this._get( inst, "dateFormat" );

				if ( dateFormat.match( /[DM]/ ) ) {
					findMax = function( names ) {
						max = 0;
						maxI = 0;
						for ( i = 0; i < names.length; i++ ) {
							if ( names[ i ].length > max ) {
								max = names[ i ].length;
								maxI = i;
							}
						}
						return maxI;
					};
					date.setMonth( findMax( this._get( inst, ( dateFormat.match( /MM/ ) ?
						"monthNames" : "monthNamesShort" ) ) ) );
					date.setDate( findMax( this._get( inst, ( dateFormat.match( /DD/ ) ?
						"dayNames" : "dayNamesShort" ) ) ) + 20 - date.getDay() );
				}
				inst.input.attr( "size", this._formatDate( inst, date ).length );
			}
		},

		/* Attach an inline date picker to a div. */
		_inlineDatepicker: function( target, inst ) {
			var divSpan = $( target );
			if ( divSpan.hasClass( this.markerClassName ) ) {
				return;
			}
			divSpan.addClass( this.markerClassName ).append( inst.dpDiv );
			$.data( target, "datepicker", inst );
			this._setDate( inst, this._getDefaultDate( inst ), true );
			this._updateDatepicker( inst );
			this._updateAlternate( inst );

			//If disabled option is true, disable the datepicker before showing it (see ticket #5665)
			if ( inst.settings.disabled ) {
				this._disableDatepicker( target );
			}

			// Set display:block in place of inst.dpDiv.show() which won't work on disconnected elements
			// http://bugs.jqueryui.com/ticket/7552 - A Datepicker created on a detached div has zero height
			inst.dpDiv.css( "display", "block" );
		},

		/* Pop-up the date picker in a "dialog" box.
		 * @param  input element - ignored
		 * @param  date	string or Date - the initial date to display
		 * @param  onSelect  function - the function to call when a date is selected
		 * @param  settings  object - update the dialog date picker instance's settings (anonymous object)
		 * @param  pos int[2] - coordinates for the dialog's position within the screen or
		 *					event - with x/y coordinates or
		 *					leave empty for default (screen centre)
		 * @return the manager object
		 */
		_dialogDatepicker: function( input, date, onSelect, settings, pos ) {
			var id, browserWidth, browserHeight, scrollX, scrollY,
				inst = this._dialogInst; // internal instance

			if ( !inst ) {
				this.uuid += 1;
				id = "dp" + this.uuid;
				this._dialogInput = $( "<input type='text' id='" + id +
					"' style='position: absolute; top: -100px; width: 0px;'/>" );
				this._dialogInput.on( "keydown", this._doKeyDown );
				$( "body" ).append( this._dialogInput );
				inst = this._dialogInst = this._newInst( this._dialogInput, false );
				inst.settings = {};
				$.data( this._dialogInput[ 0 ], "datepicker", inst );
			}
			datepicker_extendRemove( inst.settings, settings || {} );
			date = ( date && date.constructor === Date ? this._formatDate( inst, date ) : date );
			this._dialogInput.val( date );

			this._pos = ( pos ? ( pos.length ? pos : [ pos.pageX, pos.pageY ] ) : null );
			if ( !this._pos ) {
				browserWidth = document.documentElement.clientWidth;
				browserHeight = document.documentElement.clientHeight;
				scrollX = document.documentElement.scrollLeft || document.body.scrollLeft;
				scrollY = document.documentElement.scrollTop || document.body.scrollTop;
				this._pos = // should use actual width/height below
					[ ( browserWidth / 2 ) - 100 + scrollX, ( browserHeight / 2 ) - 150 + scrollY ];
			}

			// Move input on screen for focus, but hidden behind dialog
			this._dialogInput.css( "left", ( this._pos[ 0 ] + 20 ) + "px" ).css( "top", this._pos[ 1 ] + "px" );
			inst.settings.onSelect = onSelect;
			this._inDialog = true;
			this.dpDiv.addClass( this._dialogClass );
			this._showDatepicker( this._dialogInput[ 0 ] );
			if ( $.blockUI ) {
				$.blockUI( this.dpDiv );
			}
			$.data( this._dialogInput[ 0 ], "datepicker", inst );
			return this;
		},

		/* Detach a datepicker from its control.
		 * @param  target	element - the target input field or division or span
		 */
		_destroyDatepicker: function( target ) {
			var nodeName,
				$target = $( target ),
				inst = $.data( target, "datepicker" );

			if ( !$target.hasClass( this.markerClassName ) ) {
				return;
			}

			nodeName = target.nodeName.toLowerCase();
			$.removeData( target, "datepicker" );
			if ( nodeName === "input" ) {
				inst.append.remove();
				inst.trigger.remove();
				$target.removeClass( this.markerClassName ).
					off( "focus", this._showDatepicker ).
					off( "keydown", this._doKeyDown ).
					off( "keypress", this._doKeyPress ).
					off( "keyup", this._doKeyUp );
			} else if ( nodeName === "div" || nodeName === "span" ) {
				$target.removeClass( this.markerClassName ).empty();
			}

			if ( datepicker_instActive === inst ) {
				datepicker_instActive = null;
			}
		},

		/* Enable the date picker to a jQuery selection.
		 * @param  target	element - the target input field or division or span
		 */
		_enableDatepicker: function( target ) {
			var nodeName, inline,
				$target = $( target ),
				inst = $.data( target, "datepicker" );

			if ( !$target.hasClass( this.markerClassName ) ) {
				return;
			}

			nodeName = target.nodeName.toLowerCase();
			if ( nodeName === "input" ) {
				target.disabled = false;
				inst.trigger.filter( "button" ).
					each( function() { this.disabled = false; } ).end().
					filter( "img" ).css( { opacity: "1.0", cursor: "" } );
			} else if ( nodeName === "div" || nodeName === "span" ) {
				inline = $target.children( "." + this._inlineClass );
				inline.children().removeClass( "ui-state-disabled" );
				inline.find( "select.ui-datepicker-month, select.ui-datepicker-year" ).
					prop( "disabled", false );
			}
			this._disabledInputs = $.map( this._disabledInputs,
				function( value ) { return ( value === target ? null : value ); } ); // delete entry
		},

		/* Disable the date picker to a jQuery selection.
		 * @param  target	element - the target input field or division or span
		 */
		_disableDatepicker: function( target ) {
			var nodeName, inline,
				$target = $( target ),
				inst = $.data( target, "datepicker" );

			if ( !$target.hasClass( this.markerClassName ) ) {
				return;
			}

			nodeName = target.nodeName.toLowerCase();
			if ( nodeName === "input" ) {
				target.disabled = true;
				inst.trigger.filter( "button" ).
					each( function() { this.disabled = true; } ).end().
					filter( "img" ).css( { opacity: "0.5", cursor: "default" } );
			} else if ( nodeName === "div" || nodeName === "span" ) {
				inline = $target.children( "." + this._inlineClass );
				inline.children().addClass( "ui-state-disabled" );
				inline.find( "select.ui-datepicker-month, select.ui-datepicker-year" ).
					prop( "disabled", true );
			}
			this._disabledInputs = $.map( this._disabledInputs,
				function( value ) { return ( value === target ? null : value ); } ); // delete entry
			this._disabledInputs[ this._disabledInputs.length ] = target;
		},

		/* Is the first field in a jQuery collection disabled as a datepicker?
		 * @param  target	element - the target input field or division or span
		 * @return boolean - true if disabled, false if enabled
		 */
		_isDisabledDatepicker: function( target ) {
			if ( !target ) {
				return false;
			}
			for ( var i = 0; i < this._disabledInputs.length; i++ ) {
				if ( this._disabledInputs[ i ] === target ) {
					return true;
				}
			}
			return false;
		},

		/* Retrieve the instance data for the target control.
		 * @param  target  element - the target input field or division or span
		 * @return  object - the associated instance data
		 * @throws  error if a jQuery problem getting data
		 */
		_getInst: function( target ) {
			try {
				return $.data( target, "datepicker" );
			}
			catch ( err ) {
				throw "Missing instance data for this datepicker";
			}
		},

		/* Update or retrieve the settings for a date picker attached to an input field or division.
		 * @param  target  element - the target input field or division or span
		 * @param  name	object - the new settings to update or
		 *				string - the name of the setting to change or retrieve,
		 *				when retrieving also "all" for all instance settings or
		 *				"defaults" for all global defaults
		 * @param  value   any - the new value for the setting
		 *				(omit if above is an object or to retrieve a value)
		 */
		_optionDatepicker: function( target, name, value ) {
			var settings, date, minDate, maxDate,
				inst = this._getInst( target );

			if ( arguments.length === 2 && typeof name === "string" ) {
				return ( name === "defaults" ? $.extend( {}, $.datepicker._defaults ) :
					( inst ? ( name === "all" ? $.extend( {}, inst.settings ) :
					this._get( inst, name ) ) : null ) );
			}

			settings = name || {};
			if ( typeof name === "string" ) {
				settings = {};
				settings[ name ] = value;
			}

			if ( inst ) {
				if ( this._curInst === inst ) {
					this._hideDatepicker();
				}

				date = this._getDateDatepicker( target, true );
				minDate = this._getMinMaxDate( inst, "min" );
				maxDate = this._getMinMaxDate( inst, "max" );
				datepicker_extendRemove( inst.settings, settings );

				// reformat the old minDate/maxDate values if dateFormat changes and a new minDate/maxDate isn't provided
				if ( minDate !== null && settings.dateFormat !== undefined && settings.minDate === undefined ) {
					inst.settings.minDate = this._formatDate( inst, minDate );
				}
				if ( maxDate !== null && settings.dateFormat !== undefined && settings.maxDate === undefined ) {
					inst.settings.maxDate = this._formatDate( inst, maxDate );
				}
				if ( "disabled" in settings ) {
					if ( settings.disabled ) {
						this._disableDatepicker( target );
					} else {
						this._enableDatepicker( target );
					}
				}
				this._attachments( $( target ), inst );
				this._autoSize( inst );
				this._setDate( inst, date );
				this._updateAlternate( inst );
				this._updateDatepicker( inst );
			}
		},

		// Change method deprecated
		_changeDatepicker: function( target, name, value ) {
			this._optionDatepicker( target, name, value );
		},

		/* Redraw the date picker attached to an input field or division.
		 * @param  target  element - the target input field or division or span
		 */
		_refreshDatepicker: function( target ) {
			var inst = this._getInst( target );
			if ( inst ) {
				this._updateDatepicker( inst );
			}
		},

		/* Set the dates for a jQuery selection.
		 * @param  target element - the target input field or division or span
		 * @param  date	Date - the new date
		 */
		_setDateDatepicker: function( target, date ) {
			var inst = this._getInst( target );
			if ( inst ) {
				this._setDate( inst, date );
				this._updateDatepicker( inst );
				this._updateAlternate( inst );
			}
		},

		/* Get the date(s) for the first entry in a jQuery selection.
		 * @param  target element - the target input field or division or span
		 * @param  noDefault boolean - true if no default date is to be used
		 * @return Date - the current date
		 */
		_getDateDatepicker: function( target, noDefault ) {
			var inst = this._getInst( target );
			if ( inst && !inst.inline ) {
				this._setDateFromField( inst, noDefault );
			}
			return ( inst ? this._getDate( inst ) : null );
		},

		/* Handle keystrokes. */
		_doKeyDown: function( event ) {
			var onSelect, dateStr, sel,
				inst = $.datepicker._getInst( event.target ),
				handled = true,
				isRTL = inst.dpDiv.is( ".ui-datepicker-rtl" );

			inst._keyEvent = true;
			if ( $.datepicker._datepickerShowing ) {
				switch ( event.keyCode ) {
					case 9: $.datepicker._hideDatepicker();
							handled = false;
							break; // hide on tab out
					case 13: sel = $( "td." + $.datepicker._dayOverClass + ":not(." +
										$.datepicker._currentClass + ")", inst.dpDiv );
							if ( sel[ 0 ] ) {
								$.datepicker._selectDay( event.target, inst.selectedMonth, inst.selectedYear, sel[ 0 ] );
							}

							onSelect = $.datepicker._get( inst, "onSelect" );
							if ( onSelect ) {
								dateStr = $.datepicker._formatDate( inst );

								// Trigger custom callback
								onSelect.apply( ( inst.input ? inst.input[ 0 ] : null ), [ dateStr, inst ] );
							} else {
								$.datepicker._hideDatepicker();
							}

							return false; // don't submit the form
					case 27: $.datepicker._hideDatepicker();
							break; // hide on escape
					case 33: $.datepicker._adjustDate( event.target, ( event.ctrlKey ?
								-$.datepicker._get( inst, "stepBigMonths" ) :
								-$.datepicker._get( inst, "stepMonths" ) ), "M" );
							break; // previous month/year on page up/+ ctrl
					case 34: $.datepicker._adjustDate( event.target, ( event.ctrlKey ?
								+$.datepicker._get( inst, "stepBigMonths" ) :
								+$.datepicker._get( inst, "stepMonths" ) ), "M" );
							break; // next month/year on page down/+ ctrl
					case 35: if ( event.ctrlKey || event.metaKey ) {
								$.datepicker._clearDate( event.target );
							}
							handled = event.ctrlKey || event.metaKey;
							break; // clear on ctrl or command +end
					case 36: if ( event.ctrlKey || event.metaKey ) {
								$.datepicker._gotoToday( event.target );
							}
							handled = event.ctrlKey || event.metaKey;
							break; // current on ctrl or command +home
					case 37: if ( event.ctrlKey || event.metaKey ) {
								$.datepicker._adjustDate( event.target, ( isRTL ? +1 : -1 ), "D" );
							}
							handled = event.ctrlKey || event.metaKey;

							// -1 day on ctrl or command +left
							if ( event.originalEvent.altKey ) {
								$.datepicker._adjustDate( event.target, ( event.ctrlKey ?
									-$.datepicker._get( inst, "stepBigMonths" ) :
									-$.datepicker._get( inst, "stepMonths" ) ), "M" );
							}

							// next month/year on alt +left on Mac
							break;
					case 38: if ( event.ctrlKey || event.metaKey ) {
								$.datepicker._adjustDate( event.target, -7, "D" );
							}
							handled = event.ctrlKey || event.metaKey;
							break; // -1 week on ctrl or command +up
					case 39: if ( event.ctrlKey || event.metaKey ) {
								$.datepicker._adjustDate( event.target, ( isRTL ? -1 : +1 ), "D" );
							}
							handled = event.ctrlKey || event.metaKey;

							// +1 day on ctrl or command +right
							if ( event.originalEvent.altKey ) {
								$.datepicker._adjustDate( event.target, ( event.ctrlKey ?
									+$.datepicker._get( inst, "stepBigMonths" ) :
									+$.datepicker._get( inst, "stepMonths" ) ), "M" );
							}

							// next month/year on alt +right
							break;
					case 40: if ( event.ctrlKey || event.metaKey ) {
								$.datepicker._adjustDate( event.target, +7, "D" );
							}
							handled = event.ctrlKey || event.metaKey;
							break; // +1 week on ctrl or command +down
					default: handled = false;
				}
			} else if ( event.keyCode === 36 && event.ctrlKey ) { // display the date picker on ctrl+home
				$.datepicker._showDatepicker( this );
			} else {
				handled = false;
			}

			if ( handled ) {
				event.preventDefault();
				event.stopPropagation();
			}
		},

		/* Filter entered characters - based on date format. */
		_doKeyPress: function( event ) {
			var chars, chr,
				inst = $.datepicker._getInst( event.target );

			if ( $.datepicker._get( inst, "constrainInput" ) ) {
				chars = $.datepicker._possibleChars( $.datepicker._get( inst, "dateFormat" ) );
				chr = String.fromCharCode( event.charCode == null ? event.keyCode : event.charCode );
				return event.ctrlKey || event.metaKey || ( chr < " " || !chars || chars.indexOf( chr ) > -1 );
			}
		},

		/* Synchronise manual entry and field/alternate field. */
		_doKeyUp: function( event ) {
			var date,
				inst = $.datepicker._getInst( event.target );

			if ( inst.input.val() !== inst.lastVal ) {
				try {
					date = $.datepicker.parseDate( $.datepicker._get( inst, "dateFormat" ),
						( inst.input ? inst.input.val() : null ),
						$.datepicker._getFormatConfig( inst ) );

					if ( date ) { // only if valid
						$.datepicker._setDateFromField( inst );
						$.datepicker._updateAlternate( inst );
						$.datepicker._updateDatepicker( inst );
					}
				}
				catch ( err ) {
				}
			}
			return true;
		},

		/* Pop-up the date picker for a given input field.
		 * If false returned from beforeShow event handler do not show.
		 * @param  input  element - the input field attached to the date picker or
		 *					event - if triggered by focus
		 */
		_showDatepicker: function( input ) {
			input = input.target || input;
			if ( input.nodeName.toLowerCase() !== "input" ) { // find from button/image trigger
				input = $( "input", input.parentNode )[ 0 ];
			}

			if ( $.datepicker._isDisabledDatepicker( input ) || $.datepicker._lastInput === input ) { // already here
				return;
			}

			var inst, beforeShow, beforeShowSettings, isFixed,
				offset, showAnim, duration;

			inst = $.datepicker._getInst( input );
			if ( $.datepicker._curInst && $.datepicker._curInst !== inst ) {
				$.datepicker._curInst.dpDiv.stop( true, true );
				if ( inst && $.datepicker._datepickerShowing ) {
					$.datepicker._hideDatepicker( $.datepicker._curInst.input[ 0 ] );
				}
			}

			beforeShow = $.datepicker._get( inst, "beforeShow" );
			beforeShowSettings = beforeShow ? beforeShow.apply( input, [ input, inst ] ) : {};
			if ( beforeShowSettings === false ) {
				return;
			}
			datepicker_extendRemove( inst.settings, beforeShowSettings );

			inst.lastVal = null;
			$.datepicker._lastInput = input;
			$.datepicker._setDateFromField( inst );

			if ( $.datepicker._inDialog ) { // hide cursor
				input.value = "";
			}
			if ( !$.datepicker._pos ) { // position below input
				$.datepicker._pos = $.datepicker._findPos( input );
				$.datepicker._pos[ 1 ] += input.offsetHeight; // add the height
			}

			isFixed = false;
			$( input ).parents().each( function() {
				isFixed |= $( this ).css( "position" ) === "fixed";
				return !isFixed;
			} );

			offset = { left: $.datepicker._pos[ 0 ], top: $.datepicker._pos[ 1 ] };
			$.datepicker._pos = null;

			//to avoid flashes on Firefox
			inst.dpDiv.empty();

			// determine sizing offscreen
			inst.dpDiv.css( { position: "absolute", display: "block", top: "-1000px" } );
			$.datepicker._updateDatepicker( inst );

			// fix width for dynamic number of date pickers
			// and adjust position before showing
			offset = $.datepicker._checkOffset( inst, offset, isFixed );
			inst.dpDiv.css( { position: ( $.datepicker._inDialog && $.blockUI ?
				"static" : ( isFixed ? "fixed" : "absolute" ) ), display: "none",
				left: offset.left + "px", top: offset.top + "px" } );

			if ( !inst.inline ) {
				showAnim = $.datepicker._get( inst, "showAnim" );
				duration = $.datepicker._get( inst, "duration" );
				inst.dpDiv.css( "z-index", datepicker_getZindex( $( input ) ) + 1 );
				$.datepicker._datepickerShowing = true;

				if ( $.effects && $.effects.effect[ showAnim ] ) {
					inst.dpDiv.show( showAnim, $.datepicker._get( inst, "showOptions" ), duration );
				} else {
					inst.dpDiv[ showAnim || "show" ]( showAnim ? duration : null );
				}

				if ( $.datepicker._shouldFocusInput( inst ) ) {
					inst.input.trigger( "focus" );
				}

				$.datepicker._curInst = inst;
			}
		},

		/* Generate the date picker content. */
		_updateDatepicker: function( inst ) {
			this.maxRows = 4; //Reset the max number of rows being displayed (see #7043)
			datepicker_instActive = inst; // for delegate hover events
			inst.dpDiv.empty().append( this._generateHTML( inst ) );
			this._attachHandlers( inst );

			var origyearshtml,
				numMonths = this._getNumberOfMonths( inst ),
				cols = numMonths[ 1 ],
				width = 17,
				activeCell = inst.dpDiv.find( "." + this._dayOverClass + " a" );

			if ( activeCell.length > 0 ) {
				datepicker_handleMouseover.apply( activeCell.get( 0 ) );
			}

			inst.dpDiv.removeClass( "ui-datepicker-multi-2 ui-datepicker-multi-3 ui-datepicker-multi-4" ).width( "" );
			if ( cols > 1 ) {
				inst.dpDiv.addClass( "ui-datepicker-multi-" + cols ).css( "width", ( width * cols ) + "em" );
			}
			inst.dpDiv[ ( numMonths[ 0 ] !== 1 || numMonths[ 1 ] !== 1 ? "add" : "remove" ) +
				"Class" ]( "ui-datepicker-multi" );
			inst.dpDiv[ ( this._get( inst, "isRTL" ) ? "add" : "remove" ) +
				"Class" ]( "ui-datepicker-rtl" );

			if ( inst === $.datepicker._curInst && $.datepicker._datepickerShowing && $.datepicker._shouldFocusInput( inst ) ) {
				inst.input.trigger( "focus" );
			}

			// Deffered render of the years select (to avoid flashes on Firefox)
			if ( inst.yearshtml ) {
				origyearshtml = inst.yearshtml;
				setTimeout( function() {

					//assure that inst.yearshtml didn't change.
					if ( origyearshtml === inst.yearshtml && inst.yearshtml ) {
						inst.dpDiv.find( "select.ui-datepicker-year:first" ).replaceWith( inst.yearshtml );
					}
					origyearshtml = inst.yearshtml = null;
				}, 0 );
			}
		},

		// #6694 - don't focus the input if it's already focused
		// this breaks the change event in IE
		// Support: IE and jQuery <1.9
		_shouldFocusInput: function( inst ) {
			return inst.input && inst.input.is( ":visible" ) && !inst.input.is( ":disabled" ) && !inst.input.is( ":focus" );
		},

		/* Check positioning to remain on screen. */
		_checkOffset: function( inst, offset, isFixed ) {
			var dpWidth = inst.dpDiv.outerWidth(),
				dpHeight = inst.dpDiv.outerHeight(),
				inputWidth = inst.input ? inst.input.outerWidth() : 0,
				inputHeight = inst.input ? inst.input.outerHeight() : 0,
				viewWidth = document.documentElement.clientWidth + ( isFixed ? 0 : $( document ).scrollLeft() ),
				viewHeight = document.documentElement.clientHeight + ( isFixed ? 0 : $( document ).scrollTop() );

			offset.left -= ( this._get( inst, "isRTL" ) ? ( dpWidth - inputWidth ) : 0 );
			offset.left -= ( isFixed && offset.left === inst.input.offset().left ) ? $( document ).scrollLeft() : 0;
			offset.top -= ( isFixed && offset.top === ( inst.input.offset().top + inputHeight ) ) ? $( document ).scrollTop() : 0;

			// Now check if datepicker is showing outside window viewport - move to a better place if so.
			offset.left -= Math.min( offset.left, ( offset.left + dpWidth > viewWidth && viewWidth > dpWidth ) ?
				Math.abs( offset.left + dpWidth - viewWidth ) : 0 );
			offset.top -= Math.min( offset.top, ( offset.top + dpHeight > viewHeight && viewHeight > dpHeight ) ?
				Math.abs( dpHeight + inputHeight ) : 0 );

			return offset;
		},

		/* Find an object's position on the screen. */
		_findPos: function( obj ) {
			var position,
				inst = this._getInst( obj ),
				isRTL = this._get( inst, "isRTL" );

			while ( obj && ( obj.type === "hidden" || obj.nodeType !== 1 || $.expr.filters.hidden( obj ) ) ) {
				obj = obj[ isRTL ? "previousSibling" : "nextSibling" ];
			}

			position = $( obj ).offset();
			return [ position.left, position.top ];
		},

		/* Hide the date picker from view.
		 * @param  input  element - the input field attached to the date picker
		 */
		_hideDatepicker: function( input ) {
			var showAnim, duration, postProcess, onClose,
				inst = this._curInst;

			if ( !inst || ( input && inst !== $.data( input, "datepicker" ) ) ) {
				return;
			}

			if ( this._datepickerShowing ) {
				showAnim = this._get( inst, "showAnim" );
				duration = this._get( inst, "duration" );
				postProcess = function() {
					$.datepicker._tidyDialog( inst );
				};

				// DEPRECATED: after BC for 1.8.x $.effects[ showAnim ] is not needed
				if ( $.effects && ( $.effects.effect[ showAnim ] || $.effects[ showAnim ] ) ) {
					inst.dpDiv.hide( showAnim, $.datepicker._get( inst, "showOptions" ), duration, postProcess );
				} else {
					inst.dpDiv[ ( showAnim === "slideDown" ? "slideUp" :
						( showAnim === "fadeIn" ? "fadeOut" : "hide" ) ) ]( ( showAnim ? duration : null ), postProcess );
				}

				if ( !showAnim ) {
					postProcess();
				}
				this._datepickerShowing = false;

				onClose = this._get( inst, "onClose" );
				if ( onClose ) {
					onClose.apply( ( inst.input ? inst.input[ 0 ] : null ), [ ( inst.input ? inst.input.val() : "" ), inst ] );
				}

				this._lastInput = null;
				if ( this._inDialog ) {
					this._dialogInput.css( { position: "absolute", left: "0", top: "-100px" } );
					if ( $.blockUI ) {
						$.unblockUI();
						$( "body" ).append( this.dpDiv );
					}
				}
				this._inDialog = false;
			}
		},

		/* Tidy up after a dialog display. */
		_tidyDialog: function( inst ) {
			inst.dpDiv.removeClass( this._dialogClass ).off( ".ui-datepicker-calendar" );
		},

		/* Close date picker if clicked elsewhere. */
		_checkExternalClick: function( event ) {
			if ( !$.datepicker._curInst ) {
				return;
			}

			var $target = $( event.target ),
				inst = $.datepicker._getInst( $target[ 0 ] );

			if ( ( ( $target[ 0 ].id !== $.datepicker._mainDivId &&
					$target.parents( "#" + $.datepicker._mainDivId ).length === 0 &&
					!$target.hasClass( $.datepicker.markerClassName ) &&
					!$target.closest( "." + $.datepicker._triggerClass ).length &&
					$.datepicker._datepickerShowing && !( $.datepicker._inDialog && $.blockUI ) ) ) ||
				( $target.hasClass( $.datepicker.markerClassName ) && $.datepicker._curInst !== inst ) ) {
					$.datepicker._hideDatepicker();
			}
		},

		/* Adjust one of the date sub-fields. */
		_adjustDate: function( id, offset, period ) {
			var target = $( id ),
				inst = this._getInst( target[ 0 ] );

			if ( this._isDisabledDatepicker( target[ 0 ] ) ) {
				return;
			}
			this._adjustInstDate( inst, offset +
				( period === "M" ? this._get( inst, "showCurrentAtPos" ) : 0 ), // undo positioning
				period );
			this._updateDatepicker( inst );
		},

		/* Action for current link. */
		_gotoToday: function( id ) {
			var date,
				target = $( id ),
				inst = this._getInst( target[ 0 ] );

			if ( this._get( inst, "gotoCurrent" ) && inst.currentDay ) {
				inst.selectedDay = inst.currentDay;
				inst.drawMonth = inst.selectedMonth = inst.currentMonth;
				inst.drawYear = inst.selectedYear = inst.currentYear;
			} else {
				date = new Date();
				inst.selectedDay = date.getDate();
				inst.drawMonth = inst.selectedMonth = date.getMonth();
				inst.drawYear = inst.selectedYear = date.getFullYear();
			}
			this._notifyChange( inst );
			this._adjustDate( target );
		},

		/* Action for selecting a new month/year. */
		_selectMonthYear: function( id, select, period ) {
			var target = $( id ),
				inst = this._getInst( target[ 0 ] );

			inst[ "selected" + ( period === "M" ? "Month" : "Year" ) ] =
			inst[ "draw" + ( period === "M" ? "Month" : "Year" ) ] =
				parseInt( select.options[ select.selectedIndex ].value, 10 );

			this._notifyChange( inst );
			this._adjustDate( target );
		},

		/* Action for selecting a day. */
		_selectDay: function( id, month, year, td ) {
			var inst,
				target = $( id );

			if ( $( td ).hasClass( this._unselectableClass ) || this._isDisabledDatepicker( target[ 0 ] ) ) {
				return;
			}

			inst = this._getInst( target[ 0 ] );
			inst.selectedDay = inst.currentDay = $( "a", td ).html();
			inst.selectedMonth = inst.currentMonth = month;
			inst.selectedYear = inst.currentYear = year;
			this._selectDate( id, this._formatDate( inst,
				inst.currentDay, inst.currentMonth, inst.currentYear ) );
		},

		/* Erase the input field and hide the date picker. */
		_clearDate: function( id ) {
			var target = $( id );
			this._selectDate( target, "" );
		},

		/* Update the input field with the selected date. */
		_selectDate: function( id, dateStr ) {
			var onSelect,
				target = $( id ),
				inst = this._getInst( target[ 0 ] );

			dateStr = ( dateStr != null ? dateStr : this._formatDate( inst ) );
			if ( inst.input ) {
				inst.input.val( dateStr );
			}
			this._updateAlternate( inst );

			onSelect = this._get( inst, "onSelect" );
			if ( onSelect ) {
				onSelect.apply( ( inst.input ? inst.input[ 0 ] : null ), [ dateStr, inst ] );  // trigger custom callback
			} else if ( inst.input ) {
				inst.input.trigger( "change" ); // fire the change event
			}

			if ( inst.inline ) {
				this._updateDatepicker( inst );
			} else {
				this._hideDatepicker();
				this._lastInput = inst.input[ 0 ];
				if ( typeof( inst.input[ 0 ] ) !== "object" ) {
					inst.input.trigger( "focus" ); // restore focus
				}
				this._lastInput = null;
			}
		},

		/* Update any alternate field to synchronise with the main field. */
		_updateAlternate: function( inst ) {
			var altFormat, date, dateStr,
				altField = this._get( inst, "altField" );

			if ( altField ) { // update alternate field too
				altFormat = this._get( inst, "altFormat" ) || this._get( inst, "dateFormat" );
				date = this._getDate( inst );
				dateStr = this.formatDate( altFormat, date, this._getFormatConfig( inst ) );
				$( altField ).val( dateStr );
			}
		},

		/* Set as beforeShowDay function to prevent selection of weekends.
		 * @param  date  Date - the date to customise
		 * @return [boolean, string] - is this date selectable?, what is its CSS class?
		 */
		noWeekends: function( date ) {
			var day = date.getDay();
			return [ ( day > 0 && day < 6 ), "" ];
		},

		/* Set as calculateWeek to determine the week of the year based on the ISO 8601 definition.
		 * @param  date  Date - the date to get the week for
		 * @return  number - the number of the week within the year that contains this date
		 */
		iso8601Week: function( date ) {
			var time,
				checkDate = new Date( date.getTime() );

			// Find Thursday of this week starting on Monday
			checkDate.setDate( checkDate.getDate() + 4 - ( checkDate.getDay() || 7 ) );

			time = checkDate.getTime();
			checkDate.setMonth( 0 ); // Compare with Jan 1
			checkDate.setDate( 1 );
			return Math.floor( Math.round( ( time - checkDate ) / 86400000 ) / 7 ) + 1;
		},

		/* Parse a string value into a date object.
		 * See formatDate below for the possible formats.
		 *
		 * @param  format string - the expected format of the date
		 * @param  value string - the date in the above format
		 * @param  settings Object - attributes include:
		 *					shortYearCutoff  number - the cutoff year for determining the century (optional)
		 *					dayNamesShort	string[7] - abbreviated names of the days from Sunday (optional)
		 *					dayNames		string[7] - names of the days from Sunday (optional)
		 *					monthNamesShort string[12] - abbreviated names of the months (optional)
		 *					monthNames		string[12] - names of the months (optional)
		 * @return  Date - the extracted date value or null if value is blank
		 */
		parseDate: function( format, value, settings ) {
			if ( format == null || value == null ) {
				throw "Invalid arguments";
			}

			value = ( typeof value === "object" ? value.toString() : value + "" );
			if ( value === "" ) {
				return null;
			}

			var iFormat, dim, extra,
				iValue = 0,
				shortYearCutoffTemp = ( settings ? settings.shortYearCutoff : null ) || this._defaults.shortYearCutoff,
				shortYearCutoff = ( typeof shortYearCutoffTemp !== "string" ? shortYearCutoffTemp :
					new Date().getFullYear() % 100 + parseInt( shortYearCutoffTemp, 10 ) ),
				dayNamesShort = ( settings ? settings.dayNamesShort : null ) || this._defaults.dayNamesShort,
				dayNames = ( settings ? settings.dayNames : null ) || this._defaults.dayNames,
				monthNamesShort = ( settings ? settings.monthNamesShort : null ) || this._defaults.monthNamesShort,
				monthNames = ( settings ? settings.monthNames : null ) || this._defaults.monthNames,
				year = -1,
				month = -1,
				day = -1,
				doy = -1,
				literal = false,
				date,

				// Check whether a format character is doubled
				lookAhead = function( match ) {
					var matches = ( iFormat + 1 < format.length && format.charAt( iFormat + 1 ) === match );
					if ( matches ) {
						iFormat++;
					}
					return matches;
				},

				// Extract a number from the string value
				getNumber = function( match ) {
					var isDoubled = lookAhead( match ),
						size = ( match === "@" ? 14 : ( match === "!" ? 20 :
						( match === "y" && isDoubled ? 4 : ( match === "o" ? 3 : 2 ) ) ) ),
						minSize = ( match === "y" ? size : 1 ),
						digits = new RegExp( "^\\d{" + minSize + "," + size + "}" ),
						num = value.substring( iValue ).match( digits );
					if ( !num ) {
						throw "Missing number at position " + iValue;
					}
					iValue += num[ 0 ].length;
					return parseInt( num[ 0 ], 10 );
				},

				// Extract a name from the string value and convert to an index
				getName = function( match, shortNames, longNames ) {
					var index = -1,
						names = $.map( lookAhead( match ) ? longNames : shortNames, function( v, k ) {
							return [ [ k, v ] ];
						} ).sort( function( a, b ) {
							return -( a[ 1 ].length - b[ 1 ].length );
						} );

					$.each( names, function( i, pair ) {
						var name = pair[ 1 ];
						if ( value.substr( iValue, name.length ).toLowerCase() === name.toLowerCase() ) {
							index = pair[ 0 ];
							iValue += name.length;
							return false;
						}
					} );
					if ( index !== -1 ) {
						return index + 1;
					} else {
						throw "Unknown name at position " + iValue;
					}
				},

				// Confirm that a literal character matches the string value
				checkLiteral = function() {
					if ( value.charAt( iValue ) !== format.charAt( iFormat ) ) {
						throw "Unexpected literal at position " + iValue;
					}
					iValue++;
				};

			for ( iFormat = 0; iFormat < format.length; iFormat++ ) {
				if ( literal ) {
					if ( format.charAt( iFormat ) === "'" && !lookAhead( "'" ) ) {
						literal = false;
					} else {
						checkLiteral();
					}
				} else {
					switch ( format.charAt( iFormat ) ) {
						case "d":
							day = getNumber( "d" );
							break;
						case "D":
							getName( "D", dayNamesShort, dayNames );
							break;
						case "o":
							doy = getNumber( "o" );
							break;
						case "m":
							month = getNumber( "m" );
							break;
						case "M":
							month = getName( "M", monthNamesShort, monthNames );
							break;
						case "y":
							year = getNumber( "y" );
							break;
						case "@":
							date = new Date( getNumber( "@" ) );
							year = date.getFullYear();
							month = date.getMonth() + 1;
							day = date.getDate();
							break;
						case "!":
							date = new Date( ( getNumber( "!" ) - this._ticksTo1970 ) / 10000 );
							year = date.getFullYear();
							month = date.getMonth() + 1;
							day = date.getDate();
							break;
						case "'":
							if ( lookAhead( "'" ) ) {
								checkLiteral();
							} else {
								literal = true;
							}
							break;
						default:
							checkLiteral();
					}
				}
			}

			if ( iValue < value.length ) {
				extra = value.substr( iValue );
				if ( !/^\s+/.test( extra ) ) {
					throw "Extra/unparsed characters found in date: " + extra;
				}
			}

			if ( year === -1 ) {
				year = new Date().getFullYear();
			} else if ( year < 100 ) {
				year += new Date().getFullYear() - new Date().getFullYear() % 100 +
					( year <= shortYearCutoff ? 0 : -100 );
			}

			if ( doy > -1 ) {
				month = 1;
				day = doy;
				do {
					dim = this._getDaysInMonth( year, month - 1 );
					if ( day <= dim ) {
						break;
					}
					month++;
					day -= dim;
				} while ( true );
			}

			date = this._daylightSavingAdjust( new Date( year, month - 1, day ) );
			if ( date.getFullYear() !== year || date.getMonth() + 1 !== month || date.getDate() !== day ) {
				throw "Invalid date"; // E.g. 31/02/00
			}
			return date;
		},

		/* Standard date formats. */
		ATOM: "yy-mm-dd", // RFC 3339 (ISO 8601)
		COOKIE: "D, dd M yy",
		ISO_8601: "yy-mm-dd",
		RFC_822: "D, d M y",
		RFC_850: "DD, dd-M-y",
		RFC_1036: "D, d M y",
		RFC_1123: "D, d M yy",
		RFC_2822: "D, d M yy",
		RSS: "D, d M y", // RFC 822
		TICKS: "!",
		TIMESTAMP: "@",
		W3C: "yy-mm-dd", // ISO 8601

		_ticksTo1970: ( ( ( 1970 - 1 ) * 365 + Math.floor( 1970 / 4 ) - Math.floor( 1970 / 100 ) +
			Math.floor( 1970 / 400 ) ) * 24 * 60 * 60 * 10000000 ),

		/* Format a date object into a string value.
		 * The format can be combinations of the following:
		 * d  - day of month (no leading zero)
		 * dd - day of month (two digit)
		 * o  - day of year (no leading zeros)
		 * oo - day of year (three digit)
		 * D  - day name short
		 * DD - day name long
		 * m  - month of year (no leading zero)
		 * mm - month of year (two digit)
		 * M  - month name short
		 * MM - month name long
		 * y  - year (two digit)
		 * yy - year (four digit)
		 * @ - Unix timestamp (ms since 01/01/1970)
		 * ! - Windows ticks (100ns since 01/01/0001)
		 * "..." - literal text
		 * '' - single quote
		 *
		 * @param  format string - the desired format of the date
		 * @param  date Date - the date value to format
		 * @param  settings Object - attributes include:
		 *					dayNamesShort	string[7] - abbreviated names of the days from Sunday (optional)
		 *					dayNames		string[7] - names of the days from Sunday (optional)
		 *					monthNamesShort string[12] - abbreviated names of the months (optional)
		 *					monthNames		string[12] - names of the months (optional)
		 * @return  string - the date in the above format
		 */
		formatDate: function( format, date, settings ) {
			if ( !date ) {
				return "";
			}

			var iFormat,
				dayNamesShort = ( settings ? settings.dayNamesShort : null ) || this._defaults.dayNamesShort,
				dayNames = ( settings ? settings.dayNames : null ) || this._defaults.dayNames,
				monthNamesShort = ( settings ? settings.monthNamesShort : null ) || this._defaults.monthNamesShort,
				monthNames = ( settings ? settings.monthNames : null ) || this._defaults.monthNames,

				// Check whether a format character is doubled
				lookAhead = function( match ) {
					var matches = ( iFormat + 1 < format.length && format.charAt( iFormat + 1 ) === match );
					if ( matches ) {
						iFormat++;
					}
					return matches;
				},

				// Format a number, with leading zero if necessary
				formatNumber = function( match, value, len ) {
					var num = "" + value;
					if ( lookAhead( match ) ) {
						while ( num.length < len ) {
							num = "0" + num;
						}
					}
					return num;
				},

				// Format a name, short or long as requested
				formatName = function( match, value, shortNames, longNames ) {
					return ( lookAhead( match ) ? longNames[ value ] : shortNames[ value ] );
				},
				output = "",
				literal = false;

			if ( date ) {
				for ( iFormat = 0; iFormat < format.length; iFormat++ ) {
					if ( literal ) {
						if ( format.charAt( iFormat ) === "'" && !lookAhead( "'" ) ) {
							literal = false;
						} else {
							output += format.charAt( iFormat );
						}
					} else {
						switch ( format.charAt( iFormat ) ) {
							case "d":
								output += formatNumber( "d", date.getDate(), 2 );
								break;
							case "D":
								output += formatName( "D", date.getDay(), dayNamesShort, dayNames );
								break;
							case "o":
								output += formatNumber( "o",
									Math.round( ( new Date( date.getFullYear(), date.getMonth(), date.getDate() ).getTime() - new Date( date.getFullYear(), 0, 0 ).getTime() ) / 86400000 ), 3 );
								break;
							case "m":
								output += formatNumber( "m", date.getMonth() + 1, 2 );
								break;
							case "M":
								output += formatName( "M", date.getMonth(), monthNamesShort, monthNames );
								break;
							case "y":
								output += ( lookAhead( "y" ) ? date.getFullYear() :
									( date.getFullYear() % 100 < 10 ? "0" : "" ) + date.getFullYear() % 100 );
								break;
							case "@":
								output += date.getTime();
								break;
							case "!":
								output += date.getTime() * 10000 + this._ticksTo1970;
								break;
							case "'":
								if ( lookAhead( "'" ) ) {
									output += "'";
								} else {
									literal = true;
								}
								break;
							default:
								output += format.charAt( iFormat );
						}
					}
				}
			}
			return output;
		},

		/* Extract all possible characters from the date format. */
		_possibleChars: function( format ) {
			var iFormat,
				chars = "",
				literal = false,

				// Check whether a format character is doubled
				lookAhead = function( match ) {
					var matches = ( iFormat + 1 < format.length && format.charAt( iFormat + 1 ) === match );
					if ( matches ) {
						iFormat++;
					}
					return matches;
				};

			for ( iFormat = 0; iFormat < format.length; iFormat++ ) {
				if ( literal ) {
					if ( format.charAt( iFormat ) === "'" && !lookAhead( "'" ) ) {
						literal = false;
					} else {
						chars += format.charAt( iFormat );
					}
				} else {
					switch ( format.charAt( iFormat ) ) {
						case "d": case "m": case "y": case "@":
							chars += "0123456789";
							break;
						case "D": case "M":
							return null; // Accept anything
						case "'":
							if ( lookAhead( "'" ) ) {
								chars += "'";
							} else {
								literal = true;
							}
							break;
						default:
							chars += format.charAt( iFormat );
					}
				}
			}
			return chars;
		},

		/* Get a setting value, defaulting if necessary. */
		_get: function( inst, name ) {
			return inst.settings[ name ] !== undefined ?
				inst.settings[ name ] : this._defaults[ name ];
		},

		/* Parse existing date and initialise date picker. */
		_setDateFromField: function( inst, noDefault ) {
			if ( inst.input.val() === inst.lastVal ) {
				return;
			}

			var dateFormat = this._get( inst, "dateFormat" ),
				dates = inst.lastVal = inst.input ? inst.input.val() : null,
				defaultDate = this._getDefaultDate( inst ),
				date = defaultDate,
				settings = this._getFormatConfig( inst );

			try {
				date = this.parseDate( dateFormat, dates, settings ) || defaultDate;
			} catch ( event ) {
				dates = ( noDefault ? "" : dates );
			}
			inst.selectedDay = date.getDate();
			inst.drawMonth = inst.selectedMonth = date.getMonth();
			inst.drawYear = inst.selectedYear = date.getFullYear();
			inst.currentDay = ( dates ? date.getDate() : 0 );
			inst.currentMonth = ( dates ? date.getMonth() : 0 );
			inst.currentYear = ( dates ? date.getFullYear() : 0 );
			this._adjustInstDate( inst );
		},

		/* Retrieve the default date shown on opening. */
		_getDefaultDate: function( inst ) {
			return this._restrictMinMax( inst,
				this._determineDate( inst, this._get( inst, "defaultDate" ), new Date() ) );
		},

		/* A date may be specified as an exact value or a relative one. */
		_determineDate: function( inst, date, defaultDate ) {
			var offsetNumeric = function( offset ) {
					var date = new Date();
					date.setDate( date.getDate() + offset );
					return date;
				},
				offsetString = function( offset ) {
					try {
						return $.datepicker.parseDate( $.datepicker._get( inst, "dateFormat" ),
							offset, $.datepicker._getFormatConfig( inst ) );
					}
					catch ( e ) {

						// Ignore
					}

					var date = ( offset.toLowerCase().match( /^c/ ) ?
						$.datepicker._getDate( inst ) : null ) || new Date(),
						year = date.getFullYear(),
						month = date.getMonth(),
						day = date.getDate(),
						pattern = /([+\-]?[0-9]+)\s*(d|D|w|W|m|M|y|Y)?/g,
						matches = pattern.exec( offset );

					while ( matches ) {
						switch ( matches[ 2 ] || "d" ) {
							case "d" : case "D" :
								day += parseInt( matches[ 1 ], 10 ); break;
							case "w" : case "W" :
								day += parseInt( matches[ 1 ], 10 ) * 7; break;
							case "m" : case "M" :
								month += parseInt( matches[ 1 ], 10 );
								day = Math.min( day, $.datepicker._getDaysInMonth( year, month ) );
								break;
							case "y": case "Y" :
								year += parseInt( matches[ 1 ], 10 );
								day = Math.min( day, $.datepicker._getDaysInMonth( year, month ) );
								break;
						}
						matches = pattern.exec( offset );
					}
					return new Date( year, month, day );
				},
				newDate = ( date == null || date === "" ? defaultDate : ( typeof date === "string" ? offsetString( date ) :
					( typeof date === "number" ? ( isNaN( date ) ? defaultDate : offsetNumeric( date ) ) : new Date( date.getTime() ) ) ) );

			newDate = ( newDate && newDate.toString() === "Invalid Date" ? defaultDate : newDate );
			if ( newDate ) {
				newDate.setHours( 0 );
				newDate.setMinutes( 0 );
				newDate.setSeconds( 0 );
				newDate.setMilliseconds( 0 );
			}
			return this._daylightSavingAdjust( newDate );
		},

		/* Handle switch to/from daylight saving.
		 * Hours may be non-zero on daylight saving cut-over:
		 * > 12 when midnight changeover, but then cannot generate
		 * midnight datetime, so jump to 1AM, otherwise reset.
		 * @param  date  (Date) the date to check
		 * @return  (Date) the corrected date
		 */
		_daylightSavingAdjust: function( date ) {
			if ( !date ) {
				return null;
			}
			date.setHours( date.getHours() > 12 ? date.getHours() + 2 : 0 );
			return date;
		},

		/* Set the date(s) directly. */
		_setDate: function( inst, date, noChange ) {
			var clear = !date,
				origMonth = inst.selectedMonth,
				origYear = inst.selectedYear,
				newDate = this._restrictMinMax( inst, this._determineDate( inst, date, new Date() ) );

			inst.selectedDay = inst.currentDay = newDate.getDate();
			inst.drawMonth = inst.selectedMonth = inst.currentMonth = newDate.getMonth();
			inst.drawYear = inst.selectedYear = inst.currentYear = newDate.getFullYear();
			if ( ( origMonth !== inst.selectedMonth || origYear !== inst.selectedYear ) && !noChange ) {
				this._notifyChange( inst );
			}
			this._adjustInstDate( inst );
			if ( inst.input ) {
				inst.input.val( clear ? "" : this._formatDate( inst ) );
			}
		},

		/* Retrieve the date(s) directly. */
		_getDate: function( inst ) {
			var startDate = ( !inst.currentYear || ( inst.input && inst.input.val() === "" ) ? null :
				this._daylightSavingAdjust( new Date(
				inst.currentYear, inst.currentMonth, inst.currentDay ) ) );
				return startDate;
		},

		/* Attach the onxxx handlers.  These are declared statically so
		 * they work with static code transformers like Caja.
		 */
		_attachHandlers: function( inst ) {
			var stepMonths = this._get( inst, "stepMonths" ),
				id = "#" + inst.id.replace( /\\\\/g, "\\" );
			inst.dpDiv.find( "[data-handler]" ).map( function() {
				var handler = {
					prev: function() {
						$.datepicker._adjustDate( id, -stepMonths, "M" );
					},
					next: function() {
						$.datepicker._adjustDate( id, +stepMonths, "M" );
					},
					hide: function() {
						$.datepicker._hideDatepicker();
					},
					today: function() {
						$.datepicker._gotoToday( id );
					},
					selectDay: function() {
						$.datepicker._selectDay( id, +this.getAttribute( "data-month" ), +this.getAttribute( "data-year" ), this );
						return false;
					},
					selectMonth: function() {
						$.datepicker._selectMonthYear( id, this, "M" );
						return false;
					},
					selectYear: function() {
						$.datepicker._selectMonthYear( id, this, "Y" );
						return false;
					}
				};
				$( this ).on( this.getAttribute( "data-event" ), handler[ this.getAttribute( "data-handler" ) ] );
			} );
		},

		/* Generate the HTML for the current state of the date picker. */
		_generateHTML: function( inst ) {
			var maxDraw, prevText, prev, nextText, next, currentText, gotoDate,
				controls, buttonPanel, firstDay, showWeek, dayNames, dayNamesMin,
				monthNames, monthNamesShort, beforeShowDay, showOtherMonths,
				selectOtherMonths, defaultDate, html, dow, row, group, col, selectedDate,
				cornerClass, calender, thead, day, daysInMonth, leadDays, curRows, numRows,
				printDate, dRow, tbody, daySettings, otherMonth, unselectable,
				tempDate = new Date(),
				today = this._daylightSavingAdjust(
					new Date( tempDate.getFullYear(), tempDate.getMonth(), tempDate.getDate() ) ), // clear time
				isRTL = this._get( inst, "isRTL" ),
				showButtonPanel = this._get( inst, "showButtonPanel" ),
				hideIfNoPrevNext = this._get( inst, "hideIfNoPrevNext" ),
				navigationAsDateFormat = this._get( inst, "navigationAsDateFormat" ),
				numMonths = this._getNumberOfMonths( inst ),
				showCurrentAtPos = this._get( inst, "showCurrentAtPos" ),
				stepMonths = this._get( inst, "stepMonths" ),
				isMultiMonth = ( numMonths[ 0 ] !== 1 || numMonths[ 1 ] !== 1 ),
				currentDate = this._daylightSavingAdjust( ( !inst.currentDay ? new Date( 9999, 9, 9 ) :
					new Date( inst.currentYear, inst.currentMonth, inst.currentDay ) ) ),
				minDate = this._getMinMaxDate( inst, "min" ),
				maxDate = this._getMinMaxDate( inst, "max" ),
				drawMonth = inst.drawMonth - showCurrentAtPos,
				drawYear = inst.drawYear;

			if ( drawMonth < 0 ) {
				drawMonth += 12;
				drawYear--;
			}
			if ( maxDate ) {
				maxDraw = this._daylightSavingAdjust( new Date( maxDate.getFullYear(),
					maxDate.getMonth() - ( numMonths[ 0 ] * numMonths[ 1 ] ) + 1, maxDate.getDate() ) );
				maxDraw = ( minDate && maxDraw < minDate ? minDate : maxDraw );
				while ( this._daylightSavingAdjust( new Date( drawYear, drawMonth, 1 ) ) > maxDraw ) {
					drawMonth--;
					if ( drawMonth < 0 ) {
						drawMonth = 11;
						drawYear--;
					}
				}
			}
			inst.drawMonth = drawMonth;
			inst.drawYear = drawYear;

			prevText = this._get( inst, "prevText" );
			prevText = ( !navigationAsDateFormat ? prevText : this.formatDate( prevText,
				this._daylightSavingAdjust( new Date( drawYear, drawMonth - stepMonths, 1 ) ),
				this._getFormatConfig( inst ) ) );

			prev = ( this._canAdjustMonth( inst, -1, drawYear, drawMonth ) ?
				"<a class='ui-datepicker-prev ui-corner-all' data-handler='prev' data-event='click'" +
				" title='" + prevText + "'><span class='ui-icon ui-icon-circle-triangle-" + ( isRTL ? "e" : "w" ) + "'>" + prevText + "</span></a>" :
				( hideIfNoPrevNext ? "" : "<a class='ui-datepicker-prev ui-corner-all ui-state-disabled' title='" + prevText + "'><span class='ui-icon ui-icon-circle-triangle-" + ( isRTL ? "e" : "w" ) + "'>" + prevText + "</span></a>" ) );

			nextText = this._get( inst, "nextText" );
			nextText = ( !navigationAsDateFormat ? nextText : this.formatDate( nextText,
				this._daylightSavingAdjust( new Date( drawYear, drawMonth + stepMonths, 1 ) ),
				this._getFormatConfig( inst ) ) );

			next = ( this._canAdjustMonth( inst, +1, drawYear, drawMonth ) ?
				"<a class='ui-datepicker-next ui-corner-all' data-handler='next' data-event='click'" +
				" title='" + nextText + "'><span class='ui-icon ui-icon-circle-triangle-" + ( isRTL ? "w" : "e" ) + "'>" + nextText + "</span></a>" :
				( hideIfNoPrevNext ? "" : "<a class='ui-datepicker-next ui-corner-all ui-state-disabled' title='" + nextText + "'><span class='ui-icon ui-icon-circle-triangle-" + ( isRTL ? "w" : "e" ) + "'>" + nextText + "</span></a>" ) );

			currentText = this._get( inst, "currentText" );
			gotoDate = ( this._get( inst, "gotoCurrent" ) && inst.currentDay ? currentDate : today );
			currentText = ( !navigationAsDateFormat ? currentText :
				this.formatDate( currentText, gotoDate, this._getFormatConfig( inst ) ) );

			controls = ( !inst.inline ? "<button type='button' class='ui-datepicker-close ui-state-default ui-priority-primary ui-corner-all' data-handler='hide' data-event='click'>" +
				this._get( inst, "closeText" ) + "</button>" : "" );

			buttonPanel = ( showButtonPanel ) ? "<div class='ui-datepicker-buttonpane ui-widget-content'>" + ( isRTL ? controls : "" ) +
				( this._isInRange( inst, gotoDate ) ? "<button type='button' class='ui-datepicker-current ui-state-default ui-priority-secondary ui-corner-all' data-handler='today' data-event='click'" +
				">" + currentText + "</button>" : "" ) + ( isRTL ? "" : controls ) + "</div>" : "";

			firstDay = parseInt( this._get( inst, "firstDay" ), 10 );
			firstDay = ( isNaN( firstDay ) ? 0 : firstDay );

			showWeek = this._get( inst, "showWeek" );
			dayNames = this._get( inst, "dayNames" );
			dayNamesMin = this._get( inst, "dayNamesMin" );
			monthNames = this._get( inst, "monthNames" );
			monthNamesShort = this._get( inst, "monthNamesShort" );
			beforeShowDay = this._get( inst, "beforeShowDay" );
			showOtherMonths = this._get( inst, "showOtherMonths" );
			selectOtherMonths = this._get( inst, "selectOtherMonths" );
			defaultDate = this._getDefaultDate( inst );
			html = "";

			for ( row = 0; row < numMonths[ 0 ]; row++ ) {
				group = "";
				this.maxRows = 4;
				for ( col = 0; col < numMonths[ 1 ]; col++ ) {
					selectedDate = this._daylightSavingAdjust( new Date( drawYear, drawMonth, inst.selectedDay ) );
					cornerClass = " ui-corner-all";
					calender = "";
					if ( isMultiMonth ) {
						calender += "<div class='ui-datepicker-group";
						if ( numMonths[ 1 ] > 1 ) {
							switch ( col ) {
								case 0: calender += " ui-datepicker-group-first";
									cornerClass = " ui-corner-" + ( isRTL ? "right" : "left" ); break;
								case numMonths[ 1 ] - 1: calender += " ui-datepicker-group-last";
									cornerClass = " ui-corner-" + ( isRTL ? "left" : "right" ); break;
								default: calender += " ui-datepicker-group-middle"; cornerClass = ""; break;
							}
						}
						calender += "'>";
					}
					calender += "<div class='ui-datepicker-header ui-widget-header ui-helper-clearfix" + cornerClass + "'>" +
						( /all|left/.test( cornerClass ) && row === 0 ? ( isRTL ? next : prev ) : "" ) +
						( /all|right/.test( cornerClass ) && row === 0 ? ( isRTL ? prev : next ) : "" ) +
						this._generateMonthYearHeader( inst, drawMonth, drawYear, minDate, maxDate,
						row > 0 || col > 0, monthNames, monthNamesShort ) + // draw month headers
						"</div><table class='ui-datepicker-calendar'><thead>" +
						"<tr>";
					thead = ( showWeek ? "<th class='ui-datepicker-week-col'>" + this._get( inst, "weekHeader" ) + "</th>" : "" );
					for ( dow = 0; dow < 7; dow++ ) { // days of the week
						day = ( dow + firstDay ) % 7;
						thead += "<th scope='col'" + ( ( dow + firstDay + 6 ) % 7 >= 5 ? " class='ui-datepicker-week-end'" : "" ) + ">" +
							"<span title='" + dayNames[ day ] + "'>" + dayNamesMin[ day ] + "</span></th>";
					}
					calender += thead + "</tr></thead><tbody>";
					daysInMonth = this._getDaysInMonth( drawYear, drawMonth );
					if ( drawYear === inst.selectedYear && drawMonth === inst.selectedMonth ) {
						inst.selectedDay = Math.min( inst.selectedDay, daysInMonth );
					}
					leadDays = ( this._getFirstDayOfMonth( drawYear, drawMonth ) - firstDay + 7 ) % 7;
					curRows = Math.ceil( ( leadDays + daysInMonth ) / 7 ); // calculate the number of rows to generate
					numRows = ( isMultiMonth ? this.maxRows > curRows ? this.maxRows : curRows : curRows ); //If multiple months, use the higher number of rows (see #7043)
					this.maxRows = numRows;
					printDate = this._daylightSavingAdjust( new Date( drawYear, drawMonth, 1 - leadDays ) );
					for ( dRow = 0; dRow < numRows; dRow++ ) { // create date picker rows
						calender += "<tr>";
						tbody = ( !showWeek ? "" : "<td class='ui-datepicker-week-col'>" +
							this._get( inst, "calculateWeek" )( printDate ) + "</td>" );
						for ( dow = 0; dow < 7; dow++ ) { // create date picker days
							daySettings = ( beforeShowDay ?
								beforeShowDay.apply( ( inst.input ? inst.input[ 0 ] : null ), [ printDate ] ) : [ true, "" ] );
							otherMonth = ( printDate.getMonth() !== drawMonth );
							unselectable = ( otherMonth && !selectOtherMonths ) || !daySettings[ 0 ] ||
								( minDate && printDate < minDate ) || ( maxDate && printDate > maxDate );
							tbody += "<td class='" +
								( ( dow + firstDay + 6 ) % 7 >= 5 ? " ui-datepicker-week-end" : "" ) + // highlight weekends
								( otherMonth ? " ui-datepicker-other-month" : "" ) + // highlight days from other months
								( ( printDate.getTime() === selectedDate.getTime() && drawMonth === inst.selectedMonth && inst._keyEvent ) || // user pressed key
								( defaultDate.getTime() === printDate.getTime() && defaultDate.getTime() === selectedDate.getTime() ) ?

								// or defaultDate is current printedDate and defaultDate is selectedDate
								" " + this._dayOverClass : "" ) + // highlight selected day
								( unselectable ? " " + this._unselectableClass + " ui-state-disabled" : "" ) +  // highlight unselectable days
								( otherMonth && !showOtherMonths ? "" : " " + daySettings[ 1 ] + // highlight custom dates
								( printDate.getTime() === currentDate.getTime() ? " " + this._currentClass : "" ) + // highlight selected day
								( printDate.getTime() === today.getTime() ? " ui-datepicker-today" : "" ) ) + "'" + // highlight today (if different)
								( ( !otherMonth || showOtherMonths ) && daySettings[ 2 ] ? " title='" + daySettings[ 2 ].replace( /'/g, "&#39;" ) + "'" : "" ) + // cell title
								( unselectable ? "" : " data-handler='selectDay' data-event='click' data-month='" + printDate.getMonth() + "' data-year='" + printDate.getFullYear() + "'" ) + ">" + // actions
								( otherMonth && !showOtherMonths ? "&#xa0;" : // display for other months
								( unselectable ? "<span class='ui-state-default'>" + printDate.getDate() + "</span>" : "<a class='ui-state-default" +
								( printDate.getTime() === today.getTime() ? " ui-state-highlight" : "" ) +
								( printDate.getTime() === currentDate.getTime() ? " ui-state-active" : "" ) + // highlight selected day
								( otherMonth ? " ui-priority-secondary" : "" ) + // distinguish dates from other months
								"' href='#'>" + printDate.getDate() + "</a>" ) ) + "</td>"; // display selectable date
							printDate.setDate( printDate.getDate() + 1 );
							printDate = this._daylightSavingAdjust( printDate );
						}
						calender += tbody + "</tr>";
					}
					drawMonth++;
					if ( drawMonth > 11 ) {
						drawMonth = 0;
						drawYear++;
					}
					calender += "</tbody></table>" + ( isMultiMonth ? "</div>" +
								( ( numMonths[ 0 ] > 0 && col === numMonths[ 1 ] - 1 ) ? "<div class='ui-datepicker-row-break'></div>" : "" ) : "" );
					group += calender;
				}
				html += group;
			}
			html += buttonPanel;
			inst._keyEvent = false;
			return html;
		},

		/* Generate the month and year header. */
		_generateMonthYearHeader: function( inst, drawMonth, drawYear, minDate, maxDate,
				secondary, monthNames, monthNamesShort ) {

			var inMinYear, inMaxYear, month, years, thisYear, determineYear, year, endYear,
				changeMonth = this._get( inst, "changeMonth" ),
				changeYear = this._get( inst, "changeYear" ),
				showMonthAfterYear = this._get( inst, "showMonthAfterYear" ),
				html = "<div class='ui-datepicker-title'>",
				monthHtml = "";

			// Month selection
			if ( secondary || !changeMonth ) {
				monthHtml += "<span class='ui-datepicker-month'>" + monthNames[ drawMonth ] + "</span>";
			} else {
				inMinYear = ( minDate && minDate.getFullYear() === drawYear );
				inMaxYear = ( maxDate && maxDate.getFullYear() === drawYear );
				monthHtml += "<select class='ui-datepicker-month' data-handler='selectMonth' data-event='change'>";
				for ( month = 0; month < 12; month++ ) {
					if ( ( !inMinYear || month >= minDate.getMonth() ) && ( !inMaxYear || month <= maxDate.getMonth() ) ) {
						monthHtml += "<option value='" + month + "'" +
							( month === drawMonth ? " selected='selected'" : "" ) +
							">" + monthNamesShort[ month ] + "</option>";
					}
				}
				monthHtml += "</select>";
			}

			if ( !showMonthAfterYear ) {
				html += monthHtml + ( secondary || !( changeMonth && changeYear ) ? "&#xa0;" : "" );
			}

			// Year selection
			if ( !inst.yearshtml ) {
				inst.yearshtml = "";
				if ( secondary || !changeYear ) {
					html += "<span class='ui-datepicker-year'>" + drawYear + "</span>";
				} else {

					// determine range of years to display
					years = this._get( inst, "yearRange" ).split( ":" );
					thisYear = new Date().getFullYear();
					determineYear = function( value ) {
						var year = ( value.match( /c[+\-].*/ ) ? drawYear + parseInt( value.substring( 1 ), 10 ) :
							( value.match( /[+\-].*/ ) ? thisYear + parseInt( value, 10 ) :
							parseInt( value, 10 ) ) );
						return ( isNaN( year ) ? thisYear : year );
					};
					year = determineYear( years[ 0 ] );
					endYear = Math.max( year, determineYear( years[ 1 ] || "" ) );
					year = ( minDate ? Math.max( year, minDate.getFullYear() ) : year );
					endYear = ( maxDate ? Math.min( endYear, maxDate.getFullYear() ) : endYear );
					inst.yearshtml += "<select class='ui-datepicker-year' data-handler='selectYear' data-event='change'>";
					for ( ; year <= endYear; year++ ) {
						inst.yearshtml += "<option value='" + year + "'" +
							( year === drawYear ? " selected='selected'" : "" ) +
							">" + year + "</option>";
					}
					inst.yearshtml += "</select>";

					html += inst.yearshtml;
					inst.yearshtml = null;
				}
			}

			html += this._get( inst, "yearSuffix" );
			if ( showMonthAfterYear ) {
				html += ( secondary || !( changeMonth && changeYear ) ? "&#xa0;" : "" ) + monthHtml;
			}
			html += "</div>"; // Close datepicker_header
			return html;
		},

		/* Adjust one of the date sub-fields. */
		_adjustInstDate: function( inst, offset, period ) {
			var year = inst.selectedYear + ( period === "Y" ? offset : 0 ),
				month = inst.selectedMonth + ( period === "M" ? offset : 0 ),
				day = Math.min( inst.selectedDay, this._getDaysInMonth( year, month ) ) + ( period === "D" ? offset : 0 ),
				date = this._restrictMinMax( inst, this._daylightSavingAdjust( new Date( year, month, day ) ) );

			inst.selectedDay = date.getDate();
			inst.drawMonth = inst.selectedMonth = date.getMonth();
			inst.drawYear = inst.selectedYear = date.getFullYear();
			if ( period === "M" || period === "Y" ) {
				this._notifyChange( inst );
			}
		},

		/* Ensure a date is within any min/max bounds. */
		_restrictMinMax: function( inst, date ) {
			var minDate = this._getMinMaxDate( inst, "min" ),
				maxDate = this._getMinMaxDate( inst, "max" ),
				newDate = ( minDate && date < minDate ? minDate : date );
			return ( maxDate && newDate > maxDate ? maxDate : newDate );
		},

		/* Notify change of month/year. */
		_notifyChange: function( inst ) {
			var onChange = this._get( inst, "onChangeMonthYear" );
			if ( onChange ) {
				onChange.apply( ( inst.input ? inst.input[ 0 ] : null ),
					[ inst.selectedYear, inst.selectedMonth + 1, inst ] );
			}
		},

		/* Determine the number of months to show. */
		_getNumberOfMonths: function( inst ) {
			var numMonths = this._get( inst, "numberOfMonths" );
			return ( numMonths == null ? [ 1, 1 ] : ( typeof numMonths === "number" ? [ 1, numMonths ] : numMonths ) );
		},

		/* Determine the current maximum date - ensure no time components are set. */
		_getMinMaxDate: function( inst, minMax ) {
			return this._determineDate( inst, this._get( inst, minMax + "Date" ), null );
		},

		/* Find the number of days in a given month. */
		_getDaysInMonth: function( year, month ) {
			return 32 - this._daylightSavingAdjust( new Date( year, month, 32 ) ).getDate();
		},

		/* Find the day of the week of the first of a month. */
		_getFirstDayOfMonth: function( year, month ) {
			return new Date( year, month, 1 ).getDay();
		},

		/* Determines if we should allow a "next/prev" month display change. */
		_canAdjustMonth: function( inst, offset, curYear, curMonth ) {
			var numMonths = this._getNumberOfMonths( inst ),
				date = this._daylightSavingAdjust( new Date( curYear,
				curMonth + ( offset < 0 ? offset : numMonths[ 0 ] * numMonths[ 1 ] ), 1 ) );

			if ( offset < 0 ) {
				date.setDate( this._getDaysInMonth( date.getFullYear(), date.getMonth() ) );
			}
			return this._isInRange( inst, date );
		},

		/* Is the given date in the accepted range? */
		_isInRange: function( inst, date ) {
			var yearSplit, currentYear,
				minDate = this._getMinMaxDate( inst, "min" ),
				maxDate = this._getMinMaxDate( inst, "max" ),
				minYear = null,
				maxYear = null,
				years = this._get( inst, "yearRange" );
				if ( years ) {
					yearSplit = years.split( ":" );
					currentYear = new Date().getFullYear();
					minYear = parseInt( yearSplit[ 0 ], 10 );
					maxYear = parseInt( yearSplit[ 1 ], 10 );
					if ( yearSplit[ 0 ].match( /[+\-].*/ ) ) {
						minYear += currentYear;
					}
					if ( yearSplit[ 1 ].match( /[+\-].*/ ) ) {
						maxYear += currentYear;
					}
				}

			return ( ( !minDate || date.getTime() >= minDate.getTime() ) &&
				( !maxDate || date.getTime() <= maxDate.getTime() ) &&
				( !minYear || date.getFullYear() >= minYear ) &&
				( !maxYear || date.getFullYear() <= maxYear ) );
		},

		/* Provide the configuration settings for formatting/parsing. */
		_getFormatConfig: function( inst ) {
			var shortYearCutoff = this._get( inst, "shortYearCutoff" );
			shortYearCutoff = ( typeof shortYearCutoff !== "string" ? shortYearCutoff :
				new Date().getFullYear() % 100 + parseInt( shortYearCutoff, 10 ) );
			return { shortYearCutoff: shortYearCutoff,
				dayNamesShort: this._get( inst, "dayNamesShort" ), dayNames: this._get( inst, "dayNames" ),
				monthNamesShort: this._get( inst, "monthNamesShort" ), monthNames: this._get( inst, "monthNames" ) };
		},

		/* Format the given date for display. */
		_formatDate: function( inst, day, month, year ) {
			if ( !day ) {
				inst.currentDay = inst.selectedDay;
				inst.currentMonth = inst.selectedMonth;
				inst.currentYear = inst.selectedYear;
			}
			var date = ( day ? ( typeof day === "object" ? day :
				this._daylightSavingAdjust( new Date( year, month, day ) ) ) :
				this._daylightSavingAdjust( new Date( inst.currentYear, inst.currentMonth, inst.currentDay ) ) );
			return this.formatDate( this._get( inst, "dateFormat" ), date, this._getFormatConfig( inst ) );
		}
	} );

	/*
	 * Bind hover events for datepicker elements.
	 * Done via delegate so the binding only occurs once in the lifetime of the parent div.
	 * Global datepicker_instActive, set by _updateDatepicker allows the handlers to find their way back to the active picker.
	 */
	function datepicker_bindHover( dpDiv ) {
		var selector = "button, .ui-datepicker-prev, .ui-datepicker-next, .ui-datepicker-calendar td a";
		return dpDiv.on( "mouseout", selector, function() {
				$( this ).removeClass( "ui-state-hover" );
				if ( this.className.indexOf( "ui-datepicker-prev" ) !== -1 ) {
					$( this ).removeClass( "ui-datepicker-prev-hover" );
				}
				if ( this.className.indexOf( "ui-datepicker-next" ) !== -1 ) {
					$( this ).removeClass( "ui-datepicker-next-hover" );
				}
			} )
			.on( "mouseover", selector, datepicker_handleMouseover );
	}

	function datepicker_handleMouseover() {
		if ( !$.datepicker._isDisabledDatepicker( datepicker_instActive.inline ? datepicker_instActive.dpDiv.parent()[ 0 ] : datepicker_instActive.input[ 0 ] ) ) {
			$( this ).parents( ".ui-datepicker-calendar" ).find( "a" ).removeClass( "ui-state-hover" );
			$( this ).addClass( "ui-state-hover" );
			if ( this.className.indexOf( "ui-datepicker-prev" ) !== -1 ) {
				$( this ).addClass( "ui-datepicker-prev-hover" );
			}
			if ( this.className.indexOf( "ui-datepicker-next" ) !== -1 ) {
				$( this ).addClass( "ui-datepicker-next-hover" );
			}
		}
	}

	/* jQuery extend now ignores nulls! */
	function datepicker_extendRemove( target, props ) {
		$.extend( target, props );
		for ( var name in props ) {
			if ( props[ name ] == null ) {
				target[ name ] = props[ name ];
			}
		}
		return target;
	}

	/* Invoke the datepicker functionality.
	   @param  options  string - a command, optionally followed by additional parameters or
						Object - settings for attaching new datepicker functionality
	   @return  jQuery object */
	$.fn.datepicker = function( options ) {

		/* Verify an empty collection wasn't passed - Fixes #6976 */
		if ( !this.length ) {
			return this;
		}

		/* Initialise the date picker. */
		if ( !$.datepicker.initialized ) {
			$( document ).on( "mousedown", $.datepicker._checkExternalClick );
			$.datepicker.initialized = true;
		}

		/* Append datepicker main container to body if not exist. */
		if ( $( "#" + $.datepicker._mainDivId ).length === 0 ) {
			$( "body" ).append( $.datepicker.dpDiv );
		}

		var otherArgs = Array.prototype.slice.call( arguments, 1 );
		if ( typeof options === "string" && ( options === "isDisabled" || options === "getDate" || options === "widget" ) ) {
			return $.datepicker[ "_" + options + "Datepicker" ].
				apply( $.datepicker, [ this[ 0 ] ].concat( otherArgs ) );
		}
		if ( options === "option" && arguments.length === 2 && typeof arguments[ 1 ] === "string" ) {
			return $.datepicker[ "_" + options + "Datepicker" ].
				apply( $.datepicker, [ this[ 0 ] ].concat( otherArgs ) );
		}
		return this.each( function() {
			typeof options === "string" ?
				$.datepicker[ "_" + options + "Datepicker" ].
					apply( $.datepicker, [ this ].concat( otherArgs ) ) :
				$.datepicker._attachDatepicker( this, options );
		} );
	};

	$.datepicker = new Datepicker(); // singleton instance
	$.datepicker.initialized = false;
	$.datepicker.uuid = new Date().getTime();
	$.datepicker.version = "1.12.1";

	var widgetsDatepicker = $.datepicker;
	</script>
    
    <script tyoe="text/javascript">
	/* Inicialització en català per a l'extensió 'UI date picker' per jQuery. */
	/* Writers: (joan.leon@gmail.com). */
	( function( factory ) {
		if ( typeof define === "function" && define.amd ) {

			// AMD. Register as an anonymous module.
			define( [ "../widgets/datepicker" ], factory );
		} else {

			// Browser globals
			factory( jQuery.datepicker );
		}
	}( function( datepicker ) {

	datepicker.regional.ca = {
		closeText: "Tanca",
		prevText: "Anterior",
		nextText: "Següent",
		currentText: "Avui",
		monthNames: [ "gener","febrer","març","abril","maig","juny",
		"juliol","agost","setembre","octubre","novembre","desembre" ],
		monthNamesShort: [ "gen","feb","març","abr","maig","juny",
		"jul","ag","set","oct","nov","des" ],
		dayNames: [ "diumenge","dilluns","dimarts","dimecres","dijous","divendres","dissabte" ],
		dayNamesShort: [ "dg","dl","dt","dc","dj","dv","ds" ],
		dayNamesMin: [ "dg","dl","dt","dc","dj","dv","ds" ],
		weekHeader: "Set",
		dateFormat: "dd/mm/yy",
		firstDay: 1,
		isRTL: false,
		showMonthAfterYear: false,
		yearSuffix: "" };
	datepicker.setDefaults( datepicker.regional.ca );

	return datepicker.regional.ca;

	} ) );
	
	</script>
    
</body>
</html>