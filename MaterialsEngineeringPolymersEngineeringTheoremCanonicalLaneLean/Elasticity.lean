import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure ElasticityPackage where
  stressTensor : Type u
  strainTensor : Type v
  hookeLaw : Prop
  youngModulus : ℕ
  poissonRatio : ℝ
  anisotropyFactor : ℝ

structure ElasticityEvidence (E : ElasticityPackage) where
  hookeLawClosed : E.hookeLaw
  youngModulusClosed : E.youngModulus > 0
  poissonRatioClosed : E.poissonRatio > -1 ∧ E.poissonRatio < 0.5

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.hookeLaw ∧ E.youngModulus > 0 ∧ (E.poissonRatio > -1 ∧ E.poissonRatio < 0.5)

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Ev : ElasticityEvidence E) : ElasticityClosed E := by
  exact And.intro Ev.hookeLawClosed
    (And.intro Ev.youngModulusClosed Ev.poissonRatioClosed)

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse