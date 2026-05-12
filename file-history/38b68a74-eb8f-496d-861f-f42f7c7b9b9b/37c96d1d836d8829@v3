
include(${Slicer_CMAKE_DIR}/SlicerMacroBuildLoadableModule.cmake)

# "A depends on B" comment in the module list means that
# module B must be in the module list before module A
# (so that include directories provided by B are available
# when configuring module A).

# Phase 1 — Data Visualization only.
# Disabled modules are listed below and can be re-enabled in later phases.
set(qtmodules
  SubjectHierarchy
  Colors           # depends on SubjectHierarchy
  Annotations      # build-time dep of Markups (vtkSlicerAnnotationModuleLogic header)
  Markups          # build-time dep of VolumeRendering (vtkMRMLMarkupsROINode clipping box)
  Data
  Models
  Volumes
  VolumeRendering  # depends on Volumes and Markups
  ViewControllers
  )

# Phase 2+ (segmentation, transforms):
#   Terminologies
#   Transforms
#   GeneralizedReformat
#   Segmentations
#   SceneViews       # depends on Sequences

# Phase 3+ (analysis, sequences):
#   Sequences
#   Plots
#   Tables
#   Texts

# Not needed for medical imaging workflow:
#   Cameras
#   Units
#   SlicerWelcome
#   Reformat
#   CropVolume

include(SlicerCheckModuleEnabled)

foreach(module ${qtmodules})
  slicer_is_loadable_builtin_module_enabled(${module} _build_module)
  if(_build_module)
    add_subdirectory(${module})
  endif()
endforeach()
