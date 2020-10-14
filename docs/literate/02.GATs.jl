### A Pluto.jl notebook ###
# v0.12.3

using Markdown
using InteractiveUtils

# ╔═╡ 855fc742-0e07-11eb-1172-d7e7a0c01d7e
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

# ╔═╡ eaf00702-0e07-11eb-2030-7dfa450e22ad
md"
# Generalized Algebraic Theories (GATs)

Much of this material is developed from the source [Catlab,.jl project](https://algebraicjulia.github.io/Catlab.jl/latest/) and people (e.g., [James Fairbanks: Compositional Scientific Computing with Catlab and SemanticModels](https://youtu.be/Q5BzzkNDpPE)).  They have developed a clean, accessible, and practical framework for the working computational category theorist.

Category theory is increasingly being recognized as the foundation for capturing, connecting, depicting, reasoning about, and operationalizing complex systems across many disciplines where rigor is required.  The Catlab.jl team has designed an elegant system that connects all the dots, covering:
- encoding a theory
- experimentation in the design space
- developing and employing domain-appropriate notation, expression, depiction, and visualization
- technologically neutral simulation and instance implementations

And this is what this notebook is about.
"

# ╔═╡ c0d2013e-0e0c-11eb-206b-eff9c574914c
md"## Model-Driven Scientific Software

What is the best way to develop software in technical fields, such as industrial, manufacturing, energy, chemical, pharma, health, aerospace, geo, government, finance, physics, and increasingly law, policy, contract, trade, logistics, supply chain, ...?

Systems developed in many of these domains must operate under the strictist of requirements, compliance, and governance due to the risks involved in their failure.  We turn to formal methods to give the greatest assurance under the widest conditions that the desired outcomes are achieved and the undesired outcomes are avoided.  We often want to min/max, find the global optimum, and, ultimately, **improve over time** through machine learning and subsystem development or extension.

A software framework aims to improve the iterative paths between conception, expression, manifestation, and verification.  Technical software development involves domain experts, data scientists, and researchers.  Development tools and processes must cater to the diverse needs of these experts while unifying them in their shared goal of delivering real-world systems.

The path between conception and expression, these fields often use domain-appropriate modeling tools, such as circuit diagrams, process flows, Feynman diagrams, formulae, etc.  These formal diagrams are really *graphical programming languages* that describe physical systems.  From these, we can construct *simulations* that allows us to answer questions and solve problems.  These are **digital twins** of physical systems (not just of physical assets, as the term commonly means today).

**Generalized algebraic theories** (GATs) provide a mathematical foundation for achieving this seemingly impossible task.  As we hope to show throughout these notebooks, not only is it possible, it's already happening.
"

# ╔═╡ 79b299d2-0e12-11eb-1f72-4958cad0ad03
md"### Three Layers of GAT-Based Modeling

The process of modeling in this style can be divided into three distinct parts:
- Theory: the encoding of the rules of the system into a *univeral algebra*
- Syntax: from the theory specification, a set of notations are derived for expressing situations within the theory
- Instance: directly connect with the computing implementation best-suited to simulate the situations according to the rules of the theory.

Catlab.jl, specifically, provides the following domain-specific languages (DSLs) implemented in [Julia]() for defining these three layers:

- `@theory`: the algebraic structure that defines possible expressions in a theory
- `@syntax`: an abstract syntax tree of valid expressions tied to the theory
- `@presentation`: a specific example of the theory
- `@instance`: a Julia implementation (types and functions) of the theory
- `@program`: express formulas using program notation

These will be elaborated on in the following sections.
"

# ╔═╡ 4e216c4a-0e16-11eb-0e55-ab5ef3f2f4a7
md" ### Example: Theory of the Category of Natural Numbers

**Categories are an abstraction of how mathematical functions work.**  When we express these concepts computationally, we use **type systems** based on categorical concepts (i.e., function abstraction, composition of functions).

Let us formally define what we mean when we say *Category*.  Specifically, what is our *theory* of the concept of a category.  We use the first DSL, `@theory`, to encode our definition:
"

# ╔═╡ 03bbcd0e-0e1a-11eb-0084-8f79dcf4a230
md"The ingredients of an algebraic theory are the along with the example theory of category:
1. **data** (e.g., `Ob` and `Hom`)
1. **operators** (e.g., `(→)` and `(⋅)`)
1. **operations** (e.g., `id` and `compose`) 
1. **laws** (e.g., associativity, unital)
"

# ╔═╡ b6cfecd2-0e1e-11eb-18e7-fffd6703a135
md"#### Lens: Type Theory
We can map a theory of types (i.e., a formal theory of computation) to the theory of a category, using the correspondence to the mathematical functions they abstract:

- types map to objects
- functions map to homomorphisms

These computational functions, like all **arrows**, take an input object (**domain**) and produce an output object (**codomain**).  Computational functions also **compose**, allowing us to build complex programs that obey the unital and associativity **laws**.  As a notational convenience, serveral **operators** are defined, making for a more concise and natural expression of their verbose counterparts.
"


# ╔═╡ 74650ba8-0e20-11eb-19ab-c7b04c6cb0a6
md"#### Lens: Proof Theory
In logical proof, where a **proposition** must be *judged* as **true/false**, we can interpret this categorically through a correspondence with **type theory** lens:

- propositions map to types (which map to objects in a category)
- proofs map to functions (or programs which map to homomorphisms in a category)

Proofs compose in the obvious way. 
"

# ╔═╡ 7801ad86-0e1e-11eb-384b-8bef68b96c86
md"#### Lens: Graph Theory

We can interpret a theory of graphs through the lens of a category by mapping:
- vertices map to objects
- paths (sequences of arrows) map to homomorphisms

Composition in this interpretation involves **concatenation** of paths and the unital and associativity **laws** apply.
"

# ╔═╡ 30a136ec-0e24-11eb-0b85-8140cf4821da
md"#### Instance: Category of Natural Numbers

Now that we've defined a `@theory` of what we mean by `Category`, we can make it *computational* by defining a Julia instance and linking it to the category.
"

# ╔═╡ bd3b1a46-0e24-11eb-2715-4362958601ed
begin
	struct FinOrd n:: Int end

	abstract type FinOrdMap end

	struct FinSetFunc <: FinOrdMap
		func::Function
		dom::Int
		codom::Int
	end
	
	(f::FinSetFunc)(x) = f.func(x)
	
	struct FinSetVec <: FinOrdMap
		func::Vector{Int}
		codom::Int
	end
	
	(f::FinSetVec)(x) = f.func[x]
end

# ╔═╡ 3238b504-0e27-11eb-3860-79ad48685799
md"We *instantiate* the theory of categories by defining three Julia types:
- `FinOrd`: is just the number, `n`
- `FinOrdFunc`: store the homomorphisms as Julia functions that will be called to apply the map of $Int \mapsto Int$.
- `FinOrdVec`: store the homomorphisms as explicit maps of $Int \mapsto Int$
"

# ╔═╡ 9698ec72-0e26-11eb-3cba-1d4c3e291fd9
@instance Category{FinOrd, FinOrdMap} begin
  dom(f::FinOrdMap) = FinOrd(f.dom)
  codom(f::FinOrdMap) = FinOrd(f.codom)
  
  id(A::FinOrd) = FinOrdFunc(identity, A, A)
  
  function compose(f::FinOrdMap, g::FinOrdMap)
    @assert codom(f) == dom(g)
    FinOrdFun(compose(f.func,g.func), dom(f), codom(g))
  end
end

# ╔═╡ 06550dbe-0e1a-11eb-0c47-113a4b2fcc20
@theory Category{Ob,Hom} begin
  @op begin
    (→) := Hom
    (⋅) := compose
  end

  Ob::TYPE
  Hom(dom::Ob, codom::Ob)::TYPE

  id(A::Ob)::(A → A)
  compose(f::(A → B), g::(B → C))::(A → C) ⊣ (A::Ob, B::Ob, C::Ob)

  (f ⋅ g) ⋅ h == f ⋅ (g ⋅ h) ⊣ (A::Ob, B::Ob, C::Ob, D::Ob,
                                f::(A → B), g::(B → C), h::(C → D))
  f ⋅ id(B) == f ⊣ (A::Ob, B::Ob, f::(A → B))
  id(A) ⋅ f == f ⊣ (A::Ob, B::Ob, f::(A → B))
end

# ╔═╡ db429174-0e2c-11eb-3884-57db68ea09f5
md"Here we bind the Julia instantiation of a Category (of natural numbers) to the theory of category by stating the objects as `FinOrd` and the homomorphisms as `FinOrdMap`, which is the abstract type for both the *intensional* function, `FinOrdFunc`, and the *extensional* map, `FinOrVec`.

We describe how to resolve the `dom` and `codom` by selecting the appropriate field from the data structure.

We describe how to generate the `id` and `compose` arrows, which includes a validation that the domain and codomain are properly aligned.
"

# ╔═╡ b6b8543c-0e2d-11eb-3081-0143323aa645
md"## Symmetric Monoidal Categories

In order to solve more interesting problems, we can use a more powerful theory.  The theory of symmetric monoidal categories models the operation of *tupling*.

An alternative to defining an `@instance` is to define a *presentation* of syntactic objects using the `@present` DSL.  Presentations define small categories by generators and relations and are useful in applications like knowledge representation.
"

# ╔═╡ d0e1434c-0e3b-11eb-0f94-abd5db4aea09
md"### Presentation
Here, we define an example *presentation*, `P`, of a special kind of category, `FreeSymmetricMonoidalCategory`, involving three objects (`Ob`) and 3 homomorphisms (`Hom`), including one with a special circle-x operator.  This presentation *generates* a category.
"

# ╔═╡ e0b4d83e-0e30-11eb-3fa6-c13871904aac
@present P(FreeSymmetricMonoidalCategory) begin
	X::Ob
	Y::Ob
	Z::Ob
	
	f::Hom(X,Y)
	g::Hom(Y,Z)
	h::Hom(Y⊗Z, X)
end

# ╔═╡ 75295d5e-0e3c-11eb-1e9a-339b0874a83a
md"### Signature
The *signature* of a theory is its data and operations without its axioms.  We define the signature of the theory of symmetric monoidal category as:
"

# ╔═╡ 6671f9e6-0e33-11eb-220f-87df581aaf75
@signature Category(Ob,Hom) => SymmetricMonoidalCategory(Ob,Hom) begin
	otimes(A::Ob, B::Ob)::Ob
	otimes(f::(A→B), g::(C→D))::((A⊗C)→(B⊗D)) ⊣ (A::Ob, B::Ob, C::Ob, D::Ob)
	@op (⊗) := otimes
	munit()::Ob
	braid(A::Ob, B::Ob)::((A⊗B)→(B⊗A))
	@op (σ) := braid
end

# ╔═╡ 08f57e00-0e3d-11eb-236a-9f097400dc8b
md"The objects of this category are `otimes` of objects, which is recursive.  This captures the concept of repeatedly *pairing* objects (aka *s-expressions*), producing a tree of pairs.

The homomorphisms are maps between these pair-tree objects: given a map, `f`, 

# ╔═╡ ed03f956-0e3c-11eb-1604-3bc02332281a
md"### Programs



# ╔═╡ 98f757d6-0e37-11eb-0a63-1b1669eaf09a
d = @program P (x::X,y::Y) begin
	a = f(x)
	b = g(y)
	z = h(a,b)
	return z
end

# ╔═╡ 130d5dfc-0e3f-11eb-022f-4b2149237db3
md"This program encodes the following expression in the theory:"

# ╔═╡ c055c41c-0e3e-11eb-254b-af7e1f15f176
to_hom_expr(FreeSymmetricMonoidalCategory, d)

# ╔═╡ 2e9508c0-0e3f-11eb-2c63-91d279285ea5
md"And also defines this *wiring diagram**:"

# ╔═╡ 73fd3d5a-0e38-11eb-054b-270be525a13f
function show_diagram(d::WiringDiagram)
  to_graphviz(d, orientation=LeftToRight, labels=true)
end

# ╔═╡ becbc10c-0e37-11eb-10be-a9df5b483bd3
show_diagram(d)

# ╔═╡ 572a8492-0e3f-11eb-14b8-a5b3a9605e05
md"#### Why is this important?

This category allows us to build up **parallel** and **sequential** operations that combine the inputs and outputs in a data flow pipeline.  This is an extremely common abstraction that appears in many different settings, including ETL pipelines, machine-learning pipelines, robotic process automation, process flows, activity sequence, etc.  With this pattern identified and formalized, we can now apply all the rules and receive guarantees they will keep the system consistent and coherent as it operates between the different levels of representation and operationalization.
"

# ╔═╡ Cell order:
# ╟─855fc742-0e07-11eb-1172-d7e7a0c01d7e
# ╟─eaf00702-0e07-11eb-2030-7dfa450e22ad
# ╟─c0d2013e-0e0c-11eb-206b-eff9c574914c
# ╟─79b299d2-0e12-11eb-1f72-4958cad0ad03
# ╟─4e216c4a-0e16-11eb-0e55-ab5ef3f2f4a7
# ╠═06550dbe-0e1a-11eb-0c47-113a4b2fcc20
# ╟─03bbcd0e-0e1a-11eb-0084-8f79dcf4a230
# ╟─b6cfecd2-0e1e-11eb-18e7-fffd6703a135
# ╟─74650ba8-0e20-11eb-19ab-c7b04c6cb0a6
# ╟─7801ad86-0e1e-11eb-384b-8bef68b96c86
# ╟─30a136ec-0e24-11eb-0b85-8140cf4821da
# ╠═bd3b1a46-0e24-11eb-2715-4362958601ed
# ╟─3238b504-0e27-11eb-3860-79ad48685799
# ╠═9698ec72-0e26-11eb-3cba-1d4c3e291fd9
# ╟─db429174-0e2c-11eb-3884-57db68ea09f5
# ╟─b6b8543c-0e2d-11eb-3081-0143323aa645
# ╟─d0e1434c-0e3b-11eb-0f94-abd5db4aea09
# ╠═e0b4d83e-0e30-11eb-3fa6-c13871904aac
# ╠═75295d5e-0e3c-11eb-1e9a-339b0874a83a
# ╠═6671f9e6-0e33-11eb-220f-87df581aaf75
# ╠═08f57e00-0e3d-11eb-236a-9f097400dc8b
# ╠═ed03f956-0e3c-11eb-1604-3bc02332281a
# ╠═98f757d6-0e37-11eb-0a63-1b1669eaf09a
# ╟─130d5dfc-0e3f-11eb-022f-4b2149237db3
# ╠═c055c41c-0e3e-11eb-254b-af7e1f15f176
# ╟─2e9508c0-0e3f-11eb-2c63-91d279285ea5
# ╠═becbc10c-0e37-11eb-10be-a9df5b483bd3
# ╟─73fd3d5a-0e38-11eb-054b-270be525a13f
# ╠═572a8492-0e3f-11eb-14b8-a5b3a9605e05
