import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheorem

structure CrystallographyPackage where
  latticeStructure : Type u
  unitCellGeometry : Prop
  symmetryGroup : Prop
  bravaisLatticeClassified : Prop
  xrdPatternComputed : Prop

structure CrystallographyEvidence (C : CrystallographyPackage) where
  unitCellGeometryClosed : C.unitCellGeometry
  symmetryGroupClosed : C.symmetryGroup
  bravaisLatticeClassifiedClosed : C.bravaisLatticeClassified
  xrdPatternComputedClosed : C.xrdPatternComputed

def CrystallographyClosed (C : CrystallographyPackage) : Prop :=
  C.unitCellGeometry ∧ C.symmetryGroup ∧ C.bravaisLatticeClassified ∧ C.xrdPatternComputed

theorem crystallography_closed_from_evidence (C : CrystallographyPackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.unitCellGeometryClosed
    (And.intro E.symmetryGroupClosed
      (And.intro E.bravaisLatticeClassifiedClosed E.xrdPatternComputedClosed))

end MaterialsEngineeringPolymersEngineeringTheorem
end HautevilleHouse