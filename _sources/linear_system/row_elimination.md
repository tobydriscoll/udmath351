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

# Row elimination

You've probably solved small systems of equations by substitution. In order to solve systems with more equations and variables, we systematize the idea as an *elimination* process. The goal of elimination is to transform the system to an equivalent one whose solution(s) we can deduce easily. There are three "legal moves" at our disposal.

(definition-row_elimination-operations)=
::::{proof:definition} Row operations
1. Swap the positions of two equations.
2. Multiply an equation by a nonzero constant.
3. Add a multiple of one equation to another equation.
::::

All of the row operations are reversible. Therefore, solutions of the system remain unchanged after a row operation.

(example-gauss-elimination)=
::::{proof:example}
Use elimination to solve the $3\times 3$ system

\begin{align*}
x_1 - x_2  - x_3 & = 2, \\
3x_1 - 2x_2 & = 9, \\
x_1 - 2x_2 - x_3 & = 5.
\end{align*}

:::{dropdown} Solution

The first step is to use the first equation to eliminate $x_1$ from the second and third equations. We therefore add $-3$ times equation 1 to equation 2, and $-1$ times equation 1 to equation 3:

\begin{align*}
 x_1 - x_2  - x_3  & = 2, \\
(3x_1 - 2x_2) - 3(x_1 - x_2  - x_3) & = 9 - 3(2),\\
(x_1 - 2x_2 - x_3) - 1(x_1 - x_2  - x_3) & = 5 - 1(2) .
\end{align*}

This takes us to
\begin{align*}
 x_1 - x_2  - x_3  & = 2,  \\
x_2 + 3x_3 &= 3, \\
-x_2 &= 3.
\end{align*}

It's tempting to grab that last equation and use it to remove $x_2$ from everything else. That certainly works out here. But we are aiming for a fully automatic system that works every time, so we will act as though the last equation still might contain $x_3$ and is not so trivial.

The next step of the recipe is to leave the first equation alone, and use the second to eliminate $x_2$ from all the others below it.

\begin{align*}
 x_1 - x_2  - x_3  & = 2, \\
x_2 + 3x_3 & = 3, \\
(-x_2) + (x_2+3x_3)  & = 3 + 3.
\end{align*}

We now have a system in **triangular** form,

\begin{align*}
 x_1 - x_2  - x_3  & = 2, \\
x_2 + 3x_3 & = 3, \\
3x_3  & = 6.
\end{align*}

We can now deduce that $x_3=2$ from the last equation. Moving up to the second equation, we then find that $x_2=3-3(2)=-3$. Finally, the first equation yields $x_1=2+(-3)+(2)=1$.
:::
::::

```{index} ! Gaussian elimination
```

The process in {numref}`Example {number} <example-gauss-elimination>` leading to triangular system is commonly known as **Gaussian elimination**. (It's a misnomer, as the process was known at least in China thousands of years before Gauss, but never mind.) Finding the solution from the triangular form is called **backward substitution**.

## Gauss-Jordan elimination

An alternative to backward substitution is to transform the triangular system into something even simpler.

(example-gauss-jordan)=
::::{proof:example} 

We continue from the end of {numref}`Example {number} <example-gauss-elimination>`.  Having reached the last variable and equation, we turn around and eliminate *upwards* instead:

\begin{align*}
(x_1 - x_2 - x_3) + \frac{1}{3}(3x_3) & = 2  +\frac{1}{3}(6), \\
(x_2 + 3x_3) - (3x_3) & = 3 - (6),\\
3x_3  & = 6.
\end{align*}

This leaves the system as
\begin{align*}
 x_1  -x_2 & = 4,\\
x_2 & = -3,\\
3x_3  & = 6.
\end{align*}

Moving upwards to the second equation, and use it to eliminate within the one above it:

\begin{align*}
(x_1 - x_2 ) + (x_2) & = 4  + (-3),\\
x_2 & = -3,\\
3x_3  & = 6. 
\end{align*}

The system is now trivial: $x_1=1$, $x_2=-3$, and $x_3=2$.
::::

```{index} ! Gauss–Jordan elimination
```

The process above is called **Gauss–Jordan elimination**, or more simply, **row elimination**. 

## Matrix form

```{index} ! augmented matrix
```

Before fully generalizing the elimination process, we will lighten the notational load by using matrices. We start with the $m\times (n+1)$ **augmented matrix** $\mathbf{G} = [\bfA\:\bfb]$ that contains all the equation coefficients and right-side values. 

Let's look at elimination in this form for the system

$$
x_1 - x_2 - x_3 &= 2, \\ 
3x_1-2x_2 &= 9, \\ 
x_1-2x_2-x_3 &= 5. 
$$

This system has the augmented matrix

$$
\mathbf{G} = 
\begin{bmatrix}
1 & -1 & -1 & 2 \\
3 & -2 & 0 & 9 \\
1 & -2 & -1 & 5
\end{bmatrix}.
$$

To ease the arithmetic, we do the elimination in Julia.

```{code-cell}
G = Rational.([1 -1 -1 2; 3 -2 0 9; 1 -2 -1 5])
```

The first elimination step uses multiples of the first row to eliminate below it. 

```{code-cell}
G[2,:] = G[2,:] - 3*G[1,:]
G
```

```{code-cell}
G[3,:] = G[3,:] - 1*G[1,:]
G
```

Next we use the second row to eliminate below it.

```{code-cell}
G[3,:] -= (-1)*G[2,:]
G
```

Having reached the last row, we turn around and use it to eliminate above it in column 3.

```{code-cell}
G[2,:] -= 1*G[3,:]
G
```

```{code-cell}
G[1,:] -= (-1/3)*G[3,:]
G
```

We move up to the second row and eliminate above that in column 2.

```{code-cell}
G[1,:] -= (-1)*G[2,:]
G
```

Finally, to be super pedantic, we normalize the last row by its leading nonzero.

```{code-cell}
G[3,:] = G[3,:]/G[3,3]
G
```

The result is the augmented matrix of the system

$$
\begin{matrix}
x_1 & & &= &1 \\
& x_2 & &= &-3 \\
& & x_3 &= &2,
\end{matrix}
$$

whose solution is obvious.

Here's an example that works out differently, starting from the augmented matrix

$$
\begin{bmatrix}
1 & 1 & -1 & 4 \\
1 & 2 & 2 & 3 \\
2 & 1 & -5 & 9
\end{bmatrix}.
$$

First, we use multiples of the first row to eliminate in the first column below it.

```{code-cell}
G = [ 1 1 -1 4; 1 2 2 3; 2 1 -5 9]
G[2,:] = G[2,:] - 1*G[1,:]
G[3,:] = G[3,:] - 2*G[1,:]
G
```

Now use a multiple of the second row to put a zero underneath it in column 2.

```{code-cell}
G[3,:] -= (-1)*G[2,:]
G
```

We have reached the last row, and it's time to turn around and eliminate upwards. But because the last row is entirely zero, it can't make changes to the rows above it. So we skip that and move up to the second row, eliminating upwards in the second column.

```{code-cell}
G[1,:] -= 1*G[2,:]
G
```

This is as simple as we can get things. The last row is telling us the astounding fact that $0=0$—i.e., nothing at all. The other two rows imply

\begin{align*}
x_1 &= 5 + 4x_3, \\
x_2 &= -1 - 3x_3.
\end{align*}

Since the third row gave us no information, we take the attitude that $x_3$ is unrestricted. That is,

\begin{align*}
x_1 &= 5 + 4s, \\
x_2 &= -1 - 3s, \\
x_3 &= s.
\end{align*}

is a solution for any value of $s$, and we have an infinite family of solutions.
