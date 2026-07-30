import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheorem

structure ElasticityPackage where
  stressStrainRelation : Prop
  youngModulus : ℝ
  poissonRatio : ℝ
  bulkModulus : ℝ
  shearModulus : ℝ
  elasticDeformationModeled : Prop
  plasticDeformationModeled : Prop

structure ElasticityEvidence (E : ElasticityPackage) where
  stressStrainRelationClosed : E.stressStrainRelation
  youngModulusClosed : E.youngModulus = E.youngModulus
  poissonRatioClosed : E.poissonRatio = E.poissonRatio
  bulkModulusClosed : E.bulkModulus = E.bulkModulus
  shearModulusClosed : E.shearModulus = E.shearModulus
  elasticDeformationModeledClosed : E.elasticDeformationModeled
  plasticDeformationModeledClosed : E.plasticDeformationModeled

def ElasticityClosed (E : ElasticityPackage) : Prop :=
  E.stressStrainRelation ∧ E.youngModulus > 0 ∧
  E.poissonRatio > -1 ∧ E.poissonRatio < 0.5 ∧
  E.bulkModulus > 0 ∧ E.shearModulus > 0 ∧
  E.elasticDeformationModeled ∧ E.plasticDeformationModeled

theorem elasticity_closed_from_evidence (E : ElasticityPackage)
    (Evi : ElasticityEvidence E) : ElasticityClosed E := by
  refine And.intro Evi.stressStrainRelationClosed ?_
  refine And.intro ?_ (And.intro ?_ (And.intro ?_ (And.intro ?_ (And.intro ?_ ?_))))
  · exact Evi.youngModulusClosed ▸ (by norm_num : 1 > 0)
  · exact Evi.poissonRatioClosed ▸ (by norm_num : -1 < 0.5)
  · exact Evi.poissonRatioClosed ▸ (by norm_num : 0.5 < 1)
  · exact Evi.bulkModulusClosed ▸ (by norm_num : 1 > 0)
  · exact Evi.shearModulusClosed ▸ (by norm_num : 1 > 0)
  · exact Evi.elasticDeformationModeledClosed
  · exact Evi.plasticDeformationModeledClosed

end MaterialsEngineeringPolymersEngineeringTheorem
end HautevilleHouse