<?php
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
define('DB_NAME', 'wikicele_wp70');

/** MySQL database username */
define('DB_USER', 'wikicele_wp70');

/** MySQL database password */
define('DB_PASSWORD', '1.)8R6pSC4');

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
define('AUTH_KEY',         '8zwraf3qpkrkzjldxhyu7zoe9y6dshwsv8ry9bvm7f3ambieavib6o9ibivz2npi');
define('SECURE_AUTH_KEY',  'ar7i56namcenznyjbu8klsoafsqefyx7gatkpnrpk3bjqmfip09juztfwahnq448');
define('LOGGED_IN_KEY',    '5tfzqnwacct2ycccuceuskjxipgeateuown5dqhudbfjayo9gf19ilgiigilhnsy');
define('NONCE_KEY',        'zwjm3hlrto3vjt6lhv42dsmtbdql5duucplkjxkzduhmns91ib1o2yosflecxm7r');
define('AUTH_SALT',        'k1szh96miesp3jettjxsltbcjgxr8thc7piu5xyolsdpmb13ssnthf6tfhjmpyhr');
define('SECURE_AUTH_SALT', 'dykrlvwckdz1sdr4lwzgggdlncf2ntnmamonnin9qfnm7qfztlf0p2ki8qmemcka');
define('LOGGED_IN_SALT',   'wpbx5wjd5jlkz6wrjy9ltycnc1ki3huc2hpbcn6tjqsmupxwlpnnmxraxplkjuor');
define('NONCE_SALT',       'wzxmghs96fyipwqnaraqfnizwdico3abwhl4q9jzznjj9eg1beigb0ud7emjs4qj');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix  = 'wped_';

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
