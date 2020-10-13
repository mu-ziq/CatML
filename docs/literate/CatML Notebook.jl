### A Pluto.jl notebook ###
# v0.12.3

using Markdown
using InteractiveUtils

# ╔═╡ 67e66e34-0d4a-11eb-3b5b-43f479616a85
begin
	import Pkg
	Pkg.activate(mktempdir())
		
	# framework for applied and computational category theory
	Pkg.add("Catlab")
	using Catlab.Theories
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

# ╔═╡ 9c76b242-0d44-11eb-17c5-f52a44933839
md"# Categorical Modeling Language

We define the simplest possible concept as that which distinguishes *some* **thing** from *no* **thing** -- an object alone in the void:

```math
\begin{aligned}
\bullet
\end{aligned}
```
"

# ╔═╡ 7d979b28-0d5a-11eb-347e-5def8d0a9e49
md"
This abstraction captures the concept of *existence* itself.  It is a visual depiction of the assertion: **I am**.
"

# ╔═╡ 1213556a-0d62-11eb-36c6-5f18d411284b
md"
We need a way to refer to this object and distinguish it from other objects.  **Identity** takes the form of a self-directed, labelled **arrow**.

```math
\begin{aligned}
A \rightarrow \bullet
\end{aligned}
```

The `identity` arrow (`id` for short) acts like a pointer that states *this thing right here has the identity `A`*.
"

# ╔═╡ d5bf0d02-0d72-11eb-33f0-4555107de3d3
md"
But an arrow is not a connection between an identity and an object.  Arrows only connect objects, so the `identity` of `A` is really a labelled *line* `A` between an object and itself (i.e., a loop).  This is denoted as:
"

# ╔═╡ b4461640-0d73-11eb-1863-036e510f726e
md"
Since an object is known only by its identity arrow, we can simply use the arrow itself to represent the object `A`:
"

# ╔═╡ fffa2d90-0d7a-11eb-3842-87b28939fa48
md"
## Discrete Categories
An object, depicted by its identity arrow, forms our first example of a **category**.  A category acts like a *bounded context* for us to consider a collection of objects and, more importantly, a collection of arrows.

This particular category is called *discrete* and, since it has only one object (arrow), it is denoted: **Disc(1)**.  This category captures the essence of what it means to be an *individual*.  It isolates the concept, giving it a context, and discards all other considerations.
"

# ╔═╡ fbf67c78-0d7a-11eb-1ff8-3b45b8a79ba4
md"
There could of course be more than one object:
"

# ╔═╡ 8aece31a-0d7c-11eb-3bdc-f7550f93e5d0
md"
This forms another category, **Disc(2)**, which captures the essence of what it means to be a **Pair** -- two *things* `(A,B)` considered together as *one* (the category `Disc(2)`).  As you might imagine, there are many such discrete categories representing arbitrary collections of distinct *things* (i.e., *n*-tuples).
"

# ╔═╡ c419ed96-0d7d-11eb-0557-0f86eb4e330b
md"
The essential ingredients of category theory are: **objects**, **arrows**, and **categories**, along with a few operations for combining arrows and a few rules that must be obeyed.  (A more formal description is given below.)
"

# ╔═╡ 93487310-0d7e-11eb-05ab-f7850463bbea
md"
## Patterns of Meaning

Our primary focus is on the **patterns** of objects, arrows, and contexts (categories), each of which has a name (often daunting and cryptic) and its own set of rules, conditions, and implications.  We've already seen the patterns (concepts) of *one* (an individual) and *two* (a pair).  Concepts are captured and encoded in this language of patterns.  They identify repeating conceptual arrangements in different contexts and help us to reason about situations and gain new insights.  It enables us to build a precise description with well-understood and formally verified semantics (meaning; iterpretation).
"

# ╔═╡ c6b1fec4-0d7e-11eb-3826-e9ec738ce76f
md"
### Relatedness

So far we've only discussed *discrete* categories (i.e., those with only objects and identity arrows).  We suggested earlier that arrows connect objects.  We've only seen `identity` arrows that connect the same object, but if we take `Disc(2)` and add an arrow (making the new category *non*-discrete) between `A` and `B`, let's call it `f`, we can capture the concept of an **Arrow** itself, as denoted:
"

# ╔═╡ fe1f75dc-0d81-11eb-3e02-21c1491aaab2
md"
and depicted as:
"

# ╔═╡ 22824e54-0d82-11eb-1d49-f336c622bcb8
md"
This pattern captures the essence of a *from/to* relationship between two objects `(A,B)`.  It indicates that `A` is *related* to `B` in some way (`f`).  The objects could be represent anything: *From* and *To*, *Source* and *Target*, or two other concepts, *Remus* and *Romulus*, while the arrow might indicate mathematical relations (e.g., $<$, $\times 2$), spatial relations (e.g., *atop*, *within*), familial relations (e.g., *hasBrother*, *hasAunt*), etc.
"

# ╔═╡ 3024a2fe-0d85-11eb-2760-5f5a61a71749
md"
### Composition

One of the important rules of arrows within a category is that they must compose together (i.e., form chains of to/from).
"

# ╔═╡ 69abdf64-0d4d-11eb-3b43-b913298a6ea2
md"
### Symmetric monoidal category
"

# ╔═╡ 8880d62e-0d66-11eb-3922-3d36340ea699
begin
	A, B, C, D = Ob(FreeSymmetricMonoidalCategory, :A, :B, :C, :D)
	f, g = Hom(:f, A, B), Hom(:g, B, A);
end


# ╔═╡ 68e9e972-0d6b-11eb-01da-0bfd617f6f08
id(A)

# ╔═╡ 225d2d80-0d6f-11eb-1502-cf6a2e91b15a
to_tikz(id(A), labels=true)

# ╔═╡ 110bd404-0d7a-11eb-3f5e-4fb5d38e85c8
to_tikz(id(A)⊗id(B), labels=true)

# ╔═╡ faf7406a-0d81-11eb-12da-055b37c8b827
f

# ╔═╡ 4609a876-0d81-11eb-1fdb-a737c40fdeeb
to_tikz(f, labels=true)

# ╔═╡ 806c8226-0d66-11eb-1251-5f5e9cc7d3d3
to_composejl(f)

# ╔═╡ 9261dab2-0d66-11eb-331f-71ece3dacfed
to_composejl(f⋅g)

# ╔═╡ 8395f4ba-0d6f-11eb-0413-c501c42f95c3
to_composejl(f⋅g, default_box_shape=:circle)

# ╔═╡ 94622a7e-0d66-11eb-25b2-eb9248e4a960
to_composejl(f⊗g)

# ╔═╡ Cell order:
# ╟─67e66e34-0d4a-11eb-3b5b-43f479616a85
# ╟─9c76b242-0d44-11eb-17c5-f52a44933839
# ╟─7d979b28-0d5a-11eb-347e-5def8d0a9e49
# ╟─1213556a-0d62-11eb-36c6-5f18d411284b
# ╟─d5bf0d02-0d72-11eb-33f0-4555107de3d3
# ╟─68e9e972-0d6b-11eb-01da-0bfd617f6f08
# ╟─b4461640-0d73-11eb-1863-036e510f726e
# ╟─225d2d80-0d6f-11eb-1502-cf6a2e91b15a
# ╟─fffa2d90-0d7a-11eb-3842-87b28939fa48
# ╟─fbf67c78-0d7a-11eb-1ff8-3b45b8a79ba4
# ╟─110bd404-0d7a-11eb-3f5e-4fb5d38e85c8
# ╟─8aece31a-0d7c-11eb-3bdc-f7550f93e5d0
# ╟─c419ed96-0d7d-11eb-0557-0f86eb4e330b
# ╟─93487310-0d7e-11eb-05ab-f7850463bbea
# ╟─c6b1fec4-0d7e-11eb-3826-e9ec738ce76f
# ╟─faf7406a-0d81-11eb-12da-055b37c8b827
# ╟─fe1f75dc-0d81-11eb-3e02-21c1491aaab2
# ╟─4609a876-0d81-11eb-1fdb-a737c40fdeeb
# ╟─22824e54-0d82-11eb-1d49-f336c622bcb8
# ╟─3024a2fe-0d85-11eb-2760-5f5a61a71749
# ╟─69abdf64-0d4d-11eb-3b43-b913298a6ea2
# ╠═8880d62e-0d66-11eb-3922-3d36340ea699
# ╠═806c8226-0d66-11eb-1251-5f5e9cc7d3d3
# ╠═9261dab2-0d66-11eb-331f-71ece3dacfed
# ╠═8395f4ba-0d6f-11eb-0413-c501c42f95c3
# ╠═94622a7e-0d66-11eb-25b2-eb9248e4a960
