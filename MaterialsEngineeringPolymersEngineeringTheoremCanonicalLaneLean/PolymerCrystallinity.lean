import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PolymerCrystallinityPackage where
  crystalStructure : Prop
  unitCell : Prop
  lamellarThickness : Prop
  degreeOfCrystallinity : Prop
  meltingTemperature : Prop

structure PolymerCrystallinityEvidence (C : PolymerCrystallinityPackage) where
  crystalStructureClosed : C.crystalStructure
  unitCellClosed : C.unitCell
  lamellarThicknessClosed : C.lamellarThickness
  degreeOfCrystallinityClosed : C.degreeOfCrystallinity
  meltingTemperatureClosed : C.meltingTemperature

def PolymerCrystallinityClosed (C : PolymerCrystallinityPackage) : Prop :=
  C.crystalStructure ∧ C.unitCell ∧ C.lamellarThickness ∧ C.degreeOfCrystallinity ∧ C.meltingTemperature

theorem polymer_crystallinity_closed_from_evidence
    (C : PolymerCrystallinityPackage) (Ev : PolymerCrystallinityEvidence C) :
    PolymerCrystallinityClosed C := by
  exact And.intro Ev.crystalStructureClosed
    (And.intro Ev.unitCellClosed
      (And.intro Ev.lamellarThicknessClosed
        (And.intro Ev.degreeOfCrystallinityClosed Ev.meltingTemperatureClosed)))

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse