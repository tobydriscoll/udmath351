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

# Matrix-vector algebra

Matrices support addition/subtraction and scalar multiplication just as vectors do, by acting elementwise. But things get more complicated when we start considering how to multiply matrices and vectors together.

## Matrix times vector

The [linear combination definition](definition-linalg-linear-combination) serves as the foundation of multiplication between a matrix and a vector.

````{proof:definition} Matrix times vector
Given $\bfA\in\cmn{m}{n}$ and $\bfx\in\complex^{n}$, the product $\bfA\bfx$ is defined as

```{math}
:label: matrix-vector-mult
\bfA\bfx = x_1 \bfa_1 + x_2 \bfa_2 + \cdots + x_n \bfa_n = \sum_{j=1}^n x_j \bfa_j,
```

where $\bfa_j$ refers to the $j$th column of $\bfA$.
````

```{warning}
In order for $\bfA\bfx$ to be defined, the number of columns in $\bfA$ has to be the same as the number of elements in (dimension of) $\bfx$. 
```

Note that when $\bfA$ is $m\times n$, then $\bfx$ must have dimension $n$ and $\bfA\bfx$  has dimension $m$. 

::::{proof:example}

Calculate the product

```{math}
\begin{bmatrix} 
1 & -1 & -1 \\ 3 & -2 & 0 \\ 1 & -2 & -1 \end{bmatrix} \threevec{-1}{2}{-1}.
```

:::{dropdown} Solution
The product is equivalent to

```{math}
(-1) \threevec{1}{3}{1} + (2) \threevec{-1}{-2}{-2} + (-1) \threevec{-1}{0}{-1} = \threevec{-2}{-7}{-4}.
```

We often don't write out the product in this much detail just to calculate an instance. Instead we "zip together" the rows of the matrix with the entries of the vector:

```{math}
\threevec{(-1)(1)+(2)(-1)+(-1)(-1)}{(-1)(3)+(2)(-2)+(-1)(0)}{(-1)(1)+(2)(-2)+(-1)(-1)}  = \threevec{-2}{-7}{-4}.
```

You might recognize the "zip" expressions in this vector as dot products from vector calculus.
:::
::::

What justifies calling this operation multiplication? In large part, it's the natural distributive properties

\begin{align*}
\bfA(\bfx+\bfy) & =  \bfA\bfx + \bfA\bfy,\\
(\bfA+\bfB)\bfx & =  \bfA\bfx + \bfB\bfx,
\end{align*}

which can be checked with a little effort. It's also true that $\bfA(c\bfx)=c(\bfA\bfx)$ for any scalar $c$. However, there is a big departure from multiplication as we usually know it.

```{warning}
Matrix-vector products are not commutative. In fact, $\bfx\bfA$ is not defined even when $\bfA\bfx$ is.
```

## Connection to linear systems

Earlier we said that a linear system is equivalent to a statement about a linear combination of vectors. Now we have said that a linear combination of vectors is equivalent to a matrix-vector multiplication. Putting these together,

````{proof:observation}
The linear system with coefficient matrix $\bfA$, right-side vector $\bfb$, and solution $\bfx$ is equivalent to the equation $\bfA\bfx=\bfb$.
````

This observation finally brings us back around to the introduction of linear systems through the insultingly simple scalar equation $ax=b$. But to fully solve it in the vector case, we need a bit more preparation.

## MATLAB

We can now connect solving linear systems with backslash to matrix-vector multiplication. The system defined by

```{code-cell}
1==1
A = [ 1 -1 0; 2 2 -3; 4 0 1 ];
b = [ 3, -1, 1 ];
```

is solved via

```{code-cell}
x = A \ b
```

We check the result:

```{code-cell}
b - A*x
```

In general, we cannot expect all the entries of the vector to be exactly zero, due to rounding errors.