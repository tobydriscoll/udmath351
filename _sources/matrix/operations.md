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

# Algebraic operations

## Matrix times vector

The idea of linear combinations, as defined in {numref}`Definition {number} <definition-nullspace-linear-comb>`, serves as the foundation of multiplication between a matrix and a vector.

```{index} ! matrix times vector
```

(definition-operations-matvec)=
::::{proof:definition} Matrix times vector
Given $\bfA\in\cmn{m}{n}$ and $\bfx\in\complex^{n}$, the product $\bfA\bfx$ is defined as

```{math}
:label: eq-operations-matvec
\bfA\bfx = x_1 \bfa_1 + x_2 \bfa_2 + \cdots + x_n \bfa_n = \sum_{j=1}^n x_j \bfa_j,
```

where $\bfa_j$ refers to the $j$th column of $\bfA$.
::::

```{attention}
In order for $\bfA\bfx$ to be defined, the number of columns in $\bfA$ has to be the same as the number of elements in $\bfx$. 
```

Note that when $\bfA$ is $m\times n$, then $\bfx$ must be in $\real^n$ or $\complex^n$, and $\bfA\bfx$ has dimension $m$. 

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

We don't often write out the product in this much detail. Instead we "zip together" the rows of the matrix with the entries of the vector:

```{math}
\threevec{(-1)(1)+(2)(-1)+(-1)(-1)}{(-1)(3)+(2)(-2)+(-1)(0)}{(-1)(1)+(2)(-2)+(-1)(-1)}  = \threevec{-2}{-7}{-4}.
```

You might recognize the "zip" expressions in this vector as dot products from vector calculus.
:::
::::

### Properties

What justifies calling this operation multiplication? In large part, it's the natural distributive properties

\begin{align*}
\bfA(\bfx+\bfy) & =  \bfA\bfx + \bfA\bfy,\\
(\bfA+\bfB)\bfx & =  \bfA\bfx + \bfB\bfx,
\end{align*}

which can be checked with a little effort. It's also true that $\bfA(c\bfx)=c(\bfA\bfx)$ for any scalar $c$. However, there is a big departure from multiplication as we usually know it.

```{warning}
Matrix-vector products are not commutative. In fact, $\bfx\bfA$ is not defined even when $\bfA\bfx$ is.
```

### Connection to linear systems

The following observation finally brings us back around to the introduction of linear systems through the insultingly simple scalar equation $ax=b$. 

::::{proof:observation}
The linear system with coefficient matrix $\bfA$, right-side vector $\bfb$, and solution $\bfx$ is equivalent to the equation $\bfA\bfx=\bfb$.
::::

Bringing together more of our definitions:

::::{proof:theorem}
1. The linear system $\bfA\bfx=\bfb$ is consistent if and only if $\bfb$ is in the span of the columns of $\bfA$.
2. The null space of a matrix contains nonzero vectors if and only if the columns of the matrix are linearly dependent.
::::

## Matrix multiplication

We can think of vectors as a special kind of matrix, and accordingly we can generalize matrix-vector products to matrix-matrix products. There are many equivalent ways to define these products. Here is the one we start with.

::::{proof:definition} Matrix times matrix
If $\bfA$ is $m\times n$ and $\bfB$ is $n\times p$, then the product $\bfA\bfB$ is defined as

```{math}
:label: matrix-mult
\bfA\mathbf{B}
= \bfA \begin{bmatrix} \mathbf{b}_1 & \mathbf{b}_2 & \cdots & \mathbf{b}_p \end{bmatrix}
= \begin{bmatrix} \bfA\mathbf{b}_1 & \bfA\mathbf{b}_2 & \cdots & \bfA\mathbf{b}_p \end{bmatrix}.
```
::::

In words, a matrix-matrix product is the horizontal concatenation of matrix-vector products involving the columns of the right-hand matrix.

```{warning}
In order to define $\bfA\bfB$, we require that the number of columns in $\bfA$ is the same as the number of rows in $\bfB$. That is, the *inner dimensions* must agree. The result has size determined by the *outer dimensions* of the original matrices.
```

When we compute a matrix product by hand, we usually don't write out the above. Instead we use a more compact definition for the individual entries of $\mathbf{C} = \bfA\bfB$,

```{math}
:label: matrix-mult-element
C_{ij} = \sum_{k=1}^n a_{ik}b_{kj}, \qquad i=1,\ldots,m, \quad j=1,\ldots,p.
```

The sum to get a single $C_{ij}$ is what we called a "zip", or essentially a dot product, of row $i$ from $\bfA$ with column $j$ from $\bfB$.

::::{proof:example}

Find $\mathbf{A}\mathbf{B}$ if

```{math}
\bfA = \begin{bmatrix}
1 & -1 \\ 0 & 2 \\ -3 & 1
\end{bmatrix}, \qquad
\mathbf{B} = \begin{bmatrix}
2 & -1 & 0 & 4 \\ 1 & 1 & 3 & 2
\end{bmatrix}.
```

:::{dropdown} Solution
Using {eq}`matrix-mult-element`,

\begin{align*}
\bfA\mathbf{B} &= \begin{bmatrix}
(1)(2) + (-1)(1) & (1)(-1) + (-1)(1) & (1)(0) + (-1)(3) & (1)(4) + (-1)(2) \\
(0)(2) + (2)(1) & (0)(-1) + (2)(1) & (0)(0) + (2)(3) & (0)(4) + (2)(2) \\
(-3)(2) + (1)(1) & (-3)(-1) + (1)(1) & (-3)(0) + (1)(3) & (-3)(4) + (1)(2)
\end{bmatrix} \\
& = \begin{bmatrix}
1 & -2 & -3 & 2 \\ 2 & 2 & 6 & 4 \\ -5 & 4 & 3 & -10
\end{bmatrix}
\end{align*}.

Observe that

```{math}
\bfA \begin{bmatrix} 2 \\ 1 \end{bmatrix} = 2 \begin{bmatrix} 1 \\ 0 \\ -3
\end{bmatrix} + 1 \begin{bmatrix} -1 \\ 2 \\ 1 \end{bmatrix}
= \begin{bmatrix} 1 \\ 2 \\ -5 \end{bmatrix},
```

and so on.
:::
::::

### Properties

First, the bad news. 

```{warning}
Matrix multiplication is not commutative. If $\bfA\bfB$ is defined, then $\bfB\bfA$ may not be, and even if it is, it may not equal $\bfA\bfB$. Put another way, you cannot simply change the order of the terms in a matrix product without some explicit justification.
```

Fortunately, other familiar and handy properties of multiplication do come along for the ride:

1. $(\bfA\bfB)\mathbf{C}=\bfA(\bfB \mathbf{C})\qquad$  (association)
2. $\bfA(\bfB+\mathbf{C}) = \bfA\bfB + \bfA\mathbf{C}\qquad$  (right distribution)
3. $(\bfA+\bfB)\mathbf{C} = \bfA\mathbf{C} + \bfB\mathbf{C}\qquad$   (left distribution)

These properties are easy to demonstrate computationally. (But keep in mind that a numerical demonstration, or an algebraic one at particular sizes, is not a general proof.) 

## Transpose

Here's a curious operation that we won't be using much, but it is important enough to know about.

```{index} ! transpose of a matrix
```

(definition-algebra-transpose)=
::::{proof:definition} Transpose of a matrix
The **transpose** of $m\times n$ matrix $\bfA$, whose elements are $A_{ij}$, is the $n\times m$ matrix $\bfA^T$ with elements $A_{ji}$.
::::

When taking the transpose, rows become columns, and vice versa.

### Properties

(theorem-algebra-transpose)=
::::{proof:theorem} 
If $\bfA$ and $\bfB$ are matrices of compatible sizes, and $c$ is a number, then
1. $(\bfA^T)^T = \bfA$
2. $(\bfA+\bfB)^T = \bfA^T + \bfB^T$
3. $(c\bfA^T) = c(\bfA^T)$
4. $(\bfA\bfB)^T = \bfB^T \bfA^T$
::::

Only the last of these is not intuitively clear.
