<?php
/**
 * The default template for displaying content
 * 
 * @package	wind
 * @since   1.0
 * @author  RewindCreation
 * @license GPL v3 or later
 * @link    http://www.rewindcreation.com/
 */
?>
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
<?php
	global $wind_options;
	
	wind_post_thumbnail( $post->ID ); ?>
	<header class="entry-header">
<?php
		wind_meta_top();
		wind_post_title();
		wind_meta_middle();
?>
	</header>
	<div class="entry-content clearfix">
<?php
		if ( is_single() && has_excerpt() ) { ?>
			<div class="entry-excerpt clearfix">
				<?php the_excerpt(); ?>
			</div>
<?php	}
		the_content( '' );
		wp_link_pages( array( 'before' => '<div class="page-link"><span>' . __( 'Pages:', 'wind' ) . '</span>', 'after' => '</div>' ) ); 
?>
	</div>
<?php	wind_single_post_link(); ?>	
	<footer class="entry-footer clearfix">
<?php	wind_meta_bottom();
		wind_post_edit();
		wind_author_info();
?>
	</footer>
</article>
