'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"index.html": "5a58b44ef8654411b9a57757b8ae175d",
"/": "5a58b44ef8654411b9a57757b8ae175d",
"main.dart.js": "24d470d4455ed1ccf6ee118febc582a7",
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
"manifest.json": "b605ad991061d4b657563c9b028d355c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter_bootstrap.js": "b2f2a569923e5dd84f26709897a47ac6",
"version.json": "0c10a4af112b0c8e91d589a0bac3ccd4",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/NOTICES": "0a85a3fbd2bc99f296b82e2f4d8c73a7",
"assets/AssetManifest.json": "705730b4235b560d9f42c7cf424a0868",
"assets/AssetManifest.bin": "2c9c02920ec45d45a08485a352ec9646",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/AssetManifest.bin.json": "31b7e0b10613a4d76040a7724e834c42",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/assets/images/player.png": "fc8f9be6377c0f53468e882d83321fd5",
"assets/assets/images/player_two.png": "b67be35ddc9fec7317fd886b12ea66c5",
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
"assets/assets/images/dice/d6/dice_three.png": "fe0d69067ef0cda1836949a6e3893bbf"};
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
