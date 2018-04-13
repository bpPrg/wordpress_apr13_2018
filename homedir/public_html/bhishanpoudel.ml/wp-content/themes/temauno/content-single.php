<?php
/**
 * @package temauno
 */
?>

<?php if(has_post_format('aside')) : ?>
	<div class="col-full-width">
<?php else : ?>
	<div class="col-normal">
<?php endif; ?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header">

		<?php if(has_post_thumbnail()) {
			the_post_thumbnail('full', array('class' => 'img-single'));
		}
		?>
		<?php the_title( '<h1 class="entry-title">', '</h1>' ); ?>

		<div class="entry-meta">
			<?php temauno_posted_on(); ?>
		</div><!-- .entry-meta -->
	</header><!-- .entry-header -->

	<div class="entry-content">
		<?php the_content(); ?>
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

<?php temauno_post_nav(); ?>

<?php
				// If comments are open or we have at least one comment, load up the comment template
				if ( comments_open() || get_comments_number() ) :
					comments_template();
				endif;
			?>

</div>
			
<?php if(!has_post_format('aside')) : ?>
	<div class="col-sidebar">
	<?php get_sidebar(); ?>
	</div>
<?php endif; ?>