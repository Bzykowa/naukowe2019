#Karolina Bąk
#l2z4.jl Lista 2 zadanie 4
using Polynomials

function test_a()
    #współczynniki wielomianu p
    pa=[1, -210.0, 20615.0,-1256850.0,
          53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
          11310276995381.0, -135585182899530.0,
          1307535010540395.0,     -10142299865511450.0,
          63030812099294896.0,     -311333643161390640.0,
          1206647803780373360.0,     -3599979517947607200.0,
          8037811822645051776.0,      -12870931245150988800.0,
          13803759753640704000.0,      -8752948036761600000.0,
          2432902008176640000.0]
    #funkcje liczące z pakietu Polynomials liczą od ostatnich współczynników
    reverse!(pa)
    #wielomian naturalny
    Px = Poly(pa)
    #pierwiastki P(x)
    z = roots(Px)
    #generowanie dokładniejszego P(x) na podstawie dokładnych pierwiastków
    p_rts = [i for i in 1:20]
    px = poly(p_rts)
    for k in 1:20
        println(abs(polyval(Px,z[k])),", ",abs(polyval(px,z[k])),", ",abs(z[k]-k))
    end
end

function test_b()
    #współczynniki wielomianu p
    pa=[1, -210.0-2^-23, 20615.0,-1256850.0,
          53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,
          11310276995381.0, -135585182899530.0,
          1307535010540395.0,     -10142299865511450.0,
          63030812099294896.0,     -311333643161390640.0,
          1206647803780373360.0,     -3599979517947607200.0,
          8037811822645051776.0,      -12870931245150988800.0,
          13803759753640704000.0,      -8752948036761600000.0,
          2432902008176640000.0]
    #funkcje liczące z pakietu Polynomials liczą od ostatnich współczynników
    reverse!(pa)
    #wielomian naturalny
    Px = Poly(pa)
    #pierwiastki P(x)
    z = roots(Px)
    #generowanie dokładniejszego P(x) na podstawie dokładnych pierwiastków
    p_rts = [i for i in 1:20]
    px = poly(p_rts)
    for k in 1:20
        println(abs(polyval(Px,z[k])),", ",abs(polyval(px,z[k])),", ",abs(z[k]-k))
    end
end
