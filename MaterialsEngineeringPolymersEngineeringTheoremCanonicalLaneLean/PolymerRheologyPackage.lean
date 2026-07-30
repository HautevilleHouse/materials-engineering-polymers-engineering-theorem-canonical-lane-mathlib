import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PolymerRheologyPackage where
  viscosityModel : Prop
  shearRateDependence : Prop
  relaxationTime : Prop
  viscoelasticModulus : Prop
  meltFlowIndex : Prop

structure PolymerRheologyEvidence (P : PolymerRheologyPackage) where
  viscosityModelClosed : P.viscosityModel
  shearRateDependenceClosed : P.shearRateDependence
  relaxationTimeClosed : P.relaxationTime
  viscoelasticModulusClosed : P.viscoelasticModulus
  meltFlowIndexClosed : P.meltFlowIndex

def PolymerRheologyClosed (P : PolymerRheologyPackage) : Prop :=
  P.viscosityModel ∧ P.shearRateDependence ∧ P.relaxationTime ∧
  P.viscoelasticModulus ∧ P.meltFlowIndex

theorem polymer_rheology_closed_from_evidence (P : PolymerRheologyPackage)
    (E : PolymerRheologyEvidence P) : PolymerRheologyClosed P := by
  exact And.intro E.viscosityModelClosed
    (And.intro E.shearRateDependenceClosed
      (And.intro E.relaxationTimeClosed
        (And.intro E.viscoelasticModulusClosed E.meltFlowIndexClosed)))

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse
