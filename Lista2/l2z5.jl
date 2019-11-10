#Karolina Bąk
#l2z5.jl Lista 2 zadanie 5

function ppl(p0, r, n)
    if (n == 0)
        println(n,", ",p0)
        return p0
    end
    pn = ppl(p0, r, n-1)
    pn_1 = pn + r*pn*(1 - pn)
    println(n,", ",pn_1)
    return pn_1
end

function test32()
    ppl(Float32(0.01), Float32(3), 40)
end

function test64()
    ppl(Float64(0.01), Float64(3), 40)
end

function test3210()
    res = ppl(Float32(0.01), Float32(3), 10)
    res = ppl(Float32(trunc(res*1000)/1000), Float32(3), 10)
    res = ppl(Float32(trunc(res*1000)/1000), Float32(3), 10)
    res = ppl(Float32(trunc(res*1000)/1000), Float32(3), 10)
end
