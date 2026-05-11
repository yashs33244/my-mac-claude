# Libs/MRML/ — Medical Reality Markup Language

## Sub-dirs
| Dir | Purpose |
|-----|---------|
| `Core/` | Node types, scene, I/O — the data model |
| `Logic/` | MRML-level algorithms (no Qt dependency) |
| `DisplayableManager/` | Bridges MRML nodes → VTK renderers |
| `Widgets/` | Qt widgets tightly coupled to MRML (sliders, node selectors) |
| `IDImageIO/` | Image I/O factory registration |

## Node Authoring Rules
- Inherit from `vtkMRMLNode` (or appropriate subclass)
- Implement: `CreateNodeInstance`, `GetNodeTagName`, `Copy`, `ReadXMLAttributes`, `WriteXML`, `PrintSelf`
- Use `vtkMRMLNodeMacro` in .cxx
- Register in scene: `vtkMRMLScene::RegisterNodeClass`

## Key Patterns
- Node references (instead of raw pointers): `AddNodeReferenceRole` / `GetNodeReference`
- Modified events: call `this->Modified()` after state change; observers use `vtkCommand::ModifiedEvent`
- Storage nodes handle file I/O separately from data nodes

## Python Access
```python
node = slicer.mrmlScene.GetFirstNodeByClass("vtkMRMLVolumeNode")
```
