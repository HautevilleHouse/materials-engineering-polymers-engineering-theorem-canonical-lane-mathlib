import HautevilleHouse.MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

def ConstrainedMaterialsEngineeringPolymersClosure (A : MaterialsEngineeringPolymersAdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_materials_engineering_polymers_endgame (A : MaterialsEngineeringPolymersAdmissibleClass) :
    ConstrainedMaterialsEngineeringPolymersClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse