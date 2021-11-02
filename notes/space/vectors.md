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

Many of the conclusions we have seen in linear algebra ultimately depend only on the idea of linear combinations. But there are objects other than "a collection of $n$ numbers" that can play the linear combination game.

(example-vectors-matrix)=
::::{proof:example} 
For fixed $m$ and $n$, any collection of $m\times n$ matrices $vv,\ldots,\bfA_k$ can be combined as

$$
\bfB = c_1 \bfA_1 + c_2 \bfA_2 + \cdots + c_k \bfA_k,
$$

resulting in another $m\times n$ matrix.
::::

```{index} ! vector space, ! scalar, ! subspace
```

(definition-vectors-space)=
::::{proof:definition} Vector space
Let $V$ be a set with rules for multiplication by real numbers and addition of set members. If every linear combination of members of $V$ results in another member of $V$, we call $V$ a **vector space**. In this context, the numbers that multiply set elements in a linear combination are called **scalars**. Any vector space $S$ that is a subset of another vector space $V$ is called a **subspace** of $V$. A vector space is a subspace of itself.
::::

:::{note}
I have omitted some technical details about how addition and scalar multiplication are supposed to behave; we will only consider the "natural" familiar versions of those operations.
:::

The sets in the examples above are vector spaces. Here are some other examples.

(definition-vectors-polynomial)=
::::{proof:definition} Polynomials
Let $\mathcal{P}_n$ stand for the set of all polynomials of degree $n$ or less.
::::

(example-vectors-polynomial)=
::::{proof:example} 
If $p$ and $q$ are both polynomials of degree $n$ or less, then $c_1p + c_2q$ is also in $\mathcal{P}_n$. Hence $\mathcal{P}_n$ is a vector space for any fixed $n$.
::::

(example-vectors-smooth)=
::::{proof:example} 
Let $\mathcal{C}$ denote the set of all real-valued functions that are infinitely differentiable on the real line. If $f\in \mathcal{C}$ and $c$ is a real number, define $cf$ as the function 

$$
(cf)(x) = c\cdot f(x).
$$

With this rule, a linear combination of functions in $\mathcal{C}$ is also infinitely differentiable and thus belongs in $\mathcal{C}$.
::::


## Lack of closure

All of the examples above are vector spaces. Not every set we could pick will be one. A set fails to be a vector space if it is not closed under linear combinations. This can be checked by looking separately at scalar multiplication and addition of vectors.


(example-vectors-unclosed-poly)=
::::{proof:example} 
Suppose $S$ is the set of all polynomials of degree exactly 3. (Note the distinction from $\mathcal{P}_3$.) Since, for example,

$$
(x^3+x+1) + (-x^3+x^2)
$$

is not a polynomial of degree exactly 3, $S$ is not closed under linear combinations.
::::

(example-vectors-unclosed-matrices)=
::::{proof:example} 
Let $S$ be this subset of $2\times 2$ matrices:

$$
\left\{  \bfA = \twomat{a}{b}{c}{d} : ad \ge 0   \right\}.
$$

The product of diagonal terms in $k\bfA$ is $k^2ad$, which is nonnegative whenever $ad \ge 0$. Hence $S$ is closed under scalar multiplication. But it fails closure under addition. The matrices $\bfA=\twomat{-1}{0}{0}{0}$ and $\bfB=\twomat{0}{0}{0}{1}$ both belong to $S$, but $\bfA + \bfB$ fails the condition of membership.
::::
<!-- 
There is one easy way of detecting some sets that aren't vector spaces.

(theorem-vectors-zero)=
::::{proof:theorem} 
If $V$ is a nonempty vector space, then the zero vector is in $V$.
::::
:::{proof:proof}
Let $\bfv$ be any member of $V$. Then $1\cdot \bfv + (-1)\cdot \bfv$ will be zero.
::: 
-->

(example-vectors-affine)=
::::{proof:example} 
Let $S$ be the set of all vectors in $\real^2$ such that $x_1+x_2=1$. Since, for example,

$$
[1,0] + [0,1] = [1,1]
$$

we have found two vectors in $S$ whose sum is not in $S$. Thus $S$ is not a vector space.
::::

## Span and independence

Our previous definitions of span and independence refer only to linear combinations of vectors, so they can be applied directly to more abstract vector spaces. 

(example-vectors-spanP2)=
::::{proof:example} 
The polynomials $p(x)=1$ and $q(x)=x^2$ are vectors in the space $\mathcal{P}_2$. Their span is

$$
\span(p,q) = c_1p(x) + c_2 q(x) = c_1 + c_2x^2,
$$

which is the subset of all even polynomials in $\mathcal{P}_2$.
::::

Span is a common way to represent and to generate subspaces.

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

satisfies $p(x)=0$ for all real $x$. The Fundamental Theorem of Algebra states that a polynomial of degree $n$ has at most $n$ real roots, so the only possibility is $p$ is the zero polynomial. This implies that $c_0=c_1=\cdots=c_n=0$. Hence $1,x,\ldots,x^n$ are linearly independent in $\mathcal{P}_2$.
::::

For the vector spaces $\mathbb{R}^{m\times n}$ and $\mathcal{P}_n$, there is an easy and rather obvious way to transform statements about these vectors to the ones we have been using.

(example-vectors-spanP2)=
::::{proof:example} 
Consider again the span of $p(x)=1$ and $q(x)=x^2$ in the space $\mathcal{P}_2$. It is natural to represent each polynomial by a vector of its coefficients:

$$
p \leftrightarrow \threevec{1}{0}{0}, \qquad q \leftrightarrow \threevec{0}{0}{1}.
$$

The span of these vectors is represented by $\threevec{a}{0}{c}$, which is the set of vectors having second coordinate equal to zero. This corresponds to the set of polynomials in $\mathcal{P}_2$ with no linear term.
::::

(example-vectors-independent)=
::::{proof:example}
Determine whether 

$$
\twomat{1}{-1}{0}{1}, \quad \twomat{0}{1}{1}{0}, \quad \twomat{1}{1}{2}{1}
$$

are linearly independent.

:::{dropdown} Solution
Stack the columns of each matrix in order to get the vectors

$$
\begin{bmatrix} 1 \\ 0 \\ -1 \\ 1 \end{bmatrix}, \quad 
\begin{bmatrix} 0 \\ 1 \\ 1 \\ 0 \end{bmatrix}, \quad 
\begin{bmatrix} 1 \\ 2 \\ 1 \\ 1 \end{bmatrix}.
$$

The question can now be answered for these vectors in the usual way, by making them columns of a $4\times 3$ matrix. The dimension of its column space is just 2, so the vectors are dependent.
:::
::::