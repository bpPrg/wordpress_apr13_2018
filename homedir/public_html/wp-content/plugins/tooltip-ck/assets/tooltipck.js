/**
 * @name		Tooltip CK
 * @copyright	Copyright (C) 2016. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 * @author		Cédric KEIFLIN - http://www.joomlack.fr - http://www.template-creator.com - http://www.wp-pluginsck.com
 */

(function () {
	'use strict';

	var $;

	/*===========================
	Tooltipck
	===========================*/
	var Tooltipck = function (options) {
		if (!(this instanceof Tooltipck)) return new Tooltipck(options);

		if (typeof jQuery !== 'undefined'){
			$ = jQuery;
		}

		if (typeof $ === 'undefined') {
			console.log('Tooltip CK error : jQuery instance not found !');
			return;
		}

		// Tooltipck
        var t = this;

		// Settings
		var defaults = {
			fxTransition: 'linear',
			fxType: 'both',					// can be both, horizontal, vertical, fade
			fxDuration: 500,
			tipPosition: 'right',			// can be right, top, left, bottom
			delayIn: 0,
			delayOut: 500,
			isMobile: 0,
			opacity: 0.9,
			offsetx: 0,
			offsety: 0
			};
		options = options || {};
		options = $.extend(defaults, options);

		var tooltip;
		$('.tooltipck').each(function(i, tooltip) {
			tooltip = $(tooltip);
			tooltip = $.extend(tooltip, options);

			// quick fix for the height of the element
			tooltip.css('display', 'inline-block');
			tooltip.height = tooltip.height();
			tooltip.css('display', '');

			tooltip.tip = $('> .tooltipck-tip', tooltip);
			tooltip.tipWidth = tooltip.tip.outerWidth() + parseInt(tooltip.tip.css('border-left-width')) + parseInt(tooltip.tip.css('border-right-width'));
			tooltip.tipHeight = tooltip.tip.outerHeight();
			tooltip.tip.css({
				'opacity': '0',
				'width': '0',
				'height': '0'
			});
			getTooltipParams();

			if (options.isMobile == 1) {
				tooltip.click(function() {
					if (tooltip.data('status') != 'open') {
						showTip(tooltip);
						hideTipOutsideClick();
					} else {
						hideTip(tooltip);
					}
				});
			} else {
				tooltip.mouseover(function() {
					showTip(tooltip);
				});
				tooltip.mouseleave(function() {
					hideTip(tooltip);
				});
			}

			function hideTipOutsideClick() {
				$(window).on('click', function(event){
					if ( 
						tooltip.data('status') == 'open'
						&&
						tooltip.has(event.target).length == 0 //checks if descendants was clicked
						&&
						!tooltip.is(event.target) //checks if itself was clicked
						){
						// is outside
						hideTip(tooltip);
					} else {
						// is inside, do nothing
					}
				});
			}

			function getTipPosition() {

				// get the coordinates of the 4 screen edges
				var boundTop = $(document).scrollTop();
				var boundLeft = $(document).scrollLeft();
				var boundRight = boundLeft + $(window).width();
				var boundBottom = boundTop + $(window).height();

				var prop1 ,val1, prop2, val2, prop3, val3, prop4, val4;

				switch(tooltip.tipPosition) {
					case 'right':
					default:
						prop1 = 'left';
						val1 = (tooltip.pointer.offset().left + parseInt(tooltip.offsetx)) + 'px';
						prop2 = 'top';
						val2 = (tooltip.pointer.offset().top + parseInt(tooltip.offsety)) + 'px';
						prop3 = 'right';
						val3 = '';
						prop4 = 'marginTop';
						val4 = '';
						// check if the tip is outside of screen
						if (boundRight < (parseInt(val1) + tooltip.tipWidth) && tooltip.checkedPositions['right'] != true) {
							tooltip.checkedPositions['right'] = true;
							if (! tooltip.checkedPositions['left'])  {
								tooltip.tipPosition = 'left';
							} else if (! tooltip.checkedPositions['top']) {
								tooltip.tipPosition = 'top';
							} else if (! tooltip.checkedPositions['bottom']) {
								tooltip.tipPosition = 'bottom';
							}
							return getTipPosition();
						}
						break;
					case 'left':
						prop1 = 'right';
						val1 = (tooltip.pointer.offset().left + parseInt(tooltip.offsetx)) + 'px';
						prop2 = 'top';
						val2 = (tooltip.pointer.offset().top + parseInt(tooltip.offsety)) + 'px';
						prop3 = 'left';
						val3 = '';
						prop4 = 'marginTop';
						val4 = '';
						// check if the tip is outside of screen
						if (boundLeft > (tooltip.offset().left - parseInt(val1) - tooltip.tipWidth) && tooltip.checkedPositions['left'] != true) {
							tooltip.checkedPositions['left'] = true;
							if (! tooltip.checkedPositions['right'])  {
								tooltip.tipPosition = 'right';
							} else if (! tooltip.checkedPositions['top']) {
								tooltip.tipPosition = 'top';
							} else if (! tooltip.checkedPositions['bottom']) {
								tooltip.tipPosition = 'bottom';
							}
							return getTipPosition();
						}
						break;
					case 'top':
						prop1 = 'left';
						val1 = (tooltip.pointer.offset().left + parseInt(tooltip.offsetx) - tooltip.tipWidth/2) + 'px';
						prop2 = 'bottom';
						val2 = (boundBottom - tooltip.pointer.offset().top + parseInt(tooltip.offsety)) + 'px';
						prop3 = 'right';
						val3 = '';
						prop4 = 'top';
						val4 = '';
						// check if the tip is outside of screen
						if (boundTop > (tooltip.offset().top - parseInt(val2) - tooltip.tipHeight && tooltip.checkedPositions['top'] != true) ) {
							tooltip.checkedPositions['top'] = true;
							if (! tooltip.checkedPositions['bottom'])  {
								tooltip.tipPosition = 'bottom';
							} else if (! tooltip.checkedPositions['left']) {
								tooltip.tipPosition = 'left';
							} else if (! tooltip.checkedPositions['right']) {
								tooltip.tipPosition = 'right';
							}
							return getTipPosition();
						}
						break;
					case 'bottom':
						prop1 = 'left';
						// val1 = (tooltip.width()/2 - tooltip.tipWidth/2 + tooltip.pointer.offset().left + parseInt(tooltip.offsetx)) + 'px';
						val1 = (tooltip.pointer.offset().left + parseInt(tooltip.offsetx) - tooltip.tipWidth/2) + 'px';
						prop2 = 'top';
						val2 = (tooltip.pointer.offset().top + tooltip.height + parseInt(tooltip.offsety)) + 'px';
						prop3 = 'right';
						val3 = '';
						prop4 = 'bottom';
						val4 = '';
						// check if the tip is outside of screen
						if (boundBottom < (parseInt(val2) + parseInt(tooltip.tip.css('marginTop')) + tooltip.tipHeight) && tooltip.checkedPositions['bottom'] != true) {
							tooltip.checkedPositions['bottom'] = true;
							if (! tooltip.checkedPositions['top'])  {
								tooltip.tipPosition = 'top';
							} else if (! tooltip.checkedPositions['left']) {
								tooltip.tipPosition = 'left';
							} else if (! tooltip.checkedPositions['right']) {
								tooltip.tipPosition = 'right';
							}
							return getTipPosition();
						}
						break;
				}

				return Array(prop1, val1, prop2, val2, prop3, val3, prop4, val4);
			}

			function checkWithinBounds() {
				var boundTop = $(document).scrollTop();
				var boundBottom = boundTop + $(window).height();
				var boundLeft = $(document).scrollLeft();
				var boundRight = boundLeft + $(window).width();

				if (tooltip.tipPosition != 'top') {
					var tipPositionBottom = tooltip.pointer.offset().top + tooltip.tipHeight + parseInt(tooltip.tip.css('marginTop'));;
					var vOffset = boundBottom - tipPositionBottom;
					if (vOffset < 0) {
						tooltip.tip.css('marginTop', '+=' + vOffset + 'px');
					}
				}

				if (tooltip.tipPosition != 'bottom' && tooltip.tipPosition != 'left' && tooltip.tipPosition != 'right') {
					var tipPositionTop = tooltip.pointer.offset().top + parseInt(tooltip.tip.css('marginTop')) - tooltip.tipHeight;
					var vOffset = boundTop - tipPositionTop;
					if (vOffset < 0) {
						tooltip.tip.css('marginTop', '-=' + vOffset + 'px');
					}
				}

				if (tooltip.tipPosition != 'left') {
					var tipPositionRight = tooltip.pointer.offset().left + parseInt(tooltip.tip.css('marginLeft')) + tooltip.tipWidth;
					var hOffset = boundRight - tipPositionRight;
					if (hOffset < 0) {
						tooltip.tip.css('marginLeft', '+=' + hOffset + 'px');
					}
				}

				if (tooltip.tipPosition != 'right') {
					var tipPositionLeft = tooltip.pointer.offset().left + parseInt(tooltip.tip.css('marginLeft'));
			
					var hOffset = boundLeft + tipPositionLeft;
					if (hOffset < 0) {
						tooltip.tip.css('marginLeft', '-=' + hOffset + 'px');
					}
				}

			}

			function showTip(el) {
				clearTimeout(el.timeout);
				el.timeout = setTimeout(function() {
					openTip(el);
				}, options.delayIn);
			}

			function hideTip(el) {
				$(el).data('status', 'hide')
				clearTimeout(el.timeout);
				el.timeout = setTimeout(function() {
					if (tooltip.hasClass('tooltipck-paused')) return;
					closeTip(el);
				}, tooltip.delayOut);
			}

			function openTip(el) {
				var tip = $(el.tip);
				el.data('status', 'open');
				if (el.data('status') == 'opened')
					return;
				
				// tip.css('display' ,'inline-block');
				tip.addClass('tooltipck-hover');
				// add a html pointer to get the correct tip position
				// if (! tooltip.find('.tooltipck-pointer').length) tooltip.append('<span class="tooltipck-pointer"></span>');
				tooltip.pointer = tooltip.find('.tooltipck-pointer');
				// check where to place the tooltip
				tooltip.checkedPositions = [];
				// empty the array
				while (tooltip.checkedPositions.length) { tooltip.checkedPositions.pop(); }
				// tooltip.tipPosition = options.tipPosition;
				var tipPositionCss = getTipPosition();
				

				// reset all positions to avoid issues
				tip.css({
					'top': '',
					'bottom': '',
					'left': '',
					'right': '',
					'marginLeft': '',
					'marginTop': '',
				});
				tip.css(tipPositionCss[0], tipPositionCss[1]);
				tip.css(tipPositionCss[2], tipPositionCss[3]);
				tip.css(tipPositionCss[4], tipPositionCss[5]);
				tip.css(tipPositionCss[6], tipPositionCss[7]);
				checkWithinBounds();
				$(document.body).append(tip);

				$('.tooltipck').removeClass('tooltipck-active');
				tooltip.addClass('tooltipck-active');

				switch(options.fxType) {
					case 'both':
					default:
						tip.animate({
							'opacity' : options.opacity,
							'height' : el.tipHeight,
							'width' : el.tipWidth,
							'display' : 'inline-block',
							// 'zIndex' : '6001'
							}, parseInt(tooltip.fxDuration), options.fxTransition, {
							complete: function() {
								el.data('status', 'opened');
								tip.css('height' ,'auto');
							}
						});
						break;
					case 'horizontal':
						tip.css('height', el.tipHeight);
						tip.animate({
							'opacity' : options.opacity,
							'width' : el.tipWidth,
							'display' : 'inline-block'
							}, parseInt(tooltip.fxDuration), options.fxTransition, {
							complete: function() {
								el.data('status', 'opened');
								tip.css('height' ,'auto');
							}
						});
						break;
					case 'vertical':
						tip.css('width', el.tipWidth);
						tip.animate({
							'opacity' : options.opacity,
							'height' : el.tipHeight,
							'display' : 'inline-block'
							}, parseInt(tooltip.fxDuration), options.fxTransition, {
							complete: function() {
								el.data('status', 'opened');
								tip.css('height' ,'auto');
							}
						});
						break;
					case 'fade':
						tip.css('height', el.tipHeight);
						tip.css('width', el.tipWidth);
						tip.animate({
							'opacity' : options.opacity,
							'display' : 'inline-block'
							}, parseInt(tooltip.fxDuration), options.fxTransition, {
							complete: function() {
								el.data('status', 'opened');
								tip.css('height' ,'auto');
							}
						});
						break;
				}
				tip.mouseover(function() {
					tooltip.addClass('tooltipck-paused');
				}).mouseleave(function() {
					tooltip.removeClass('tooltipck-paused').trigger('mouseleave');
				});
			}

			function closeTip(el) {
				var tip = $(el.tip);
				el.data('status', 'close');
				tip.stop(true, true);
				tip.css({
					'opacity': '0',
					'width': '0',
					'height': '0',
					'display' : 'none'
				});
				tooltip.removeClass('tooltipck-active');
				tip.removeClass('tooltipck-hover');
				tooltip.append(tip);
				el.data('status', 'closed');
			}

			function getTooltipParams() {
				if (tooltip.attr('rel')) {
					var params = tooltip.attr('rel').split('|');
					for (var i = 0; i < params.length; i++) {
						var param = params[i];
						if (param.indexOf('time=') != -1)
							tooltip.fxDuration = parseInt(param.replace("time=", ""));
						if (param.indexOf('delayOut=') != -1)
							tooltip.delayOut = parseInt(param.replace("delayOut=", ""));
						if (param.indexOf('offsetx=') != -1)
							tooltip.offsetx = parseInt(param.replace("offsetx=", ""));
						if (param.indexOf('offsety=') != -1)
							tooltip.offsety = parseInt(param.replace("offsety=", ""));
						if (param.indexOf('position=') != -1)
							tooltip.tipPosition = param.replace("position=", "");
						// Legacy
						if (param.indexOf('mood=') != -1)
							tooltip.fxDuration = param.replace("mood=", "");
						if (param.indexOf('tipd=') != -1)
							tooltip.delayOut = param.replace("tipd=", "");
					}
				}
			}

			// used when mobile window is switched between landscape and portrait
			$(window).on('resize', function() { repositionTooltip(tooltip); });

			function repositionTooltip(tooltip) {
				if (tooltip.data('status') != 'open' || options.isMobile != '1') return;
				tooltip.tipPosition = options.tipPosition;
				var tipPositionCss = getTipPosition();
				var tip = tooltip.tip;
				// reset all positions to avoid issues
				tip.css(tipPositionCss[0], tipPositionCss[1]);
				tip.css(tipPositionCss[2], tipPositionCss[3]);
				tip.css(tipPositionCss[4], tipPositionCss[5]);
				tip.css(tipPositionCss[6], tipPositionCss[7]);
				// checkWithinBounds();
			}
		});
	};

	window.Tooltipck = Tooltipck;
})();
