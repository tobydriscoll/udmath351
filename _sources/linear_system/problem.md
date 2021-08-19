
# Defining the problem

## One variable

It might feel silly, but let's review what it means to solve the linear equation

$$ax = b$$

for $x$.

- If $a\neq 0$, there is a unique solution, $x=b/a$.
- Otherwise,
   - If also $b=0$, then every value of $x$ is a valid solution.
   - Otherwise, there are no solutions.

It turns out that no matter how many equations and variables we have, the only three possibilites are the ones above: zero, one, or infinitely many solutions. The main difference is that the condition "$a=0$" has to be generalized.

(definition-linear_systems-consistent)=
::::{proof:definition} Consistent linear system
A linear system that has at least one solution is called **consistent**. Otherwise, it is **inconsistent**.
::::

## Two variables

Going one more baby step to two equations in two variables, we want to solve

\begin{align*}
ax + by &= f, \\
cx + dy &= g.
\end{align*}

There is some easy geometric intuition here. Each equation represents a straight line in the plane, and solving both equations simultaneously means finding an intersection of these lines. Our cases above translate directly into:

- If the lines are not parallel, there is a unique solution.
- Otherwise,
   - If the lines are identical, there are infinitely many solutions.
   - Otherwise, there are no solutions.

It's not hard to turn those statements into algebraic conditions. The slopes of the two lines are (ignoring infinities for a moment) $-a/b$ and $-c/d$, and we can say the slopes are equal if and only if $ad=bc$.

- If $ad \neq bc$, there is a single solution.
- Otherwise,
   - If one equation is a multiple of the other, there are infinitely many solutions.
   - Otherwise, there are no solutions.

::::{proof:example}
Find all solutions to the equations

\begin{align*}
x - 3y & = 1, \\
-2x + 6y & = 2.
\end{align*}

:::{dropdown} Solution

We identify $(a,b,c,d)=(1,-3,-2,6)$, and $ad-bc=6-6=0$. So we know there is not a unique solution (i.e., the lines are parallel). Dividing the second equation by $-2$ leads to the equivalent system

\begin{align*}
x - 3y & = 1, \\
x - 3y & = -1.
\end{align*}

It's now clear that there is no way to satisfy both equations simultaneously. The system is inconsistent.
:::
::::

## General case

Time to put on our big-kid pants. For $m$ equations in $n$ variables, we need to use subscripts rather than different letters for everything:

:::{math}
:label: eq-linear_systems-def
A_{11} x_1 + A_{12} x_2 + \cdots + A_{1n} x_n & = b_1 \\
A_{21} x_1 + A_{22} x_2 + \cdots + A_{2n} x_n & = b_2 \\
& \vdots \\
A_{m1} x_1 + A_{m2} x_2 + \cdots + A_{mn} x_n & = b_m.
:::

The solution is the list of values $x_1,\ldots,x_n$. We want to gather those into a single mathematical object.

```{index} ! vector
```

(definition-linear_systems-vector)=
::::{proof:definition} Vector
A **vector** is a finite collection of numbers called its elements. The set of all vectors with $n$ real-valued elements is denoted $\real^n$. If the elements are complex numbers, we use the symbol $\complex^n$. 
::::

I use boldfaced lowercase letters to represent vectors, and a subscript to refer to an individual element within one. For instance, $x_3$ is the third element of a vector $\bfx$. Note that the values on the right sides of the equations in {eq}`eq-linear_systems-def` form another vector $\bfb\in\real^m$. 

Then we come to the doubly-indexed values $A_{ij}$. The first index is the equation number, and the second corresponds to the variable number. We want to collect these numbers also into a single object.

```{index} ! matrix
```

(definition-linear_systems-matrix)=
::::{proof:definition} Matrix
A **matrix** is an $m\times n$ array of numbers called its elements. The set of all $m\times n$ matrices with real elements is denoted $\rmn{m}{n}$, and with complex elements it's $\cmn{m}{n}$. 
::::

I use boldfaced uppercase letters to represent matrices, and a pair of subscripts to refer to an individual element within one. For instance, $A_{23}$ is the element in row 2, column 3 of the matrix $\bfA$.

```{note}
Matrix subscripts are always in the order row first, column second. (This is the opposite of Excel, which is just one of myriad reasons that Excel is evil.)
```

In the context of {eq}`eq-linear_systems-def`, we call the $m\times n$ matrix $\bfA$ the **coefficient matrix** of the linear system. Altogether, $\bfA$ and $\bfb$ are the data of the linear system, and $\bfx$ is the solution.

::::{proof:example}
Sometimes zeros are needed as placeholders in the coefficient matrix. In the linear system

\begin{align*}
  x_1 - x_2 + 3 x_3 &= 4,\\
  2x_2 + 5x_4 &= -1,
\end{align*}

the coefficient matrix is $2\times 4$, 

$$
\bfA =
\begin{bmatrix}
1 & -1 & 3 & 0 \\ 0 & 2 & 0 & 5
\end{bmatrix},
$$

and the right-side vector is $\twovec{4}{-1}$.
::::
