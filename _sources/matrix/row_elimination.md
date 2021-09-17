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

You've probably solved small systems of equations by substitution. In order to solve systems with more equations and variables, we systematize the idea as an elimination process. The goal of elimination is to transform the system to an equivalent one whose solution(s) we can deduce easily.

(example-gauss-elimination)=

::::{proof:example}

Use elimination to solve the $3\times 3$ system

\begin{align*}
x_1 - x_2  - x_3 & = 2, \\
3x_1 - 2x_2 & = 9, \\
x_1 - 2x_2 - x_3 & = 5.
\end{align*}

:::{dropdown} Solution

The first step is to use the first equation to eliminate $x_1$ from the second and third equations. We therefore subtract 3 times equation 1 from equation 2, and 1 times equation 1 from equation 3:

\begin{align*}
 x_1 - x_2  - x_3  & = 2, \\
(3x_1 - 2x_2) - 3(x_1 - x_2  - x_3) & = 9 - 3(2),\\
(x_1 - 2x_2 - x_3) - 1(x_1 - x_2  - x_3) & = 5 - 1(2) .
\end{align*}

This takes us to
\begin{align*}
 x_1 - x_2  - x_3  & = 2,  \\
x_2 + 3x_3 & = 3, \\
-x_2 &= 3.
\end{align*}

It's tempting to grab that last equation and use it to remove $x_2$ from everything else. That certainly works, and it's what you want to do by hand. But we are aiming for a fully automatic system that works every time, so we will act as though the last equation still contains $x_3$ and is not so trivial.

The next step of the recipe is to leave the first equation alone, and use the second to eliminate $x_2$ from all the others below it; in this case, it's just the third equation.

\begin{align*}
 x_1 - x_2  - x_3  & = 2, \\
x_2 + 3x_3 & = 3, \\
(-x_2) + (x_2+3x_3)  & = 3 + 3.
\end{align*}

We now have a system in so-called *triangular* form,

\begin{align*}
 x_1 - x_2  - x_3  & = 2, \\
x_2 + 3x_3 & = 3, \\
3x_3  & = 6.
\end{align*}
:::
::::

The process in [the preceding example](example-gauss-elimination) is most commonly known as **Gaussian elimination**. (It's a misnomer, as the process was known in China thousands of years before Gauss, but never mind.) We could solve the triangular system at the end of the example by starting with the last equation to deduce that $x_3=2$. We then put that value into the second equation and can solve that for $x_2$, etc.

Instead, though, we are going to continue to manipulate the system to get something even simpler.

(example-gauss-jordan)=

::::{admonition} Example (continued)
:class: tip 

We continue from the end of [the preceding example](example-gauss-elimination).  Having reached the last variable and equation, we turn around and eliminate *upwards* instead:

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

Continue moving upwards, to the second equation, and use it to eliminate within the one above it:

\begin{align*}
(x_1 - x_2 ) + (x_2) & = 4  + (-3),\\
x_2 & = -3,\\
3x_3  & = 6. 
\end{align*}

The system is now trivial: $x_1=1$, $x_2=-3$, and $3x_3=6$.
::::

That was a mouthful. We can lighten the notational load by using matrices. We start with the $m\times (n+1)$ **augmented matrix** $\bfG = [\bfA\:\bfb]$ that contains all the equation coefficients and right-side values. We repeat the previous process in augmented matrix form, starting from

$$
\bfG = 
\begin{bmatrix}
1 & -1 & -1 & 2 \\
3 & -2 & 0 & 9 \\
1 & -2 & -1 & 5
\end{bmatrix}.
$$

(Observe that when a variable is absent from an equation, its corresponding element in $\bfG$ is zero.) To ease the arithmetic, we do the elimination in MATLAB.

```{code-cell}
G = float([1 -1 -1 2; 3 -2 0 9; 1 -2 -1 5])
```

The first elimination step uses multiples of the first row to eliminate below it. Note that in MATLAB, `G[1,:]` refers to the entire first row of `G`, etc.

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

The process just demonstrated is best known as *Gauss–Jordan elimination*, or more simply, **row elimination**. As seen in the examples, row elimination consists of two phases, one downward (Gaussian elimination) and one upward. The goal is to put the augmented matrix into a special form.

In the next section we get more formal about the process and results. For now, let's look at an example that works out differently. We solve the system having augmented matrix

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