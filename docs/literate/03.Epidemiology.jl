### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# ╔═╡ b164563c-0e54-11eb-0a14-21775ffefaf1
begin
	import Pkg
	Pkg.activate(mktempdir())
		
	# framework for applied and computational category theory
	Pkg.add("Catlab")
	using Catlab.GAT
	using Catlab.Theories
	using Catlab.Present	
	using Catlab.Programs	
	using Catlab.WiringDiagrams
	using Catlab.Graphics

	# create Tikz pictures
	Pkg.add("TikzPictures")
	import TikzPictures
	
	# disciplined convex programming
	Pkg.add("Convex") 
	import Convex
	
	# splitting cone solver
	Pkg.add("SCS")
	import SCS
end

# ╔═╡ f1652868-0e4f-11eb-09e5-7b23b575cb71
md"# Epidemiology"

# ╔═╡ ed5fd302-0ee6-11eb-018d-01d7c068d777
# Load images
begin
	struct Epidemiological_Cost_Model end
    struct Pandemic_Slide end
	struct City_Spread_Slide end
	struct SIR_Slide end
	struct Petri_Slide end
	struct Vectorfield_Slide end
	struct Solve_Slide end
	struct Present_Epidemiology_Slide end
	struct Decorated_Cospans_Slide end
	struct Dec_Cos_Comp_Slide end
	struct Dyn_Sys_Comp_Slide end
	struct Epi_Functors_Slide end
	struct Epi_Models_Slide end
	struct Superposition_Slide end
	struct FP_Slide end
	struct Graph_Models_Slide end
	struct Algebraic_Julia_Slide end
	struct CSet_Slide end
	struct CSet_Petri_Slide end
	struct Lego_Slide end
	struct SQL_Slide end
	struct Ecosystem_Slide end
	
	function Base.show(io::IO, ::MIME"image/svg+xml", x::Epidemiological_Cost_Model)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/epidemiology.svg")))
	end
	
	function Base.show(io::IO, ::MIME"image/png", x::Pandemic_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/pandemic.png")))
	end
	
	function Base.show(io::IO, ::MIME"image/png", x::City_Spread_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/city_spread.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::SIR_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/sir.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Petri_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/petri.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Vectorfield_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/vectorfield.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Solve_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/solve.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Present_Epidemiology_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/present_epidemiology.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Decorated_Cospans_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/decorated_cospans.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Dec_Cos_Comp_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/dec_cos_comp.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Dyn_Sys_Comp_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/dyn_sys_comp.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Epi_Functors_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/epi_functors.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Epi_Models_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/epi_models.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Superposition_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/superposition.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::FP_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/fp.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Graph_Models_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/graph_models.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Algebraic_Julia_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/algebraic_julia.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::CSet_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/cset.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::CSet_Petri_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/cset_petri.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Lego_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/lego.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::SQL_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/sql.png")))
	end

	function Base.show(io::IO, ::MIME"image/png", x::Ecosystem_Slide)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/ecosystem.png")))
	end

	nothing
end

# ╔═╡ 81c0fd9e-0ee9-11eb-3b8e-7d5131b38004
Epidemiological_Cost_Model()

# ╔═╡ 252b10ae-0f04-11eb-1873-9fa53e180517
md"!!! note

This section is entirely based on [JuliaCon 2020 | AlgebraicJulia: Applied Category Theory in Julia | James Fairbanks](https://youtu.be/7zr2qnud4XM) and [James Fairbanks: Compositional Scientific Computing with Catlab and SemanticModels](https://youtu.be/Q5BzzkNDpPE).  Please watch enjoy the original for a much better explanation.  This is an attempt to recreate their work as a rabbit hole tutorial on [Julia](https://julialang.org/), [Pluto.jl](https://github.com/fonsp/Pluto.jl), [AlgebraicJulia](https://github.com/AlgebraicJulia), [CatLab.jl](https://algebraicjulia.github.io/Catlab.jl/latest/), [AlgebraicPetri.jl](https://github.com/AlgebraicJulia/AlgebraicPetri.jl), [AlgebraicRelations.jl](https://github.com/AlgebraicJulia/AlgebraicRelations.jl), [SemanicModels.jl](https://github.com/jpfairbanks/SemanticModels.jl) and [SciML](https://github.com/SciML).
"

# ╔═╡ 6d6b1dea-0f05-11eb-1b79-9bbeccf02f20
md"## Modeling a Pandemic

"

# ╔═╡ c6ebd4bc-0ef4-11eb-2abf-0730612e5588
Pandemic_Slide()

# ╔═╡ a30cca48-0f05-11eb-2021-3740fe56a784
md"### Modeling the Spread Across Cities

"

# ╔═╡ cd58373a-0ef4-11eb-2351-752dca43c16b
City_Spread_Slide()

# ╔═╡ c46ac1d4-0f05-11eb-1fc8-ebcf6971e16d
md"### The SIR Theory
"

# ╔═╡ 770f908c-0ef7-11eb-284a-b91cd8b20af8
SIR_Slide()

# ╔═╡ db1bda1e-0f05-11eb-3701-c5682b75c21f
md"### Petri Nets
"

# ╔═╡ 7ccb446c-0ef7-11eb-16cc-b1bd31b8f9f9
Petri_Slide()

# ╔═╡ e717709e-0f05-11eb-2cd2-a3130764d2d1
md"### Vector Field
"

# ╔═╡ 9f9bfa40-0ef7-11eb-33dd-6bdbab8dfc4b
Vectorfield_Slide()

# ╔═╡ fd40e6de-0f05-11eb-0c02-274a25a641c2
md"### Differential Equation Solver

"

# ╔═╡ e65f9432-0ef7-11eb-3faa-d123d5ed8e78
Solve_Slide()

# ╔═╡ 1944fa3c-0f06-11eb-1a76-dd2e909e5257
md"### Presentation of an Epidemiology Model
"

# ╔═╡ 4ec0c172-0ef8-11eb-3d67-59e67b7fbe44
Present_Epidemiology_Slide()

# ╔═╡ 38b2d88a-0f06-11eb-3103-738b73dfc9dc
md"### Map From the Theory to Petri Nets via Decorated Cospans
"

# ╔═╡ b4ad4924-0ef8-11eb-0094-293fd92bd904
Decorated_Cospans_Slide()

# ╔═╡ 52197496-0f06-11eb-1b6a-3d1ab0c25990
md"### Composition of Petri Nets
"

# ╔═╡ 237b12fa-0ef9-11eb-0e22-fd9aef87a347
Dec_Cos_Comp_Slide()

# ╔═╡ 65519dd8-0f06-11eb-11b2-a5cc10393ca7
md"### Map to and Compose Dynamic Systems

"

# ╔═╡ 5c52dc02-0ef9-11eb-35c2-c755298f57e4
Dyn_Sys_Comp_Slide()

# ╔═╡ a497724a-0f06-11eb-0935-d54353226886
md"### Computational Epidemiology Functors
"

# ╔═╡ db4f2f68-0ef9-11eb-1163-6987ee6e0a52
Epi_Functors_Slide()

# ╔═╡ cfb565d6-0f06-11eb-3ea1-dbdafed5b538
md"### Extending the Model
"

# ╔═╡ 7f0cff74-0efa-11eb-29c0-fd783518ba5f
Epi_Models_Slide()

# ╔═╡ e9fcdc80-0f06-11eb-2a9e-45696b9454b1
md"### Simulating the Model
"

# ╔═╡ f4b71822-0efa-11eb-2e21-4d7a73d049ef
Superposition_Slide()

# ╔═╡ f5cf44c6-0f06-11eb-26fd-c5df0cda8c11
md"### Modeling Behavioral Semantics

Move up a layer of abstraction.  Work directly at the layer of meaning, not at the layer of a particular system of symbols.
"

# ╔═╡ 40727ebe-0efb-11eb-275c-f3ddfd6029ef
FP_Slide()

# ╔═╡ 383a685e-0f07-11eb-0aa8-ed07ec21fd1a
md"### Graphical Models
"

# ╔═╡ c1a4fa86-0efb-11eb-30a3-5fdbc23c3ad3
Graph_Models_Slide()

# ╔═╡ 45ccdb78-0f07-11eb-3e8b-4184ef82fcef
md"### Connecting the Models via AlgebraicJulia

"

# ╔═╡ fd187276-0efb-11eb-0184-0750af04172a
Algebraic_Julia_Slide()

# ╔═╡ 62bfc510-0f07-11eb-1096-bde8faa47d16
md"### Reuse: Extending Theories

"

# ╔═╡ 690cdaa8-0efc-11eb-37a5-7f711d537435
CSet_Slide()

# ╔═╡ 8ac304e8-0f07-11eb-39af-fb9267fb1084
md"### CSet Petri Nets

"

# ╔═╡ ab9a65aa-0efc-11eb-2493-e91d8acbde81
CSet_Petri_Slide()

# ╔═╡ a9d94af2-0f07-11eb-02af-13dc34cad813
md"### Automatic Model Optimization
"

# ╔═╡ 1e8cc438-0efd-11eb-01f3-ab7634ad9bef
Lego_Slide()

# ╔═╡ bbeba046-0f07-11eb-034d-55275e2f9735
md"### Interop: Map to Relational Databases
"

# ╔═╡ 4655b308-0efd-11eb-1b02-c3a9d92f5572
SQL_Slide()

# ╔═╡ e89e66e6-0f07-11eb-378e-ff02ae562bea
md"### AlgebraicJulia Ecosystem"

# ╔═╡ c527f1fa-0efd-11eb-09ba-33706f3951db
Ecosystem_Slide()

# ╔═╡ Cell order:
# ╟─b164563c-0e54-11eb-0a14-21775ffefaf1
# ╟─f1652868-0e4f-11eb-09e5-7b23b575cb71
# ╟─ed5fd302-0ee6-11eb-018d-01d7c068d777
# ╠═81c0fd9e-0ee9-11eb-3b8e-7d5131b38004
# ╟─252b10ae-0f04-11eb-1873-9fa53e180517
# ╠═6d6b1dea-0f05-11eb-1b79-9bbeccf02f20
# ╠═c6ebd4bc-0ef4-11eb-2abf-0730612e5588
# ╠═a30cca48-0f05-11eb-2021-3740fe56a784
# ╠═cd58373a-0ef4-11eb-2351-752dca43c16b
# ╠═c46ac1d4-0f05-11eb-1fc8-ebcf6971e16d
# ╠═770f908c-0ef7-11eb-284a-b91cd8b20af8
# ╠═db1bda1e-0f05-11eb-3701-c5682b75c21f
# ╠═7ccb446c-0ef7-11eb-16cc-b1bd31b8f9f9
# ╠═e717709e-0f05-11eb-2cd2-a3130764d2d1
# ╠═9f9bfa40-0ef7-11eb-33dd-6bdbab8dfc4b
# ╠═fd40e6de-0f05-11eb-0c02-274a25a641c2
# ╠═e65f9432-0ef7-11eb-3faa-d123d5ed8e78
# ╠═1944fa3c-0f06-11eb-1a76-dd2e909e5257
# ╠═4ec0c172-0ef8-11eb-3d67-59e67b7fbe44
# ╠═38b2d88a-0f06-11eb-3103-738b73dfc9dc
# ╠═b4ad4924-0ef8-11eb-0094-293fd92bd904
# ╠═52197496-0f06-11eb-1b6a-3d1ab0c25990
# ╠═237b12fa-0ef9-11eb-0e22-fd9aef87a347
# ╠═65519dd8-0f06-11eb-11b2-a5cc10393ca7
# ╠═5c52dc02-0ef9-11eb-35c2-c755298f57e4
# ╠═a497724a-0f06-11eb-0935-d54353226886
# ╠═db4f2f68-0ef9-11eb-1163-6987ee6e0a52
# ╠═cfb565d6-0f06-11eb-3ea1-dbdafed5b538
# ╠═7f0cff74-0efa-11eb-29c0-fd783518ba5f
# ╠═e9fcdc80-0f06-11eb-2a9e-45696b9454b1
# ╠═f4b71822-0efa-11eb-2e21-4d7a73d049ef
# ╠═f5cf44c6-0f06-11eb-26fd-c5df0cda8c11
# ╠═40727ebe-0efb-11eb-275c-f3ddfd6029ef
# ╠═383a685e-0f07-11eb-0aa8-ed07ec21fd1a
# ╠═c1a4fa86-0efb-11eb-30a3-5fdbc23c3ad3
# ╠═45ccdb78-0f07-11eb-3e8b-4184ef82fcef
# ╠═fd187276-0efb-11eb-0184-0750af04172a
# ╠═62bfc510-0f07-11eb-1096-bde8faa47d16
# ╠═690cdaa8-0efc-11eb-37a5-7f711d537435
# ╠═8ac304e8-0f07-11eb-39af-fb9267fb1084
# ╠═ab9a65aa-0efc-11eb-2493-e91d8acbde81
# ╠═a9d94af2-0f07-11eb-02af-13dc34cad813
# ╠═1e8cc438-0efd-11eb-01f3-ab7634ad9bef
# ╠═bbeba046-0f07-11eb-034d-55275e2f9735
# ╠═4655b308-0efd-11eb-1b02-c3a9d92f5572
# ╠═e89e66e6-0f07-11eb-378e-ff02ae562bea
# ╠═c527f1fa-0efd-11eb-09ba-33706f3951db
