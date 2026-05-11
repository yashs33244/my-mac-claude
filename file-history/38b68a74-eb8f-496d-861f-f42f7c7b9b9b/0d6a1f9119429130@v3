# Modules/Loadable/ — C++ Runtime Modules

## Structure (each module follows this layout)
```
ModuleName/
  CMakeLists.txt
  qSlicerModuleNameModule.{h,cxx}       # module registration
  qSlicerModuleNameModuleWidget.{h,cxx} # panel UI
  Logic/vtkSlicerModuleNameLogic.{h,cxx}
  Widgets/                              # reusable widgets
  Resources/                            # .ui files, icons
  Testing/
```

## Phase 1 Active Modules
| Module | Purpose |
|--------|---------|
| `SubjectHierarchy` | Data tree / organization panel |
| `Colors` | Color tables for display (depends on SubjectHierarchy) |
| `Data` | Scene data panel |
| `Models` | 3D surface mesh viewing |
| `Volumes` | Volume (slice) display and loading |
| `VolumeRendering` | 3D volume rendering (depends on Volumes) |
| `ViewControllers` | Per-view axis/orientation controls |

## Disabled in Phase 1 (see CMakeLists.txt comments for phase targets)
Segmentations, Markups, Transforms, Sequences, Plots, Tables, Texts,
Annotations, Cameras, Units, SlicerWelcome, Reformat, CropVolume,
GeneralizedReformat, SceneViews

## UI Files
`.ui` files live in `Resources/UI/`. Edit with Qt Designer. CMake wraps them via `set(MODULE_UI_SRCS ...)`.
