import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheorem

structure PhaseDiagramPackage where
  components : List String
  temperatureRange : Prop
  pressureRange : Prop
  phaseBoundariesCalculated : Prop
  eutecticPointIdentified : Prop
  glassTransitionModeled : Prop

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  temperatureRangeClosed : P.temperatureRange
  pressureRangeClosed : P.pressureRange
  phaseBoundariesCalculatedClosed : P.phaseBoundariesCalculated
  eutecticPointIdentifiedClosed : P.eutecticPointIdentified
  glassTransitionModeledClosed : P.glassTransitionModeled

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.temperatureRange ∧ P.pressureRange ∧ P.phaseBoundariesCalculated ∧
  P.eutecticPointIdentified ∧ P.glassTransitionModeled

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.temperatureRangeClosed
    (And.intro E.pressureRangeClosed
      (And.intro E.phaseBoundariesCalculatedClosed
        (And.intro E.eutecticPointIdentifiedClosed E.glassTransitionModeledClosed)))

end MaterialsEngineeringPolymersEngineeringTheorem
end HautevilleHouse