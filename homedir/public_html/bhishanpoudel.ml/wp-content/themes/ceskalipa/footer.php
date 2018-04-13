<?php
/**
 * The template for displaying the footer
 *
 * Contains footer content and the closing of the #main and #page div elements.
 *
 * @package WordPress
 * @subpackage CeskaLipa
 * @since Ceska Lipa 1.0
 */
?>

		</div><!-- #main -->

		<footer id="colophon" class="site-footer" role="contentinfo">

			<?php get_sidebar( 'footer' ); ?>

			<div class="site-info">
				<?php do_action( 'ceskalipa_credits' ); ?>
				<p class="f-right">Powered by <a href="http://www.wordpress.org/">WordPress</a>  |  Designed by <a href="http://www.ceskalipa.cz" class="author">Ceska Lipa</a>
        <span class="alignright">&copy;&nbsp;<?php echo date("Y");?> <a href="<?php echo home_url(); ?>"><?php bloginfo('name'); ?></a></span></p>
			</div><!-- .site-info -->
		</footer><!-- #colophon -->
	</div><!-- #page -->

	<?php wp_footer(); ?>
</body>
</html>