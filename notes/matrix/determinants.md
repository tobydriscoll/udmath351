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

# Determinants

There are many ways to characterize singular matrices, but only a few of them are computationally attractive. One that stands out is a function of square matrices called the **determinant**. (You probably saw some $2\times 2$ and $3\times 3$ determinants in vector calculus. This is the same thing.)

A definition of the determinant from fundamentals is actually quite tricky. We are going to take a shortcut and "define" it by a formula for computing it. The $2\times 2$ case is easy:

```{math}
\det\left( \twomat{a}{b}{c}{d} \right) = \twodet{a}{b}{c}{d} = ad-bc.
```

This definition can be bootstrapped into a real-valued function for square matrices of any size. 

(definition-linalg-determinant)=
````{proof:definition} Determinant
If $\bfA$ is $n\times n$, then its **determinant** is

```{math}
:label: eq-determinants-cofactor
\det(\bfA) = \sum (-1)^{i+j} a_{ij} \det\bigl( \mathbf{M}_{ij} \bigr),
```

where the sum is taken over any row or column of $\bfA$ and $\mathbf{M}_{ij}$ is the matrix that results from deleting row $i$ and column $j$ from $\bfA$.
````

The formula {eq}`eq-determinants-cofactor`, which is called **cofactor expansion**, is recursive: the $n\times n$ case is defined in terms of the $(n-1)\times (n-1)$ case, and so on all the way back down to $2\times 2$. 

Since expanding along any row or column gives the same result, it can be advantageous to choose one with lots of zeros to cut down on the total computation.

::::{proof:example}
Compute the determinant of 

$$
\begin{bmatrix} 
2 & 0 & -1 \\ -2 & 3 & -1 \\ 2 & 0 & 1
\end{bmatrix}.
$$

:::{dropdown} Solution
Using cofactor expansion along the first row,

\begin{align*}
\begin{vmatrix} 2 & 0 & -1 \\ -2 & 3 & -1 \\ 2 & 0 & 1 \end{vmatrix} & =  (2) \twodet{3}{-1}{0}{1} - (0) \twodet{-2}{-1}{2}{1} + (-1)\twodet{-2}{3}{2}{0}    \\
& = 2(3-0) + (-1)(0-6) = 12. \\
\end{align*}

In this case it might have been a tad easier to exploit the zeros by expanding along the second column instead:

\begin{align*}
\begin{vmatrix} 2 & 0 & -1 \\ -2 & 3 & -1 \\ 2 & 0 &  1 \end{vmatrix} & =  -(0) \begin{vmatrix} \cdots \end{vmatrix} + (3) \twodet{2}{-1}{2}{1} - (0)\begin{vmatrix} \cdots \end{vmatrix}    \\
& = 3(2+2) = 12. \\
\end{align*}
:::
::::

## Properties

::::{proof:theorem}
Let $\bfA$ and $\bfB$ be $n\times n$, and let $c$ be a number. Then

1. $\det(c\bfA) = c^n \det(\bfA)$,
2. $\det(\bfA\bfB) = \det(\bfA)\det(\bfB)$,
3. If $\bfA$ is nonsingular, $\det(\bfA^{-1})=\bigl[\det(\bfA)\bigr]^{-1}$.
4. $\det(\bfA)=0$ if and only if $\bfA$ is singular.
::::

It's the last property above that is of the greatest interest. 

:::{note}
The determinant is often the easiest way to check by hand for the invertibility of a small matrix.
:::

## Cramer's Rule

Even though a 2x2 inverse is easy, it's still not the most convenient way to solve a linear system $\bfA\bfx=\bfb$ by hand. There is another shortcut known as **Cramer's Rule**:

\begin{align*}
x_1 & = \frac{ \twodet{b_1}{a_{12}}{b_2}{a_{22}} }{ \det(\bfA) }\\[1ex]
x_2 & = \frac{ \twodet{a_{11}}{b_1}{a_{21}}{b_2} }{ \det(\bfA) }.
\end{align*}

Obviously this does not work if $\det(\bfA)=0$, i. e., when the matrix is singular. In that case, you have to fall back on row elimination.

::::{proof:example}
Solve

\begin{align*}
-x + 3y & = 1 \\
3x + y & = 7
\end{align*}

by Cramer's Rule.

:::{dropdown} Solution
Plug and play (or is it plug and pray?):

\begin{align*}
x & = \frac{ \twodet{1}{3}{7}{1} }{ \det(\bfA) }=  \frac{ \twodet{1}{3}{7}{1} }{ \twodet{-1}{3}{3}{1} } = \frac{-20}{-10} = 2, \\
y & = \frac{ \twodet{-1}{1}{3}{7} }{ \det(\bfA) } = \frac{ \twodet{-1}{1}{3}{7} }{ \twodet{-1}{3}{3}{1} } = \frac{-10}{-10} = 1.\\
\end{align*}.
:::
::::
