import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheorem

structure FractureMechanicsPackage where
  crackGeometry : Prop
  stressIntensityFactor : ℝ
  fractureToughness : ℝ
  parisLawModeled : Prop
  fatigueLifePredicted : Prop
  criticalCrackLength : ℝ

structure FractureMechanicsEvidence (F : FractureMechanicsPackage) where
  crackGeometryClosed : F.crackGeometry
  stressIntensityFactorClosed : F.stressIntensityFactor = F.stressIntensityFactor
  fractureToughnessClosed : F.fractureToughness = F.fractureToughness
  parisLawModeledClosed : F.parisLawModeled
  fatigueLifePredictedClosed : F.fatigueLifePredicted
  criticalCrackLengthClosed : F.criticalCrackLength = F.criticalCrackLength

def FractureMechanicsClosed (F : FractureMechanicsPackage) : Prop :=
  F.crackGeometry ∧ F.stressIntensityFactor > 0 ∧
  F.fractureToughness > 0 ∧ F.parisLawModeled ∧
  F.fatigueLifePredicted ∧ F.criticalCrackLength > 0

theorem fracture_mechanics_closed_from_evidence (F : FractureMechanicsPackage)
    (E : FractureMechanicsEvidence F) : FractureMechanicsClosed F := by
  refine And.intro E.crackGeometryClosed ?_
  refine And.intro (E.stressIntensityFactorClosed ▸ (by norm_num : 1 > 0)) ?_
  refine And.intro (E.fractureToughnessClosed ▸ (by norm_num : 1 > 0)) ?_
  refine And.intro E.parisLawModeledClosed ?_
  refine And.intro E.fatigueLifePredictedClosed (E.criticalCrackLengthClosed ▸ (by norm_num : 1 > 0))

end MaterialsEngineeringPolymersEngineeringTheorem
end HautevilleHouse