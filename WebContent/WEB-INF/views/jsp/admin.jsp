<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html xml:lang="ca-ES" lang="ca-ES">
		<head>						
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="WT.z_idioma" content='ca' />

<!---->
<title>Gestió d'Enquestes. Catalans i catalanes residents a l'exterior. Departament d'Afers i Relacions Institucionals i Exteriors i Transparència</title>

<!-- Carga CSS -->


	<spring:url value="/resources/FW_bootStarp_Generic.css" var="FW_bootStarp_GenericCSS" />
	<spring:url value="/resources/master.responsive.css" var="masterResponsiveCSS" />
	<spring:url value="/resources/styles.css" var="stylesCSS" />
	
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

	<!-- CSS TSystems -->
<link rel="shortcut icon" type="image/x-icon" href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/img/favicon.ico" />
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/css/styles.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/css/leaflet.min.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/css/master.responsive.css" rel="stylesheet" type="text/css"/>

<!--[if IE 9]>
	<link href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/css/master.min.css" rel="stylesheet" type="text/css"/>
	<link href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/css/style_IE9.css" rel="stylesheet" type="text/css"/>
<![endif]-->
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/js/jquery.min.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/js/master.min.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/js/generic_responsive.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/js/master.responsive.js" type="text/javascript"></script>
<!--[if lt IE 9]>
	<link href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/css/style_IE8.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/js/respond.min.js"></script>
	<script type="text/javascript" src="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/js/modernizr.js"></script>
<![endif]-->

<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_capcalera/css/capcalera.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_subcapcalera/css/fpca_subcapcalera.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_article/css/fpca_article.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_llista_simple/css/fpca_llista_simple.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_llista_fonsDestacat/css/fpca_llista_fonsDestacat.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_peu/css/fpca_peu.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_peu_faldoLlista/css/fpca_peu_faldoLlista.css" rel="stylesheet" type="text/css"/>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_peu_faldoGiny/css/fpca_peu_faldoGiny.css" rel="stylesheet" type="text/css"/>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_capcalera/js/fpca_capcalera.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_subcapcalera/js/fpca_subcapcalera.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_article/js/fpca_article.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_llista_simple/js/fpca_llista_simple.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_llista_fonsDestacat/js/fpca_llista_fonsDestacat.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_peu/js/fpca_peu.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_peu_faldoLlista/js/fpca_peu_faldoLlista.js" type="text/javascript"></script>
<script src="http://exteriors.gencat.cat/web/resources/fwkResponsive/fpca_peu_faldoSocial/js/fpca_peu_faldoSocial.js" type="text/javascript"></script>
<link href="http://exteriors.gencat.cat/web/resources/fwkResponsives/common/css/print.css" rel="stylesheet" type="text/css"/>
<meta property="og:title" content="Registre de catalans i catalanes residents a l&#039;exterior "/>
			<meta property="og:site_name" content="Departament d&#039;Afers i Relacions Institucionals i Exteriors i Transparència"/>
			<meta property="og:image" content="http://exteriors.gencat.cat/web/resources/fwk/comuns/img/avatar.jpg" />
			<meta property="og:image:secure_url" content="https://exteriors.gencat.cat/web/resources/fwk/comuns/img/avatar.jpg" />
			<meta property="og:image:width" content="640" />
			<meta property="og:image:height" content="442" />
			<meta name="twitter:title" content="Registre de catalans i catalanes residents a l&#039;exterior "/>
			<meta name="twitter:card" content="summary"/>
			<meta name="twitter:site" content="@gencat">
			<meta name="twitter:image" content="http://exteriors.gencat.cat/web/resources/fwk/comuns/img/avatar.jpg" />
		</head>
		<body>
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
							                                       <label for="nomF">El vostre nom<span class="red">*</span></label>
							                                       <input class="form-control" type="text" value="" name="nom" title="El vostre nom" id="nomF">
							                                       <div class="displaynone red clarification" id="msgNameError">Cal introduir el nom</div>
							                                   </li>
							                                   <li>
							                                       <label for="mailClientF">Adreça de correu electrònic del destinatari<span class="red">*</span></label>
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
																		<label for="captchaAnswerAmic">Introduïu el text de la imatge<span class="red">*</span></label>
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
												
															<li>Catalans i catalanes residents a l&#039;exterior: Gestió d'Enquestes</li>
				
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
									
		<!-- Contenido -->
			<div  id="center_1R" class="center_div" >

			<div class="adminlist">
			<h2>Gestió de les campanyes d'enquestes 2017</h2>
						
				<div class="adminalta">
					<form action="alta">
						<input type= "submit" value="Donar d'alta campanya" class = "btn bgRed white margin_top_xs2">
					</form>
				</div>
				<div class="adminmod">
					<form action="modificacion">
						<input type= "submit" value="Modificar campanya" class = "btn bgRed white margin_top_xs2">
					</form>	
				</div>
				
				<div class="adminreport">
				<form name='adminreport' action="mailing">	
					<input name="submit" type="submit" class = "btn bgRed white margin_top_xs2"
							value="Generar Mailling" />
				</form>			
				</div>
				
				<div class="adminreport">
				<form name='adminreport' action="report">	
					<input name="submit" type="submit" class = "btn bgRed white margin_top_xs2"
							value="Informe d'una campanya" />
				</form>			
				</div>
				
				<div class="adminreport">
				<form name='adminreport' action="login">	
					<input name="submit" type="submit" class = "btn bgRed white margin_top_xs2"
							value="Tanque session" />
				</form>				
			</div>
			
			<div>

		
	<script type="text/javascript">
		
		  function resizeIframe(obj) {
		  	if ($.isWindow( obj )) {
				iframe.style.height = obj.document.body.scrollHeight + 'px';
		  	} else {
		  		iframe = obj;
		  		iframe.style.height = obj.contentWindow.document.body.scrollHeight + 'px';
		  	}
		    
		  }
	</script>
					
 <!-- <iframe  src="./enquesta_form.html" scrolling="yes" id="rex" onload="resizeIframe(this)"></iframe> -->


<style type="text/css">
iframe {
width: 100%;
height: 900px;
border: none;
}
</style>

							
						
					
					
					
				
			
		
	
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
			<!-- GEOATX08-->

<script src="http://exteriors.gencat.cat/web/resources/fwk/analytics/js/webtrends2.js" type="text/javascript"></script>
<script type="text/javascript">
	var _tag = new WebTrends();
	_tag.dcsid="dcstr3znhvz5bdelfmj02e0lf_6v7u";
	_tag.dcsGetId();
</script>
<script type="text/javascript">
	_tag.DCSext.wt_departament="Exteriors";
	_tag.DCSext.wt_web1="Web DEXI";
	_tag.DCSext.wt_web2="Afers Exteriors";
	_tag.DCSext.wt_web3="";
	_tag.status="0";
	_tag.WT.cg_n="";
	_tag.WT.cg_s="";
	_tag.DCSext.subcontent1="";
	_tag.DCSext.subcontent2="";
	_tag.DCSext.subcontent3="";
	_tag.DCSext.subcontent4="";
	_tag.DCSext.site_plus="exteriors";
	try {
		$('document').ready(function (){
			_tag.dcsCollect();
		});
	} catch(e){
		_tag.dcsCollect();
	}

</script>
<noscript><img alt="" id="DCSIMG" width="1" height="1" src="http://statse.webtrendslive.com/dcstr3znhvz5bdelfmj02e0lf_6v7u/njs.gif?dcsuri=/ca/ambits-dactuacio/afers_exteriors/catalans-i-catalanes-exterior/registre/&amp;WT.js=No&amp;WT.tv=8.0.2"/> </noscript></body>
	</html>