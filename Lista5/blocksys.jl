#Karolina Bąk
#Lista 5

module blocksys

    using DelimitedFiles
    using SparseArrays
    using LinearAlgebra

    export readA, readb, writeResults, generateb, gauss, solveGauss, gaussChoice, solveGaussChoice, lu, luChoice, solveLU, solveLUChoice
    export A, b

    global A    # matrix A, n = size of matrix, l = size of block submatrix
    global b    # right-sides vector b, n = size
    global x    # x_s to solve, later the result

    #read matrix A from file
    function readA(path::String)
        temp = readdlm(path)
        row_indices = Int[]
        col_indices = Int[]
        vals = Float64[]
        for i in 2:size(temp,1)
            push!(row_indices, temp[i,1])
            push!(col_indices, temp[i,2])
            push!(vals, temp[i,3])
        end
        a = sparse(row_indices,col_indices,vals)
        global A = (A = a, n = temp[1,1], l = temp[1,2])
    end

    #read vector b from file
    function readb(path::String)
        temp = readdlm(path)
        b_tmp = Float64[]
        for i in 2:length(temp)
            push!(b_tmp, temp[i])
        end
        global b = (b = b_tmp, n = Int(temp[1]))
        return b
    end

    #write result of Ax = b to a file
    #if b was generated write also relative error
    function writeResults(path::String, x::Vector{Float64}, n::Int64, gen::Bool)
        open(path, "w") do file
            if gen
                x_gen = ones(n)
                err = Float64(norm(x_gen - x)/norm(x))
                println(file, err)
            end
            for i in 1:n
                println(file, x[i])
            end
        end
    end

    #generate b for given A (function for testing solving Ax=b)
    function generateb(A::SparseMatrixCSC{Float64, Int64}, n::Int64, l::Int64)

        global b = Vector{Float64}(undef, n) 

        for i in 1:n
            b[i] = Float64(0.)
            
            for j in max(1, Int64(l*floor((i-1)/l))-1):min(n, Int64(l + l * floor((i - 1) / l)))
                b[i] += A[i,j]
            end

            next = i+l
            if next <= n
                b[i] += A[i, next]
            end
        end

        return b
    end

    #Gaussian elimination of given A matrix of specific for this task scheme
    #If lu is true then function makes LU decomposition
    function gauss(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64, lu::Bool)
        #Iterate through columns
        for k in 1:(n-1)
            #choose max index in range of eliminated elements
            #take account of second from the end column of block B
            eliminate = ((k % l) == (l - 1)) ? (k + (2l - (k % l))) : (k + (l - (k % l)))
            
            #Iterate through elements to eliminate
            for i in k+1:min(eliminate,n)
                #mult - current element / element on diagonal
                mult = A[i,k] / A[k,k]

                #if lu set here mult that was used
                A[i,k] = lu ? mult : Float64(0.)

                for j in k+1:min(k+l, n)
                    A[i,j] -= mult * A[k,j] 
                end

                if !lu
                    b[i] -= mult * b[k]
                end
            end
        end
        return (A = A, b = b)
    end

    #solve Ax = b using Gauss elimination
    function solveGauss(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
        gauss_res = gauss(A, b, n, l, false)
        _A = gauss_res.A
        dropzeros!(_A)
        _b = gauss_res.b

        #Solutions of equations
        global x = vec(zeros(n))

        #Iterate through rows
        for i in n:-1:1
            row_sum = Float64(0.)

            #iterate through colums
            for j in i+1:min(n, i+l)
                row_sum += _A[i,j] * x[j]
            end

            x[i] = (_b[i] - row_sum) / _A[i,i]
        end
        return x
    end

    #Gaussian elimination with partial choice of main element of given matrix of specific for this task scheme
    #If lu is true then function makes LU decomposition
    function gaussChoice(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64, lu::Bool)
        #permutation vector
        perm = vec(zeros(Int64, n))

        #initial state of perm
        for i in 1:n
            perm[i] = i
        end

        #iterate through columns
        for k in 1:n-1
            #choose max index in range of eliminated elements
            #take account of second from the end column of block B
            eliminate = ((k % l) == (l - 1)) ? (k + (2l - (k % l))) : (k + (l - (k % l)))
            
            #row with max element
            max_row = k

            #max element in column
            max_element = abs(A[k,k])

            for i in k:min(eliminate,n)
                if abs(A[perm[i],k]) > max_element
                    max_element = abs(A[perm[i],k])
                    max_row = i
                end
            end

            #swap k with max_row
            perm[k], perm[max_row] = perm[max_row], perm[k]

            #iteration through elements to eliminate
            for i in k+1:min(eliminate,n)
                mult = A[perm[i],k] / A[perm[k],k]

                A[perm[i],k] = lu ? mult : Float64(0.)

                #iterate through columns
                for j in k+1:min(k+2l, n)
                    A[perm[i], j] -= mult * A[perm[k],j]
                end

                if !lu
                    b[perm[i]] -= mult*b[perm[k]]
                end
            end
        end
        return (A = A, perm = perm, b = b)
    end

    #solve Ax = b using Gauss elimination with partial choice of main element
    function solveGaussChoice(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
        res = gaussChoice(A,b,n,l,false)

        _A = res.A
        dropzeros!(_A)
        _perm = res.perm
        _b = res.b

        #Solutions of equations
        global x = vec(zeros(n))

        #iterate through rows
        for i in n:-1:1
            row_sum = Float64(0.)

            #iterate through columns
            for j in i+1:min(i+2l+1,n)
                row_sum += _A[_perm[i],j] * x[j]
            end

            x[i] = (_b[_perm[i]]-row_sum) / _A[_perm[i], i]
        end
        return x
    end

    #call functions that make lu decomposition
    function lu(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
        return gauss(A, b, n, l, true)
    end

    function luChoice(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
        return gaussChoice(A, b, n, l, true)
    end

    #solve Ax = b where A = LU
    function solveLU(A::SparseMatrixCSC{Float64, Int64}, b::Vector{Float64}, n::Int64, l::Int64)
        #vector b after multiplying by saved mults
        mod_b = vec(zeros(n))

        #solve upper matrix
        for i in 1:n
            row_sum = Float64(0.)

            for j in max(1, Int64(l*floor((i-1)/l))-1):i-1
                row_sum += A[i,j] * mod_b[j]
            end

            mod_b[i] = b[i] - row_sum
        end

        global x = vec(zeros(n))

        #iterate through rows
        for i in n:-1:1
            row_sum = Float64(0.)

            #iterate through columns
            for j in i+1:min(n, i+1+l)
                row_sum += A[i,j] * x[j]
            end

            x[i] = (mod_b[i] - row_sum) / A[i,i]
        end
        return x
    end

    #solve Ax = b where A = LU and using Gauss elimination with partial choice
    function solveLUChoice(A::SparseMatrixCSC{Float64, Int64}, perm::Vector{Int64}, b::Vector{Float64}, n::Int64, l::Int64)
        #vector b after multiplying by saved mults
        mod_b = vec(zeros(n))

        #solve upper matrix
        for i in 1:n
            row_sum = Float64(0.)

            for j in max(1, Int64(l*floor((i-1)/l))-1):i-1
                row_sum += A[perm[i],j] * mod_b[j]
            end

            mod_b[i] = b[perm[i]] - row_sum
        end

        global x = vec(zeros(n))

        for i in n:-1:1
            row_sum = Float64(0.)

            for j in i+1:min(i+2l+1, n)
                row_sum += A[perm[i],j] * x[j]
            end

            x[i] = (mod_b[i] - row_sum) / A[perm[i], i]
        end
        return x
    end

end # module
