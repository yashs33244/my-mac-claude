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
