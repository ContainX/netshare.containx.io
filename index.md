---
layout: project
project: netshare
---

<div class="feature intro">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <p>
        Mount NFS v3/4, AWS EFS or CIFS inside your docker containers. This is a docker plugin which enables these volume types to be directly mounted within a container.
        </p>
      </div>
    </div>
  </div>
</div>

<!-- Docker Tools -->
<div class="feature gray-background">
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <h2>Docker Tools</h2>
        <p>Supports all major Docker tools including Engine/Daemon, Compose and Docker Swarm.</p>
      </div>
      <div class="col-sm-5 text-right">
        <img class="svgcolor" src="/assets/img/icons/whale.svg">
      </div>
    </div>
  </div>
</div>

<!-- Databases -->
<div class="feature white-background">
  <div class="container">
    <div class="row">      
      <div class="col-sm-5 col-sm-offset-1">
        <img class="svg" src="/assets/img/icons/database.svg">
      </div>
      <div class="col-sm-6 text-right">
        <h2>Databases</h2>
        <p>Perfect companion to mount persistent volumes for RDBMS and NoSQL based databases.</p>
      </div>
    </div>
  </div>
</div>

<!--Simple -->
<div class="feature gray-background">
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <h2>Simple</h2>
        <p>Easy to install and configure! Supports clusters such as Mesos/Marathon and Docker Swarm.</p>
      </div>
      <div class="col-sm-5 text-right">
        <img class="svg" src="/assets/img/icons/simplify.svg">
      </div>
    </div>
  </div>
</div>

<!-- Embeddable -->
<!-- <div class="feature gray-background">
  <div class="container">
    <div class="row">
<div class="col-sm-6" markdown="1">
```java
containxReplica replica = containxReplica.builder(address, members)
  .withTransport(new NettyTransport())
  .withStorage(new Storage(StorageLevel.DISK))
  .build()
  .open()
  .get();
```
</div>
      <div class="col-sm-6 text-right">
        <h2>Embeddable</h2>
        <p>containx supports fully embeddable replicas that live in-process, eliminating the need to manage external coordination services.</p>
      </div>
    </div>
  </div>
</div> -->

<!--Learn more -->
<div class="feature get-started">
  <div class="container">
    <div class="row">
      <div class="col-sm-12 text-center">
        <h2>Ready to learn more?</h2>
        <p>
          <a href="/docs/getting-started" class="btn btn-success btn-lg doc-btn">Get Started</a>
        </p>
      </div>
    </div>
  </div>
</div>

<script type='text/javascript'>
// Format tabs
$(function(){
  var $container = $('#sync-tabs');

  updateTabs($container);
  $(window).resize(function(){
    updateTabs($container);
  })

  function updateTabs($tabsContainer){
      var $containerWidth = $tabsContainer.width();
      var tabWidths = [];
      var $tabs = $tabsContainer.find('li');
      $tabs.each(function(index, tab){
        tabWidths.push($(tab).width());
      });

      var formattedTabs = [];
      var maxWidth = $containerWidth;
      var maxWidthSet = false;
      var rowWidth = 0;
      for(var i = tabWidths.length - 1; i >= 0; i--){
          var tabWidth = tabWidths[i];
          if(rowWidth + tabWidth > maxWidth){
            if(!maxWidthSet){
              maxWidth = rowWidth;
              maxWidthSet = true;
            }
            rowWidth = tabWidth;
            formattedTabs.unshift($('<div class="spacer"></div>'));
          }else{
            rowWidth += tabWidth;
          }
          formattedTabs.unshift($tabs.get(i));
      }

      var $tempContainer = $('<div></div>');
      formattedTabs.forEach(function(tab, index){
        $tempContainer.append(tab);
      });
      $tabsContainer.html($tempContainer.html());
  }
});
</script>
