<?php

if ( file_exists( dirname( __FILE__ ) . './env_local' ) ) {
  // Local Environment
  define('WP_ENV', 'local');
  
  define('DB_NAME', '%%LOCAL_DB_NAME%%');
  define('DB_USER', '%%LOCAL_DB_USER%%');
  define('DB_PASSWORD', '%%LOCAL_DB_PASSWORD%%');
  define('DB_HOST', '%%LOCAL_DB_HOST%%');

  // Use direct file manipulation instead of FTP
  define('FS_METHOD', 'direct');

  define('WP_DEBUG', true);

} elseif( file_exists( dirname( __FILE__ ) . './env_staging' ) ) {
    // Staging Environment
  define('WP_ENV', 'staging');
  
  define('DB_NAME', '%%STAGING_DB_NAME%%');
  define('DB_USER', '%%STAGING_DB_USER%%');
  define('DB_PASSWORD', '%%STAGING_DB_PASSWORD%%');
  define('DB_HOST', '%%STAGING_DB_HOST%%');

} else {
  // Production Environment
  define('WP_ENV', 'production');

  define('DB_NAME', '%%PRODUCTION_DB_NAME%%');
  define('DB_USER', '%%PRODUCTION_DB_USER%%');
  define('DB_PASSWORD', '%%PRODUCTION_DB_PASSWORD%%');
  define('DB_HOST', '%%PRODUCTION_DB_HOST%%');

  define('WP_DEBUG', false);
}
define('DB_CHARSET', 'utf8');
define('DB_COLLATE', ''); 

define( 'AUTH_KEY',         'put your unique phrase here' );
define( 'SECURE_AUTH_KEY',  'put your unique phrase here' );
define( 'LOGGED_IN_KEY',    'put your unique phrase here' );
define( 'NONCE_KEY',        'put your unique phrase here' );
define( 'AUTH_SALT',        'put your unique phrase here' );
define( 'SECURE_AUTH_SALT', 'put your unique phrase here' );
define( 'LOGGED_IN_SALT',   'put your unique phrase here' );
define( 'NONCE_SALT',       'put your unique phrase here' );


$table_prefix  = 'wp_';


/**
 * WordPress Localized Language, defaults to English.
 *
 * Change this to localize WordPress. A corresponding MO file for the chosen
 * language must be installed to wp-content/languages. For example, install
 * de_DE.mo to wp-content/languages and set WPLANG to 'de_DE' to enable German
 * language support.
 */
define('WPLANG', '');

// ========================
// Custom Content Directory
// ========================
define( 'WP_CONTENT_DIR', dirname( __FILE__ ) . '/content' );
define( 'WP_CONTENT_URL', 'http://' . $_SERVER['HTTP_HOST'] . '/content' );


/* That's all, stop editing! Happy blogging. */

/** Absolute path to the WordPress directory. */
if ( !defined('ABSPATH') )
  define('ABSPATH', dirname(__FILE__) . '/application/');

/** Sets up WordPress vars and included files. */
require_once(ABSPATH . 'wp-settings.php');

