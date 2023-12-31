####################################################
# Single Particle Multi Site Composite Basis State #
####################################################


# basis state build on superposition
"""
    SPMSCompositeBasisState{SPB <: SPBasis{SPMSBasisState{SPSS}} where SPSS<:AbstractSPSSBasisState} <: AbstractSPBasisState

This object defines a single particle composite basis state through the prefactors of the basis states `prefactors :: Vector{Complex{Float64}}` and its original basis `basis :: SPB`. 
"""
struct SPMSCompositeBasisState{SPB <: SPBasis{SPMSBasisState{SPSS}} where SPSS<:AbstractSPSSBasisState} <: AbstractSPBasisState
    # the prefactors of basis states
    prefactors :: Vector{Complex{Float64}}
    # the original basis
    basis      :: SPB
end
export SPMSCompositeBasisState



function SPMSCompositeBasisState(prefactors :: Vector{<:Number}, basis :: B) where {B <: SPBasis{<:SPMSBasisState{SPSS}} where SPSS<:AbstractSPSSBasisState}
    return SPMSCompositeBasisState{B}(prefactors, basis)
end

function CompositeBasisState(prefactors :: Vector{<:Number}, basis :: B) where {B <: SPBasis{<:SPMSBasisState{SPSS}} where SPSS<:AbstractSPSSBasisState}
    return SPMSCompositeBasisState(prefactors, basis)
end
export CompositeBasisState


function get_sites(basis::SPBasis{BS}) where {SPSSBS, BS <: SPMSCompositeBasisState{B} where B}
    return unique(vcat([get_sites(s.basis) for s in states(basis)]))
end
export get_sites