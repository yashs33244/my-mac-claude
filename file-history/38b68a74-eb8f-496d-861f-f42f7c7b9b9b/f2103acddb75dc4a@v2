
# Phase 1 — No CLI processing modules needed for data visualization.
# All CLI modules are image processing algorithms (filters, segmentation, etc.)
# and will be re-enabled in later phases alongside those features.

# Phase 2+ (re-enable as needed):
#   GrayscaleModelMaker / ModelMaker      — DICOM-to-surface pipeline
#   N4ITKBiasFieldCorrection              — volume pre-processing
#   ResampleScalarVectorDWIVolume         — needed by CropVolume
#   CreateDICOMSeries                     — DICOM export
#   PETStandardUptakeValueComputation     — PET analysis
#   ... (full original list preserved below for reference)
#
# Original full list:
#   AddScalarVolumes, CastScalarVolume, CheckerBoardFilter,
#   CurvatureAnisotropicDiffusion, ExecutionModelTour, ExtractSkeleton,
#   GaussianBlurImageFilter, GradientAnisotropicDiffusion,
#   GrayscaleFillHoleImageFilter, GrayscaleGrindPeakImageFilter,
#   GrayscaleModelMaker, HistogramMatching, ImageLabelCombine,
#   LabelMapSmoothing, MaskScalarVolume, MedianImageFilter,
#   MergeModels, ModelMaker, ModelToLabelMap, MultiplyScalarVolumes,
#   N4ITKBiasFieldCorrection, OrientScalarVolume, ProbeVolumeWithModel,
#   ResampleDTIVolume, ResampleScalarVectorDWIVolume,
#   RobustStatisticsSegmenter, SimpleRegionGrowingSegmentation,
#   SubtractScalarVolumes, ThresholdScalarVolume,
#   VotingBinaryHoleFillingImageFilter,
#   ROITest (testing only),
#   CreateDICOMSeries, PETStandardUptakeValueComputation (DICOM),
#   FiducialRegistration, ResampleScalarVolume (legacy)

set(cli_modules)

include(SlicerCheckModuleEnabled)

foreach(module ${cli_modules})
  set(${module}_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/${module})
  slicer_is_cli_builtin_module_enabled(${module} _build_module)
  if(_build_module)
    add_subdirectory(${module})
  endif()
endforeach()
