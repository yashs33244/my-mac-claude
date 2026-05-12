
include(${Slicer_CMAKE_DIR}/SlicerMacroBuildLoadableModule.cmake)

# "A depends on B" comment in the module list means that
# module B must be in the module list before module A
# (so that include directories provided by B are available
# when configuring module A).

# Phase 1 — Data Visualization only.
# Order follows the original upstream order to preserve dependency resolution.
# Modules marked "infrastructure" are not user-facing but are compile-time or
# link-time dependencies (including test deps) of the Phase 1 feature modules.
set(qtmodules
  Cameras          # infrastructure: Data links vtkSlicerCamerasModuleLogic
  Terminologies    # infrastructure: SubjectHierarchy/Widgets links qSlicerTerminologiesModuleWidgets
  SubjectHierarchy
  Colors           # depends on SubjectHierarchy
  Annotations      # infrastructure: Markups compiles qSlicerAnnotationsReader (needs vtkSlicerAnnotationModuleLogic)
  Sequences        # infrastructure: SceneViews links vtkSlicerSequencesModuleMRML;
                   #                 Sequences tests use vtkSlicerTablesLogic -> Tables also needed
  Tables           # infrastructure: Sequences tests link vtkSlicerTablesLogic
  SceneViews       # infrastructure: Markups tests include vtkSlicerSceneViewsModuleLogic.h (BUILD_TESTING)
  Markups          # infrastructure: VolumeRendering links vtkMRMLMarkupsROINode clipping box
  Data             # depends on Cameras
  Models
  Volumes
  VolumeRendering  # depends on Volumes + Markups
  ViewControllers
  )

# Phase 2+ (re-enable alongside those features):
#   Transforms
#   GeneralizedReformat
#   Segmentations
#   Plots
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
