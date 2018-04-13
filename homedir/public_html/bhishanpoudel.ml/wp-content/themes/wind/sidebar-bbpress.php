<?php
/**
 * Sidebar for bbPress/BuddyPress.
 *
 * @package	wind
 * @since   1.0
 * @author  RewindCreation
 * @license GPL v3 or later
 * @link    http://www.rewindcreation.com/
 */ 
	global $wind_options;

	if ( $wind_options['bbp_column2'] > 0 
			&& is_active_sidebar( 'bbp-widget-area' ) ) {
				
		$sidebar_class = 'large-' . $wind_options['bbp_column2'] . ' medium-' . $wind_options['bbp_column2'] . ' columns';
		if ( 1 == $wind_options['bbp_position'] ) {
			$sidebar_class = $sidebar_class . " pull-" . $wind_options['bbp_column1'];
		}
?>	
		<div id="bbp-sidebar" class="<?php echo $sidebar_class; ?> widget blog-widget" role="complementary">		
			<ul class="xoxo">		
<?php			dynamic_sidebar( 'bbp-widget-area' );	?>
			</ul>
		</div>
<?php
	}
?>
