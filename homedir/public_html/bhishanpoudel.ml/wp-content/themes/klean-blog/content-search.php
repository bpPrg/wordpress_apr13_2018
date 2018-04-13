<?php
/**
 * The template part for displaying results in search pages
 *
 * Learn more: {@link https://codex.wordpress.org/Template_Hierarchy}
 *
 * @package WordPress
 * @subpackage Klean_Blog
 * @since Klean Blog 1.0
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<?php get_template_part( 'template-parts/content', 'media' ); ?>

	<header class="entry-header">
	<div class="entry-meta-category">
						<?php klean_blog_posted_on_cat(); ?>
					</div><!-- .entry-meta-category -->
		<?php the_title( sprintf( '<h2 class="entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h2>' ); ?>
	
	<div class="entry-meta">
					<?php
					if ( 'page' !== get_post_type() ) {
						klean_blog_posted_on();
					}
					?>
				</div><!-- .entry-meta -->
	
	</header><!-- .entry-header -->

	<div class="entry-summary">
		<?php the_excerpt(); ?>
	</div><!-- .entry-summary -->
</article><!-- #post-## -->
