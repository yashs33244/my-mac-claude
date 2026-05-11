# Phase 1 — Data Visualization only.
# Disabled modules are listed below and can be re-enabled in later phases.
set(modules
  DataProbe
  SampleData
  )

# Phase 2+ (segmentation):
#   SegmentEditor
#   SegmentStatistics
#   VectorToScalarVolume
#   CropVolumeSequence
#   ImportItkSnapLabel

# Not needed / developer tools:
#   PerformanceTests
#   SelfTests
#   WebServer
#   ScreenCapture

# Conditional on Slicer_BUILD_EXTENSIONMANAGER_SUPPORT:
#   ExtensionWizard

# Conditional on Slicer_USE_NUMPY:
#   Endoscopy

# Conditional on Slicer_USE_SCIPY:
#   LineProfile

if(Slicer_BUILD_DICOM_SUPPORT)
  list(APPEND modules
    DICOM
    DICOMLib
    DICOMPlugins
    DICOMPatcher
    )
endif()

include(SlicerCheckModuleEnabled)

foreach(module ${modules})
  slicer_is_scripted_builtin_module_enabled(${module} _build_module)
  if(_build_module)
    add_subdirectory(${module})
  endif()
endforeach()
