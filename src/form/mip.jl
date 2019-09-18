# Define MIP implementations of Gas Models

export
    MIPGasModel, StandardMIPForm

""
abstract type AbstractMIPForm <: AbstractGasFormulation end

""
abstract type StandardMIPForm <: AbstractMIPForm end

const MIPGasModel = GenericGasModel{StandardMIPForm} # the standard MIP model

"default MIP constructor"
MIPGasModel(data::Dict{String,Any}; kwargs...) = GenericGasModel(data, StandardMIPForm)

#################################################################################################
### Variables
#################################################################################################

######################################################################################################
## Constraints
######################################################################################################

"Constraint: Weymouth equation--not applicable for MIP models"
function constraint_weymouth(gm::GenericGasModel{T}, n::Int, k, i, j, f_min, f_max, w, pd_min, pd_max) where T <: AbstractMIPForm
    #TODO we could think about putting a polyhendra around the weymouth
end

"Constraint: Weymouth equation with one way direction--not applicable for MIP models"
function constraint_weymouth_directed(gm::GenericGasModel{T}, n::Int, k, i, j, w, direction) where T <: AbstractMIPForm
    #TODO we could think about putting a polyhendra around the weymouth
end

" Constraint: constraints on pressure drop across where direction is constrained"
function constraint_pipe_pressure_directed(gm::GenericGasModel{T}, n::Int, k, i, j, pd_min, pd_max) where T <: AbstractMIPForm
end

" Constraint: Constraint on pressure drop across a short pipe--not applicable for MIP models"
function constraint_short_pipe_pressure(gm::GenericGasModel{T}, n::Int, k, i, j) where T <: AbstractMIPForm
end

"Constraint: Compressor ratio constraints on pressure differentials--not applicable for MIP models"
function constraint_compressor_ratios(gm::GenericGasModel{T}, n::Int, k, i, j, min_ratio, max_ratio, i_pmax, j_pmax) where T <: AbstractMIPForm
end

" Constraint: Compressor ratio when the flow direction is constrained--not applicable for MIP models"
function constraint_compressor_ratios_directed(gm::GenericGasModel{T}, n::Int, k, i, j, min_ratio, max_ratio, direction) where T <: AbstractMIPForm
end

" Constraint: Constraints on pressure drop across valves where the valve can open or close--not applicable for MIP models"
function constraint_on_off_valve_pressure(gm::GenericGasModel{T}, n::Int, k, i, j, i_pmax, j_pmax) where T <: AbstractMIPForm
end

" constraints on pressure drop across control valves that are undirected--not applicable for MIP models"
function constraint_on_off_control_valve_pressure(gm::GenericGasModel{T}, n::Int, k, i, j, min_ratio, max_ratio, f_max, i_pmin, i_pmax, j_pmax) where T <: AbstractMIPForm
end

" Constraint: Pressure drop across a control valves when directions is constrained--not applicable for MIP models"
function constraint_on_off_control_valve_pressure_directed(gm::GenericGasModel{T}, n::Int, k, i, j, min_ratio, max_ratio, i_pmax, j_pmax, yp, yn) where T <: AbstractMIPForm
end

"Constraint: Weymouth equation--not applicable for MIP models--not applicable for MIP models"
function constraint_weymouth_ne(gm::GenericGasModel{T},  n::Int, k, i, j, w, f_min, f_max, pd_min, pd_max) where T <: AbstractMIPForm
end

" Constraint: Pressure drop across an expansion pipe when direction is constrained--not applicable for MIP models"
function constraint_pressure_ne_directed(gm::GenericGasModel{T}, n::Int, k, i, j, yp, yn) where T <: AbstractMIPForm
end

"Constraint: Weymouth equation--not applicable for MIP models--not applicable for MIP models"
function constraint_weymouth_ne_directed(gm::GenericGasModel{T},  n::Int, k, i, j, w, pd_min, pd_max, direction) where T <: AbstractMIPForm
end

"Constraint: compressor ratios on a new compressor--not applicable for MIP models-not applicable for MIP models"
function constraint_compressor_ratios_ne(gm::GenericGasModel{T}, n::Int, k, i, j, min_ratio, max_ratio, f_max, i_pmin, i_pmax, j_pmax) where T <: AbstractMIPForm
end

" Constraint: Pressure drop across an expansion compressor when direction is constrained-not applicable for MIP models"
function constraint_compressor_ratios_ne_directed(gm::GenericGasModel{T}, n::Int, k, i, j, min_ratio, max_ratio, mf, j_pmax, i_pmin, i_pmax, direction) where T <: AbstractMIPForm
end

"Constraint: Constraints which define pressure drop across a pipe "
function constraint_pipe_pressure(gm::GenericGasModel{T}, n::Int, k, i, j, pd_min, pd_max) where T <: AbstractMIPForm
end

"Constraint: constraints on pressure drop across an expansion pipe"
function constraint_pipe_pressure_ne(gm::GenericGasModel{T}, n::Int, k, i, j, pd_min, pd_max) where T <: AbstractMIPForm
end
