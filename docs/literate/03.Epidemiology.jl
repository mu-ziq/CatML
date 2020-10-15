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
	struct A end
	# struct B end
	
	function Base.show(io::IO, ::MIME"image/svg+xml", x::A)
		write(io, read(download("https://raw.githubusercontent.com/mu-ziq/CatML.jl/wip/docs/gh-deploy/dist/images/epidemiology.svg")))
	end
	# function Base.show(io::IO, ::MIME"image/jpg", x::B)
	# 	write(io, read(download("https://fonsp.com/img/doggoSmall.jpg?raw=true")))
	# end
	nothing
end

# ╔═╡ 81c0fd9e-0ee9-11eb-3b8e-7d5131b38004
A()

# ╔═╡ 12518ee2-0eec-11eb-1472-498f5418ad90


# ╔═╡ Cell order:
# ╟─b164563c-0e54-11eb-0a14-21775ffefaf1
# ╟─f1652868-0e4f-11eb-09e5-7b23b575cb71
# ╟─ed5fd302-0ee6-11eb-018d-01d7c068d777
# ╠═81c0fd9e-0ee9-11eb-3b8e-7d5131b38004
# ╠═12518ee2-0eec-11eb-1472-498f5418ad90
