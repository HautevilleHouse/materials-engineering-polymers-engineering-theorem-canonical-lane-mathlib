import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure PolymerMeltRheologyPackage where
  viscosityModel : Type u
  shearRateRange : Type v
  carreauYasudaModel : Prop
  arrheniusTemperatureDependence : Prop
  activationEnergy : ℝ
  powerLawIndex : ℝ

structure ProcessingEvidence (P : PolymerMeltRheologyPackage) where
  carreauYasudaModelClosed : P.carreauYasudaModel
  arrheniusTemperatureDependenceClosed : P.arrheniusTemperatureDependence
  activationEnergyClosed : P.activationEnergy > 0

def PolymerMeltRheologyClosed (P : PolymerMeltRheologyPackage) : Prop :=
  P.carreauYasudaModel ∧ P.arrheniusTemperatureDependence ∧ P.activationEnergy > 0

theorem polymer_melt_rheology_closed_from_evidence (P : PolymerMeltRheologyPackage)
    (E : ProcessingEvidence P) : PolymerMeltRheologyClosed P := by
  exact And.intro E.carreauYasudaModelClosed
    (And.intro E.arrheniusTemperatureDependenceClosed E.activationEnergyClosed)

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse