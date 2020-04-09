(function(html) {
const photo = document.currentScript.getAttribute('data-photo-id');
const target = document.currentScript.getAttribute('data-target-id');
const container = document.querySelector(`#${target}`);
container.innerHTML = html;
document.querySelector(`#${photo}`).classList.add(TARGET_CLASS);
lazyload();
})(`
<li class="item " id="my-desk-at-home" style="background-image: url('/photo-stream/photos/tint/my%20desk%20at%20home-65ba1d.jpg')" title="my desk at home">
  <img class="lazyload" data-src="/photo-stream/photos/thumbnail/my%20desk%20at%20home-ccf4df.jpg" src="/photo-stream/photos/tint/my%20desk%20at%20home-65ba1d.jpg" height="1200" width="1600" />
  <span class="full">
    <span style="background-image: url('/photo-stream/photos/large/my%20desk%20at%20home-686656.jpg')"></span>
    <h2><span>  I'm always rotating in new hardware, but this is what my desk looks like today.  ()</span></h2>
  </span>
  <a class="open" href="/photo-stream/my-desk-at-home" data-target="my-desk-at-home">Open</a>
  <a class="close" href="/photo-stream/">Close</a>
  <a href="/photo-stream/munchie-riding-shotgun" data-target="munchie-riding-shotgun" class="next" title="Go to next photo">
    <span>Next</span>
  </a>
  <!-- <ul class="meta">
    <li></li>
    <li></li>
    <li><span class="aperture"><em>f</em>/</span>0.0</li>
	</ul> -->
</li>
<li class="item " id="munchie-riding-shotgun" style="background-image: url('/photo-stream/photos/tint/munchie%20riding%20shotgun-65ba1d.jpg')" title="munchie riding shotgun">
  <img class="lazyload" data-src="/photo-stream/photos/thumbnail/munchie%20riding%20shotgun-ccf4df.jpg" src="/photo-stream/photos/tint/munchie%20riding%20shotgun-65ba1d.jpg" height="3024" width="4032" />
  <span class="full">
    <span style="background-image: url('/photo-stream/photos/large/munchie%20riding%20shotgun-686656.jpg')"></span>
    <h2><span>  Muncie (beagle) riding shotgun in my RV  (2020:02:16)</span></h2>
  </span>
  <a class="open" href="/photo-stream/munchie-riding-shotgun" data-target="munchie-riding-shotgun">Open</a>
  <a class="close" href="/photo-stream/">Close</a>
  <a href="/photo-stream/my-desk-at-home" data-target="my-desk-at-home" class="previous" title="Go to previous photo">
    <span>Previous</span>
  </a>
  <a href="/photo-stream/i-had-blue-hair" data-target="i-had-blue-hair" class="next" title="Go to next photo">
    <span>Next</span>
  </a>
  <!-- <ul class="meta">
    <li></li>
    <li>1/144</li>
    <li><span class="aperture"><em>f</em>/</span>2.4</li>
	</ul> -->
</li>
<li class="item " id="i-had-blue-hair" style="background-image: url('/photo-stream/photos/tint/i%20had%20blue%20hair-65ba1d.jpg')" title="i had blue hair">
  <img class="lazyload" data-src="/photo-stream/photos/thumbnail/i%20had%20blue%20hair-ccf4df.jpg" src="/photo-stream/photos/tint/i%20had%20blue%20hair-65ba1d.jpg" height="1980" width="2640" />
  <span class="full">
    <span style="background-image: url('/photo-stream/photos/large/i%20had%20blue%20hair-686656.jpg')"></span>
    <h2><span>  For a couple of months while I was retired, I had blue hair  ()</span></h2>
  </span>
  <a class="open" href="/photo-stream/i-had-blue-hair" data-target="i-had-blue-hair">Open</a>
  <a class="close" href="/photo-stream/">Close</a>
  <a href="/photo-stream/munchie-riding-shotgun" data-target="munchie-riding-shotgun" class="previous" title="Go to previous photo">
    <span>Previous</span>
  </a>
  <!-- <ul class="meta">
    <li></li>
    <li></li>
    <li><span class="aperture"><em>f</em>/</span>0.0</li>
	</ul> -->
</li>
`);