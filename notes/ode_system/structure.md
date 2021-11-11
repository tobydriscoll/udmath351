# Linear ODE systems

Rather than the fully general system {eq}`eq-intro-vector-ode`, we will focus on linear problems.

(definition-intro-linear-ODE-system)=
::::{proof:definition} Linear system of ODEs
A **linear ODE system** is an equation of the form

:::{math}
:label: eq-structure-vector-linear
\mathbf{x}' = \mathbf{A}(t)\mathbf{x} + \bff(t),
:::

where $\mathbf{x}$ is an $n$-dimensional vector, $\mathbf{A}$ is an $n\times n$ **coefficient matrix**, and $\bff(t)$ is an $n$-dimensional **forcing function**. If the coefficient matrix does not depend on time, the system is said to be **constant-coefficient**. 

If given, an **initial condition** of the system is a time $t_0$ and vector $\mathbf{x}_0$ such that $\mathbf{x}(t_0)=\mathbf{x}_0$. 
::::

```{attention}
The matrix in {eq}`eq-structure-vector-linear` must be square.
```

(example-structure-sho-system)=
::::{proof:example} 
The simple harmonic oscillator system in {numref}`Example {number} <example-intro-sho-system>` is equivalent to 

$$
\bfu' = \twomat{0}{1}{-\omega_0^2}{-2 \omega_0 \zeta} \bfu + \twovec{0}{f},
$$

where $u_1 = x$, $u_2 = x'$ is the state vector.
::::


(example-intro-twotanks)=
::::{proof:example}

Suppose two connected tanks hold brine. Tank 1 holds 100 L, has an input of 4 L/hr of brine of concentration 3 kg/L, and an output of 6 L/hr. Tank 2 holds 200 L, has an input of 7 L/hr of brine of concentration 5 kg/L, and an output of 5 L/hr. Tank 1 pumps 1 L/hr into tank 2, and tank 2 pumps 3 L/hr into tank 1. 

Let $x_i(t)$ be the mass of salt in tank $i$. The statements above imply 

\begin{align*}
\dd{x_1}{t} & = 4\cdot 3 - 6\cdot \frac{x_1}{100} - 1\cdot \frac{x_1}{100} + 3 \cdot \frac{x_2}{200}  \\
\dd{x_2}{t} & = 7\cdot 5 - 5\cdot \frac{x_2}{200} - 3\cdot \frac{x_2}{200} +  1\cdot \frac{x_1}{100}\\
\end{align*}.

This is neatly expressed using linear algebra: 

:::{math}
\dd{}{t} \twovec{x_1}{x_2} = \frac{1}{200}\twomat{-14}{3}{2}{-8} \twovec{x_1}{x_2} + \twovec{12}{35}.
:::
::::

(example-intro-heating)=
::::{proof:example}
Here is a basic model for heating in a house. Let $b(t)$ be the temperature of the basement, $m(t)$ be the temperature of the main living area, and $a(t)$ be the temperature of the attic. Suppose the ground is at a constant 10 degrees C. We use a Newtonian model to describe how the temperature of the basement evolves due to interactions with the earth and the main floor:

:::{math}
\frac{db}{dt} = -k_b (b - 10) - k_{mb} (b-m). 
:::

Similarly, the attic interacts with the air, which we will hold at 2 degrees, and the main floor:

:::{math}
\frac{da}{dt} = -k_a (a - 2) - k_{ma} (a-m). 
:::

Finally, suppose the main area interacts mostly with the other levels and experiences input from a heater:

:::{math}
\frac{dm}{dt} = -k_{mb} (m - b) - k_{ma} (m - a) + h(t).
:::

To write the system in vector form, we define $x_1=b$, $x_2=m$, and $x_3=a$. Then

$$
\frac{d\bfx}{dt} = \threevec{(-k_b - k_{mb}) x_1  +k_{mb} x_2}{ k_{mb}x_1 -(k_{mb}+k_{ma})x_2 + k_{ma}x_3}{k_{ma}x_2  -(k_{ma}+k_a)x_3} + \threevec{10k_b}{h(t)}{2k_a}.
$$

Observe that on the right side, the terms depending on $\bfx$ have been separated from the others. Hence

$$
\bfx' = \begin{bmatrix} -k_b-k_{mb} & k_{mb} & 0 \\ k_{mb} & -k_{mb}-k_{ma} & k_{ma} \\  0 & k_{ma} & -k_{ma}-k_a \end{bmatrix}  \bfx + \threevec{10k_b}{h(t)}{2k_a}.
$$
::::

:::{attention}
You need to read and write carefully when in vector-land. In particular, note that $\mathbf{x}_1$ refers to the first vector of a collection, while $x_1$ means the first component of a vector $\mathbf{x}$.
:::

## General solutions

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

Once again, then, we look first at the homogeneous system with no forcing term.

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

### Fundamental matrix

Suppose $\mathbf{x}_1,\ldots,\mathbf{x}_m$ are homogeneous solutions of {eq}`eq-structure-homog`, and that we use a linear combination of them to satisfy an initial condition $\mathbf{x}(0)=\mathbf{x}_0$: 

:::{math}
	c_1 \mathbf{x}_1(0) + \cdots + c_m \mathbf{x}_m(0) = \mathbf{x}_0.
:::

Using the equivalence of linear combination with matrix-vector multiplication, we define the $n\times m$ matrix

:::{math}
:label: eq-structure-fundamental
\fundm(t) = \bigl[ \mathbf{x}_1(t) \; \mathbf{x}_2(t) \; \cdots \; \mathbf{x}_m(t)  \bigr],
:::

so that 

:::{math}
\fundm(0) \begin{bmatrix} c_1 \\ c_2 \\ \vdots \\ c_m \end{bmatrix} = \mathbf{x}_0.
:::

This is a linear algebraic system for the coefficients $c_i$. We can expect a unique solution if and only if $m=n$ and $\bfX(0)$ is invertible.  

```{index} ! fundamental matrix
```

(definition-structure-fundamental)=
::::{proof:definition} Fundamental matrix
The $n\times n$ matrix $\fundm(t)$ is a **fundamental matrix** of the homogeneous system $\mathbf{x}' = \mathbf{A}(t)\mathbf{x}$ if its columns satisfy

:::{math}
:label: eq-structure-columns
\mathbf{x}_j'=\mathbf{A}\mathbf{x}_j, \quad j=1,\ldots,n,
:::

and $\fundm(t)$ is invertible at all times in an open interval $I$ where $\bfA$ is continuous. Equivalently,

$$
\fundm'=\bfA\fundm.
$$
::::

:::{note}
A homogeneous system does not have a unique fundamental matrix.
:::

The fundamental matrix gives all we need for the general homogeneous solution.

::::{proof:theorem}
If $\fundm$ is a fundamental matrix for $\bfx'=\bfA(t)\bfx$, then the general solution of this system is 

$$
\bfx_h = \mathbf{x}(t)=\fundm(t)\mathbf{c},
$$ 

for an arbitrary constant vector $\mathbf{c}$. 
::::

### Wronskian

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
Suppose that $\mathbf{x}_1,\ldots,\mathbf{x}_n$ are solutions of {eq}`eq-structure-homog`, and $I$ is an interval where $\bfA(t)$ is continuous. The following are equivalent statements:

1. $\mathbf{x}_1,\ldots,\mathbf{x}_n$ are linearly independent in $I$.
2. $\mathbf{x}_1,\ldots,\mathbf{x}_n$ are columns of a fundamental matrix.
3. The Wronksian of $\mathbf{x}_1,\ldots,\mathbf{x}_n$ is nonzero at all $t\in I$.
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

