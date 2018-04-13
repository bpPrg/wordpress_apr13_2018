<?php
/**
 * Content Functions
 * 
 * @package	wind
 * @since   1.0
 * @author  RewindCreation
 * @license GPL v3 or later
 * @link    http://www.rewindcreation.com/
 */
if ( ! function_exists( 'wind_featured_top' ) ):
function wind_featured_top( ) {
	global $wind_options;
	
	if ( is_front_page() ) {
		if ( 1 == $wind_options['slider_home'] )
			wind_featured_slider();
	}
	elseif ( is_single() ) { //Single Post
		if ( 1 == $wind_options['slider_post'] )
			wind_featured_slider();
	}
	elseif ( is_page() ) { // Page
		if ( ! is_page_template() || is_page_template( 'pages/nosidebar.php' ) ) {
			if ( 1 == $wind_options['slider_page'] )
				wind_featured_slider();		
		}
		elseif ( 1 == $wind_options['slider_blog'] )
			wind_featured_slider();
	}
	elseif ( ! is_archive() && ! is_search()  ) {
		if ( 1 == $wind_options['slider_blog'] )
			wind_featured_slider();
	}

}
endif;

function wind_has_featured_content( ) {
	global $wind_options;
	
	if ( is_front_page() ) {
		if ( 1 == $wind_options['slider_home'] )
			return true;

	}
	elseif ( is_single() ) { //Single Post
		if ( 1 == $wind_options['slider_post'] )
			return true;
	}
	elseif ( is_page() ) { // Page
		if ( ! is_page_template() || is_page_template( 'pages/nosidebar.php' ) ) {
			if ( 1 == $wind_options['slider_page'] )
				return true;
		}
		elseif ( 1 == $wind_options['slider_blog'] )
			return true;
	}
	elseif ( ! is_archive() && ! is_search()  ) {
		if ( 1 == $wind_options['slider_blog'] )
			return true;
	}
	return false;
}

if ( ! function_exists( 'wind_featured_slider' ) ):
function wind_featured_slider( ) {
	global $wind_options;
	
	$featured_args = array(
						'post_type' => 'post',
						'post_status' => 'publish',
						'posts_per_page' => $wind_options['fp_posnum'],
						'ignore_sticky_posts' => 1,
						'no_found_rows' => 1
						);
	if ( $wind_options['fp_category'] > 0 && 1 == $wind_options['fp_option'] )
		$featured_args['category__in'] = $wind_options['fp_category'];
	elseif (2 == $wind_options['fp_option']) {
	   $featured_args['meta_query'] = array(
       			array(
           			'key' => '_wind_featured',
           			'value' => 1,
          			'compare' => 'IN' ) );
	}
?>
	<div class="featured-content featured-content-<?php echo $wind_options['slider_type']; ?>">
<?php
		if ( '1' == $wind_options['slider_type'] )
			wind_featured_ticker( $featured_args );
		elseif ( '2' == $wind_options['slider_type'] )
			wind_featured_fullwidth( $featured_args );
		elseif ( '3' == $wind_options['slider_type'] )
			wind_featured_gridwidth( $featured_args );
?>
	</div>
<?php
}
endif;

if ( ! function_exists( 'wind_featured_fullwidth' ) ):
function wind_featured_fullwidth( $featured_args ) {
	global $wind_options, $post;
	$featured = new WP_Query( $featured_args );
	if ( $featured->have_posts() ) {
		echo '<ul class="windSlider">';
		$inline_css = '';
		while ( $featured->have_posts() ) {
			$featured->the_post();

			$readmore = get_post_meta( $post->ID, '_wind_readmore', true );
			if ( empty( $readmore ) )
				$readmore = __( 'Learn More', 'wind' );
?>
			<li class="slider slider-<?php echo $post->ID; ?>">
			  <div class="row">
				<div class="large-12 columns">
				  <div class="featured-caption">
					<h3 class="featured-title">
						<a href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a>
					</h3>
<?php				if ( has_excerpt()) { ?>
						<div class="featured-excerpt">
							<?php the_excerpt( '' ); ?>
						</div>
<?php				} ?>
					<a class="btn btn-lg btn-info btn-featured" href="<?php echo get_permalink(); ?>"><?php echo $readmore; ?></a>
				  </div>
				</div>
			  </div>
			</li>
<?php
			if ( has_post_thumbnail() ) { //  Featured Images
				$image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'full' );
   				$inline_css .= '.slider-' . $post->ID . ' { background-image: url("' . esc_url( $image[0] ) . '");}' . "\n";
			}
		}
		echo '</ul>';
		$sliderOption = array (
			'mode' => $wind_options['slider_mode'],
			'speed' => $wind_options['slider_speed'],
		);
		wp_localize_script( WIND_THEME_ID, 'windSlider', $sliderOption );
	}
	wp_reset_postdata();
	if ( !empty( $inline_css ) ) {
		echo '<style>' . $inline_css . '</style>';
	}
}
endif;

if ( ! function_exists( 'wind_featured_gridwidth' ) ):
function wind_featured_gridwidth( $featured_args ) {
	global $wind_options, $post;
	$featured = new WP_Query( $featured_args );
	if ( $featured->have_posts() ) {
		echo '<div class="row"><ul class="windSlider">';
		while ( $featured->have_posts() ) {
			$featured->the_post();

			$readmore = get_post_meta( $post->ID, '_wind_readmore', true );
			if ( empty( $readmore ) )
				$readmore = __( 'Learn More', 'wind' );
?>
			<li class="slider slider-<?php echo $post->ID; ?>">

<?php
			if ( has_post_thumbnail() ) { //  Featured Images ?>
				<a href="<?php echo get_permalink(); ?>"><?php the_post_thumbnail( 'wind-featured', array(  'class' => 'wind-featured', 'title' => get_the_title() ) );?></a>
				<div class="featured-caption">
					<h3 class="featured-title">
						<a href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a>
					</h3>
<?php				if ( has_excerpt()) { ?>
						<div class="featured-excerpt">
							<?php the_excerpt( '' ); ?>
						</div>
<?php				} ?>
					<a class="btn btn-lg btn-info btn-featured" href="<?php echo get_permalink(); ?>"><?php echo $readmore; ?></a>
				</div>
<?php		} else { // No Featured Images ?>
				<div class="featured-text">
					<h3 class="entry-title">
						<a href="<?php echo get_permalink(); ?>"><?php the_title(); ?></a>
					</h3>
					<?php the_excerpt( '' ); ?>
					<a class="btn btn-lg btn-info btn-featured" href="<?php echo get_permalink(); ?>"><?php echo $readmore; ?></a>
				</div>
<?php		} ?>
			</li>
<?php
		}
		echo '</ul></div>';
		$sliderOption = array (
			'mode' => $wind_options['slider_mode'],
			'speed' => $wind_options['slider_speed'],
		);
		wp_localize_script( WIND_THEME_ID, 'windSlider', $sliderOption );
	}
	wp_reset_postdata();
}
endif;

if ( ! function_exists( 'wind_featured_ticker' ) ):
function wind_featured_ticker( $featured_args ) {
	global $wind_options, $post;
	
	$featured = new WP_Query( $featured_args );	
	$width = 0;
	if ( $featured->have_posts() ) {
		echo '<div class="row"><ul class="windTicker">';
		while ( $featured->have_posts() ) {
			$featured->the_post();
			
			echo '<li><a href="' . get_permalink() . '">';
			if ( has_post_thumbnail() ) { //  Featured Images
				$image = wp_get_attachment_image_src( get_post_thumbnail_id( $post->ID ), 'wind-ticker' );
				if ( $image[1] > $width )
					$width =  $image[1];
					
				the_post_thumbnail( 'wind-ticker', array(  'class' => 'featured-img', 'title' => get_the_title() ) );
				echo '<div class="ticker-caption">' . get_the_title() . '</div>';
			} else { // No Featured Images
				echo '<h3 class="entry-title">';
				the_title();
				echo '</h3>';
			}
			echo '</a></li>';
		}
		echo '</ul></div>';
		if ( 0 == $width )
			$width = 255;
		$tickerOption = array (
			'minSlides' => $wind_options['ticker_min'],
			'maxSlides' => $wind_options['ticker_max'],
			'slideWidth' =>  $width,
			'speed' =>  $wind_options['ticker_speed'],
		);
		wp_localize_script( WIND_THEME_ID, 'windTicker', $tickerOption );
	} 
	wp_reset_postdata();
}
endif;
