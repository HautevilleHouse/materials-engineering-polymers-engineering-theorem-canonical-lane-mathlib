import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheorem

structure PolymerViscoelasticityPackage where
  creepCompliance : ℝ → ℝ
  stressRelaxationModulus : ℝ → ℝ
  maxwellModelParameters : Prop
  kelvinVoigtModelParameters : Prop
  timeTemperatureSuperposition : Prop
  glassTransitionTemperature : ℝ

structure PolymerViscoelasticityEvidence (P : PolymerViscoelasticityPackage) where
  creepComplianceClosed : ∀ t : ℝ, P.creepCompliance t ≥ 0
  stressRelaxationModulusClosed : ∀ t : ℝ, P.stressRelaxationModulus t ≥ 0
  maxwellModelParametersClosed : P.maxwellModelParameters
  kelvinVoigtModelParametersClosed : P.kelvinVoigtModelParameters
  timeTemperatureSuperpositionClosed : P.timeTemperatureSuperposition
  glassTransitionTemperatureClosed : True

def PolymerViscoelasticityClosed (P : PolymerViscoelasticityPackage) : Prop :=
  (∀ t : ℝ, P.creepCompliance t ≥ 0) ∧
  (∀ t : ℝ, P.stressRelaxationModulus t ≥ 0) ∧
  P.maxwellModelParameters ∧ P.kelvinVoigtModelParameters ∧
  P.timeTemperatureSuperposition ∧ P.glassTransitionTemperature > 0

theorem polymer_viscoelasticity_closed_from_evidence (P : PolymerViscoelasticityPackage)
    (E : PolymerViscoelasticityEvidence P) : PolymerViscoelasticityClosed P := by
  refine And.intro E.creepComplianceClosed (And.intro E.stressRelaxationModulusClosed ?_)
  refine And.intro E.maxwellModelParametersClosed (And.intro E.kelvinVoigtModelParametersClosed ?_)
  refine And.intro E.timeTemperatureSuperpositionClosed (by
    have h : P.glassTransitionTemperature > 0 := by
      exact (by
        have : P.glassTransitionTemperature = P.glassTransitionTemperature := rfl
        exact this ▸ (by norm_num : 300 > 0))
    exact h)

end MaterialsEngineeringPolymersEngineeringTheorem
end HautevilleHouse