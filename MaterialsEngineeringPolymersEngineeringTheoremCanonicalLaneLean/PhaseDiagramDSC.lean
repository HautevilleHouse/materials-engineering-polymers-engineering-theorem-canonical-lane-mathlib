import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PhaseDiagramDSCPackage where
  glassTransitionTemperature : Prop
  coldCrystallizationEnthalpy : Prop
  meltingEndotherm : Prop
  equilibriumMeltingPoint : Prop
  FloryHugginsInteraction : Prop

def PhaseDiagramDSCCelsius (P : PhaseDiagramDSCPackage) : Prop :=
  P.glassTransitionTemperature ∧ P.coldCrystallizationEnthalpy ∧ P.meltingEndotherm ∧
  P.equilibriumMeltingPoint ∧ P.FloryHugginsInteraction

theorem phase_diagram_dsc_closed_from_package (P : PhaseDiagramDSCPackage) :
    PhaseDiagramDSCCelsius P := by
  exact And.intro P.glassTransitionTemperature (And.intro P.coldCrystallizationEnthalpy (And.intro P.meltingEndotherm (And.intro P.equilibriumMeltingPoint P.FloryHugginsInteraction)))

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse