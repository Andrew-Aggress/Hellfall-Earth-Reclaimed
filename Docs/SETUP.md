# Hellfall setup

## Required tools

- Unreal Engine 5.8.3 installed on drive D:
- Visual Studio Build Tools 2022 with MSVC and Windows SDK
- .NET SDK 8+
- Git and Git LFS

## Project creation

Do not create `.uproject` or C++ target files manually before Unreal Engine is installed. Use the Unreal Project Browser to create a **C++ Games / First Person** project in this folder, then generate project files and verify a Development Editor build.

## Planned source layout

```text
Source/Hellfall/
  Core/
  Player/
  Input/
  Combat/
  AI/
  Components/
  Systems/
  UI/
```

## Planned content layout

```text
Content/_Project/
  Core/
  FirstSlice/
    Maps/
    Input/
    Weapons/
    Enemies/
    Arena/
    FX/
    Audio/
    UI/
  Localization/
```

## First validation

1. Open the generated `.uproject`.
2. Confirm there are no missing modules.
3. Compile Development Editor.
4. Launch the default map.
5. Commit the clean scaffold before gameplay implementation.
