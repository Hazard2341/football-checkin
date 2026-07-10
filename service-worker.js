const CACHE = 'football-checkin-v1';
const FILES = [
  '/',
  '/index.html',
  '/manifest.json',
  '/images/icon-192.svg',
  '/images/icon-512.svg'
];

self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(CACHE).then(c => c.addAll(FILES))
  );
});

self.addEventListener('fetch', (e) => {
  e.respondWith(
    caches.match(e.request).then(r => r || fetch(e.request))
  );
});
