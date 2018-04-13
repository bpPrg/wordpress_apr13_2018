<?php
/**
 * @package temauno
 */
?>
<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header-index">
		<?php the_title( sprintf( '<h1 class="entry-title"><a href="%s" rel="bookmark">', esc_url( get_permalink() ) ), '</a></h1>' ); ?>

		<?php if(has_post_thumbnail()) {
			the_post_thumbnail('thumbnail-index', array('class' => 'img-index'));
		}
		?>

		<?php if ( 'post' == get_post_type() ) : ?>
		<div class="entry-meta">
			<?php temauno_posted_on(); ?>
		</div><!-- .entry-meta -->
		<?php endif; ?>
	</header><!-- .entry-header -->

	<div class="entry-content">
		<?php the_excerpt(); ?>
		
		<div class="meta-more"><a href="<?php the_permalink()?>"><?php echo __('Continue Reading', 'temauno'); ?> <i class="fa fa-arrow-right"></i></a></div>

		<?php
			wp_link_pages( array(
				'before' => '<div class="page-links">' . __( 'Pages:', 'temauno' ),
				'after'  => '</div>',
			) );
		?>
	</div><!-- .entry-content -->

	<footer class="entry-footer">
		<?php temauno_entry_footer(); ?>
	</footer><!-- .entry-footer -->
</article><!-- #post-## -->