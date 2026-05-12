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

## Adding a New Loadable Module
1. Copy an existing simple module (e.g. `Texts/`)
2. Rename all classes/files
3. Register in parent `CMakeLists.txt` via `add_subdirectory`
4. Module auto-discovered at runtime via `qSlicerModuleFactory`

## Key Modules Reference
| Module | Notes |
|--------|-------|
| `Volumes` | Volume display/loading |
| `Markups` | Fiducials, ROIs, curves, planes |
| `Segmentations` | Label maps + segment editor backend |
| `Models` | Surface mesh display |
| `SubjectHierarchy` | Tree-based data organization |
| `Sequences` | Time-series node sequences |

## UI Files
`.ui` files live in `Resources/UI/`. Edit with Qt Designer. CMake wraps them via `set(MODULE_UI_SRCS ...)`.
