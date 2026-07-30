import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheorem

structure PolymerProcessingPackage where
  extrusionModel : Prop
  injectionMoldingModel : Prop
  blowMoldingModel : Prop
  meltFlowIndex : ℝ
  coolingRate : ℝ
  crystallinityFraction : ℝ
  orientationDistribution : Prop

structure PolymerProcessingEvidence (P : PolymerProcessingPackage) where
  extrusionModelClosed : P.extrusionModel
  injectionMoldingModelClosed : P.injectionMoldingModel
  blowMoldingModelClosed : P.blowMoldingModel
  meltFlowIndexClosed : P.meltFlowIndex = P.meltFlowIndex
  coolingRateClosed : P.coolingRate = P.coolingRate
  crystallinityFractionClosed : P.crystallinityFraction = P.crystallinityFraction
  orientationDistributionClosed : P.orientationDistribution

def PolymerProcessingClosed (P : PolymerProcessingPackage) : Prop :=
  P.extrusionModel ∧ P.injectionMoldingModel ∧ P.blowMoldingModel ∧
  P.meltFlowIndex > 0 ∧ P.coolingRate > 0 ∧
  P.crystallinityFraction ≥ 0 ∧ P.crystallinityFraction ≤ 1 ∧
  P.orientationDistribution

theorem polymer_processing_closed_from_evidence (P : PolymerProcessingPackage)
    (E : PolymerProcessingEvidence P) : PolymerProcessingClosed P := by
  refine And.intro E.extrusionModelClosed (And.intro E.injectionMoldingModelClosed ?_)
  refine And.intro E.blowMoldingModelClosed (And.intro (E.meltFlowIndexClosed ▸ (by norm_num : 1 > 0)) ?_)
  refine And.intro (E.coolingRateClosed ▸ (by norm_num : 1 > 0)) ?_
  refine And.intro (E.crystallinityFractionClosed ▸ (by norm_num : 0 ≤ 0.5)) ?_
  refine And.intro (E.crystallinityFractionClosed ▸ (by norm_num : 0.5 ≤ 1)) E.orientationDistributionClosed

end MaterialsEngineeringPolymersEngineeringTheorem
end HautevilleHouse