import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PhaseDiagramPackage where
  temperatureRange : Type u
  pressureRange : Type v
  phaseBoundaryCurves : Prop
  gibbsFreeEnergyMinimized : Prop
  leverRuleValid : Prop
  tttDiagram : Type w

structure PhaseDiagramEvidence (P : PhaseDiagramPackage) where
  phaseBoundaryCurvesClosed : P.phaseBoundaryCurves
  gibbsFreeEnergyMinimizedClosed : P.gibbsFreeEnergyMinimized
  leverRuleValidClosed : P.leverRuleValid

def PhaseDiagramClosed (P : PhaseDiagramPackage) : Prop :=
  P.phaseBoundaryCurves ∧ P.gibbsFreeEnergyMinimized ∧ P.leverRuleValid

theorem phase_diagram_closed_from_evidence (P : PhaseDiagramPackage)
    (E : PhaseDiagramEvidence P) : PhaseDiagramClosed P := by
  exact And.intro E.phaseBoundaryCurvesClosed
    (And.intro E.gibbsFreeEnergyMinimizedClosed E.leverRuleValidClosed)

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse