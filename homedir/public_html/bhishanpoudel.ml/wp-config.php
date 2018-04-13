<?php
/** Enable W3 Total Cache */
define('WP_CACHE', true); // Added by W3 Total Cache

/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://codex.wordpress.org/Editing_wp-config.php
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define('DB_NAME', 'wikicele_wp226');

/** MySQL database username */
define('DB_USER', 'wikicele_wp226');

/** MySQL database password */
define('DB_PASSWORD', '[)Sp4492EU');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8');

/** The Database Collate type. Don't change this if in doubt. */
define('DB_COLLATE', '');

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         'trocoouwg1zdiu8mfgwuasr6elcgcgchwidkcbmoaqvmoa84d5af3cuey8eabxok');
define('SECURE_AUTH_KEY',  'jzmzylpgsbonsj3t1c1xjkwufytrvjb8rx3oe5axj77prr8sl5kqqrgn8gqfm8kf');
define('LOGGED_IN_KEY',    'bvvpwdywdg3b7gbnxhtwayzalompavzvqvboynpatzdfnjopyl29eheczx6fvkse');
define('NONCE_KEY',        'ryfxdhbkvqccmygczg99e3ntys7viuetzvvdx6tpemn1hlmdlauqw0lmn1wpl9yf');
define('AUTH_SALT',        'mpnmeury5zg5enx0xyfnj7ytk7h0jfh9hdwgl2aka63g429yezl4wgs2idjhzdyg');
define('SECURE_AUTH_SALT', 'ghxsos63z9zczvhez5lfqhnoqhr9eek2rtc9tmq36co9bb76w6w3pmapdidr2cqt');
define('LOGGED_IN_SALT',   'nfagclsorswozur6v7tn4hbbu6myfkwywynjpouxud8lzesc2yakyjn6hhtfbk0h');
define('NONCE_SALT',       'rc9xphmpbyobeao101shollfm3iaenmu45jnuxvinxqnsss4hgjlriakldqgodh1');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wp9e_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the Codex.
 *
 * @link https://codex.wordpress.org/Debugging_in_WordPress
 */
define('WP_DEBUG', false);

/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');
