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
# Variation of parameters

{numref}`section-first_order-homogeneous1` explained how to find the general solution $x_h(t)$ of a homoegenous linear system $\bfA\bfx=\bfzero$. The next step of our [overall solution strategy](algorithm-linear-solve) is to find any particular solution of $\opA[x]=f$ for a given $f(t)$.

The form of the homogeneous solution is

$$
x_h(t) = c_1 g(t),
$$

where $c_1$ is an arbitrary constant and $g(t)$ is computed as the exponentiation of an integral. Something useful happens if we replace the constant by an unknown function of $t$. Setting $x_p(t)=k(t)g(t)$, then:

\begin{align*}
\opA[x_p] &= x_p' + P(t) x_p \\ 
& = (k'g+kg') + P k g \\ 
& = k'g + k(g'+Pg) \\ 
&= k'g + k\cdot\opA[g] = k'g.
\end{align*}

The last step occurs because $g$ is a homogeneous solution. We conclude that we can make $x_p$ as defined above a particular solution if we have $f=k'g$. This lets us solve for the unknown $k(t)$. 

This technique for finding $x_p$ is known as the **variation of parameters** formula, or VoP formula for short. But we present it here along with the rest of the steps in {numref}`Algorithm {number} <algorithm-linear-solve>` as a complete method to find the general solution.

(formula-firstlin-varpar)=
````{proof:formula} Variation of parameters (VoP)
To find a the general solution of $\opA[x]=f$, compute

\begin{align*}
g(t) &= \exp\left[ -\int P(t)\, dt\right], \\ 
k(t) &= \int \frac{f(t)}{g(t)}\, dt, \\
x_p(t) &= k(t)g(t), \\
x(t) &= c_1g(t) + x_p(t) = g(t)[ c_1 + k(t) ].
\end{align*}
````

:::{note}
As before, we can ignore the integration constant in finding $g$. We can ignore it for $k$ as well, but the last line shows that it effectively comes back anyway.
:::

:::{attention}
It might seem like the form $x=g(t)[c_1 + k(t)]$ must be the simplest, but that isn't always the case, as the next example shows.
:::

(example-vop-one)=
::::{proof:example}
Solve $3x'=12x+24t$.

:::{dropdown} Solution
Rewriting the ODE in standard form as $x'-4x=8t$, we identify $P(t)=-4$ and $f(t)=8t$. Then

```{math}
g(t) = \exp\left[ \int 4\,dt \right] = e^{4t},
```

and

```{math}
k(t) = \int \frac{8t}{e^{4t}}\, dt = -\frac{1}{2} (4t+1)e^{-4t},
```

where you need integration by parts (or a computer) to perform the integral. We have $x_p=kg$ and the general solution 

```{math}
x(t) = x_h(t) + x_p(t) = c_1 e^{4t} - \frac{1}{2} (4t+1).
```

If we were to write this as $g(t)[c_1 + k(t)]$, then we would miss out on the cancellation of $e^{4t}$ and $e^{-4t}$ that we got above.
:::
::::

::::{proof:example}
Find a particular solution of $x'= 2t x + 6t$. 

:::{dropdown} Solution
Note that $\opA[x]=x'-2tx$, so $P(t)=-2t$. We compute

```{math}
g(t) = \exp\left[ \int 2t\, dt \right] = e^{t^2}.
```

Then we can compute

```{math}
k(t) = \int \frac{6t}{e^{t^2}}\, dt  = -3 e^{-t^2}.
```

Finally,

```{math}
x_p(t) = k(t) g(t) = -3,
```

and the general solution is $x(t)=c_1 e^{t^2}-3$.
:::
::::


::::{proof:example}
Solve the IVP

$$
(2+t) x'= x - 1, \quad x(0) = -5.
$$

:::{dropdown} Solution
First we put the ODE into standard form,

```{math}
x' - \frac{1}{2+t} x = -\frac{1}{2+t}.
```

Then

```{math}
g(t) = \exp\left[ \int \frac{1}{2+t}\, dt \right] = \exp[ \ln(2+t) ] = 2+t.
```

Next,

```{math}
k(t) = \int \frac{-1}{2+t} (2+t)^{-1} \, dt = (2+t)^{-1},
```

so that the general solution is

```{math}
x(t) = c_1 (2+t) + (2+t)^{-1} (2+t) = c_1(2+t) + 1.
```

Finally, we apply the initial condition to solve for $c_1$:

$$
-5 = x(0) = 2c_1+1 \quad \implies \quad c_1=-3.
$$

Hence $x(t) = 1-3(2+t) = -5-3t.$
:::
::::

```{attention}
It takes a fairly special relationship between $P(t)$ and $f(t)$ to make the integrals in the VoP formula reasonable to do by hand. Conversely, if you are solving an exercise and find yourself faced with an impossible or really ugly integral, you likely have made some earlier mistake. 
```
