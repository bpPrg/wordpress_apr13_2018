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
define('DB_NAME', 'wikicele_wp238');

/** MySQL database username */
define('DB_USER', 'wikicele_wp238');

/** MySQL database password */
define('DB_PASSWORD', '2Sl(9zi(p3');

/** MySQL hostname */
define('DB_HOST', 'localhost');

/** Database Charset to use in creating database tables. */
define('DB_CHARSET', 'utf8mb4');

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
define('AUTH_KEY',         'axiwaavcuwcimiqdrpqv2dz7jzmudr75aufrram9pumfwdbyzgxc0j50by9abwbv');
define('SECURE_AUTH_KEY',  'x319xy9smz7ifw4qdgvcf7qshn9vkxtuomkx8n7gz1hctypp8agrrrk1l6sbovql');
define('LOGGED_IN_KEY',    'cesrv6pvvfedrkqprj1qluktmuzco83ejmosmd4k01yi88i01285ttrgwinjz7ko');
define('NONCE_KEY',        'pf0vizgse0qiaihbbjk0ne4tz7znc2xv4ljzny3n7fitwlkdwyaov0eujjax2lr4');
define('AUTH_SALT',        'znywezrub3vaw6qu7kxpapfybljdwiwd2rj4zwkks2inwnrbo2vo8wllg3acetl1');
define('SECURE_AUTH_SALT', 's6x056bbal0mduafng9eezrhqxlxlzet317w2sdljvoh6kclnvrzue3u4n4ygwt7');
define('LOGGED_IN_SALT',   'nmijocomfiqt1jtcll0x0ms2q7fivkv83iva3r4ok0b9t5mzs3pxglykbefhv8is');
define('NONCE_SALT',       'vtsuykfnimgbfm5wvrtyy8msnobtas3iam8eugipgukrklwjujsybw5kc7sysita');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wpw6_';

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
