"""
    Bisect_Abs(S::BnBSolver,B::BnBModel,N::Vector{Interval{Float64}})

Returns two interval boxes 'X1,X2' created by bisecting 'N' in the highest width dimension.
"""
function Bisect_Abs(S::BnBSolver,B::BnBModel,N::Vector{Interval{Float64}})
  i::Int64 = indmax(diam.(N))
  N1::Interval{Float64},N2::Interval{Float64} = bisect(N[i])
  X1::Vector{Interval{Float64}} = deepcopy(N)
  X2::Vector{Interval{Float64}} = deepcopy(N)
  X1[i] = N1
  X2[i] = N2
  return X1,X2
end

"""
    Bisect_Rel(S::BnBSolver,B::BnBModel,N::Vector{Interval{Float64}})

Returns two interval boxes 'X1,X2' created by bisecting 'N' in the highest width dimension after scaling by initial box size.
"""
function Bisect_Rel(S::BnBSolver,B::BnBModel,N::Vector{Interval{Float64}})
  i::Int64 = indmax(diam.(N)./diam.(B.Init_Box))
  N1::Interval{Float64},N2::Interval{Float64} = bisect(N[i])
  X1::Vector{Interval{Float64}} = deepcopy(N)
  X2::Vector{Interval{Float64}} = deepcopy(N)
  X1[i] = N1
  X2[i] = N2
  return X1,X2
end

"""
    Bisect_Abs_Imp(S::BnBSolver,B::BnBModel,N::Vector{Interval{Float64}})

Returns two interval boxes 'X1,X2' created by bisecting 'N' in the highest width
dimension greater than 'nx'.
"""
function Bisect_Abs_Imp(S::BnBSolver,B::BnBModel,N::Vector{Interval{Float64}},nx::Int64)
  i::Int64 = indmax(diam.(N[(nx+1):end]))
  N1::Interval{Float64},N2::Interval{Float64} = bisect(N[nx+i])
  X1::Vector{Interval{Float64}} = deepcopy(N)
  X2::Vector{Interval{Float64}} = deepcopy(N)
  X1[i] = N1
  X2[i] = N2
  return X1,X2
end

"""
    Bisect_Rel_Imp(S::BnBSolver,B::BnBModel,N::Vector{Interval{Float64}})

Returns two interval boxes 'X1,X2' created by bisecting 'N' in the highest width
dimension greater than 'nx' after scaling by initial box size.
"""
function Bisect_Rel_Imp(S::BnBSolver,B::BnBModel,N::Vector{Interval{Float64}},nx::Int64)
  i::Int64 = indmax(diam.(N[(nx+1):end])./diam.(B.Init_Box[(nx+1):end]))
  N1::Interval{Float64},N2::Interval{Float64} = bisect(N[nx+i])
  X1::Vector{Interval{Float64}} = deepcopy(N)
  X2::Vector{Interval{Float64}} = deepcopy(N)
  X1[i] = N1
  X2[i] = N2
  return X1,X2
end
