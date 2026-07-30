import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PolymerPhaseBehaviorPackage where
  temperatureRange : Prop
  compositionRange : Prop
  phaseSeparation : Prop
  criticalPoint : Prop
  miscibilityGap : Prop

structure PolymerPhaseBehaviorEvidence (P : PolymerPhaseBehaviorPackage) where
  temperatureRangeClosed : P.temperatureRange
  compositionRangeClosed : P.compositionRange
  phaseSeparationClosed : P.phaseSeparation
  criticalPointClosed : P.criticalPoint
  miscibilityGapClosed : P.miscibilityGap

def PolymerPhaseBehaviorClosed (P : PolymerPhaseBehaviorPackage) : Prop :=
  P.temperatureRange ∧ P.compositionRange ∧ P.phaseSeparation ∧ P.criticalPoint ∧ P.miscibilityGap

theorem polymer_phase_behavior_closed_from_evidence
    (P : PolymerPhaseBehaviorPackage) (E : PolymerPhaseBehaviorEvidence P) :
    PolymerPhaseBehaviorClosed P := by
  exact And.intro E.temperatureRangeClosed
    (And.intro E.compositionRangeClosed
      (And.intro E.phaseSeparationClosed
        (And.intro E.criticalPointClosed E.miscibilityGapClosed)))

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse