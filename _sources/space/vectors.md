---
jupytext:
  cell_metadata_filter: -all
  formats: md:myst
  text_representation:
    extension: .md
    format_name: myst
    format_version: 0.13
    jupytext_version: 1.10.3
kernelspec:
  display_name: Julia 1.6.1
  language: julia
  name: julia-1.6
---
# Vectors galore

Many of the conclusions we have seen in linear algebra ultimately depend only on the idea of linear combinations. But there are objects other than collections of $n$ numbers that can play the linear combination game.

(example-vectors-matrix)=
::::{proof:example} 
For fixed $m$ and $n$, any collection of $m\times n$ matrices $vv,\ldots,\bfA_k$ can be combined as

$$
\bfB = c_1 \bfA_1 + c_2 \bfA_2 + \cdots + c_k \bfA_k,
$$

resulting in another $m\times n$ matrix.
::::

(example-vectors-symmetric)=
::::{proof:example} 
Any $2\times 2$ symmetric matrix can be written in the form $\twomat{a}{b}{b}{c}$. If we combine two such matrices, we get

$$
k_1 \twomat{a}{b}{b}{c} + k_2 \twomat{d}{f}{f}{g} = \twomat{k_1a+k_2d}{k_1b+k_2f}{k_1b+k_2f}{k_1c + k_2g},
$$

which is another symmetric matrix. The same is true for longer linear combinations.
::::

(definition-vectors-polynomial)=
::::{proof:definition} Polynomials
Let $\mathcal{P}_n$ stand for the set of all polynomials of degree $n$ or less.
::::

(example-vectors-polynomial)=
::::{proof:example} 
If $p$ and $q$ are both polynomials of degree $n$ or less, then $c_1p + c_2q$ is also in $\mathcal{P}_2$.
::::

(example-vectors-smooth)=
::::{proof:example} 
Let $\mathcal{C}$ denote the set of all real-valued functions that are infinitely differentiable on the real line. If $f\in \mathcal{C}$ and $c$ is a real number, define $cf$ as the function 

$$
(cf)(x) = c\cdot f(x).
$$

With this rule, a linear combination of functions in $\mathcal{C}$ is also infinitely differentiable and thus belongs in $\mathcal{C}$.
::::

## Definition

```{index} ! vector space, ! scalar, ! subspace
```

(definition-vectors-space)=
::::{proof:definition} Vector space
Let $V$ be a set with rules for mutliplication by real numbers and addition of set members. If every linear combination of members of $V$ results in another member of $V$, we call $V$ a **vector space**. In this context, the numbers that multiply set elements in a linear combination are called **scalars**. Any vector space $S$ that is a subset of another vector space $V$ is called a **subspace** of $V$. A vector space is a subspace of itself.
::::

:::{note}
I have omitted some technical details about how addition and scalar multiplication are supposed to behave; we will only consider the "natural" versions of those operations, which behave properly.
:::

All of the examples above are vector spaces. Not every set we could pick will be one.

(example-vectors-badpoly)=
::::{proof:example} 
Suppose $S$ is the set of all polynomials of degree 3. Since, for example,

$$
(x^3+x+1) + (-x^3+x^2)
$$

is not a polynomial of degree 3, $S$ is not closed under linear combinations.
::::

(example-vectors-affine)=
::::{proof:example} 
Let $S$ be the set of all vectors in $\real^2$ such that $x_1+x_2=1$. Since, for example,

$$
[1,0] + [0,1] = [1,1]
$$

is not in $S$, $S$ is not a vector space.
::::

There is one easy way of detecting some sets that aren't vector spaces.

(theorem-vectors-zero)=
::::{proof:theorem} 
If $V$ is a nonempty vector space, then the zero vector is in $V$.
::::
:::{proof:proof}
Let $\bfv$ be any member of $V$. Then $1\cdot \bfv + (-1)\cdot \bfv$ will be zero.
:::

## Span and independence

Our previous definitions of span and independence refer only to linear combinations of vectors, so they can be applied directly to more abstract vector spaces. 

(example-vectors-spanP2)=
::::{proof:example} 
The polynomials $p(x)=1$ and $q(x)=x^2$ are vectors in the space $\mathcal{P}_2$. Their span is

$$
\span(p,q) = c_1p(x) + c_2 q(x) = c_1 + c_2x^2,
$$

which is the subset of all even functions in $\mathcal{P}_2$.
::::

Span is a common way to generate subspaces.

(theorem-vectors-span)=
::::{proof:theorem} 
Let $\bfv_1,\ldots,\bfv_k$ be members of vector space $V$. Define $S=\span(\bfv_1,\ldots,\bfv_k)$. Then:

1. $S$ is a subspace.
2. Any vector space that contains $\bfv_1,\ldots,\bfv_k$ also contains $S$.
::::

(example-vectors-monomial)=
::::{proof:example} 
The vectors $1,x,\ldots,x^n$ clearly form a spanning set for $\mathcal{P}_n$. Suppose that scalars $c_0,\ldots,c_n$ are chosen so that

$$
p = c_0(1) + c_1(x) + \cdots + c_n(x^n)
$$

satisfies $p(x)=0$ for all real $x$. The Fundamental Theorem of Algebra states that a polynomial of degree $n$ has at most $n$ real roots, so the only possibility is $p$ is the zero polynomial. This implies that $c_0=c_1=\cdots=c_n=0$. Hence $1,x,\ldots,x^n$ are linearly indepdendent in $\mathcal{P}_2$.
::::

