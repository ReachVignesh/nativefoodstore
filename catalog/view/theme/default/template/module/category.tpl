<div class="panel panel-default catnav mb0">

  <div class="list-group">

    <a class="list-group-item fltrHdng"><?php echo $heading_title; ?> <i class="fa fa-angle-down"></i></a>

    <div class="list-group-item">

    <?php foreach ($categories as $category) { ?>   

    <ul class="sideNav">

      <?php if ($category['category_id'] == $category_id) { ?>

      <li><a href="<?php echo $category['href']; ?>" class="active"><?php echo $category['name']; ?></a></li>

      <?php } else { ?>  

      <li><a href="<?php echo $category['href']; ?>" class=""><?php echo $category['name']; ?></a></li>

      <?php } ?>

    </ul>

    <?php } ?>

    <!--<ul class="">

              <?php foreach ($categories as $category) { ?>

								<?php if ($category['category_id'] == $category_id) { ?>

              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a>

                <?php if ($category['children']) { ?>   

                  <?php foreach ($category['children'] as $child) { ?>

                    <ul class="list-unstyled">

                      <?php foreach ($children as $child) { ?>

                      <li><a href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></li>

                      <?php } ?>

                    </ul>

                    <?php } ?>

                  <?php } ?>  

              </li>

              

              <?php } else { ?>

              <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>

              <?php } ?>

              <?php } ?>

            </ul>-->

    

    </div>

  </div>

</div>

