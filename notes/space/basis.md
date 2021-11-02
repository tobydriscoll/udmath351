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

(section-space-basis)=
# Basis and dimension

Here is a formal definition that we postponed when talking about matrices.

```{index} ! basis
```
(definition-vectors-basis)=
::::{proof:definition} 
A linearly independent set of vectors that spans vector space $V$ is called a **basis** of $V$
::::

Since questions about span and independence always reduce to questions about linear combinations, they can be converted into statements about linear systems, at which point we can use the tools from Chapter 4.

(example-basis-show)=
::::{proof:example} 
Show that the matrices

$$
\twomat{1}{-1}{0}{0}, \twomat{0}{1}{1}{0}, \twomat{1}{0}{0}{-1}, \twomat{0}{1}{0}{1}
$$

form a basis of $\real^{2\times 2}$, the set of $2\times 2$ real matrices.

:::{dropdown} Solution
We stack the columns of the matrices to get the vectors

$$
\begin{bmatrix} 1 \\ 0 \\ -1 \\ 0 \end{bmatrix}, \quad
\begin{bmatrix} 0 \\ 1 \\ 1 \\ 0 \end{bmatrix}, \quad
\begin{bmatrix} 1 \\ 0 \\ 0 \\ -1 \end{bmatrix}, \quad
\begin{bmatrix} 0 \\ 0 \\ 1 \\ 1 \end{bmatrix}.
$$

These are the columns of the matrix

$$
\begin{bmatrix}
  1 & 0 & 1 & 0 \\ 0 & 1 & 0 & 0 \\ -1 & 1 & 0 & 1 \\ 0 & 0 & -1 & 1
\end{bmatrix}.
$$

<!-- 

First we show spanning. Let $\twomat{a}{b}{c}{d}$ be any member of $\real^{2\times 2}$. We have to show that there is a solution $x_1,\ldots,x_4$ of

$$
\twomat{a}{b}{c}{d} = x_1\twomat{1}{-1}{0}{0}+ x_2 \twomat{0}{1}{1}{0} + x_3 \twomat{1}{0}{0}{-1}+ x_4 \twomat{0}{1}{0}{1}.
$$

We get four individual equations from each element of this matrix equality: 

$$
\begin{bmatrix}
  x_1\\x_2\\x_3\\x_4
\end{bmatrix}
= \begin{bmatrix}
  a \\ b \\ c \\ d
\end{bmatrix}.
$$

-->

This is a square matrix whose determinant is found to equal $-2$, hence it is invertible. Thus its columns are a basis of $\mathbb{R}^4$, and by unstacking the columns, we can say the same about $\rmn{2}{2}$. 
:::
::::

(example-basis-polynomial)=
::::{proof:example} 
Determine whether the vectors $1+x$ and $x+x^2$ form a basis of $\mathcal{P}_2$.
:::{dropdown} Solution
By writing coefficients in the order of increasing degree, these vectors are equivalent to 

$$
\threevec{1}{1}{0}, \quad \threevec{0}{1}{1}
$$

The question of reaching a generic member $a+bx+cx^2$ of $\mathcal{P}_2$ is 

$$
a+bx+cx^2 = z_1(1+x) + z_2(x+x^2)
$$

for constants $z_1,z_2$. This is equivalent to

$$
\begin{bmatrix}
  1 & 0 \\ 1 & 1 \\ 0 & 1
\end{bmatrix} \twovec{z_1}{z_2} = \threevec{a}{b}{c}.
$$

The RRE form of the coefficient matrix is

$$
\begin{bmatrix}
  1 & 0  \\ 0 & 1  \\ 0 & 0 
\end{bmatrix}.
$$

This has rank equal to 2. There is no way the column space can include all possible choices of $\threevec{a}{b}{c}$, which is three-dimensional. Thus, the given vectors do not span $\mathcal{P}_2$.
:::
::::

## Standard basis

```{index} standard basis
```
A number of important vector spaces have a **standard basis**. These include

* For $\real^n$: vectors $\bfe_1,\ldots,\bfe_n$ that are the columns of an $n\times n$ identity matrix:

$$
\bfe_1 = \begin{bmatrix} 1 \\ 0 \\ 0 \vdots \\ 0 \end{bmatrix}, \quad 
\bfe_2 = \begin{bmatrix} 0 \\ 1 \\ 0 \vdots \\ 0 \end{bmatrix}, \quad 
\cdots, \quad
\bfe_n = \begin{bmatrix} 0 \\ 0 \\ 0 \vdots \\ 1 \end{bmatrix}.
$$

* For $m\times n$ matrices: the $mn$ matrices that are zero in every element except for 1 in one position. (These come from unstacking the standard vectors of $\real^{mn}$.)
* For $\mathcal{P}_n$: the monomials $1,x,\ldots,x^n$. (These correspond to the standard basis in $\real^{n+1}$.)

## Dimension

```{index} dimension
```

In our new context, {numref}`Theorem {number} <theorem-subspaces-dimension>` still holds, and we can still define the **dimension** of a subspace as the number of members in any basis for it. It should be clear by now that the dimension of $\real^{m\times n}$ is $mn$ and that the dimension of $\mathcal{P}_n$ is $n+1$.

As before, we have a basic "counting theorem" when it comes to dimension.

(theorem-basis-counting)=
::::{proof:theorem} 
Suppose $d$ is the dimension of a vector space $V$. Then any set with fewer than $d$ members cannot span $V$, and any set with more than $d$ members cannot be linearly independent in $V$.
::::


:::{attention}
The big new wrinkle with abstract vector spaces is that the dimension can be infinity. This happens for the vector space of *all* polynomials, for example. We won't be dealing with these, although the implications are interesting and far-reaching.
:::

