# Applications/SlicerApp/ — Main Application

## Key Files
| File | Purpose |
|------|---------|
| `Main.cxx` | Entry point |
| `qSlicerAppMainWindow.{h,cxx}` | Main window (menus, toolbars, layout) |
| `Resources/` | App icons, splash screen |
| `slicer-application-properties.cmake` | Version/branding metadata |

## Main Window Customization
- Add menu actions in `qSlicerAppMainWindow.cxx` via `setupMenus()`
- Toolbar buttons: `addToolBar()` / `QToolBar`
- Layout presets: `qSlicerLayoutManager`

## Application Properties
Edit `slicer-application-properties.cmake` for:
- `Slicer_VERSION_*`
- `Slicer_ORGANIZATION_*`
- Default module on startup

## Phase 1 UI State (feature-1/data-visual)
Developer-facing items hidden from the medical-app build. Changes in `Base/QTApp/`:

| Item | Location | Change |
|------|----------|--------|
| Error Log | View menu | Not added to menu (dock widget still active internally) |
| Python Console | View menu + DialogToolBar | Not added (console still available for internal use) |
| Extensions Manager | View menu + DialogToolBar | Removed from `.ui` |

**What is kept:** File menu (Add Data `Ctrl+O`, DICOM, Save, Close), View menu (all layouts), viewport toolbars, DICOM module, Data/Volumes modules.
