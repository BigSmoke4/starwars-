✦ Beyond the Known
> **A cinematic 3D space journey built with Three.js — where scrolling becomes the flight path.**
![Three.js](https://img.shields.io/badge/Three.js-r160-black?style=for-the-badge&logo=three.js&logoColor=white)
![WebGL](https://img.shields.io/badge/WebGL-3D%20Rendering-111827?style=for-the-badge&logo=webgl&logoColor=white)
![GLTF](https://img.shields.io/badge/Assets-GLB-7c3aed?style=for-the-badge)
![License](https://img.shields.io/badge/License-Add%20Your%20License-374151?style=for-the-badge)
---
◇ The Experience
Beyond the Known is an immersive, scroll-driven 3D web experience that turns a webpage into a cinematic journey through deep space.
Instead of traditional page navigation, the user's scroll position controls the narrative:
Galaxy → Ship → Approach → Boarding → Cockpit → Deep Space → Discovery
The project combines Three.js, custom GLSL shaders, GLB models, procedural motion, camera choreography, cinematic typography, and responsive interaction into one lightweight browser experience.
> *Every star is a possibility. Every horizon hides something new.*
---
✧ What Happens
Chapter	Experience
`01`	Before the Journey — the galaxy unfolds around the viewer
`02`	The Ship Appears — an unknown vessel emerges from the darkness
`03`	Approaching the Ship — the camera closes the distance
`04`	Entering the Ship — transition into the interior corridor
`05`	Inside the Cockpit — flight systems come online
`06`	The Galaxy Reveals Itself — the journey accelerates
`07`	The Journey Begins — the unknown becomes the destination
`08`	Beyond the Known — cinematic title sequence
`09`	The Discovery — a new world appears
`10`	Final Section — the journey continues
---
🚀 Highlights
Scroll-driven cinematic storytelling
Three.js WebGL rendering
Custom GLB/GLTF 3D assets
Dynamic camera choreography
Interactive mouse-look camera
Pointer/touch drag camera controls
Pinch/scroll zoom support
Animated star-speed streaks
Procedural GLSL planet shader
HDR-like environment lighting through `RoomEnvironment`
Smooth scene transitions with black cinematic flashes
Animated loading screen with progress
Responsive desktop and mobile layout
`prefers-reduced-motion` support
Optional live tuning/debug mode
No framework or build system required
---
🛸 Tech Stack
```text
Frontend
├── HTML5
├── CSS3
└── JavaScript ES Modules

3D / Rendering
├── Three.js 0.160.0
├── WebGL
├── GLTFLoader
├── RoomEnvironment
└── Custom GLSL Shaders

Assets
├── galaxy.glb
├── ship.glb
├── cockpit.glb
└── transition.glb

Development
└── Python / local HTTP server
```
The project intentionally keeps the runtime simple: no React, no bundler, no npm dependency installation is required.
Three.js is loaded from the jsDelivr CDN through an ES-module import map.
---
📁 Project Structure
```text
starwars-site/
│
├── index.html          # Main experience, styling, Three.js logic
├── start-server.bat    # Windows helper for starting the local server
│
├── galaxy.glb         # Space / galaxy environment
├── ship.glb           # Exterior spacecraft model
├── cockpit.glb        # Cockpit interior model
└── transition.glb     # Interior corridor / transition environment
```
---
⚡ Run Locally
Option 1 — Windows
Double-click:
```text
start-server.bat
```
Then open the local address shown by the server.
Option 2 — Python
Open a terminal inside the project directory:
```bash
python -m http.server 8000
```
Then visit:
```text
http://localhost:8000
```
Important
Do not open `index.html` directly with `file://`.
The project loads `.glb` files and JavaScript modules, so it should be served through a local HTTP server.
---
🎮 Interaction
Desktop
Input	Action
Scroll	Progress through the cinematic journey
Move mouse	Look around
Drag	Rotate the camera
Ctrl + Mouse Wheel	Zoom
Buttons	Jump to specific journey stages
Touch
Gesture	Action
Swipe / Drag	Look around
Two-finger pinch	Zoom
Vertical scrolling	Progress through the story
---
🎬 How the Scene System Works
The experience is driven by the current scroll position.
The page is divided into cinematic sections. The renderer continuously calculates which section is active and converts that value into a normalized journey position.
Conceptually:
```text
Scroll Position
      ↓
Journey Progress
      ↓
Scene Phase
      ↓
Camera + Model + Lighting + Effects
```
The major scene phases are:
```text
PHASE 0
Ship Exterior
      ↓
PHASE 1
Corridor Transition
      ↓
PHASE 2
Cockpit
      ↓
Deep Space / Discovery
```
Each transition is smoothed to prevent abrupt camera movement.
---
🌌 3D Pipeline
Galaxy
The galaxy model is normalized and converted into a large surrounding environment.
It follows the camera so the viewer remains immersed inside the space environment.
Ship
The spacecraft is normalized dynamically based on its bounding box, positioned into the scene, and animated through its available GLTF animation clips.
Cockpit
The cockpit is aligned with a configurable pilot-eye position so the camera can transition into the interior without relying on hard-coded model dimensions.
Corridor
The transition model is analyzed at runtime to determine its bounding dimensions and establish a camera path through the corridor.
---
✨ Procedural Effects
Star Streaks
The project generates thousands of line segments around the camera:
```text
2,200 line segments
        ↓
GPU shader animation
        ↓
Variable streak length
        ↓
Higher speed during travel
```
This creates the sensation of accelerating through space without requiring thousands of individual star objects.
Discovered Planet
The destination planet is generated procedurally with a custom GLSL shader.
It uses:
Procedural noise
Fractal Brownian motion
Surface variation
Directional lighting
Rim lighting
Animated rotation
No external planet texture is required.
---
🎨 Visual Language
The UI intentionally avoids conventional dashboard-style layouts.
Palette
```text
Void        #04060B
Star        #EAF0FA
Muted       #9FB0C8
Amber       #FFB454
```
Typography
```text
Headings    Syncopate
Body        Newsreader
```
The combination creates a contrast between:
Technical / futuristic headings
Editorial / cinematic narrative text
---
⚙️ Configuration
Most scene-alignment values are grouped near the top of the JavaScript module:
```js
const CFG = {
  shipYaw: Math.PI,
  shipLen: 5,
  rear: [0, 0.4, 2.6],
  canopy: [0, 0.45, -0.3],
  cockpitYaw: Math.PI / 2,
  cockpitLen: 2.4,
  eye: [-0.3, 0.85, 0],
  corridorRev: false,
  corridorEye: 0.4
};
```
This makes it easier to adapt the experience to different GLB models.
Useful values
Property	Purpose
`shipYaw`	Exterior ship rotation
`shipLen`	Exterior ship normalization
`cockpitYaw`	Cockpit orientation
`cockpitLen`	Cockpit normalization
`eye`	Pilot/camera reference position
`corridorRev`	Reverse corridor direction
`corridorEye`	Corridor camera height
`rear`	Exterior camera anchor
`canopy`	Cockpit placement anchor
---
🧪 Built-in Tuning Mode
The project contains a lightweight development tuning mode.
Press:
```text
T
```
to display the tuning HUD.
Available controls include:
```text
Y              Rotate ship
C              Rotate cockpit

Arrow Up       Move eye forward
Arrow Down     Move eye backward
Arrow Left     Move eye left
Arrow Right    Move eye right

Page Up        Raise eye
Page Down      Lower eye

V              Reverse corridor

-              Lower corridor camera
=              Raise corridor camera

[ / ]          Adjust rear entry height
```
The current `CFG` object is printed to the HUD so adjusted values can be copied back into the source.
---
📱 Responsive Design
The experience adapts to different viewport sizes using:
Responsive typography
Viewport-based section heights
Dynamic WebGL camera aspect ratio
Pointer events
Touch gestures
Mobile-friendly spacing
Reduced-motion detection
The renderer also caps device pixel ratio:
```js
renderer.setPixelRatio(Math.min(devicePixelRatio, 1.75));
```
This helps balance visual quality and GPU performance.
---
♿ Reduced Motion
The project respects the browser's reduced-motion preference:
```js
const reduce =
  matchMedia('(prefers-reduced-motion: reduce)').matches;
```
When enabled, certain camera and travel effects are reduced to make the experience less motion-intensive.
---
🧩 Customizing the Story
The narrative is intentionally written directly in the HTML so it is easy to replace.
A section follows this pattern:
```html
<section class="beat">
  <div class="copy">
    <div class="ch">01 — Chapter</div>

    <h2>YOUR TITLE</h2>

    <p>
      Your cinematic narrative goes here.
    </p>
  </div>
</section>
```
You can therefore transform the experience into:
A portfolio
A product launch
A game landing page
A sci-fi story
A creative agency website
A music experience
An interactive film introduction
without changing the underlying 3D engine.
---
🔧 Performance Notes
For smoother rendering:
Serve the project over HTTP instead of `file://`
Keep GLB files optimized
Avoid unnecessarily large textures
Test on integrated GPUs and mobile devices
Keep device pixel ratio capped
Use reduced motion when appropriate
Consider compressing GLB assets for production
For a production deployment, consider adding:
```text
GLB compression
Texture compression
CDN hosting
Asset preloading strategy
Production error reporting
```
---
🌐 Browser Requirements
A modern browser with WebGL and ES-module support is recommended.
Good targets include:
Chrome / Chromium
Microsoft Edge
Firefox
Safari
Hardware acceleration should be enabled for the best experience.
---
🗂️ Deployment
Because this is a static site, it can be deployed to most static hosting platforms.
Typical deployment flow:
```text
GitHub Repository
       ↓
Static Hosting
       ↓
index.html
       +
GLB assets
       ↓
Live 3D Experience
```
Suitable platforms include GitHub Pages, Netlify, Vercel, Cloudflare Pages, or any static web server.
Make sure all `.glb` files remain available at the paths expected by `index.html`.
---
🛠️ Troubleshooting
Black screen
Check that:
```text
index.html
galaxy.glb
ship.glb
cockpit.glb
transition.glb
```
are in the expected directory.
Also make sure the site is running through HTTP.
---
GLB files are not loading
Run:
```bash
python -m http.server 8000
```
Then open:
```text
http://localhost:8000
```
Do not use:
```text
file:///...
```
---
Three.js does not load
The project imports Three.js from a CDN.
Check:
Internet connection
Browser console
VPN / firewall restrictions
CDN availability
Open DevTools with:
```text
F12
```
and inspect the Console tab.
---
Performance is low
Try:
Closing GPU-heavy applications
Enabling hardware acceleration
Reducing GLB texture resolution
Compressing 3D assets
Testing with reduced motion
Lowering the renderer pixel-ratio cap
---
🧠 Architecture at a Glance
```text
                         ┌─────────────────┐
                         │    index.html   │
                         └────────┬────────┘
                                  │
              ┌───────────────────┼───────────────────┐
              │                   │                   │
              ▼                   ▼                   ▼
        HTML / CSS          Three.js Engine      Story Sections
              │                   │                   │
              │          ┌────────┼────────┐          │
              │          │        │        │          │
              │          ▼        ▼        ▼          │
              │       Galaxy    Ship    Cockpit       │
              │                   │                   │
              │                   ▼                   │
              │              Corridor                 │
              │                   │                   │
              └───────────────────┼───────────────────┘
                                  ▼
                           Scroll Progress
                                  │
                                  ▼
                        Cinematic Camera System
                                  │
                                  ▼
                         Final Discovery Scene
```
---
✦ Design Philosophy
This project follows one central idea:
> **The interface should disappear into the experience.**
There are no conventional navigation bars, card grids, or dashboard panels.
Instead, the user discovers the interface through:
```text
Motion
  ↓
Space
  ↓
Typography
  ↓
Story
  ↓
Interaction
```
The page behaves less like a website and more like a short interactive film.
---
📜 License
Add your preferred license before publishing this repository.
For example:
```text
MIT License
```
If the included 3D models, fonts, or other assets come from third parties, verify their individual licenses before redistributing them.
---
⭐ Credits
Built with:
Three.js
GLTF / GLB
WebGL
Syncopate
Newsreader
---
✦ Final Transmission
```text
THE GALAXY IS VAST.

There are worlds beyond this one,
stories beyond this journey,
and mysteries still waiting in the dark.

KEEP EXPLORING.
```
Beyond the Known — an experiment in cinematic web experiences.
