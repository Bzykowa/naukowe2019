push!(LOAD_PATH, pwd())

using Interpolations

global xs = [-1.0, 0.0, 1.0, 2.0]
global fxs = [-1.0, 0.0, -1.0, 2.0]
vec(xs)
vec(fxs)

f_xs = ilorazyRoznicowe(xs, fxs)

w_x = naturalna(xs, f_xs)