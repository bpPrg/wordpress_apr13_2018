<?php
/**
 * The template for displaying the footer
 *
 * Contains footer content and the closing of the #main and #page div elements.
 *
 * @since 1.0.0
 */
?>
		</div><!-- #main -->

		<footer id="colophon" class="site-footer" role="contentinfo">

			<?php get_sidebar( 'footer' ); ?>
			
			<div class="site-info container small text-muted">
				<div class="pull-left"><?php echo get_option( 'radar_copyright' ); ?></div>
				<div class="pull-right"><?php _e( 'Theme created by', 'radar' ); ?> <em><a class="text-muted" href="http://www.wphigh.com" target="_blank">Wphigh</a></em></div>
			</div><!-- .site-info -->
		</footer><!-- #colophon -->
	</div><!-- #page -->

	<?php wp_footer(); ?>
</body>
</html>