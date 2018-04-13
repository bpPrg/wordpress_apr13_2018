<?php
/**
 * The template for displaying search form
 *
 * @package	wind
 * @since   1.0
 * @author  RewindCreation
 * @license GPL v3 or later
 * @link    http://www.rewindcreation.com/
 */
?>
	<form method="get" action="<?php echo esc_url( home_url( '/' ) ); ?>">
      <div class="row collapse">
        <div class="small-10 columns">		
		  <input type="text" class="search-query" name="s" placeholder="<?php esc_attr_e( 'Search', 'wind' ); ?>" />
		</div>
		<div class="small-2 columns">
		  <input type="submit" class="submit button postfix" name="submit" value="<?php esc_attr_e( 'Go', 'wind' ); ?>" />
		</div>
	  </div>
	</form>
