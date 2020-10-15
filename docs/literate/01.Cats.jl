### A Pluto.jl notebook ###
# v0.12.4

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
md"# Cats

We define the simplest possible concept: that which distinguishes *some* **thing** from *no* **thing** -- an object alone in the void:

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
This forms another category, **Disc(2)**, which captures the essence of what it means to be a **Pair** -- two *things* `(A,B)` considered together as *one* (the category `Disc(2)`).  As you might imagine, there are many such discrete categories representing arbitrary collections of distinct *things* (i.e., *n*-tuples), **Disc(n)**.
"

# ╔═╡ c419ed96-0d7d-11eb-0557-0f86eb4e330b
md"
The three fundamental building blocks of category theory, then, are: **objects**, **arrows**, and **categories**, along with a few operations for combining arrows and a few rules that must be obeyed, which we'll describe as we go.
"

# ╔═╡ 93487310-0d7e-11eb-05ab-f7850463bbea
md"
## Patterns of Meaning

Our primary focus is on the **patterns** of objects, arrows, and contexts (categories), each of which has a name (often daunting and cryptic) and its own set of rules, conditions, and implications.  We've already seen the patterns (concepts) of *one* (an individual) and *two* (a pair).  Concepts are captured and encoded in this language of patterns.  They identify repeating conceptual arrangements in different contexts and help us to reason about situations and gain new insights.  They enable us to build precise descriptions with well-understood and formally verifiable semantics (meaning; iterpretation).
"

# ╔═╡ c6b1fec4-0d7e-11eb-3826-e9ec738ce76f
md"
### Relatedness

So far we've only discussed *discrete* categories (i.e., those with only objects and identity arrows).  We suggested earlier that arrows connect objects.  We've only seen `identity` arrows that connect the same object, but if we take **Disc(2)** and add an arrow (making the new category *non*-discrete) between `A` and `B`, let's call it `f`, we can capture the concept of an **Arrow** itself, as denoted:
"

# ╔═╡ fe1f75dc-0d81-11eb-3e02-21c1491aaab2
md"
and depicted as a *string diagram*:
"

# ╔═╡ 22824e54-0d82-11eb-1d49-f336c622bcb8
md"
This pattern captures the essence of a *from/to* relationship between two objects `(A,B)`.  It indicates that `A` is *related* to `B` in some way (`f`).  The objects could represent anything: *From* and *To*, *Source* and *Target*, or two other concepts, *Remus* and *Romulus*, while the arrow might indicate mathematical relations (e.g., $<$, $\times 2$), spatial relations (e.g., *atop*, *within*), familial relations (e.g., *hasBrother*, *hasAunt*), etc.
"

# ╔═╡ 3024a2fe-0d85-11eb-2760-5f5a61a71749
md"
### Composition

One of the important rules of combining arrows within a category is that arrows must *compose*, that is, the from-side (known as the *domain*) of one arrow can be connected to the to-side (known as the *codomain*) of another, thus forming chains or paths of arrows.

The two arrows we've seen so far, `id` and `f`, can be composed in two possible ways: 
"

# ╔═╡ d2215e7c-0dad-11eb-1ba3-5972eec15d14
md"
These are known as the *left* and *right identity laws* or the *unital laws* essentially state that composing an arrow with identity doesn't change anything.  For example, going from `A` to `A` then `B` is the same as just going from `A` to `B`.  This is made clear when depicted as a string diagram, where the objects are lines, since the identity function *disappears*:
"

# ╔═╡ cbd2d080-0dac-11eb-2ab3-d7a7c9bafeff
md"
### Sameness
We can add a new arrow, `g`, from `B` to `A`:
"

# ╔═╡ cf293c50-0dab-11eb-15b3-2739447c8380
md"
and then compose `f` *then* `g`, denoted as:
"

# ╔═╡ 0c99c040-0dac-11eb-0d5e-a5bbfe061c6e
md"
which is depicted as:
"

# ╔═╡ 5a9130a8-0dac-11eb-1391-3b90eadb7b48
md"
And, since domain and codomain match, we can go in the other direction, too:
"

# ╔═╡ e7748916-0daf-11eb-12c2-e72fa4bf4d37
md"depicted as:"

# ╔═╡ ee7288ca-0db0-11eb-27b7-0f1e50ca74e3
md"We can define a new arrow that represent a composition of two arrows, whose domain matches the domain of the first arrow and codomain is the same as the second:

```math
\begin{align}
  f\cdot g &= h : A \to A \\
  g\cdot f &= i : B \to B
\end{align}
```

If both the following are true:

```math
\begin{align}
  h : A \to A = id_A \\
  i : B \to B = id_B
\end{align}
```

then this pattern captures what it means for two things to be *essentially the same*, called *isomorphism*, and we can make a category for this, called **Iso**.  We'll see why this is important in the next section.
"

# ╔═╡ a661901a-0db2-11eb-03bf-859ba6238c7b
md"### Relations Between Categories

So far, we have only considered objects and arrows within single categories (**Disc(n)**, **Arrow**, **Iso**), but the true power of category theory begins to appear when we consider relationships between different categories.

Instead of inventing new mechanisms to do this, we can use just the tools we've already established by thinking of categories themselves as objects with arrows between them, which have the special name *functor*.  This defines the category of categories (and functors), known as **Cat**.

A functor is no ordinary arrow.  It must map every object and arrow in the source (domain) category to objects and arrows in the target (codomain) category, preserving the various relations within each category.  (This will be made more clear below.)
"

# ╔═╡ 86dfc8e4-0dbd-11eb-15de-a34f4aaf40c9
md"
Let's define a new simple category, **Bool**, with two objects, `T` and `F`, and two arrows: `notT` and `notF`: 
"

# ╔═╡ 74f898be-0dbe-11eb-3d11-299fe20b39f9
md"
#### pickF

We can consider this category via each of the other categories we've defined, starting with **Disc(1)**.  In **Cat**, this is simply:

```math
  pickF : Disc(1) \to Bool
```

where the functor, `pickF`, consists of two maps, one for objects and one for arrows:

```math
\begin{align}
  objs &: {A\mapsto T} \\
  arrows &: {id_A\mapsto id_T}
\end{align}
```
"

# ╔═╡ d5857e68-0dbe-11eb-2751-1d22cf4e2dcb
md"
We have thus created a kind of *lens* into **Bool** from **Disc(1)**.  Since **Disc(1)** is the category that captures the essence of being an individual, it has the effect, when forming a functor to another category, of **picking** (isolating) one object (and arrow) for consideration.  In the case of **Bool**, there are two objects to choose between.  We picked `T`, but could also pick `F`:

```math
\begin{align}
  objs &: {A\mapsto F} \\
  arrows &: {id_A\mapsto id_F}
\end{align}
```
"

# ╔═╡ 8bd8893e-0dc0-11eb-3459-51928d4947a9
md"
When it comes to arrows, we need to map the only arrow in **Disc(1)**, $id_A$, to an arrow in **Bool**.  Our choices are: $id_T$, $id_F$, $notT$, and $notF$.  If we consider the two *not* arrows, they have different domains and codomains, while $id_A$ has the same domain and codomain (which makes it an *endomorphism*), so these are not compatible arrows.  If we pick the `T` object, then try to map $id_A$ to $id_F$, $id_F$ refers to an object that the functor doesn't even know about, `F`, so it is not a compatible choice.  This leaves $id_T$ as the only choice to map to.
"

# ╔═╡ ff9a6bf0-0dc1-11eb-3608-bdab9172a64a
md" #### pairF

Similarly, we could define a functor from **Disc(2)**, or **Pair**, to **Bool**:

```math
  pairF : Disc(2) \to Bool
```

where the functor, `pairF`, consists of two maps:

```math
\begin{align}
  objs &: {A\mapsto T, B\mapsto F} \\
  arrows &: {id_A\mapsto id_T, id_B\mapsto id_F}
\end{align}
```

Alternatively, we could map `A` to `F`...

Again, the purpose of this is to allow us to consider one category, **Bool**, through the lens of another, **Disc(2)**, in this case, it means considering the boolean values as a pair.
"

# ╔═╡ 133ae11a-0dc3-11eb-0093-ab72e9fbe2cd
md"#### isF

If we think of the boolean values as having a relation between them, we can use the **Arrow** category to isolate two objects and a single relation:
```math
  isF : Arrow \to Bool
```

where the functor, `isF`, consists of two maps:

```math
\begin{align}
  objs &: {A\mapsto T, B\mapsto F} \\
  arrows &: {id_A\mapsto id_T, id_B\mapsto id_F, f\mapsto notT}
\end{align}
```

Here, the important aspect is the mapping of $f:A\to B$ to $notT:T\to F$.  It is clear that, since we mapped `A` to `T`, this is the only choice for `f`, since the composition rules must be preserved through the functor mapping:

```math
\begin{align}
  id_A\cdot f \cdot id_b &= isF(id_A)\cdot isF(f)\cdot isF(id_B) \\
  id_A\cdot f \cdot id_b &= id_T\cdot notT\cdot id_F
\end{align}
```

If we had mapped `f` to `notF`, then we'd get: $id_T\cdot notF\cdot id_F$, which doesn't properly compose.
"

# ╔═╡ 4f2fa576-0dc5-11eb-36b8-03bd7c7263d4
md"#### isIsoF
Lastly, we can map **Iso** to **Bool**:

```math
  isIsoF : Iso \to Bool
```

where the functor, `isIsoF`, consists of two maps:

```math
\begin{align}
  objs &: {A\mapsto T, B\mapsto F} \\
  arrows &: {id_A\mapsto id_T, id_B\mapsto id_F, f\mapsto notT, g\mapsto notF}
\end{align}
```


"

# ╔═╡ dc80e2e6-0db6-11eb-08a0-c56d6ca4f914
begin
	T, F = Ob(FreeSymmetricMonoidalCategory, :T, :F)
	notT, notF = Hom(:notT, T, F), Hom(:notF, F, T);
end

# ╔═╡ dab355e8-0db6-11eb-237c-f50a8b8e544a
to_tikz(notT ⋅ notF, labels=true)

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
to_tikz(id(A) ⊗ id(B), labels=true)

# ╔═╡ faf7406a-0d81-11eb-12da-055b37c8b827
f

# ╔═╡ 4609a876-0d81-11eb-1fdb-a737c40fdeeb
to_tikz(f, labels=true)

# ╔═╡ 4993572e-0dad-11eb-3e40-ad079932eeb4
id(A) ⋅ f

# ╔═╡ fd903a7c-0dac-11eb-370f-7d1ee2a42b1b
f ⋅ id(B)

# ╔═╡ 6ba0dd40-0dae-11eb-2983-59a2812b75b3
to_tikz(id(A) ⋅ f, labels=true)

# ╔═╡ 9fed6774-0dab-11eb-270c-a58e680a7e34
g

# ╔═╡ 02a20ea4-0dac-11eb-3d10-7fc4e03ac429
f ⋅ g

# ╔═╡ 0a82816e-0dac-11eb-0855-11b05f9635ed
to_tikz(f ⋅ g, labels=true)

# ╔═╡ d4f33210-0daf-11eb-0e1a-6fc26c995eb1
g ⋅ f

# ╔═╡ 7f181096-0dac-11eb-0ef9-3dc63b6182bc
to_tikz(g ⋅ f, labels=true)

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
# ╟─4993572e-0dad-11eb-3e40-ad079932eeb4
# ╟─fd903a7c-0dac-11eb-370f-7d1ee2a42b1b
# ╟─d2215e7c-0dad-11eb-1ba3-5972eec15d14
# ╟─6ba0dd40-0dae-11eb-2983-59a2812b75b3
# ╟─cbd2d080-0dac-11eb-2ab3-d7a7c9bafeff
# ╟─9fed6774-0dab-11eb-270c-a58e680a7e34
# ╟─cf293c50-0dab-11eb-15b3-2739447c8380
# ╟─02a20ea4-0dac-11eb-3d10-7fc4e03ac429
# ╟─0c99c040-0dac-11eb-0d5e-a5bbfe061c6e
# ╟─0a82816e-0dac-11eb-0855-11b05f9635ed
# ╟─5a9130a8-0dac-11eb-1391-3b90eadb7b48
# ╟─d4f33210-0daf-11eb-0e1a-6fc26c995eb1
# ╟─e7748916-0daf-11eb-12c2-e72fa4bf4d37
# ╟─7f181096-0dac-11eb-0ef9-3dc63b6182bc
# ╟─ee7288ca-0db0-11eb-27b7-0f1e50ca74e3
# ╟─a661901a-0db2-11eb-03bf-859ba6238c7b
# ╟─86dfc8e4-0dbd-11eb-15de-a34f4aaf40c9
# ╟─dab355e8-0db6-11eb-237c-f50a8b8e544a
# ╟─74f898be-0dbe-11eb-3d11-299fe20b39f9
# ╟─d5857e68-0dbe-11eb-2751-1d22cf4e2dcb
# ╟─8bd8893e-0dc0-11eb-3459-51928d4947a9
# ╟─ff9a6bf0-0dc1-11eb-3608-bdab9172a64a
# ╟─133ae11a-0dc3-11eb-0093-ab72e9fbe2cd
# ╟─4f2fa576-0dc5-11eb-36b8-03bd7c7263d4
# ╟─dc80e2e6-0db6-11eb-08a0-c56d6ca4f914
# ╟─8880d62e-0d66-11eb-3922-3d36340ea699
