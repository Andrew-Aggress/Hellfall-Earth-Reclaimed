# HUD and Menu Specification

## Combat HUD

Required elements:

- health;
- armor;
- current ammunition;
- reserve ammunition;
- crosshair;
- weapon icon;
- objective marker;
- interaction prompt;
- damage direction indicator;
- secret discovery notification;
- mission update notification.

## HUD rules

- keep the center of the screen clear;
- use animation instead of permanent clutter;
- critical information must survive colorblind modes;
- all information must be readable at 4K and ultrawide resolutions;
- support UI scale from 80% to 140%;
- never rely on color alone;
- use icon plus shape plus animation for important states.

## Menus

- main menu;
- campaign selection;
- mission select after unlock;
- settings;
- controls rebinding;
- accessibility;
- language selection;
- audio log archive;
- weapon upgrades;
- multiplayer lobby;
- pause menu;
- death and restart screen.

## Accessibility

- subtitle size;
- subtitle background opacity;
- speaker names;
- colorblind presets;
- high-contrast enemy outlines;
- screen shake slider;
- motion blur toggle;
- FOV control;
- hold/toggle options;
- aim sensitivity;
- controller vibration;
- audio channel sliders;
- reduced flashing effects.

## Localization layout

All buttons and panels must tolerate text expansion. Avoid fixed-width text boxes for mission objectives and settings descriptions.
