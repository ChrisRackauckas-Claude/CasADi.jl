using CasADi, Test

struct GenericCasadiWrapper <: CasadiSymbolicObject
    x
end

@testset "CasadiSymbolicObject interface" begin
    x = GenericCasadiWrapper(casadi.SX(2.0))
    y = GenericCasadiWrapper(casadi.SX(3.0))
    matrix = GenericCasadiWrapper(casadi.SX([[1.0, 2.0], [3.0, 4.0]]))

    @test !(x isa Number)
    @test to_julia(x + y) == 5.0
    @test to_julia(2 - x) == 0.0
    @test to_julia(x * y) == 6.0
    @test Bool(to_julia(x < y))
    @test size(matrix) == (2, 2)
    @test to_julia(matrix[2, 1]) == 3.0
    @test to_julia(sum(matrix)) == 10.0
end
