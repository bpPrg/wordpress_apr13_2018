<?php
/**
 * Getting started section.
 *
 * @package klean_blog
 */
 $pro_ver_url = 'https://www.wponlinesupport.com/wordpress-themes/kleanblog-wordpress-blog-theme/'
?>
<div id="getting-started" class="gt-tab-pane gt-is-active">
	<div class="feature-section two-col">
		<div class="col">
			<h3><?php esc_html_e( 'Customize The Theme', 'klean-blog' ); ?></h3>
			<p><?php esc_html_e( 'Using the WordPress Customizer you can easily customize every aspect of the theme.', 'klean-blog' ); ?></p>
			<p>
				<a href="<?php echo esc_url( admin_url( 'customize.php' ) ); ?>" class="button button-primary"><?php esc_html_e( 'Start Customize', 'klean-blog' ); ?></a>
			</p>

		<h3><?php esc_html_e( 'Upgrade to PRO version', 'klean-blog' ); ?></h3>
			<p><?php esc_html_e( 'Upgrade to PRO version and get lots of options.', 'klean-blog' ); ?></p>
			<ul>
				<li><?php _e( '<strong>- Post Format : </strong>Theme comes with Video, Audio, Quote and Gallery post formats.', 'klean-blog' ); ?></li>
				<li><?php _e( '<strong>- 3 Widgets : </strong>WordPress latest posts, WordPress latest posts slider and  latest posts slide/list widgets', 'klean-blog' ); ?></li>
				<li><?php _e( '<strong>- Categories Colors : </strong>Option to add custom background color for each category', 'klean-blog' ); ?></li>
				<li><?php _e( '<strong>- Google Fonts : </strong>100+ google fonts added', 'klean-blog' ); ?></li>
			</ul>
			<p>
				<a href="<?php echo esc_url( $pro_ver_url ); ?>" class="button button-primary" target="_blank"><?php esc_html_e( 'Buy PRO Version', 'klean-blog' ); ?></a>
				
			</p>		
		</div>

		<div class="col">
			<img src="<?php echo esc_url( get_template_directory_uri() ); ?>/screenshot.png" alt="<?php esc_attr_e( 'screenshot', 'klean-blog' ); ?>">
		</div>
	</div>
</div>