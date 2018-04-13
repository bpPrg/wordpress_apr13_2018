<?php
/**
 * Template for displaying search forms in Jane Lite
 *
 */
 
 if ( current_filter() === 'janelite_header_layout' ) : ?>

    <form role="search" method="get" id="header-searchform" action="<?php echo home_url( '/' ); ?>">
        <div><input type="text" value="" placeholder="<?php esc_html_e( 'Type here & click enter.', 'jane-lite') ?>" name="s" id="header-s" autocomplete="off" /></div>
    </form>
    
<?php else : ?>
    
    <form role="search" method="get" id="searchform" class="searchform" action="<?php echo home_url( '/' ); ?>">
        <div><label class="screen-reader-text" for="s"><?php esc_html_e( 'Search', 'jane-lite') ?></label>
            <input type="text" value="" name="s" id="s" />
            <input type="submit" id="searchsubmit" value="<?php esc_attr_e( 'Search', 'jane-lite') ?>" />
        </div>
    </form>
    
<?php endif; ?>