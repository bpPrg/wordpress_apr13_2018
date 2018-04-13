<?php
/**
 * @copyright	Copyright (C) 2016. All rights reserved.
 * @license		GNU General Public License version 2 or later; see LICENSE.txt
 * @author		Plugins CK - Cédric KEIFLIN - http://www.wp-pluginsck.com
 */
defined('ABSPATH') or die;

class TooltipckAdmin extends Tooltipck {

	private $initiated = false;

	private $pagehook;

	public function __construct() {
		parent::__construct();

		if ( ! $this->initiated ) {
			$this->init_hooks();
		}
	}

	public function init_hooks() {
		$this->initiated = true;

		add_action( 'admin_init', array( $this, 'admin_init' ) );
		add_action( 'admin_menu', array( $this, 'admin_menu' ), 20 );
		// add the link in the plugins list
		add_filter( 'plugin_action_links', array( $this, 'show_plugin_links'), 10, 2 );
	}

	public function admin_init() {
		register_setting( $this->settings_field, $this->settings_field);
		// load the pro version
		if (parent::check_ispro()) {
			require_once(WP_PLUGIN_DIR . '/tooltip-ck-pro-addon/class.tooltip-ck-pro-addon.php');
			$this->ispro = true;
			$proAddon = new TooltipckProAddon();
			$proAddon->add_to_editor();
		}
		if (isset($_GET['page']) && $_GET['page'] === 'tooltip-ck') $this->load_assets();
	}

	public function admin_menu() {
		if ( ! current_user_can('update_plugins') )
			return;

		// add a new submenu to the standard Settings panel
		$this->pagehook = $page = add_options_page(
		__('Tooltip CK'), __('Tooltip CK'), 
		'administrator', $this->pluginname, array($this,'render_options') );

		// load the assets for the admin plugin page only
		// add_action( 'admin_init', array( $this, 'load_assets' ) );
		// executed on-load. Add all metaboxes and create the row in the options table
		add_action( 'load-' . $this->pagehook, array( $this, 'add_metaboxes' ) );

	}

	public function show_plugin_links($links, $file) {
		if ($file == 'tooltip-ck/tooltip-ck.php') {
			array_push($links, '<a href="options-general.php?page=' . $this->pluginname . '">'. __('Settings'). '</a>');
			if (!$this->ispro) {
				array_push($links, '<br /><img class="ckicon" src="' .$this->pluginurl . '/images/star.png" /><a target="_blank" href="' . $this->prourl .'">' . __('Get the PRO Version','tooltip-ck') . '</a>');
			} else {
				array_push($links, '<br /><img class="ckicon" src="' .$this->pluginurl . '/images/tick.png" /><span style="color: green;">' . __('You are using the PRO Version. Thank you !','tooltip-ck') . '</span>' );
			}
			if ($this->check_proaddon_version($links)) {
				array_push($links, '<br /><a href="http://www.wp-pluginsck.com" class="" target="_blank"><img class="ckicon" src="' .$this->pluginurl . '/images/exclamation.png" /><span style="color: red;">' . __('Tooltip CK Pro Addon must be updated !','tooltip-ck') . '</span></a>' );
			}
		}

		return $links;
	}

	/*
	 * Get a variable from the manifest file (actually, from the manifest cache).
	 * 
	 * @return the current version
	 */
	public function check_proaddon_version() {
		if (! file_exists(WP_PLUGIN_DIR . '/tooltip-ck-pro-addon/tooltip-ck-pro-addon.php')) return false;
		$manifest = get_plugin_data( WP_PLUGIN_DIR . '/tooltip-ck-pro-addon/tooltip-ck-pro-addon.php', $markup = true, $translate = true );
		return (version_compare($this->prodaddon_min_version, $manifest['Version']) > 0);
	}

	public function load_assets() {
		wp_enqueue_script('postbox');
		wp_enqueue_script(array('jquery', 'jquery-ui-tooltip'));
		wp_enqueue_style( 'ckframework', $this->pluginurl . '/assets/ckframework.css' );
		wp_enqueue_style( 'tooltipck-admin', $this->pluginurl . '/assets/admin.css' );
	}

	public function add_metaboxes() {
		// set the entry in the database options table if not exists
		add_option( $this->settings_field, $this->default_settings );
		// add the metaboxes
		add_meta_box( 'tooltipck-styles', __('Styles', 'tooltip-ck'), array( $this, 'create_metabox_styles' ), $this->pagehook, 'main' );
		add_meta_box( 'tooltipck-effects', __('Effects', 'tooltip-ck'), array( $this, 'create_metabox_effects' ), $this->pagehook, 'main' );
		add_meta_box( 'tooltipck-advanced', __('Advanced', 'tooltip-ck'), array( $this, 'create_metabox_advanced' ), $this->pagehook, 'main' );
	}

	function create_metabox_styles() {
		?>
		<div class="ckheading"><?php _e('Colors ans Styles','tooltip-ck') ?></div>
		<div>
			<label for="<?php echo $this->fields->getId( 'bgcolor1' ); ?>"><?php _e( 'Background Color', 'tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/color.png" />
			<?php echo $this->fields->render('color', 'bgcolor1') ?>
			<?php echo $this->fields->render('color', 'bgcolor2') ?>
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'bgimage' ); ?>"><?php _e( 'Background Image','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/image.png" />
			<?php echo $this->fields->render('media', 'bgimage') ?>
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/offsetx.png" /></span><span style="width:30px;"><?php echo $this->fields->render('text', 'bgpositionx') ?></span>
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/offsety.png" /></span><span style="width:30px;">
			<?php echo $this->fields->render('text', 'bgpositiony') ?>
			</span>
			<?php $options_bgrepeat = array(
				'repeat' =>'img:'.$this->pluginurl.'/images/bg_repeat.png'
				, 'repeat-x'=>'img:'.$this->pluginurl.'/images/bg_repeat-x.png'
				, 'repeat-y'=>'img:'.$this->pluginurl.'/images/bg_repeat-y.png'
				, 'no-repeat'=>'img:'.$this->pluginurl.'/images/bg_no-repeat.png'
				);
			?>
				<span class="hasTooltip" title="<?php _e('Image repeat','tooltip-ck'); ?>"><?php echo $this->fields->render('radio', 'bgimagerepeat', '', $options_bgrepeat) ?></span>
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'opacity' ); ?>"><?php _e( 'Opacity','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/layers.png" />
			<?php echo $this->fields->render('text', 'opacity') ?>
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'textcolor' ); ?>"><?php _e( 'Text Color','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/color.png" />
			<?php echo $this->fields->render('color', 'textcolor') ?>
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'roundedcorners' ); ?>"><?php _e( 'Border radius','tooltip-ck'); ?></label>
			
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/border_radius_tl.png" /></span><span style="width:30px;" class="hasTooltip" title="<?php _e('Top left','tooltip-ck'); ?>"><?php echo $this->fields->render('text', 'roundedcornerstl') ?></span>
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/border_radius_tr.png" /></span><span style="width:30px;" class="hasTooltip" title="<?php _e('Top right','tooltip-ck'); ?>"><?php echo $this->fields->render('text', 'roundedcornerstr') ?></span>
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/border_radius_br.png" /></span><span style="width:30px;" class="hasTooltip" title="<?php _e('Bottom right','tooltip-ck'); ?>"><?php echo $this->fields->render('text', 'roundedcornersbr') ?></span>
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/border_radius_bl.png" /></span><span style="width:30px;" class="hasTooltip" title="<?php _e('Bottom left','tooltip-ck'); ?>"><?php echo $this->fields->render('text', 'roundedcornersbl') ?></span>
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'shadowcolor' ); ?>"><?php _e( 'Shadow','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/shadow_blur.png" />
			<span><?php echo $this->fields->render('color', 'shadowcolor') ?></span>
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/shadow_blur.png" /></span><span style="width:30px;" class="hasTooltip" title="<?php _e('Blur','tooltip-ck'); ?>"><?php echo $this->fields->render('text', 'shadowblur') ?></span>
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/shadow_spread.png" /></span><span style="width:30px;" class="hasTooltip" title="<?php _e('Spread','tooltip-ck'); ?>"><?php echo $this->fields->render('text', 'shadowspread') ?></span>
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/offsetx.png" /></span><span style="width:30px;" class="hasTooltip" title="<?php _e('Offset X','tooltip-ck'); ?>"><?php echo $this->fields->render('text', 'shadowoffsetx') ?></span>
			<span><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/offsety.png" /></span><span style="width:30px;" class="hasTooltip" title="<?php _e('Offset Y','tooltip-ck'); ?>"><?php echo $this->fields->render('text', 'shadowoffsety') ?></span>
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'bordercolor' ); ?>"><?php _e( 'Border','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/shape_square.png" />
			<span><?php echo $this->fields->render('color', 'bordercolor') ?></span>
			<span style="width:30px;"><?php echo $this->fields->render('text', 'borderwidth') ?></span> px
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'padding' ); ?>"><?php _e('Padding', 'tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/padding.png" />
			<span style="width:30px;"><?php echo $this->fields->render('text', 'padding') ?></span> px
		</div>
		<div class="ckheading"><?php _e('Dimensions and Position') ?></div>
		<div>
			<label for="<?php echo $this->fields->getId( 'stylewidth' ); ?>"><?php _e( 'Tooltip width','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/width.png" />
			<?php echo $this->fields->render('text', 'stylewidth') ?>px
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'tipoffsetx' ); ?>"><?php _e( 'Tooltip Offset X','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/offsetx.png" />
			<?php echo $this->fields->render('text', 'tipoffsetx') ?>px
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'tipoffsety' ); ?>"><?php _e( 'Tooltip Offset Y','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/offsety.png" />
			<?php echo $this->fields->render('text', 'tipoffsety') ?>px
		</div>
		<div class="ckheading"><?php _e('Text to hover styles', 'tooltip-ck') ?></div>
		<div>
			<label for="<?php echo $this->fields->getId( 'shuttercolor' ); ?>"><?php _e('Color', 'tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/color.png" />
			<?php echo $this->fields->render('color', 'shuttercolor') ?>
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'shutterbordercolor' ); ?>"><?php _e('Decoration', 'tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/border-dash.png" />
			<?php $options_textborderstyle = array(
				'solid' => __('solid', 'tooltip-ck')
				, 'dashed'=> __('dashed', 'tooltip-ck')
				, 'dotted'=> __('dotted', 'tooltip-ck')
				);
			?>
			<?php echo $this->fields->render('select', 'shutterborderstyle', '', $options_textborderstyle) ?>
			<?php echo $this->fields->render('text', 'shutterborderwidth') ?>px
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'shutteritalic' ); ?>"><?php _e('Italic', 'tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/edit-italic.png" />
			<?php echo $this->fields->render('radio', 'shutteritalic', '', 'boolean') ?>
		</div>
	<?php }

	function create_metabox_effects() {
		?>
		<div>
			<label for="<?php echo $this->fields->getId( 'fxduration' ); ?>"><?php _e( 'Opening speed','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/hourglass.png" />
			<?php echo $this->fields->render('text', 'fxduration') ?>ms
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'dureebulle' ); ?>"><?php _e( 'Closing delay','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/hourglass.png" />
			<?php echo $this->fields->render('text', 'dureebulle') ?>ms
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'fxType' ); ?>"><?php _e('Effect type', 'tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/chart_curve.png" />
			<?php $options_fxType = array(
				'both' => __('Height and Width', 'tooltip-ck')
				, 'horizontal' => __('Width only', 'tooltip-ck')
				, 'vertical' => __('Height only', 'tooltip-ck')
				, 'fade' => __('Fade', 'tooltip-ck')
				);
			?>
			<?php echo $this->renderProField('select', 'fxType', '', $options_fxType) ?>
		</div>
		<div>
			<label for="<?php echo $this->fields->getId( 'tipPosition' ); ?>"><?php _e('Tip Position', 'tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/edit-image-center.png" />
			<?php $options_tipPosition = array(
				'right' => __('Right', 'tooltip-ck')
				, 'top' => __('Top', 'tooltip-ck')
				, 'left' => __('Left', 'tooltip-ck')
				, 'bottom' => __('Bottom', 'tooltip-ck')
				);
			?>
			<?php echo $this->renderProField('select', 'tipPosition', '', $options_tipPosition) ?>
		</div>
	<?php }

	function create_metabox_advanced() {
		?>
		<div>
			<label for="<?php echo $this->fields->getId( 'htmlfixer' ); ?>" class="hasTooltip" title="<?php _e('This will automatically parse your html code into the tooltip to try to fix the issues. If you have any problem using html in the tooltip, you can try to disable it.','tooltip-ck'); ?>"><?php _e('Enable html fix','tooltip-ck'); ?></label>
			<img class="ckicon" src="<?php echo $this->pluginurl ?>/images/html_valid.png" />
			<?php echo $this->fields->render('radio', 'htmlfixer', '', 'boolean') ?>
		</div>
	<?php }

	public function render_options() {
	?>
	<div id="ckoptionswrapper" class="ckinterface">
		<div>
			<img src="<?php echo $this->pluginurl ?>/images/logo_tooltipck_64.png" style="display: inline-block; margin: 0px 5px 5px 0;vertical-align: top;" />
			<h2 style="display: inline-block;"><?php _e('Tooltip CK');?></h2>
		</div>
		<?php $this->show_message(); ?>
		<form method="post" action="options.php">
			<div style="clear:both;">
				<input type="submit" class="button button-primary" name="save_options" value="<?php _e('Save Settings', 'tooltip-ck'); ?>" />
			</div>
			<div class="metabox-holder">
				<div class="postbox-container" style="width: 99%;">
				<?php 
					settings_fields($this->settings_field); 
					do_meta_boxes( $this->pagehook, 'main', null );
				?>
				</div>
			</div>
			<div>
				<input type="submit" class="button button-primary" name="save_options" value="<?php _e('Save Settings', 'tooltip-ck'); ?>" />
			</div>
		</form>
		<?php $this->show_message(); ?>
	</div>
	<!-- Needed to allow metabox layout and close functionality. -->
	<script type="text/javascript">
		//<![CDATA[
		jQuery(document).ready( function ($) {
			postboxes.add_postbox_toggles('<?php echo $this->pagehook; ?>');
			$( '.hasTooltip' ).tooltip({ 
				close: function( event, ui ) {
					ui.tooltip.hide();
				},
				position: {
					my: "left bottom-10",
					at: "left top",
					using: function( position, feedback ) {
						$( this ).css( position );
					}
				},
				track: false,
				tooltipClass: "cktooltip"
			});
		});
		//]]>
	</script>
	<?php }

	public function renderProField($type, $name, $classname = '', $optionsgroup = '', $isfiles = false, $attribs = '') {
		if ($this->ispro) {
			return $this->fields->render($type, $name, $classname, $optionsgroup, $isfiles, $attribs);
		} else {
			return __('Only available in the Pro Addon', 'tooltip-ck');
		}
	}

	function show_message() { ?>
		<div class="ckmessage">
			<?php if (! $this->ispro ) : ?><a href="http://www.wp-pluginsck.com" class="ckbutton" target="_blank"><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/star.png" /> <?php _e('Get more options with the Pro Addon', 'tooltip-ck');?></a><?php endif; ?>
			<?php if ($this->check_proaddon_version()) : ?><a href="http://www.wp-pluginsck.com" class="ckbutton" target="_blank"><img class="ckicon" src="<?php echo $this->pluginurl ?>/images/exclamation.png" /><span style="color: red;"><?php _e('Tooltip CK Pro Addon must be updated !','tooltip-ck') ?></span></a><?php endif; ?>
			<a class="ckbutton" target="_blank" href="http://www.wp-pluginsck.com"><?php _e('Created By', 'tooltip-ck') ?> <img src="<?php echo $this->pluginurl ?>/images/logo_ck.png" /></a>
		</div>
	<?php }
}
