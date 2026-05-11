# Base/ — Core Framework

## Sub-dirs
| Dir | Purpose |
|-----|---------|
| `QTApp/` | Application startup, main window, settings |
| `QTGUI/` | Abstract module/widget base classes, dialogs, styles |
| `QTCore/` | IO manager, extension manager, core utilities |
| `QTCLI/` | CLI module execution wrapper |
| `Logic/` | Application-level C++ logic (non-GUI) |
| `Python/` | Python entry points: `slicer/`, `sitkUtils.py`, `mrml.py` |
| `CLI/` | CLI launcher infrastructure |

## Key Classes
- `qSlicerApplication` — singleton app; use `slicer.app` in Python
- `qSlicerAbstractModule` — base for all modules
- `qSlicerAbstractModuleWidget` — base for all module panels
- `qSlicerIOManager` — file load/save

## Python API Entry Point
`Base/Python/slicer/` — the `slicer` package users import. `util.py` is the main utility module.

## Patterns
- Signals/slots: Qt standard; use `qvtkConnect` for VTK→Qt bridging
- Private implementation: `_p.h` / `Private` pattern (CTK style)
