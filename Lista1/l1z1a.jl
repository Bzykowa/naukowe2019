#Karolina Bąk
#l1z1a.jl - Lista 1 zadanie 1 część 1

#pętla, która iteracyjnie liczy macheps dla Float16 poprzez dzielenie 1 przez 2
i = Float16(1.)
iprev = Float16(2.)
while Float16(1.)+Float16(i)>Float16(1.)
    global iprev = i
    global i = Float16(i)/2
end
println("Float16 macheps pętla: ", iprev)
println("Float16 macheps Julia: ", eps(Float16))

#pętla, która iteracyjnie liczy macheps dla Float32 poprzez dzielenie 1 przez 2
i = Float32(1.)
iprev = Float32(2.)
while Float32(1.)+Float32(i)>Float32(1.)
    global iprev = i
    global i = Float32(i)/2
end
println("Float32 macheps pętla: ", iprev)
println("Float32 macheps Julia: ", eps(Float32))

#pętla, która iteracyjnie liczy macheps dla Float64 poprzez dzielenie 1 przez 2
i = Float64(1.)
iprev = Float64(2.)
while Float64(1.)+Float64(i)>Float64(1.)
    global iprev = i
    global i = Float64(i)/2
end
println("Float64 macheps pętla: ", iprev)
println("Float64 macheps Julia: ", eps(Float64))
