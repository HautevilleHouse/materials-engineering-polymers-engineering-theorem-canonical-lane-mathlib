import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure CrystalStructurePackage where
  latticeType : Type u
  basisVectors : latticeType → latticeType → latticeType
  unitCellVolume : ℕ
  symmetryGroup : Prop
  bravaisLatticeClassified : Prop
  xrayDiffractionPattern : Type v

structure CrystallographyEvidence (C : CrystalStructurePackage) where
  symmetryGroupClosed : C.symmetryGroup
  bravaisLatticeClassifiedClosed : C.bravaisLatticeClassified

def CrystallographyClosed (C : CrystalStructurePackage) : Prop :=
  C.symmetryGroup ∧ C.bravaisLatticeClassified

theorem crystallography_closed_from_evidence (C : CrystalStructurePackage)
    (E : CrystallographyEvidence C) : CrystallographyClosed C := by
  exact And.intro E.symmetryGroupClosed E.bravaisLatticeClassifiedClosed

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse