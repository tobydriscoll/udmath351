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
# Linear equations

We now begin a close look at the linear case. Linear problems are pretty much all we consider from this point on.

```{index} ! linear ODE; first-order
```

(definition-linear-ode)=
::::{proof:definition} First-order linear ODE
A **first-order linear ODE** is an equation of the form

```{math}
:label: eq-linear-def
a_0(t)\dd{x}{t} + a_1(t) x = g(t).
```
The **standard form** of such a problem is 

:::{math}
:label: eq-linear-standard
\dd{x}{t} + P(t) x = f(t).
:::

We call $f(t)$ the **forcing function**. 
::::

```{attention}
A linear ODE has a linear dependence on the unknown (dependent) variable $x$. It may have arbitrary dependence on the independent variable $t$. Also, the solution $x$ is usually not a linear function of $t$.
```

```{warning}
Never overlook the $a_0(t)$ in {eq}`eq-linear-def`. If you forget to divide through by it to get the standard form, everything that follows will be wrong.
```

## Operator notation

There is an alternate notation for {eq}`eq-linear-standard` that will help us highlight important properties of linearity.

(definition-linear-operator)=
::::{proof:definition} Linear operator
A **linear operator** $\opA$ is a rule for transforming functions to other functions, such that

\begin{align*}
\opA[cx(t)] & =c\opA[x(t)], \\
\opA[x(t) + y(t)] &= \opA[x(t)] + \opA[y(t)],
\end{align*}

for all functions $x,y$ and numbers $c$.
::::


In the present context we are interested in the operator

```{math}
:label: eq-linear-operator
\opA[x] = x' + P(t)x,
```

whose linearity you can easily check for yourself against the definition. We can now express the ODE {eq}`eq-linear-def` simply as

$$
\opA[x]=f.
$$

(example-linear-operator)=
::::{proof:example}
The equation

$$
t x' = \sin(t) - x
$$

is linear. To write it in operator form, we rearrange to

$$
x' + \frac{1}{t}x = \frac{\sin(t)}{t}.
$$

Thus the linear operator for this ODE is $\opA[x]=x' + \tfrac{1}{t}x$, and the ODE is 

$$
\opA[x] =  \frac{\sin(t)}{t}.
$$
::::

## Homogeneous solutions

```{index} ! homogeneous; ODE
```

The equation $\opA[x]=0$, or {eq}`eq-linear-standard` with zero forcing, plays a key role.

::::{proof:definition} Homogeneous ODE
A **homogeneous ODE** takes the form

$$
\dd{x}{t} + P(t)x = 0,
$$

or $\opA[x]=0$. 
::::

```{index} ! superposition
```

Linear homogeneous problems have a key property that allows turning individual solutions into sets of them. 

(theorem-linear-super)=
::::{proof:theorem} Superposition
If $x_1(t), x_2(t),\ldots x_k(t)$ are solutions of $\opA[x]=0$, then so is any linear combination $c_1x_1 + \cdots + c_kx_k$ for constants $c_j$. 
::::

::::{proof:proof}
Because of linearity we can write

```{math}
\opA[c_1x_1 + \cdots + c_kx_k] = c_1\opA[x_1] + \cdots + c_k\opA[x_k].
```

By assumption, each $\opA[x_j]=0$. So the sum on the right is zero as well.
::::

As a special case, if $x_1$ solves $\opA[x]=0$, then so does $c_1x_1$ for an arbitrary constant $c_1$.

## General solutions

Problems with nonzero forcing contain the homogeneous case within them, as the following result shows.

```{index} ! general solution
```

(theorem-linear-general)=
::::{proof:theorem}
All solutions of $\opA[x]=f$ may be written as

```{math}
x(t) = x_h(t) + x_p(t),
```
where $x_h$ is the general solution of $\opA[x]=0$ and $x_p$ is any particular solution of $\opA[x]=f$. We call this the **general solution** of the linear ODE.
::::

We have arrived at a solution strategy for $\opA[x]=f$.

(algorithm-linear-solve)=
::::{proof:algorithm} Solution of a first-order linear ODE
1. Find the general solution $x_h$ of the associated homogeneous problem $\opA[x]=0$.
2. Find any particular solution $x_p$ of the original $\opA[x]=f$.
3. Add them.
4. If an initial condition is given, use it to solve for the integration constant.
::::

Note that because of {numref}`Theorem {number} <theorem-linear-super>`, the homogeneous part $x_h$ will contain the integration constant. We elaborate on steps 1 and 2 in the next several sections.
