# Modules/Scripted/ — Python Modules

## Structure (each module)
```
ModuleName/
  ModuleName.py          # main module class
  ModuleNameLib/         # supporting library code
  Resources/             # icons, UI files
  Testing/               # Python test scripts
  CMakeLists.txt
```

## Module Class Skeleton
```python
class ModuleName(ScriptedLoadableModule):
    def __init__(self, parent): ...

class ModuleNameWidget(ScriptedLoadableModuleWidget):
    def setup(self): ...
    def onApplyButton(self): ...

class ModuleNameLogic(ScriptedLoadableModuleLogic):
    def run(self, ...): ...

class ModuleNameTest(ScriptedLoadableModuleTest):
    def runTest(self): ...
```

## Key Modules
| Module | Purpose |
|--------|---------|
| `DICOM` | DICOM import/export UI |
| `SegmentEditor` | Segmentation editing tools |
| `SampleData` | Downloads test datasets |
| `DataProbe` | Hover-over voxel info |
| `ScreenCapture` | Screenshot/video export |

## Testing
```python
slicer.util.selectModule("ModuleName")
# or run via ctest: -R py_ModuleNameTest
```
