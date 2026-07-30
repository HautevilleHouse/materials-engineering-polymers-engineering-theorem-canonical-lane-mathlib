import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PolymerCrystallographyPackage where
  unitCellGeometry : Prop
  chainPackingSymmetry : Prop
  lamellarThicknessDistribution : Prop
  crystallinityFraction : Prop
  meltingTemperature : Prop

def PolymerCrystallographyClosed (P : PolymerCrystallographyPackage) : Prop :=
  P.unitCellGeometry ∧ P.chainPackingSymmetry ∧ P.lamellarThicknessDistribution ∧
  P.crystallinityFraction ∧ P.meltingTemperature

theorem polymer_crystallography_closed_from_package (P : PolymerCrystallographyPackage) :
    PolymerCrystallographyClosed P := by
  exact And.intro P.unitCellGeometry (And.intro P.chainPackingSymmetry (And.intro P.lamellarThicknessDistribution (And.intro P.crystallinityFraction P.meltingTemperature)))

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse