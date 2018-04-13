<?php
/**
 * Jetpack Compatibility File
 * See: http://jetpack.me/
 *
 * @package temauno
 */

/**
 * Add theme support for Infinite Scroll.
 * See: http://jetpack.me/support/infinite-scroll/
 */
function temauno_jetpack_setup() {
	add_theme_support( 'infinite-scroll', array(
		'container' => 'main',
		'footer'    => 'page',
	) );
}
add_action( 'after_setup_theme', 'temauno_jetpack_setup' );
