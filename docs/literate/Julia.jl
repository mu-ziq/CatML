### A Pluto.jl notebook ###
# v0.12.4

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    quote
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : missing
        el
    end
end

# ╔═╡ 42511832-0f1c-11eb-29a5-650ee31f8715
begin
	import Pkg
	Pkg.activate(mktempdir())
	Pkg.add([
			"GraphPlot",
			"LightGraphs", 
			"PlutoUI"])
	using LightGraphs
	import GraphPlot
	using PlutoUI

	using LinearAlgebra	
	
	Pkg.add(["Images", "ImageIO", "ImageMagick"])
	using Images

end

# ╔═╡ cd1b2cfc-0ee3-11eb-377e-7581ddc2366a
md"# Julia
[Project page](https://julialang.org/)
"

# ╔═╡ f8dcbf7e-0f1f-11eb-35d7-3de0d58d9187
md"## Variables
We can define a variable using `=` (assignment). Then we can use its value in other expressions:
"

# ╔═╡ 3e8e0ea0-edeb-11ea-22e0-c58f7c2168ce
x = 3


# ╔═╡ 59b66862-edeb-11ea-2d62-71dcc79dbfab
y = 2x

# ╔═╡ 5e062a24-edeb-11ea-256a-d938f77d7815
md"By default Julia displays the output of the last operation. (You can suppress the output by adding `;` (a semicolon) at the end.)
"

# ╔═╡ 7e46f0e8-edeb-11ea-1092-4b5e8acd9ee0
md"We can ask what type a variable has using `typeof`:"

# ╔═╡ 8a695b86-edeb-11ea-08cc-17263bec09df
typeof(y)

# ╔═╡ 8e2dd3be-edeb-11ea-0703-354fb31c12f5
md"## Functions"

# ╔═╡ 96b5a28c-edeb-11ea-11c0-597615962f54
md"We can use a short-form, one-line function definition for simple functions:"

# ╔═╡ a7453572-edeb-11ea-1e27-9f710fd856a6
f(x) = 2 + x

# ╔═╡ b341db4e-edeb-11ea-078b-b71ac00089d7
md"Typing the function's name gives information about the function. To call it we must use parentheses:"

# ╔═╡ 23f9afd4-eded-11ea-202a-9f0f1f91e5ad
f

# ╔═╡ cc1f6872-edeb-11ea-33e9-6976fd9b107a
f(10)

# ╔═╡ ce9667c2-edeb-11ea-2665-d789032abd11
md"For longer functions we use the following syntax with the `function` keyword and `end`:"

# ╔═╡ d73d3400-edeb-11ea-2dea-95e8c4a6563b
function g(x, y)
	z = x + y
	return z^2
end

# ╔═╡ e04ccf10-edeb-11ea-36d1-d11969e4b2f2
g(1, 2)

# ╔═╡ e297c5cc-edeb-11ea-3bdd-090f415685ab
md"## For loops"

# ╔═╡ ec751446-edeb-11ea-31ba-2372e7c71b42
md"Use `for` to loop through a pre-determined set of values:"

# ╔═╡ fe3fa290-edeb-11ea-121e-7114e5c573c1
let s = 0
	
	for i in 1:10
		s += i    # Equivalent to s = s + i
	end
	
	s
end

# ╔═╡ 394b0ec8-eded-11ea-31fb-27392068ef8f
md"Here, `1:10` is a **range** representing the numbers from 1 to 10:"

# ╔═╡ 4dc00908-eded-11ea-25c5-0f7b2b7e18f9
typeof(1:10)

# ╔═╡ 6c44abb4-edec-11ea-16bd-557800b5f9d2
md"Above we used a `let` block to define a new local variable `s`. 
But blocks of code like this are usually better inside functions, so that they can be reused. For example, we could rewrite the above as follows:
"

# ╔═╡ 683af3e2-eded-11ea-25a5-0d90bf099d98
function mysum(n)
	s = 0
	
	for i in 1:n
		s += i    
	end
	
	return s
end

# ╔═╡ 76764ea2-eded-11ea-1aa6-296f3421de1c
mysum(100)

# ╔═╡ 93a231f4-edec-11ea-3b39-299b3be2da78
md"## Conditionals: `if`"

# ╔═╡ 82e63a24-eded-11ea-3887-15d6bfabea4b
md"We can evaluate whether a condition is true or not by simply writing the condition:"

# ╔═╡ 9b339b2a-eded-11ea-10d7-8fc9a907c892
a = 3

# ╔═╡ 9535eb40-eded-11ea-1651-e33c9c23dbfb
a < 5

# ╔═╡ a16299a2-eded-11ea-2b56-93eb7a1010a7
md"We see that conditions have a Boolean (`true` or `false`) value. 
We can then use `if` to control what we do based on that value:"

# ╔═╡ bc6b124e-eded-11ea-0290-b3760cb81024
if a < 5
	"small"
	
else
	"big"
	
end

# ╔═╡ cfb21014-eded-11ea-1261-3bc30952a88e
md"""Note that the `if` also returns the last value that was evaluated, in this case the string `"small"` or `"big"`, Since Pluto is reactive, changing the definition of `a` above will automatically cause this to be reevaluated!"""

# ╔═╡ ffee7d80-eded-11ea-26b1-1331df204c67
md"## Arrays"

# ╔═╡ cae4137e-edee-11ea-14af-59a32227de1b
md"### 1D arrays (`Vector`s)"

# ╔═╡ 714f4fca-edee-11ea-3410-c9ab8825d836
md"We can make a `Vector` (1-dimensional, or 1D array) using square brackets:"

# ╔═╡ 82cc2a0e-edee-11ea-11b7-fbaa5ad7b556
v = [1, 2, 3]

# ╔═╡ 85916c18-edee-11ea-0738-5f5d78875b86
typeof(v)

# ╔═╡ 881b7d0c-edee-11ea-0b4a-4bd7d5be2c77
md"The `1` in the type shows that this is a 1D array.
We access elements also using square brackets:"

# ╔═╡ a298e8ae-edee-11ea-3613-0dd4bae70c26
v[2]

# ╔═╡ a5ebddd6-edee-11ea-2234-55453ea59c5a
v[2] = 10

# ╔═╡ a9b48e54-edee-11ea-1333-a96181de0185
md"Note that Pluto does not automatically update cells when you modify elements of an array, but the value does change."

# ╔═╡ 68c4ead2-edef-11ea-124a-03c2d7dd6a1b
md"A nice way to create `Vector`s following a certain pattern is to use an **array comprehension**:"

# ╔═╡ 84129294-edef-11ea-0c77-ffa2b9592a26
v2 = [i^2 for i in 1:10]

# ╔═╡ d364fa16-edee-11ea-2050-0f6cb70e1bcf
md"## 2D arrays (matrices)"

# ╔═╡ db99ae9a-edee-11ea-393e-9de420a545a1
md"We can make small matrices (2D arrays) with square brackets too:"

# ╔═╡ 04f175f2-edef-11ea-0882-712548ebb7a3
M = [1 2
	 3 4]

# ╔═╡ 0a8ac112-edef-11ea-1e99-cf7c7808c4f5
typeof(M)

# ╔═╡ 1295f48a-edef-11ea-22a5-61e8a2e1d005
md"The `2` in the type confirms that this is a 2D array."

# ╔═╡ 3e1fdaa8-edef-11ea-2f03-eb41b2b9ea0f
md"This won't work for larger matrices, though. For that we can use e.g."

# ╔═╡ 48f3deca-edef-11ea-2c18-e7419c9030a0
zeros(5, 5)

# ╔═╡ a8f26af8-edef-11ea-2fc7-2b776f515aea
md"Note that `zeros` gives `Float64`s by default. We can also specify a type for the elements:"

# ╔═╡ b595373e-edef-11ea-03e2-6599ef14af20
zeros(Int, 4, 5)

# ╔═╡ 4cb33c04-edef-11ea-2b35-1139c246c331
md"We can then fill in the values we want by manipulating the elements, e.g. with a `for` loop."

# ╔═╡ 54e47e9e-edef-11ea-2d75-b5f550902528
md"A nice alternative syntax to create matrices following a certain pattern is an array comprehension with a *double* `for` loop:"

# ╔═╡ 6348edce-edef-11ea-1ab4-019514eb414f
[i + j for i in 1:5, j in 1:6]

# ╔═╡ 34d1fb4c-0f01-11eb-0c08-8dd2e1b7c5b4
md"## Julia Tutorials

[Official YouTube Playlist](https://www.youtube.com/playlist?list=PLP8iPy9hna6SCcFv3FvY_qjAmtTsNYHQE)
"

# ╔═╡ be7ff340-0f00-11eb-0b0b-7b3605fde940
md"## Computational Thinking | MIT 18.S191 Fall 2020

[YouTube Lectures Playlist](https://www.youtube.com/playlist?list=PLP8iPy9hna6Q2Kr16aWPOKE0dz9OnsnIJ)
"

# ╔═╡ fd5692b8-0f2d-11eb-2f22-9b212b53857f
md"### Week 1
[Lecture notebooks](https://github.com/mitmath/18S191/tree/master/lecture_notebooks/week1)"

# ╔═╡ 328ee246-0f2e-11eb-0414-7bf33f2bc45e
html"<button onclick=present()>Present</button>"

# ╔═╡ 3dbce6ca-0f2e-11eb-1243-e93dadbf8456
br = HTML("<br>")

# ╔═╡ 6b01751c-0f2e-11eb-3b3a-577483b3c077
md"""## Data takes many forms
- Time series: 
  - Number of infections per day
  - Stock price each minute
  - A piece for violin broadcast over the radio
$(HTML("<br>"))
- Video:
  - The view from a window of a self-driving car
  - A hurricane monitoring station
$(HTML("<br>"))
- Images:
  - Diseased versus healthy tissue in a scan
  - Deep space via the Hubble telescope
  - Can your social media account recognise your friends?
"""

# ╔═╡ 87483b0c-0f2e-11eb-3821-5f79f1667df9
md"![](https://i.stack.imgur.com/QQL8X.jpg)"

# ╔═╡ 9e5474a0-0f2e-11eb-2f9d-91a46d94f462
begin
	image_text = 
	md"""
	## What *is* an image, though?
	- A grid of coloured squares called **pixels**
	
	- A colour for each pair $(i, j)$ of indices
	
	- A **discretization**
	"""
	
	image_text
end

# ╔═╡ e47f3ea6-0f2e-11eb-2ba2-591a26a4bdf6
url = "https://i.imgur.com/VGPeJ6s.jpg"  

# ╔═╡ ec22e810-0f2e-11eb-3aca-6bb553db9251
philip_file = download(url, "philip.jpg")  # download to a local file

# ╔═╡ f233e754-0f2e-11eb-19c1-69403dd0f350
philip = load(philip_file)

# ╔═╡ f9de0a20-0f2e-11eb-0ce2-67ff98a32b56
typeof(philip)

# ╔═╡ fe06f6f2-0f2e-11eb-2a96-6f45cfbfaf69
RGBX(0.9, 0.1, 0.1)

# ╔═╡ 88fdbfb6-0f2f-11eb-0757-27c461dfdf1c
size(philip)

# ╔═╡ 977a0748-0f2f-11eb-2085-3f1cb6fd5c11
philip[1:1000, 1:400]

# ╔═╡ 0b2f0760-0f1c-11eb-0b09-af2b2d413d45
md"### Week 5
[Lecture notebooks](https://github.com/mitmath/18S191/tree/master/lecture_notebooks/week5)"

# ╔═╡ a923da0a-0f2f-11eb-1621-c75bed2f20bb
begin 
	(h, w) = size(philip)
	head = philip[(h ÷ 2):h, (w ÷ 10): (9w ÷ 10)]
	# `÷` is typed as \div <TAB>  -- integer division
end

# ╔═╡ b22370de-0f2f-11eb-3c97-b96afd4a4ae5
size(head)

# ╔═╡ b9ead0c8-0f2f-11eb-143f-cdeff26cb259
[head head]

# ╔═╡ c16d4e52-0f2f-11eb-38ea-bbf5ede155fe
[
 head                   reverse(head, dims=2)
 reverse(head, dims=1)  reverse(reverse(head, dims=1), dims=2)
]

# ╔═╡ d48d36a0-0f2f-11eb-1a96-479132494bc0
new_phil = copy(head)

# ╔═╡ df4cf4ea-0f2f-11eb-308c-0d3199174ddd
red = RGB(1, 0, 0)

# ╔═╡ e6f39df2-0f2f-11eb-1acd-1d2ada981e24
for i in 1:100
	for j in 1:300
		new_phil[i, j] = red
	end
end

# ╔═╡ f55b0a38-0f2f-11eb-3af1-4757608b3f99
new_phil

# ╔═╡ 07493792-0f30-11eb-2daa-6552a1ec9e72
begin 
	new_phil2 = copy(new_phil)
	new_phil2[100:200, 1:100] .= RGB(0, 1, 0)
	new_phil2
end

# ╔═╡ 2fd9797e-0f1c-11eb-35bb-f54828fd8228
md"#### Graphs are matrices"

# ╔═╡ ba97add8-0f21-11eb-3060-5ff4df356c87
md"Graphs from [SpecialGraphs.jl](https://github.com/JuliaGraphs/SpecialGraphs.jl/tree/master/src)"

# ╔═╡ f38bcb10-0f1c-11eb-031d-5742dd68e41a
@bind choice PlutoUI.Select(["cycle","wheel","complete","path"])

# ╔═╡ 39ef253e-0f1d-11eb-23b8-8bd2ca6d0d25
@bind n Slider(2:10, show_value=true)

# ╔═╡ 4f646b12-0f1e-11eb-2cef-6d023ed5973e
graph_function = Dict("cycle" => cycle_graph, "wheel" => wheel_graph, "complete" => complete_graph, "path" => path_graph)[choice]

# ╔═╡ db8ae78a-0f21-11eb-2fc1-2bea5e9a3500
graph = graph_function(n)

# ╔═╡ 6aaf03d8-0f1d-11eb-316c-b10a2f9a897d
let	
	nodelabel = 1:nv(graph)
	edgelabel = 1:ne(graph)
	GraphPlot.gplot(graph, nodelabel=nodelabel, edgelabel=edgelabel)
end

# ╔═╡ 8f97a1c8-0f1d-11eb-1d10-9517024a54d4
am = Matrix(adjacency_matrix(graph))

# ╔═╡ Cell order:
# ╟─42511832-0f1c-11eb-29a5-650ee31f8715
# ╟─cd1b2cfc-0ee3-11eb-377e-7581ddc2366a
# ╟─f8dcbf7e-0f1f-11eb-35d7-3de0d58d9187
# ╠═3e8e0ea0-edeb-11ea-22e0-c58f7c2168ce
# ╠═59b66862-edeb-11ea-2d62-71dcc79dbfab
# ╟─5e062a24-edeb-11ea-256a-d938f77d7815
# ╟─7e46f0e8-edeb-11ea-1092-4b5e8acd9ee0
# ╠═8a695b86-edeb-11ea-08cc-17263bec09df
# ╟─8e2dd3be-edeb-11ea-0703-354fb31c12f5
# ╟─96b5a28c-edeb-11ea-11c0-597615962f54
# ╠═a7453572-edeb-11ea-1e27-9f710fd856a6
# ╟─b341db4e-edeb-11ea-078b-b71ac00089d7
# ╠═23f9afd4-eded-11ea-202a-9f0f1f91e5ad
# ╠═cc1f6872-edeb-11ea-33e9-6976fd9b107a
# ╟─ce9667c2-edeb-11ea-2665-d789032abd11
# ╠═d73d3400-edeb-11ea-2dea-95e8c4a6563b
# ╠═e04ccf10-edeb-11ea-36d1-d11969e4b2f2
# ╟─e297c5cc-edeb-11ea-3bdd-090f415685ab
# ╟─ec751446-edeb-11ea-31ba-2372e7c71b42
# ╠═fe3fa290-edeb-11ea-121e-7114e5c573c1
# ╟─394b0ec8-eded-11ea-31fb-27392068ef8f
# ╠═4dc00908-eded-11ea-25c5-0f7b2b7e18f9
# ╟─6c44abb4-edec-11ea-16bd-557800b5f9d2
# ╠═683af3e2-eded-11ea-25a5-0d90bf099d98
# ╠═76764ea2-eded-11ea-1aa6-296f3421de1c
# ╟─93a231f4-edec-11ea-3b39-299b3be2da78
# ╟─82e63a24-eded-11ea-3887-15d6bfabea4b
# ╠═9b339b2a-eded-11ea-10d7-8fc9a907c892
# ╠═9535eb40-eded-11ea-1651-e33c9c23dbfb
# ╟─a16299a2-eded-11ea-2b56-93eb7a1010a7
# ╠═bc6b124e-eded-11ea-0290-b3760cb81024
# ╟─cfb21014-eded-11ea-1261-3bc30952a88e
# ╟─ffee7d80-eded-11ea-26b1-1331df204c67
# ╟─cae4137e-edee-11ea-14af-59a32227de1b
# ╟─714f4fca-edee-11ea-3410-c9ab8825d836
# ╠═82cc2a0e-edee-11ea-11b7-fbaa5ad7b556
# ╠═85916c18-edee-11ea-0738-5f5d78875b86
# ╟─881b7d0c-edee-11ea-0b4a-4bd7d5be2c77
# ╠═a298e8ae-edee-11ea-3613-0dd4bae70c26
# ╠═a5ebddd6-edee-11ea-2234-55453ea59c5a
# ╟─a9b48e54-edee-11ea-1333-a96181de0185
# ╟─68c4ead2-edef-11ea-124a-03c2d7dd6a1b
# ╠═84129294-edef-11ea-0c77-ffa2b9592a26
# ╟─d364fa16-edee-11ea-2050-0f6cb70e1bcf
# ╟─db99ae9a-edee-11ea-393e-9de420a545a1
# ╠═04f175f2-edef-11ea-0882-712548ebb7a3
# ╠═0a8ac112-edef-11ea-1e99-cf7c7808c4f5
# ╟─1295f48a-edef-11ea-22a5-61e8a2e1d005
# ╟─3e1fdaa8-edef-11ea-2f03-eb41b2b9ea0f
# ╠═48f3deca-edef-11ea-2c18-e7419c9030a0
# ╟─a8f26af8-edef-11ea-2fc7-2b776f515aea
# ╠═b595373e-edef-11ea-03e2-6599ef14af20
# ╟─4cb33c04-edef-11ea-2b35-1139c246c331
# ╟─54e47e9e-edef-11ea-2d75-b5f550902528
# ╠═6348edce-edef-11ea-1ab4-019514eb414f
# ╟─34d1fb4c-0f01-11eb-0c08-8dd2e1b7c5b4
# ╟─be7ff340-0f00-11eb-0b0b-7b3605fde940
# ╟─fd5692b8-0f2d-11eb-2f22-9b212b53857f
# ╟─328ee246-0f2e-11eb-0414-7bf33f2bc45e
# ╟─3dbce6ca-0f2e-11eb-1243-e93dadbf8456
# ╟─6b01751c-0f2e-11eb-3b3a-577483b3c077
# ╠═87483b0c-0f2e-11eb-3821-5f79f1667df9
# ╟─9e5474a0-0f2e-11eb-2f9d-91a46d94f462
# ╠═e47f3ea6-0f2e-11eb-2ba2-591a26a4bdf6
# ╠═ec22e810-0f2e-11eb-3aca-6bb553db9251
# ╠═f233e754-0f2e-11eb-19c1-69403dd0f350
# ╠═f9de0a20-0f2e-11eb-0ce2-67ff98a32b56
# ╠═fe06f6f2-0f2e-11eb-2a96-6f45cfbfaf69
# ╠═88fdbfb6-0f2f-11eb-0757-27c461dfdf1c
# ╠═977a0748-0f2f-11eb-2085-3f1cb6fd5c11
# ╠═0b2f0760-0f1c-11eb-0b09-af2b2d413d45
# ╠═a923da0a-0f2f-11eb-1621-c75bed2f20bb
# ╠═b22370de-0f2f-11eb-3c97-b96afd4a4ae5
# ╠═b9ead0c8-0f2f-11eb-143f-cdeff26cb259
# ╠═c16d4e52-0f2f-11eb-38ea-bbf5ede155fe
# ╠═d48d36a0-0f2f-11eb-1a96-479132494bc0
# ╠═df4cf4ea-0f2f-11eb-308c-0d3199174ddd
# ╠═e6f39df2-0f2f-11eb-1acd-1d2ada981e24
# ╠═f55b0a38-0f2f-11eb-3af1-4757608b3f99
# ╠═07493792-0f30-11eb-2daa-6552a1ec9e72
# ╟─2fd9797e-0f1c-11eb-35bb-f54828fd8228
# ╟─ba97add8-0f21-11eb-3060-5ff4df356c87
# ╠═f38bcb10-0f1c-11eb-031d-5742dd68e41a
# ╠═39ef253e-0f1d-11eb-23b8-8bd2ca6d0d25
# ╟─4f646b12-0f1e-11eb-2cef-6d023ed5973e
# ╟─db8ae78a-0f21-11eb-2fc1-2bea5e9a3500
# ╠═6aaf03d8-0f1d-11eb-316c-b10a2f9a897d
# ╠═8f97a1c8-0f1d-11eb-1d10-9517024a54d4
