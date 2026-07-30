import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PolymerFractureMechanicsPackage where
  fractureToughness : Prop
  crackPropagation : Prop
  stressIntensityFactor : Prop
  fractureEnergy : Prop
  fatigueLimit : Prop

structure PolymerFractureMechanicsEvidence (F : PolymerFractureMechanicsPackage) where
  fractureToughnessClosed : F.fractureToughness
  crackPropagationClosed : F.crackPropagation
  stressIntensityFactorClosed : F.stressIntensityFactor
  fractureEnergyClosed : F.fractureEnergy
  fatigueLimitClosed : F.fatigueLimit

def PolymerFractureMechanicsClosed (F : PolymerFractureMechanicsPackage) : Prop :=
  F.fractureToughness ∧ F.crackPropagation ∧ F.stressIntensityFactor ∧ F.fractureEnergy ∧ F.fatigueLimit

theorem polymer_fracture_mechanics_closed_from_evidence
    (F : PolymerFractureMechanicsPackage) (Ev : PolymerFractureMechanicsEvidence F) :
    PolymerFractureMechanicsClosed F := by
  exact And.intro Ev.fractureToughnessClosed
    (And.intro Ev.crackPropagationClosed
      (And.intro Ev.stressIntensityFactorClosed
        (And.intro Ev.fractureEnergyClosed Ev.fatigueLimitClosed)))

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse