# 3D Slicer — Root

## Stack
- C++17 + Qt6 (GUI), Python 3 (scripted modules/API)
- CMake + SuperBuild (downloads/builds all dependencies)
- VTK, ITK, CTK, MRML, SlicerExecutionModel

## Key Dirs
| Dir | Purpose |
|-----|---------|
| `Base/` | Core framework: QTApp, QTGUI, QTCLI, QTCore, Logic, Python, CLI |
| `Libs/MRML/` | Medical Reality Markup Language — scene/node graph |
| `Modules/Loadable/` | C++ modules loaded at runtime (Volumes, Markups, Segmentations…) |
| `Modules/Scripted/` | Python modules (DICOM, SegmentEditor, SampleData…) |
| `Modules/CLI/` | Command-line interface modules |
| `Applications/SlicerApp/` | Main application entry point |
| `Extensions/` | Extension build/test infrastructure |
| `CMake/` | Slicer-specific CMake macros |

## Naming Conventions
- C++ classes: `qSlicer*` (Qt/GUI), `vtkSlicer*` (VTK logic), `vtkMRML*` (MRML nodes)
- Files: class name = filename (e.g. `qSlicerVolumesModule.cxx`)
- Python modules: PascalCase directory, snake_case internally

## Build
```bash
cmake -S . -B ../Slicer-build -DCMAKE_BUILD_TYPE=Release
cmake --build ../Slicer-build --parallel $(nproc)
```
SuperBuild first: `cmake -S SuperBuild.cmake -B ../SB-build`

## Testing
```bash
ctest --test-dir ../Slicer-build -R <TestName> -V
```

## Git Rules
- Branch from `main`; PRs require review
- **Never push without asking the user first**
- Commits: `ENH:` feature, `BUG:` fix, `STYLE:` cleanup, `DOC:` docs, `TEST:` tests

## Do Not
- Edit generated files (anything with `# DO NOT EDIT` header)
- Mix Python 2 syntax — Python 3 only
- Add Qt5-only APIs (Qt6 required)
