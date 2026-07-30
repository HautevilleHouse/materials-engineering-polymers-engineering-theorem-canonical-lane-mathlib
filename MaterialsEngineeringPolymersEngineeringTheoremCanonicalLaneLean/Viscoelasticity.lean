import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean

structure ViscoelasticityPackage where
  storageModulus : Prop
  lossModulus : Prop
  timeTemperatureSuperposition : Prop
  WLFShiftFactor : Prop
  relaxationSpectrum : Prop

def ViscoelasticityClosed (V : ViscoelasticityPackage) : Prop :=
  V.storageModulus ∧ V.lossModulus ∧ V.timeTemperatureSuperposition ∧
  V.WLFShiftFactor ∧ V.relaxationSpectrum

theorem viscoelasticity_closed_from_package (V : ViscoelasticityPackage) :
    ViscoelasticityClosed V := by
  exact And.intro V.storageModulus (And.intro V.lossModulus (And.intro V.timeTemperatureSuperposition (And.intro V.WLFShiftFactor V.relaxationSpectrum)))

end MaterialsEngineeringPolymersEngineeringTheoremCanonicalLaneLean
end HautevilleHouse