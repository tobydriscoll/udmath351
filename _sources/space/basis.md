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

A number of important vector spaces have a **standard basis**. These include

* For $\real^n$: vectors $\bfe_1,\ldots,\bfe_n$ that are the columns of an $n\times n$ identity matrix.
* For $m\times n$ matrices: the $mn$ matrices that are zero in every element except for 1 in one position.
* For $\mathcal{P}_n$: the monomials $1,x,\ldots,x^n$.

Since questions about span and independence always reduce to questions about linear combinations, they can be converted into statements about linear systems, at which point we can use the tools from Chapter 2.

(example-basis-show)=
::::{proof:example} 
Show that the matrices

$$
\twomat{1}{-1}{0}{0}, \twomat{0}{1}{1}{0}, \twomat{1}{0}{0}{-1}, \twomat{0}{1}{0}{1}
$$

form a basis of $\real^{2\times 2}$, the set of $2\times 2$ real matrices.

:::{dropdown} Solution
First we show spanning. Let $\twomat{a}{b}{c}{d}$ be any member of $\real^{2\times 2}$. We have to show that there is a solution $x_1,\ldots,x_4$ of

$$
\twomat{a}{b}{c}{d} = x_1\twomat{1}{-1}{0}{0}+ x_2 \twomat{0}{1}{1}{0} + x_3 \twomat{1}{0}{0}{-1}+ x_4 \twomat{0}{1}{0}{1}.
$$

We get four individual equations from each element of this matrix equality:

$$
\begin{bmatrix}
  1 & 0 & 1 & 0 \\ -1 & 1 & 0 & 1 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & -1 & 1
\end{bmatrix} \begin{bmatrix}
  x_1\\x_2\\x_3\\x_4
\end{bmatrix}
= \begin{bmatrix}
  a \\ b \\ c \\ d
\end{bmatrix}.
$$

Because the coefficient matrix is square, we only need to check whether it is invertible. We can calculate its determinant to be $-2$ and thus conclude that a solution for the $x_i$ is always possible.

Now we test indepdendence. Suppose that 

$$
\twomat{0}{0}{0}{0} = x_1\twomat{1}{-1}{0}{0}+ x_2 \twomat{0}{1}{1}{0} + x_3 \twomat{1}{0}{0}{-1}+ x_4 \twomat{0}{1}{0}{1}.
$$

This is equivalent to the linear system above with $a=b=c=d=0$. Because the coefficient matrix is invertible, the only solution is $x_1=x_2=x_3=x_4=0$. Hence the vectors are independent.
:::
::::

(example-basis-polynomial)=
::::{proof:example} 
Determine whether the vectors $1+x$ and $x+x^2$ form a basis of $\mathcal{P}_2$.
:::{dropdown} Solution
In order to equal a generic member $a+bx+cx^2$ of $\mathcal{P}_2$, we need to have a solution of the system

$$
a+bx+cx^2 = z_1(1+x) + z_2(x+x^2)
$$

for $z_1,z_2$. This is equivalent to

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

This has no free columns, so the given vectors in the problem are independent. But the rank of the matrix is 2, so thanks to {numref}`Theorem {number} <theorem-RREF-deficient>`, we cannot find a solution for every choice of $a,b,c$. Thus, the given vectors do not span $\mathcal{P}_2$.
:::
::::

## Dimension

```{index} dimension
```

The essence of {numref}`Example {number} <example-basis-polynomial>` is a counting argument. In our new context, {numref}`Theorem {number} <theorem-subspaces-dimension>` still holds, and we can still define the **dimension** of a subspace as the number of members in any basis for it. 

It should be clear that the dimension of $\real^{m\times n}$ is $mn$ and that the dimension of $\mathcal{P}_n$ is $n+1$, since we have already exhibited bases for them.

(theorem-basis-counting)=
::::{proof:theorem} 
Suppose $d$ is the dimension of a vector space $V$. Then any set with fewer than $d$ members cannot span $V$, and any set with more than $d$ members cannot be linearly independent in $V$.
::::

Revisiting {numref}`Example {number} <example-basis-polynomial>`, we now know immediately that the given set of two vectors could not possibly span all of $\mathcal{P}_2$. The question of independence could have resolved either way, but regardless, the set could not be a basis.

(example-basis-symmetric)=
::::{proof:example} 
Find the dimension of $S$, the subspace of real symmetric $2\times 2$ matrices.
:::{dropdown} Solution
We will show that a basis for $S$ is the set $\left\{ \twomat{1}{0}{0}{0}, \twomat{0}{1}{1}{0}, \twomat{0}{0}{0}{1}\right\}.$ Setting a generic member $\twomat{a}{b}{b}{c}$ equal to a linear combination of them is equivalent to a linear system with a $3\times 3$ identity as the coefficient matrix. There is a unique zero solution if $a=b=c=0$, and there is a solution regardless of how they are chosen, so the set is both independent and spanning. Therefore, $\dim(S)=3$.  
:::
::::

:::{attention}
The big new wrinkle with abstract vector spaces is that the dimension can be infinity. This happens for the vector space of all polynomials, for example. We won't be dealing with these, although the implications are interesting and far-reaching.
:::

