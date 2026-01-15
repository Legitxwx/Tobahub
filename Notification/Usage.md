# Notification System Usage Guide

This notification system creates clean, animated Roblox notifications with icon support, color names, and click-to-close functionality.

--------------------------------------------------

INSTALLATION

Put this at the TOP of your script before using Notify{}:

```
loadstring(game:HttpGet("https://raw.githubusercontent.com/Legitxwx/Tobahub/refs/heads/main/Notification/TobaNotif"))()
```

This only needs to be executed once.

--------------------------------------------------

BASIC USAGE

```
Notify{
    title = "Title here",
    description = "Description text here"
}
```

Only title and description are required.
Everything else is optional and has defaults.

--------------------------------------------------

FULL USAGE EXAMPLE

```
Notify{
    title = "Warning",
    description = "This action cannot be undone",
    color = "red",
    duration = 5,
    position = "bottom",
    icon = "alert-triangle",
    iconType = "lucide"
}
```

--------------------------------------------------

AVAILABLE VARIABLES

title (string)
The main text shown at the top of the notification.

description (string)
Smaller text shown under the title.

color (string)
Sets the accent color of the notification.
No RGB numbers are needed.

Supported colors:
red
blue
green
yellow
orange
purple
pink
cyan
gray
white
black
error
success
warning
info

If an invalid color is used, it defaults to "info".

duration (number)
How long the notification stays on screen (in seconds).
Default is 4.

position (string)
Where notifications appear.
Values:
bottom (default)
top

icon (string)
Icon name without file extension.

iconType (string)
Icon library to use.
Values:
lucide
material

--------------------------------------------------

ICON LIBRARIES

Lucide Icons:
https://lucide.dev/icons/

Example:
```
icon = "alert-triangle"
iconType = "lucide"
```

Google Material Icons:
https://fonts.google.com/icons

Example:
```
icon = "check_circle"
iconType = "material"
```

--------------------------------------------------

BEHAVIOR

- Click a notification to close it instantly
- Notifications auto-close after duration time
- Multiple notifications stack automatically
- Default position is bottom of the screen

--------------------------------------------------

MINIMAL EXAMPLE

```
loadstring(game:HttpGet("https://raw.githubusercontent.com/Legitxwx/Tobahub/refs/heads/main/Notification/TobaNotif"))()

Notify{
    title = "Loaded",
    description = "Script is ready"
}
```

--------------------------------------------------

NOTES

- The loadstring must be placed before any Notify{} calls
- Script only needs to be loaded once
- This system is executor-based
- Icons load using executor asset functions
Values:
lucide
material

--------------------------------------------------

ICON LIBRARIES

Lucide Icons:
https://lucide.dev/icons/

Example:
icon = "alert-triangle"
iconType = "lucide"

Google Material Icons:
https://fonts.google.com/icons

Example:
icon = "check_circle"
iconType = "material"

--------------------------------------------------

BEHAVIOR

- Click a notification to close it instantly
- Notifications auto-close after duration time
- Multiple notifications stack automatically
- Default position is bottom of the screen

--------------------------------------------------

MINIMAL EXAMPLE

Notify{
    title = "Loaded",
    description = "Script is ready"
}

--------------------------------------------------

NOTES

- Script must be executed once before using Notify{}
- This system is executor-based
- Icons load using executor asset functions
- 
