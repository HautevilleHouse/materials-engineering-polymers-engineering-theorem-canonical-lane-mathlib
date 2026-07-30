import HautevilleHouse.MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

def gateClosed (A : MaterialsEngineeringPolymersAdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : MaterialsEngineeringPolymersAdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse