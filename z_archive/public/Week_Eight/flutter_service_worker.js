'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "4b51c3ca4c4bb0aa554dc838b7853d00",
"/": "4b51c3ca4c4bb0aa554dc838b7853d00",
"main.dart.js": "62e12e609220ae775e6e064b7891de71",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"manifest.json": "f5914a469b7c6baee527b918fe3c79bc",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "3a31b4581b4d357ace23a763461720b5",
"version.json": "73c2470a250c5249bf9d9894eb72cfec",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"assets/fonts/MaterialIcons-Regular.otf": "a2c0d20f391dbc9e1a80963090693f4a",
"assets/NOTICES": "a07b5d690fbfe6719a37a30ff5158bdb",
"assets/AssetManifest.json": "77f604a293411c89add71c65b5c1a769",
"assets/AssetManifest.bin": "b4d3b167cf80a35ae9da0194dbe60904",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/AssetManifest.bin.json": "b8609b5df8d61d315a587ede43bbb6b2",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/data/loot.json": "2de859adfbece85ea5883aa40c531373",
"assets/assets/data/enemies.json": "1fc7b993f266517ec84f38f0d7ac3174",
"assets/assets/images/player.png": "fc8f9be6377c0f53468e882d83321fd5",
"assets/assets/images/logo.png": "b8515013a687b80ecc90128ed3630d13",
"assets/assets/images/icon.png": "b8515013a687b80ecc90128ed3630d13",
"assets/assets/images/player_two.png": "b67be35ddc9fec7317fd886b12ea66c5",
"assets/assets/images/enemies/3/fish_abomination.png": "7da85ec6743fa8ec6e4ef28072aeb47f",
"assets/assets/images/enemies/3/undead_brute.png": "ae75e2c6c2b2a57f4974607e58f77fb6",
"assets/assets/images/enemies/3/flame_boss.png": "c69d523683cb0c8c1d9e1fd405a6a372",
"assets/assets/images/enemies/1/undead.png": "1e93535fbd52a7908490ab9dca40cecf",
"assets/assets/images/enemies/1/human.png": "2110b32d88148cf9f4c633f39e3f6319",
"assets/assets/images/enemies/2/undead_soldier.png": "437abeaa1aa459a6b024527301772a23",
"assets/assets/images/enemies/2/skeleton.png": "8e4e611368ec9bae4d2f7e8c8194f390",
"assets/assets/images/enemies/2/zombie.png": "e00e09e4e63e66b5b1e67b456616c04f",
"assets/assets/images/dice/d20/dice_seventeen.png": "b33f2d00fcab0ffcafb58d00c6536420",
"assets/assets/images/dice/d20/dice_twenty.png": "c7a26fe0a12f1da817dbf8dd7895f069",
"assets/assets/images/dice/d20/dice_nine.png": "2e0e3c3a26d15bea896c7974694e013e",
"assets/assets/images/dice/d20/dice_eight.png": "40ff141373f520a86a854bc1ebd9698d",
"assets/assets/images/dice/d20/dice_fifteen.png": "fb886949319eee0e36d297aa4bb43c62",
"assets/assets/images/dice/d20/dice_sixteen.png": "f563392b23abeaf04d77ce9801e8df3b",
"assets/assets/images/dice/d20/dice_thirteen.png": "94a487cff496904f8b3538b81a5bfbf2",
"assets/assets/images/dice/d20/dice_eleven.png": "f01b5504f5f2e0135dc44450c028baca",
"assets/assets/images/dice/d20/dice_one.png": "554aa6bdb8db70a03fd0e824328a6cc3",
"assets/assets/images/dice/d20/dice_two.png": "4cf3279f9269d362683645b072640b57",
"assets/assets/images/dice/d20/dice_fourteen.png": "3e7c57f7574adc772433d4a62b2ec6fc",
"assets/assets/images/dice/d20/dice_eighteen.png": "381a2dfca360145e4c73dd4427589f38",
"assets/assets/images/dice/d20/dice_seven.png": "0f70024013b2f19316eb57fc1d2b4250",
"assets/assets/images/dice/d20/dice_four.png": "39fd913167118679f02f5e0128a620de",
"assets/assets/images/dice/d20/dice_six.png": "081845994fa5d851aa2cf003cd42a797",
"assets/assets/images/dice/d20/dice_nineteen.png": "3a885e1d3d90f04e9c87df3fd42fb2d6",
"assets/assets/images/dice/d20/dice_five.png": "5bc0ce92333f9fb567679a0d0ade7f95",
"assets/assets/images/dice/d20/dice_three.png": "f9dabe59a62887b691c68281be08e866",
"assets/assets/images/dice/d20/dice_twelve.png": "82912fc1bb6392c7f93e3abf9a1375fc",
"assets/assets/images/dice/d20/dice_ten.png": "44310e900f9d489d26544fba9a60ff8d",
"assets/assets/images/dice/d6/dice_one.png": "c29fa73a4dd17587c48732da55a3c559",
"assets/assets/images/dice/d6/dice_two.png": "bfa9a8e9a1c336b537f429a585b17de8",
"assets/assets/images/dice/d6/dice_four.png": "6f7d80522ecd987e3184a320213bae92",
"assets/assets/images/dice/d6/dice_six.png": "61d33efc4bab668d3fc8eee6a704fc34",
"assets/assets/images/dice/d6/dice_five.png": "db95958c20e5aa13f29058c20b57a98c",
"assets/assets/images/dice/d6/dice_three.png": "fe0d69067ef0cda1836949a6e3893bbf",
"assets/assets/images/loot/3/royal_shield.png": "97ee6722f0202b5da1c53aa7a53b0e83",
"assets/assets/images/loot/3/jasons_mask.png": "ed2dbfef4036cf46ca1e7590f94a3e77",
"assets/assets/images/loot/3/poison_knife.png": "2dd2e377a7ea0ca13bcf27a953af51a5",
"assets/assets/images/loot/3/fire_arrows.png": "1e04287c95ca7a05f0863fa319723a69",
"assets/assets/images/loot/3/kings_helmet.png": "a626b39366469ad0ca8e2ca6cf05b1ef",
"assets/assets/images/loot/3/turtle_shield.png": "471a4fb7238a1d6db773c88f9bc3a40b",
"assets/assets/images/loot/3/golden_axe.png": "051655bbdaeed5a75ca0253c90906bb2",
"assets/assets/images/loot/3/magic_bow.png": "41c4d2d8d765382d2d33312d2dd2045f",
"assets/assets/images/loot/1/wood_sheild.png": "e50adc4c7197e075ecbc557712f35c00",
"assets/assets/images/loot/1/wood_spear.png": "f6c8c0b5a366372fce8cb3defef076bd",
"assets/assets/images/loot/1/minor_health.png": "4783c7a9ff573c9fee672fb0851ddf27",
"assets/assets/images/loot/1/wood_sword.png": "d0ac5cb6ddb984e6d4db6d06a0f4713e",
"assets/assets/images/loot/1/fish.png": "79614385c0c0c9b40797d1c61ec0905d",
"assets/assets/images/loot/1/bad_apple.png": "9f6fb8a4c7a637e0106179a07ae13f7b",
"assets/assets/images/loot/1/wood_knife.png": "e2fc9538c51bd741e4230fb690a07260",
"assets/assets/images/loot/1/green_slime.png": "05d8400a088d791be37a3d2c5ca42bb4",
"assets/assets/images/loot/2/major_health.png": "92477f971e1a4a118e688ddbec5f36ab",
"assets/assets/images/loot/2/metal_shield.png": "64111b74789bd29d512e0d38e7487039",
"assets/assets/images/loot/2/metal_hammer.png": "017db9bb765ab903e11e28c1b7fdbfac",
"assets/assets/images/loot/2/metal_axe.png": "5b157dffb993fdc373724a1e6a05efc6",
"assets/assets/images/loot/2/metal_sword.png": "79f2023081ed468f4e83abcdf5f8a2e3"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
