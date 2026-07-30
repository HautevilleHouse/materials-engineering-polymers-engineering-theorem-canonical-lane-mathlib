import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PolymerMorphologyPackage where
  crystallinityDegree : Prop
  spheruliteGrowth : Prop
  lamellarThickness : Prop
  tieMoleculeDensity : Prop
  glassTransitionTemp : Prop

structure PolymerMorphologyEvidence (P : PolymerMorphologyPackage) where
  crystallinityDegreeClosed : P.crystallinityDegree
  spheruliteGrowthClosed : P.spheruliteGrowth
  lamellarThicknessClosed : P.lamellarThickness
  tieMoleculeDensityClosed : P.tieMoleculeDensity
  glassTransitionTempClosed : P.glassTransitionTemp

def PolymerMorphologyClosed (P : PolymerMorphologyPackage) : Prop :=
  P.crystallinityDegree ∧ P.spheruliteGrowth ∧
  P.lamellarThickness ∧ P.tieMoleculeDensity ∧ P.glassTransitionTemp

theorem polymer_morphology_closed_from_evidence (P : PolymerMorphologyPackage)
    (E : PolymerMorphologyEvidence P) : PolymerMorphologyClosed P := by
  exact And.intro E.crystallinityDegreeClosed
    (And.intro E.spheruliteGrowthClosed
      (And.intro E.lamellarThicknessClosed
        (And.intro E.tieMoleculeDensityClosed E.glassTransitionTempClosed)))

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse