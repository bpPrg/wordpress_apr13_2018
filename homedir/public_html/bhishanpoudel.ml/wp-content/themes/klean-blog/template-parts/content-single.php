<?php
/**
 * Template part for displaying posts
 *
 * @link https://codex.wordpress.org/Template_Hierarchy
 *
 * @package Klean Blog
 */
 

?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<?php get_template_part( 'template-parts/content', 'media' ); ?>
	<header class="entry-header">
		<div class="entry-meta-category">
			<?php klean_blog_posted_on_cat(); ?>
		</div><!-- .entry-meta-category -->
		<?php the_title( '<h1 class="entry-title">', '</h1>' ); ?>
		<div class="entry-meta">
			<?php klean_blog_posted_on(array('post_date', 'author','comment') ); ?>
		</div><!-- .entry-meta -->
	</header><!-- .entry-header -->

	<div class="entry-content">
		<?php
		the_content();

		wp_link_pages( array(
			'before' => '<div class="page-links">' . esc_html__( 'Pages:', 'klean-blog' ),
			'after'  => '</div>',
		) );
		?>
	</div><!-- .entry-content -->
	<div class="entry-meta entry-footer">
		<?php klean_blog_posted_on( array('tag') ); ?>
	</div><!-- .entry-meta -->	
	<footer class="entry-footer">
		<?php klean_blog_entry_footer(); ?>
	</footer><!-- .entry-footer -->
</article><!-- #post-## -->