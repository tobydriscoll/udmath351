# Structure of linear problems

:::{attention}
You need to read and write carefully when in vector-land. In particular, note that $\mathbf{x}_1$ refers to the first vector of a collection, while $x_1$ means the first component of a vector $\mathbf{x}$.
:::

Virtually all of the theoretical statements we made about the scalar linear problem $x'=a(t)x+f(t)$ can be remade with boldface/capital letters for the linear system $\mathbf{x}'=\mathbf{A}(t)\mathbf{x}+\bff(t)$. Those statements relied mainly on linearity. Most notably:

(theorem-intro-general-system)=
::::{proof:theorem} General solution of first-order linear system
Every solution of 

$$
\mathbf{x}'=\mathbf{A}(t)\mathbf{x}+\bff(t)
$$ 

can be written in the form 

$$
\mathbf{x}=\mathbf{x}_h+\mathbf{x}_p,
$$ 

where $\mathbf{x}_h$ is the general solution of $\mathbf{x}'=\mathbf{A}(t)\mathbf{x}$ and $\mathbf{x}_p$ is any solution of $\mathbf{x}'=\mathbf{A}(t)\mathbf{x}+\bff(t)$.
::::	

Once again, then, we look first at the homogeneous system with no forcing term, and then for particular solutions of the original problem.

## Homogeneous equations 

Given 
:::{math}
:label: eq-structure-homog
\mathbf{x}' = \mathbf{A}(t)\mathbf{x}, 
:::

where $\mathbf{x}\in\mathbb{R}^{n}$ and $\mathbf{A}\in\mathbb{R}^{n\times n}$, we can easily show in the usual way that any linear combination of solutions is also a solution. In fact, we have a new way of stating this result.

```{index} ! solution space
```

(definition-structure-space)=
::::{proof:definition} Solution space
The set of all solutions of a homogeneous equation $\mathbf{x}' = \mathbf{A}(t)\mathbf{x}$ is a subspace of differentiable functions called the **solution space**.
::::

Our first major goal is to find a basis for the solution space.

## Fundamental matrix

Suppose $\mathbf{x}_1,\ldots,\mathbf{x}_m$ are homogeneous solutions of {eq}`eq-structure-homog`, and that we use a linear combination of them to satisfy an initial condition $\mathbf{x}(0)=\mathbf{x}_0$: 

:::{math}
	c_1 \mathbf{x}_1(0) + \cdots + c_m \mathbf{x}_m(0) = \mathbf{x}_0.
:::

Using the equivalence of linear combination with matrix-vector multiplication, we define the $n\times m$ matrix

:::{math}
:label: eq-structure-fundamental
\bfX(t) = \bigl[ \mathbf{x}_1(t) \; \mathbf{x}_2(t) \; \cdots \; \mathbf{x}_m(t)  \bigr],
:::

so that 

:::{math}
\bfX(0) \begin{bmatrix} c_1 \\ c_2 \\ \vdots \\ c_m \end{bmatrix} = \mathbf{x}_0.
:::

This is a linear algebraic system for the coefficients $c_i$. We can expect a unique solution if and only if $m=n$ and $\bfX(0)$ is invertible.  

```{index} ! fundamental matrix
```

(definition-structure-fundamental)=
::::{proof:definition} Fundamental matrix
The $n\times n$ matrix $\bfX(t)$ is a **fundamental matrix** of the homogeneous system $\mathbf{x}' = \mathbf{A}(t)\mathbf{x}$ if its columns satisfy

:::{math}
:label: eq-structure-columns
\mathbf{x}_j'=\mathbf{A}\mathbf{x}_j, \quad j=1,\ldots,n,
:::

and $\bfX(t)$ is invertible at all times in an open interval $I$ where $\bfA$ is continuous.
::::

:::{note}
A homogeneous system does not have a unique fundamental matrix.
:::

Because matrix multiplication can be interpreted columnwise, a statement equivalent to {eq}`eq-structure-columns` is 

$$
\bfX'=\bfA\bfX.
$$

The fundamental matrix gives all we need for the general homogeneous solution.

::::{proof:theorem}
If $\bfX$ is a fundamental matrix for $\bfx'=\bfA(t)\bfx$, then the general solution of this system is 

$$
\bfx_h = \mathbf{x}(t)=\mathbf{X}(t)\mathbf{c},
$$ 

for an arbitrary constant vector $\mathbf{c}$. 
::::

## Wronskian

Since invertibility is required for a fundamental matrix, we should not be surprised to see its determinant popping up. 

```{index} ! Wronskian; for vector-valued functions
```

(definition-structure-wronskian)=
::::{proof:definition} Wronskian

Let $\mathbf{x}_1,\ldots,\mathbf{x}_n$ be a collection of vector-valued functions where each $\bfx_i$ is $n$-dimensional. Their **Wronskian** is

:::{math}
W(t) = \det\Bigl( \bigl[ \mathbf{x}_1(t) \: \cdots \: \mathbf{x}_n(t)  \bigr] \Bigr).
:::
::::

(theorem-structure-wronskian)=
::::{proof:theorem} 
If $\mathbf{x}_1,\ldots,\mathbf{x}_n$ are solutions of {eq}`eq-structure-homog`, they are linearly independent in interval $I$ where $\bfA(t)$ is continuous if and only if their Wronksian is nonzero at any $t\in I$.
::::

::::{proof:example}
Suppose we have two solutions

$$
\mathbf{x}_1(t)=e^{\lambda_1 t}\mathbf{v}_1, \quad \mathbf{x}_2(t)=e^{\lambda_2 t}\mathbf{v}_2,
$$

where $\mathbf{v}_1$ and $\mathbf{v}_2$ are columns of an invertible $2\times 2$ constant matrix. Show that the Wronskian of these solutions is nonzero at all times.

:::{dropdown} Solution
Say $\mathbf{v}_1=[a,\,c]$ and $\mathbf{v}_2=[b,\,d]$. Then 

\begin{align*}
W(t) & = \det\Bigl( \bigl[ \mathbf{x}_1(t) \: \mathbf{x}_2(t)  \bigr] \Bigr)\\
& = \twodet{a e^{\lambda_1 t}}{be^{\lambda_2 t}}{c e^{\lambda_1 t}}{d e^{\lambda_2 t}}\\
& = e^{t(\lambda_1+\lambda_2)} (ad-bc) =  e^{t(\lambda_1+\lambda_2)} \det\Bigl(\bigl[\mathbf{v}_1\: \mathbf{v}_2\bigr]\Bigr) \\
\end{align*}

The exponential function is never zero, and the problem statement guarantees that the last determinant is nonzero. Hence $W$ is nonzero as well. 
:::
::::

