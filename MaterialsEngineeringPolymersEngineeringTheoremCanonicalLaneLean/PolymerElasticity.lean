import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PolymerElasticityPackage where
  youngModulus : Prop
  shearModulus : Prop
  poissonRatio : Prop
  stressStrainCurve : Prop
  viscoelasticModel : Prop

structure PolymerElasticityEvidence (E : PolymerElasticityPackage) where
  youngModulusClosed : E.youngModulus
  shearModulusClosed : E.shearModulus
  poissonRatioClosed : E.poissonRatio
  stressStrainCurveClosed : E.stressStrainCurve
  viscoelasticModelClosed : E.viscoelasticModel

def PolymerElasticityClosed (E : PolymerElasticityPackage) : Prop :=
  E.youngModulus ∧ E.shearModulus ∧ E.poissonRatio ∧ E.stressStrainCurve ∧ E.viscoelasticModel

theorem polymer_elasticity_closed_from_evidence
    (E : PolymerElasticityPackage) (Ev : PolymerElasticityEvidence E) :
    PolymerElasticityClosed E := by
  exact And.intro Ev.youngModulusClosed
    (And.intro Ev.shearModulusClosed
      (And.intro Ev.poissonRatioClosed
        (And.intro Ev.stressStrainCurveClosed Ev.viscoelasticModelClosed)))

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse