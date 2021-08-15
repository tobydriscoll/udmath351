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
(section-first_order-homogeneous1)=
# Homogeneous solutions

Step one of our [overall solution strategy](algorithm-linear-solve) is to solve the homogeneous problem $\opA[x]=0$, or

:::{math}
:label: eq-homogeneous-ode
\dd{x}{t} + P(t) x = 0.
:::

We know that the solution of $x=ax$ for constant $a$ is $x(t)=\exp(at)$. Let's guess that the solution is exponential in this case as well: 

$$
x(t) = \exp\bigl[q(t)\bigr],
$$

for some $q(t)$ yet to be determined. Note that 

$$
x'(t) = q'(t) e^{\,q(t)} = q'(t) x.
$$

If this is to be a solution of {eq}`eq-homogeneous-ode`, all we need is that $q'(t)=-P(t)$. This is solved by simple integration. To summarize:

(formula-homogeneous1-solution)=
````{proof:formula} Solution of $x'+P(t)x=0$
$$
q(t) &= - \int P(t) \, dt, \\
x(t) &= c_1 \exp\bigl[q(t)\bigr].
$$
````

:::{note}
We can ignore the integration constant that arises from finding $q$ in {numref}`Formula {number} <formula-homogeneous1-solution>`. It would just end up being absorbed into the $c_1$ whose existence is already known thanks to the linearity plus homogeneity.
:::

::::{proof:example}
Solve $x'=\sin(t) x$. 

:::{dropdown} Solution
We integrate $P(t)=-\sin(t)$ to get $\cos(t)$. Hence

$$
q(t) = - \cos(t).
$$

The general solution is thus 

```{math}
x(t) = c_1 \exp[ -\cos(t) ].
```
:::
::::

::::{proof:example}
Solve the homogeneous IVP

$$
t x' = 2x, \quad x(2) = 12.
$$

:::{dropdown} Solution
First we rewrite the ODE in standard form as 

$$
x' - \frac{2x}{t} = 0,
$$

from which we see that $P(t)=-2/t$. We first find the general solution by integration:

$$
x(t) = c_1 \exp\left[ \int 2t^{-1}\, dt \right] = c_1 \exp\bigl[2\ln(t)\bigr] = c_1 t^2.
$$

To eliminate the integration constant, we apply the initial condition:

$$
12 = x_h(2) = c_1\cdot 2^2.
$$

Hence $x(t) = 3t^2$.
:::
::::

