<?php
define('WP_CACHE', true);
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
define('DB_NAME', 'wikicele_wp899');

/** MySQL database username */
define('DB_USER', 'wikicele_wp899');

/** MySQL database password */
define('DB_PASSWORD', '8!S[p49Nl5');

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
define('AUTH_KEY',         'ukpdg5mzaa63tdnesfxehe1rsykixry82sdczueoxyfwjdh4l6oingdntogk6qwc');
define('SECURE_AUTH_KEY',  '7mn3s1mkgqmlqiqyn9qak22x2bwcamdmnnvwhskt7dj9j8kgpke0pasdwvj5lri5');
define('LOGGED_IN_KEY',    'caz6u74hljcqtgk1ssmwa65wn9ualb20hraqiiqpjrybswwtjev36kb3w6tu9xli');
define('NONCE_KEY',        'rd3hlh4zwswkhv6awh3uj7tck3esfssypz7dvzuwwlsdwzvtvy3rsi7qa3osqyqp');
define('AUTH_SALT',        'iilc8udcqys5ld3wcxh6xdmkw3e3ojx6m5i04tcjvztt004wjeekxhp61thyykjg');
define('SECURE_AUTH_SALT', 'p9u05yx0t4wn3gjwdacrwofjwbhssca8rz8sdmtbaxkqmnfzvwn5kf4lzbbee2ut');
define('LOGGED_IN_SALT',   'f5jmcnwoa1ox35cdxykbjsshz9vnc0flyhdk0ot0xwggvv48fv3lrn3ti0mh4odx');
define('NONCE_SALT',       'txsyhhvdguggy4h4lj20gs8uzwogknwgglyo7xlvr2srjpm1leg7iihqueqn0ztd');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wplt_';

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
