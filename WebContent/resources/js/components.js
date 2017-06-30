
//versió 23/07/2014

var ajaxableLoaded = false;

$(document).ready(function(){

	$("#ajaxable").click(function(){
		if(!ajaxableLoaded){
			loadScript();
			ajaxableLoaded=true;
		}
	});
	
	//No tancar menu 
	$('.nav .dropdown').on({
        "shown.bs.dropdown": function() {
            $(this).data('closable', true);
        },
        "click": function() {
            $(this).data('closable', false);
        },
        "hide.bs.dropdown": function() {
            return $(this).data('closable');
        }
    });
	$(document).click(function(event) {	    
	    if ( $(event.target).closest('.dropdown-menu').get(0) == null ) { 
	    	$(".dropdown.open").removeClass('open');
	    }
	});

	

 
 	var window_width = $(window).width();
 	
	//Cercador SAC Tanca tot y obre tot
	$('.all-close').click(function(){
		$('.ulOrganigrama a.darkGray').addClass('collapsed');
		$('.ulOrganigrama .panel-collapse').removeClass('in');
	});
	
	$('.all-open').click(function(){
		$('.ulOrganigrama a.darkGray').removeClass('collapsed');
		$('.ulOrganigrama .panel-collapse').addClass('in');
	});
	
	//Cercador d'organismes, filtres
	if(window_width>768){
		$('#cerca_avancada_id').removeClass('collapse');
	}else{
		$('#cerca_avancada_id').addClass('collapse');
	}
		
	//Boton menu tancar desktop
	$('.dropdown-menu img[alt="Tancar"]').click(function(){
		$('.dropdown').removeClass('open');
	});
	//Boton menu tancar mobil
	//$('.navbar-collapse .menu_tancar').click(function(){
	//	$('.navbar-collapse').removeClass('in');
	//});

	//Limpiar cercador
	$("button[title='Neteja']").click(function(){
		$(this).siblings('input').val('');
	});

	//Funcionalitat boto menu mobil amb botó cercar ()
	$('.fons_header .navbar-toggle').click(function(){
		if($('.fons_header .dos').hasClass("in")) {
			$('.fons_header .dos').removeClass("in");
		}
	});
	$('.fons_header .ico_cerca').click(function(){
		if($('.fons_header .navbar-collapse').hasClass("in")) {
			$('.fons_header .navbar-collapse').removeClass("in");
		}
	});

	// Menú tercer nivell
	(function($){
		$(document).ready(function(){
			$('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(event) {
				event.preventDefault(); 
				event.stopPropagation(); 
				$(this).parent().siblings().removeClass('open');
				$(this).parent().toggleClass('open');
			});
		});
	})(jQuery);

	//Component: panelTabbed (Funcionalitat)
	$('.pestanyes .pestanyes_top .tab').each(function(){
		var thisPanel = $(this).parent().parent().parent().siblings('.pestanyes_bot').children('.panel');
		$(this).click(function(){
			var thisItem = $(this).index();
			$(this).removeClass('active').siblings('.tab').removeClass('active');
			$(this).addClass('active');
			thisPanel.children('.panel-collapse').addClass("collapse");
			thisPanel.children('.panel-collapse').removeClass("in");
			thisPanel.eq(thisItem).children(".panel-collapse").addClass("in");
			thisPanel.removeClass("active");
			thisPanel.eq(thisItem).addClass("active");
			thisPanel.children('.panel-title').children('a').addClass("collapsed");
			thisPanel.eq(thisItem).find(".panel-title").children().removeClass("collapsed");
			
		});
	});
	$('.pestanyes .panel').each(function(){
		var thisItem2 = $(this).index();
		$(this).find(".panel-title").children().click(function(){
			if($(this).hasClass("collapsed")){
				$('.pestanyes .panel').removeClass("active");
				$(this).parent().parent().parent().addClass("active");
				$('.pestanyes_top .tab').removeClass("active");
				$('.pestanyes_top .tab').eq(thisItem2).addClass("active");
			}
			else{
				$('.pestanyes .panel').removeClass("active");
			}
                        $(document).scrollTop(0);

		});
	});

	//Component: panelTabbed - Cercador SAC
	$('.resultats_cerca .pestanyes_top .tab').each(function(indice, elemento){
		$(this).click(function(){
			$('.pestanyes_top .tab').removeClass('active');
			$(this).addClass('active');
			$('.pestanyes_bot > .panel > .panel-collapse').addClass("collapse");
			$('.pestanyes_bot > .panel > .panel-collapse').removeClass("in");
			$('.pestanyes_bot > .panel').eq(indice).children(".panel-collapse").addClass("in");
			$('.pestanyes_bot > .panel').removeClass("active");
			$('.pestanyes_bot > .panel').eq(indice).addClass("active");
			$('.pestanyes .panel-title a').addClass("collapsed");
			$('.pestanyes .panel').eq(indice).find(".panel-title").children().removeClass("collapsed");
		});
	});
	$('.pestanyes.cercador_sac .panel').each(function(indice, elemento){
		$(this).find(".panel-title").children().click(function(){
			if($(this).hasClass("collapsed")){
				$('.pestanyes .panel').removeClass("active");
				$(this).parent().parent().parent().addClass("active");
				$('.pestanyes_top .tab').removeClass("active");
				$('.pestanyes_top .tab').eq(indice).addClass("active");
			}
			else{
				$('.pestanyes .panel').removeClass("active");
			}
		});
	});

	$('.avall').hide();
	$('.mes_link').click(function(){
		if($(this).hasClass('amunt')){
			$('.ocult').each(function(){
				$(this).slideToggle();
			});
			$('.amunt').hide();
			$('.avall').show();
		}
		else {
			$('.ocult').each(function(){
				$(this).slideToggle();
			});
			$('.amunt').show();
			$('.avall').hide();
		}
	});

	//el mes consultant mobil
	$('.el_mes_consultat .panel-heading a').click(function(){
		if($(this).parents('.el_mes_consultat').hasClass('open')){
			$(this).parents('.el_mes_consultat').removeClass('open');
			$('.el_mes_consultat .panel-body').animate({right:'-260px'},400, 'swing');	
		}
		else {
			$(this).parents('.el_mes_consultat').addClass('open');
			$('.el_mes_consultat .panel-body').animate({right:'0px'},400, 'swing');			
		}
	});
	
	//cercador funcionalitat imatges	
	function listar(){
		cont=0;
		if(window_width>751){
			if (window_width>976){
				var iter = 5;
			}else{				
				var iter = 4;
			}
		}else{
			var iter = 2;
		}
		var total = $(".llistat_imatges .item").length;
		$(".llistat_imatges .item").each(function (i) {
			cont++
		
			if(cont==iter || (i+1)==total){
			
				$(this).after("<div class='cercador_imatge_detail'></div>");
				cont=0;
			}
		
		});


		// //mostrar filtres en desktop		
		// if(window_width > 768){
		// 	$('.cerca_avancada_cont').addClass('in');
		// }

		//cercador: mostrar o amagar filtres a pestanya imatges
		$('#cercador_img .nav-tabs li').each(function(){
			$(this).mouseup(function(){
				if($('#cercador_mapa').hasClass('active')) {
					$('#cercador_img .txt_result,#cercador_img .cerca_avancada').show();		
				} else {
					$('#cercador_img .txt_result,#cercador_img .cerca_avancada').hide();	
				}

			});
		});


		//cercador: descheckear radio buttons en filtres
		$('.treu_filtre').click(function(){
			$(this).parent().find('input[type=radio]').prop('checked', false);
		});

	}
	

	listar();

	$(window).resize(function(){	
		
		window_width = $(window).width();
		$('.cercador_imatge_cont .container').css('height','auto');							
		var heightElement = $('.cercador_imatge_cont .container').outerHeight();
	
		$('.cercador_imatge_cont').css('height',heightElement);				
		$('.cercador_imatge_detail.opened').css('height',heightElement);
		var contenido = $(".cercador_imatge_detail.opened").html();		
		$(".cercador_imatge_detail").remove();
		
		//Component: panelTabbed (Funcionalitat)
		if($(this).width() >= 768) {
			$('.fons_header .dos').removeClass('in');
			if($('.pestanyes .panel-collapse').hasClass("in")) {
			}
			else{
				$('.pestanyes .panel:first-child .panel-collapse').addClass("in");
			}
		}

		//mostrar filtres cerca a cercador_sac en canviar de vista mòbil a desktop / tablet		
		if ($('.cerca_avancada_cont').hasClass('in')) {
			if(window_width > 768){
				$('.cerca_avancada_cont').addClass('in');
			}
		}
		
		//Cercador d'organismes, filtres
		if(window_width>768){
			$('#cerca_avancada_id').removeClass('collapse');
		}else{
			$('#cerca_avancada_id').addClass('collapse');
		}

		listar();
	});


	jQuery.fn.nextMatching = function(selector) {
    	return this.nextAll(selector).first();
	}

	jQuery.fn.prevMatching = function(selector) {
    	return this.prevAll(selector).first();
	}

	jQuery.fn.lastMatching = function(selector) {
    	return this.nextAll(selector).last();
	}
	
	//Cercador agenda activitats
	$('.cerca_avancada a').click(function(){
		if($('.cerca_avancada a').attr('class').length>0){
			$('.navbar-form.col-xs-12.cercador_vermell.web_az').fadeOut('slow');
			//$('.col-xs-12.cercador_vermell').show();
			//alert("out");
		}else{
			$('.navbar-form.col-xs-12.cercador_vermell.web_az').fadeIn('slow');
			//$('.col-xs-12.cercador_vermell').hide();
			//alert("in");
		}
	});
	
	$('.item img').each(function(){
		$(this).click(function(){

			$('.item').removeClass('item_opened');
			$(this).parent().addClass('item_opened');
			
			var itemImatge = $(this).attr('src');
			if($(this).parent().nextMatching('.cercador_imatge_detail').hasClass('opened')){
				
				$('.cercador_imatge_cont .col-izq, .cercador_imatge_cont .col-dch').stop().animate({opacity:'0'},{
					duration: 200, 
					complete: function(){
						$('.cercador_imatge_detail.opened img').attr('src', itemImatge);
					}
				});

				$('.cercador_imatge_cont .col-izq, .cercador_imatge_cont .col-dch').animate({opacity: "1"}, 200);
				
			}
			else {

				var contenido = "<div class='cercador_imatge_cont'>"
					+ "<div class='container fullcontainer-xs'>"
						+ "<button class='cercar_detall'>cercar</button>"
						+ "<div class='col-izq'>"							
							+ "<a class='prev_img' href='javascript:void(0)' title=''>Imatge anterior</a>"
							+ "<a class='next_img' href='javascript:void(0)' title=''>Imatge següent</a>"
							+ "<img class='img-responsive' src='' alt=''>"
						+ "</div>"
						+ "<div class='col-dch'>"
							+ "<h2>Lorem ipsum sit amet amb text de títol molt llarg de tres línies</h2>"
							+ "<p>Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit lorem ipsum dolor sit amet.</p>"
							+ "<ul><li>Autor: Generalitat de Catalunya</li><li>Responsable: <a href=''>Departament de Salut</a></li><li>Data de publicació: 07/10/2013</li><li>Mida: 1701 x 1134</li></ul>"
							+ "<div><a href=''>Utilizació de les imatges i vídeos</a><a class='hidden-xs' href=''>Imprimir</a></div>"
							+ "<ul class='list-group llistat_xarxes_socials'>"
								+ "<li class='list-group-item social_text hidden-xs'>Comparteix l'arxiu a:</li>"
								+ "<li class='list-group-item'><a class='twitter' href='#' title='twitter'></a></li>"
								+ "<li class='list-group-item'><a class='facebook' href='#' title='facebook'></a></li>"
							+ "</ul>"
						+ "</div>"
					+ "</div>"
				+ "</div>";				

				$('.cercador_imatge_detail').removeClass('opened').css('height','0').empty();
				$(this).parent().nextMatching('.cercador_imatge_detail').addClass('opened').append(contenido);
				$('.cercador_imatge_detail.opened img').attr('src', itemImatge);
				var heightElement = $('.cercador_imatge_cont .container').outerHeight();
				$('.cercador_imatge_cont').animate({ height: heightElement }, 400, 'swing');				
				$('.cercador_imatge_detail.opened').animate({ height: heightElement }, 400, 'swing');

			}

			$('.cercar_detall').click(function(){
				$('.cercador_imatge_detail').stop().animate({ height: 0 }, {
					duration: 400, 
					easing: 'swing',
					complete: function(){
						$(this).removeClass('opened');
					}	
				});
				$('.cercador_imatge_cont').stop().animate({height: 0},{
					duration: 400,
					easing: 'swing',
					complete: function(){
				$('.cercador_imatge_detail').empty();
					}
				});
			});

			//prev
			$('.prev_img').click(function(){
				var itemOpened = $('.item.item_opened');
				var itemImatge = itemOpened.prevMatching('.item').children().attr('src');
				
				if(itemOpened.index() <= 0){				
				}else{
					$('.cercador_imatge_cont .col-izq, .cercador_imatge_cont .col-dch').stop().animate({opacity:'0'},{
						duration: 200, 
						complete: function(){
							$('.cercador_imatge_detail.opened img').attr('src', itemImatge);
						}
					});

					$('.cercador_imatge_cont .col-izq, .cercador_imatge_cont .col-dch').animate({opacity: "1"}, 200);
					$(itemOpened).removeClass('item_opened').prevMatching('.item').addClass('item_opened');
				}
			});

			//next
			$('.next_img').click(function(){
				var itemOpened = $('.item.item_opened');
				var itemImatge = itemOpened.nextMatching('.item').children().attr('src');
				var itemLast = $('.item').nextAll('.item').last('.item').index();
				
				if(itemOpened.index() >= itemLast){				
				}else{
					$('.cercador_imatge_cont .col-izq, .cercador_imatge_cont .col-dch').stop().animate({opacity:'0'},{
						duration: 200, 
						complete: function(){
							$('.cercador_imatge_detail.opened img').attr('src', itemImatge);
						}
					});

					$('.cercador_imatge_cont .col-izq, .cercador_imatge_cont .col-dch').animate({opacity: "1"}, 200);
					$(itemOpened).removeClass('item_opened').nextMatching('.item').addClass('item_opened');
				}
			});
			$('html,body').animate({scrollTop: $(".item_opened").offset().top},'slow');
		});

	});
	
	//Enable swiping...
   $(".carousel").swipe( {
	   //Generic swipe handler for all directions
	   swipeLeft:function(event, direction, distance, duration, fingerCount) {
			   $(this).carousel('next');
			   $(this).carousel('pause');
	   },
	   swipeRight: function() {
			   $(this).carousel('prev');
			   $(this).carousel('pause');
	   },
	   //Default is 75px, set to 0 for demo so any distance triggers swipe
	   threshold:0
   });
   

   //Custom select jquery plugin
	$('.custom_select').customSelect();
	
   //Show - hide carousel controls only desktop version >=975
	if($(this).width() >= 975){
		$('.carousel .slide_navigator').hide();
		$('.carousel .slider_imatges_cont').hover(function(){
			$('.carousel .slide_navigator').stop(true,false).fadeToggle(1000, "linear");
		});
	}
	
});



//Tornar amunt
function tornarAmunt(){
	$("html, body").animate({scrollTop:0},"slow");
}

//function slide_left(id_carousel){
//	$("#"+id_carousel+".carousel").carousel('prev');
//}
//
//function slide_right(id_carousel){
//	$("#"+id_carousel+".carousel").carousel('next');
//}
//smooth scroll  anchor
$(".scroll").click(function (event) {
    event.preventDefault();
    //calculate destination place
    var dest = 0;
    if ($(this.hash).offset().top > $(document).height() - $(window).height()) {
        dest = $(document).height() - $(window).height();
    } else {
        dest = $(this.hash).offset().top;
    }
    //go to destination
    $('html,body').animate({
        scrollTop: dest
    }, 1000, 'swing');
});


function CompartirTwitter(){
	var width  = 575,
    height = 400,
    left   = ($(window).width()  - width)  / 2,
    top    = ($(window).height() - height) / 2,
    url    = 'http://twitter.com/share?text=',
    opts   = 'status=1' +
             ',width='  + width  +
             ',height=' + height +
             ',top='    + top    +
             ',left='   + left;
	url +=document.title;
	url +=' ';

	window.open(url, 'Twitter', opts);
}

function CompartirFacebook(){
	var width  = 575,
    height = 400,
    left   = ($(window).width()  - width)  / 2,
    top    = ($(window).height() - height) / 2,
    url    = 'https://www.facebook.com/sharer/sharer.php?u=',
    opts   = 'status=1' +
             ',width='  + width  +
             ',height=' + height +
             ',top='    + top    +
             ',left='   + left;
	
	url+=document.URL;
	window.open(url, 'Facebook', opts);
}



/**$("#ajaxable2").click(function(){
	if(!ajaxableLoaded){
		loadScript();
		ajaxableLoaded=true;
	}
});**/

//Cambia los iconos en caso de rollover
$(document).ready(function(){
	 $('.llistat_xarxes_socials li.list-group-item a[title*="witter"]').mouseover(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_twitter_hover.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="witter"]').mouseout(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_twitter.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="acebook"]').mouseover(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_facebook_hover.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="acebook"]').mouseout(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_facebook.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="log"]').mouseover(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_blog_hover.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="log"]').mouseout(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_blog.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="ouTube"]').mouseover(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_youtube_hover.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="ouTube"]').mouseout(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_youtube.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="s xarxes"]').mouseover(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_compartir_hover.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="s xarxes"]').mouseout(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_compartir.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="s redes"]').mouseover(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_compartir_hover.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="ore social"]').mouseout(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_compartir.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="s hilats"]').mouseover(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_compartir_hover.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="s hilats"]').mouseout(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_compartir.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="ore social"]').mouseover(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_compartir_hover.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="s redes"]').mouseout(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_compartir.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="mprimeix"]').mouseover(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_print_hover.png');
	 });
	 $('.llistat_xarxes_socials li.list-group-item a[title*="mprimeix"]').mouseout(function() {
	 	$(this).children('img').attr('src', '/gsitfc/img/NG_ico_print.png');
	 });
	 $('#ComparteixTwitter').click(function(){ CompartirTwitter();});
	 $('#ComparteixFacebook').click(function(){ CompartirFacebook();});
	 $('#MesVisitats').click(function(){void(0);});
	 $('.treu_filtre').click(function(){void(0);});
	 $('.MesEnllacos').click(function(){void(0);});
	 $('#MoreChannels').click(function(){void(0);});
	 

});
