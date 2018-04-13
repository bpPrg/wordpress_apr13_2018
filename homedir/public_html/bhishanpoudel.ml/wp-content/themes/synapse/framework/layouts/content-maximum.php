<?php
/**
 * @package Synapse
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class('col-md-12 col-sm-12 grid maximum'); ?>>

    <div class="out-thumb col-md-6 col-sm-6">
        <header class="entry-header">
            <h2 class="entry-title title-font"><a class="hvr-underline-reveal" href="<?php the_permalink(); ?>" rel="bookmark"><?php the_title(); ?></a></h2>
            <div class="postedon"><?php synapse_posted_on(); ?></div>
            <span class="entry-excerpt"><?php the_excerpt(); ?></span>
            <!--            <span class="readmore"><a class="hvr-underline-from-center" href="--><?php //the_permalink() ?><!--">--><?php //_e('Read More','synapse'); ?><!--</a></span>-->
        </header><!-- .entry-header -->
    </div><!--.out-thumb-->

    <div class="featured-thumb col-md-6 col-sm-6">
        <?php if (has_post_thumbnail()) : ?>
            <a href="<?php the_permalink() ?>" title="<?php the_title_attribute() ?>"><?php the_post_thumbnail('synapse-pop-thumb',array(  'alt' => get_the_title())); ?></a>
        <?php else: ?>
            <a href="<?php the_permalink() ?>" title="<?php the_title_attribute() ?>"><img alt="<?php the_title() ?>" src="<?php echo get_template_directory_uri()."/assets/images/placeholder2.jpg"; ?>"></a>
        <?php endif; ?>
    </div><!--.featured-thumb-->





</article><!-- #post-## -->