# Abstract super type for all basis states
abstract type AbstractBasisState end


# export abstract type
export AbstractBasisState





# general abstract overlap function
"""
    overlap(state_1 :: BS1, state_2 :: BS2) :: Complex{Float64} where {BS1<:AbstractBasisState, BS2<:AbstractBasisState}

This function computes the term ``\\left< state_1 | state_2\\right>``.

A complex number is returned.

"""
function overlap(state_1 :: BS1, state_2 :: BS2) :: Complex{Float64} where {BS1<:AbstractBasisState, BS2<:AbstractBasisState}
    @error "not implemented abstract function 'overlap' for basis states of types "*string(BS1)*" and "*string(BS2) stacktrace()
    return NaN+ NaN*im
end
export overlap