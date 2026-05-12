
include(${Slicer_CMAKE_DIR}/SlicerMacroBuildLoadableModule.cmake)

# "A depends on B" comment in the module list means that
# module B must be in the module list before module A
# (so that include directories provided by B are available
# when configuring module A).

# Phase 1 — Data Visualization only.
# Order matters: each entry must appear after its dependencies.
# Infrastructure modules are included even if not user-facing, because
# they are compile-time or link-time dependencies of the kept modules.
set(qtmodules
  Cameras          # infrastructure: Data depends on vtkSlicerCamerasModuleLogic
  Terminologies    # infrastructure: SubjectHierarchy/Widgets depends on qSlicerTerminologiesModuleWidgets
  SubjectHierarchy
  Colors           # depends on SubjectHierarchy
  Annotations      # infrastructure: Markups depends on vtkSlicerAnnotationModuleLogic header
  Markups          # infrastructure: VolumeRendering depends on vtkMRMLMarkupsROINode clipping box
  Data             # depends on Cameras
  Models
  Volumes
  VolumeRendering  # depends on Volumes and Markups
  ViewControllers
  )

# Phase 2+ (segmentation, transforms):
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
