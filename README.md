# documento.fun

All-in-one document platform — landing page + Android APK setup.

## Overview

A complete landing page for **documento.fun**, an AI-powered document platform with:
- E-signatures
- Real-time collaboration
- AI auto-fill
- Template marketplace (1,000+ templates)
- PDF tools
- Bank-level security

## Files

| File | Description |
|------|-------------|
| `index.html` | Full landing page (pure HTML/CSS/JS, no frameworks) |
| `package.json` | Capacitor 5 dependencies |
| `capacitor.config.json` | Capacitor configuration |
| `build.sh` | One-command APK builder |
| `generate-icon.html` | App icon generator (HTML Canvas) |
| `README.md` | This file |

## How to Build APK

1. Open a terminal / shell
2. Run:
   ```bash
   bash build.sh
   ```
3. Wait 3 to 5 minutes for Gradle to finish
4. Download `documento-fun.apk` from the project root

## Landing Page Features

- Typing animation in hero (4 cycling phrases)
- Sticky navbar with backdrop blur on scroll
- Scroll-triggered counter animation (2M+ docs, 180+ countries, 99.9% uptime)
- Scroll reveal: fade-up per section
- Custom lime cursor glow
- Smooth scroll for anchor links
- Mobile hamburger menu
- Scroll progress bar at top
- Floating "Download App (APK)" button

## Stack

- Landing page: Pure HTML + CSS + JS (no frameworks, no libraries)
- Mobile: Capacitor 5 wrapping the HTML as a native Android APK
- Target: Android 33 (Android 13+)

## Deploy to Vercel

1. Push this repo to GitHub
2. Go to [vercel.com](https://vercel.com) and import the GitHub repo
3. Vercel will auto-detect it as a static site
4. Set the output directory to `.` (root)
5. Deploy — your site will be live at your Vercel domain

## Design System

| Token | Value |
|-------|-------|
| Background | `#0A0A0A` |
| Accent | `#AAFF00` (lime neon) |
| Text | `#FFFFFF` |
| Secondary | `#888888` |
| Font | Inter (400, 600, 700, 900) |
| Card radius | `12px` |
| Button radius | `999px` |
