<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package temauno
 */
?>

	</div><!-- #content -->

	<footer id="colophon" class="site-footer" role="contentinfo">

	    <?php get_sidebar("footer"); ?>		

		<div class="site-info">
			<a href="<?php echo esc_url( __( 'http://wordpress.org/', 'temauno' ) ); ?>">WordPress</a>
			<span class="sep"> | </span>
			<?php printf( __( '%1$s', 'temauno' ), '<a href="http://antsanchez.com/temauno-wordpress-theme" rel="designer">Temauno</a>' ); ?>
		</div><!-- .site-info -->
	</footer><!-- #colophon -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
