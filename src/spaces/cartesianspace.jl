"""
    struct immutable CartesianSpace <: EuclideanSpace{ℝ}

A CartesianSpace is a real euclidean space `ℝ^d` and therefore self-dual. It has no
additonal structure and is completely characterised by its dimension `d`. This is
the vector space that is implicitly assumed in most of matrix algebra.
"""
struct CartesianSpace <: EuclideanSpace{ℝ}
    d::Int
end

Base.getindex(::RealNumbers) = CartesianSpace
Base.getindex(::RealNumbers, d::Int) = CartesianSpace(d)
Base.:^(::RealNumbers, d::Int) = CartesianSpace(d)

# Corresponding methods:
#------------------------
dim(V::CartesianSpace) = V.d
Base.indices(V::CartesianSpace) = Base.OneTo(dim(V))

Base.show(io::IO, V::CartesianSpace) = print(io, "ℝ^$(V.d)")

# direct sum
⊕(V1::CartesianSpace, V2::CartesianSpace) = CartesianSpace(V1.d+V2.d)
