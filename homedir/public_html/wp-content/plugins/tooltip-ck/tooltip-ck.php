<?php
/**
 * Plugin Name: Tooltip CK
 * Plugin URI: http://www.wp-pluginsck.com/en/wordpress-plugins/tooltip-ck
 * Description: Tooltip CK allows you to put some nice tooltip effects into your content. Example : {tooltip}Text to hover{end-text}a friendly little boy{end-tooltip}
 * Version: 2.1.3
 * Author: Cédric KEIFLIN
 * Author URI: http://www.wp-pluginsck.com/
 * License: GPL2
 */

defined('ABSPATH') or die;

class Tooltipck {

	public $pluginname, $pluginurl, $plugindir, $options, $settings, $settings_field, $ispro, $prourl;

	public $prodaddon_min_version = '2.0.1';

	public $default_settings = 
	array( 	
			'fxduration' => '300',
			'dureebulle' => '500',
			'fxtransition' => 'linear',
			'stylewidth' => '150',
			'padding' => '5',
			'tipoffsetx' => '0',
			'tipoffsety' => '0',
			'opacity' => '0.8',
			'bgcolor1' => '#f0f0f0',
			'bgcolor2' => '#e3e3e3',
			'textcolor' => '#444444',
			'roundedcornerstl' => '5',
			'roundedcornerstr' => '5',
			'roundedcornersbr' => '5',
			'roundedcornersbl' => '5',
			'shadowcolor' => '#444444',
			'shadowblur' => '3',
			'shadowspread' => '0',
			'shadowoffsetx' => '0',
			'shadowoffsety' => '0',
			'shadowinset' => '0',
			'bordercolor' => '#efefef',
			'borderwidth' => '1',
			'shuttercolor' => '',
			'shutterbordercolor' => '',
			'shutterborderstyle' => 'dotted',
			'shutterborderwidth' => '1',
			'shutteritalic' => '1',
			'fxType' => 'both',
			'tipPosition' => 'right',
			'htmlfixer' => '1'
			);

	function __construct() {
		$this->pluginname = 'tooltip-ck';
		$this->settings_field = 'tooltipck_options';
		$this->options = get_option( $this->settings_field );
		$this->prourl = '//www.wp-pluginsck.com/en/wordpress-plugins/tooltip-ck';
		$this->plugindir = plugin_dir_path( __FILE__ );
		$this->pluginurl = plugins_url( '', __FILE__ );
		$this->ispro = false;

		// Get the instance of the fields library
		if (empty($this->fields)) {
			require_once( WP_PLUGIN_DIR . '/' . $this->pluginname . '/includes/class.fields.php' );
			$this->fields = new TooltipckFields();
			$this->fields->pluginurl = $this->pluginurl;
			$this->fields->options = $this->options;
			$this->fields->settings_field = $this->settings_field;
			$this->fields->default_settings = $this->default_settings;
		}

	}

	function init() {
		// load the translation
		add_action('plugins_loaded', array($this, 'load_textdomain'));

		if (is_admin()) {
			// load settings page
			require_once($this->plugindir . 'includes/class.admin.php' );
			new TooltipckAdmin();
		} else {
			// load frontend tooltip class
			require_once($this->plugindir . '/includes/class.front.php');
			new TooltipckFront();
		}
	}

	function load_textdomain() {
		load_plugin_textdomain( 'tooltip-ck', false, dirname( plugin_basename( __FILE__ ) ) . '/language/'  );
	}

	function check_ispro() {
		if ( file_exists(WP_PLUGIN_DIR . '/tooltip-ck-pro-addon/class.tooltip-ck-pro-addon.php') && is_plugin_active('tooltip-ck-pro-addon/tooltip-ck-pro-addon.php') ) {
			$this->ispro = true;
			return true;
		}
		return false;
	}
}

// load the process
$tooltipck = new Tooltipck();
$tooltipck->init();