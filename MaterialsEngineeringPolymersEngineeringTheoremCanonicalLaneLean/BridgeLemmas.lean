import HautevilleHouse.MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean.PolymerAdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

def bridgeClosed (A : MaterialsEngineeringPolymersAdmissibleClass) : Prop :=
  PolymerPhaseBehaviorClosed A.object.phaseBehavior ∧
  PolymerElasticityClosed A.object.elasticity ∧
  PolymerCrystallinityClosed A.object.crystallinity ∧
  PolymerFractureMechanicsClosed A.object.fractureMechanics

theorem bridge_from_admissible_class (A : MaterialsEngineeringPolymersAdmissibleClass) :
    bridgeClosed A := by
  have h1 : PolymerPhaseBehaviorClosed A.object.phaseBehavior := by
    exact polymer_phase_behavior_closed_from_evidence A.object.phaseBehavior (by
      exact {
        temperatureRangeClosed := by trivial
        compositionRangeClosed := by trivial
        phaseSeparationClosed := by trivial
        criticalPointClosed := by trivial
        miscibilityGapClosed := by trivial
      })
  have h2 : PolymerElasticityClosed A.object.elasticity := by
    exact polymer_elasticity_closed_from_evidence A.object.elasticity (by
      exact {
        youngModulusClosed := by trivial
        shearModulusClosed := by trivial
        poissonRatioClosed := by trivial
        stressStrainCurveClosed := by trivial
        viscoelasticModelClosed := by trivial
      })
  have h3 : PolymerCrystallinityClosed A.object.crystallinity := by
    exact polymer_crystallinity_closed_from_evidence A.object.crystallinity (by
      exact {
        crystalStructureClosed := by trivial
        unitCellClosed := by trivial
        lamellarThicknessClosed := by trivial
        degreeOfCrystallinityClosed := by trivial
        meltingTemperatureClosed := by trivial
      })
  have h4 : PolymerFractureMechanicsClosed A.object.fractureMechanics := by
    exact polymer_fracture_mechanics_closed_from_evidence A.object.fractureMechanics (by
      exact {
        fractureToughnessClosed := by trivial
        crackPropagationClosed := by trivial
        stressIntensityFactorClosed := by trivial
        fractureEnergyClosed := by trivial
        fatigueLimitClosed := by trivial
      })
  exact And.intro (And.intro h1 h2) (And.intro h3 h4)

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse