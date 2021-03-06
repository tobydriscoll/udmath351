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
# Undetermined coefficients

When it comes to finding particular solutions of nonhomogeneous problems, there is a simpler alternative to variation of parameters in the important special case when

1. The coefficients in the ODE are constants, and
2. The forcing function $f(t)$ is a polynomial, exponential, sin, or cos, or a combination of these.

Thus we now consider

```{math}
:label: eq-undetermined-ode
x'' + bx' + kx = f(t),
```

where $b$ and $k$ are constants, and $f$ appears in {numref}`table-undetermined-forcing`. 

```{list-table} Particular solutions for the method of undetermined coefficients.
:header-rows: 1
:name: table-undetermined-forcing

* - $f(t)$
  - $x_p(t)$
* - $b_n t^n + \cdots b_0$
  - $B_n t^n + \cdots + B_0$
* - $e^{rt}(b_n t^n + \cdots b_0)$
  - $e^{rt}(B_n t^n + \cdots B_0)$
* - $\cos(\omega t)$
  - $A \cos(\omega t) + B \sin(\omega t)$
* - $\sin(\omega t)$
  - $A \cos(\omega t) + B \sin(\omega t)$
```

```{index} ! method of undetermined coefficients
```

Corresponding to each $f$ in {numref}`table-undetermined-forcing` is a specific form for $x_p$ containing one or more constants (given by capital letters) that must be deduced by substituting into the particular ODE under consideration. This procedure is what gives the method its name, the **method of undetermined coefficients**.

(example-undetermined-const)=
::::{proof:example} 
Rework {numref}`Example {number} <example-variation_parameters-const>`, finding a particular solution of $x'' - x = 4$. 

:::{dropdown} Solution
The forcing function is a polynomial of degree zero, so $x_p$ should be as well. Let $x_p=A.$ Then it is a solution if

$$
4 = A'' - A = -A.
$$

Hence $A=-4$.
:::
::::

:::{caution}
In the case where $f$ is a polynomial that may have some zero coefficients, you *cannot* assume that $x_p$ has zero coefficients in the same positions.
:::

::::{proof:example}
Find a particular solution of $x'' +4x'+4x=8t^2$. 

:::{dropdown} Solution

The correct form of $x_p$ is a quadratic polynomial, i.e.,

```{math}
x_p(t) = A + Bt + Ct^2.
```

Plugging that into the ODE yields

\begin{align*}
2C + 4(B+2Ct) + 4(A+Bt+Ct^2) & = 8t^2,\\
4C t^2 + (8C+4B) + (2C+4B+4A) & = 8t^2.
\end{align*}

This has to be an identity for all $t$. Matching like powers, we get a $3\times 3$ linear system for the coefficients. Fortunately, it can be solved easily if we go in order: first we read off $C=2$, then $B=-2C=-4$, and finally $A=-B-C/2=3$. This provides us with

$$
x_p(t) =2t^2+4t+3.
$$
:::
::::

::::{proof:example}
Find a particular solution of $x'' - 2x'-3x=10e^{4t}$. 

:::{dropdown} Solution
The proper choice is

```{math}
x_p(t) = Ae^{4t}.
```

Everything else is algebra.

\begin{align*}
16A e^{4t} - 2 (4A e^{4t}) - 3 (Ae^{4t}) & =10 e^{4t},\\
16A -8A -3A &=  10.
\end{align*}.

From this it's clear that $A=2$.
:::
::::

::::{proof:example}
Find the general solution of $x''+x'=\sin(2t)$.

:::{dropdown} Solution
The homogeneous problem $x''+x'=0$ has roots $0$ and $-1$, hence

$$
x_h(t) = c_1 + c_2 e^{-t}.
$$

For the particular solution we must choose

```{math}
x_p(t) = A\cos(2t) + B\sin(2t).
```

Inserting this into the original ODE leads to

```{math}
[-4A\cos(2t) - 4B\sin(2t)] + [-2A\sin(2t) + 2B\cos(2t)] = \sin(2t).
```

This is identically true for all time if and only if we match the coefficients of like trig functions:

```{math}
-4A + 2B = 0, \qquad -4B-2A = 1.
```

The solution of these equations is $A=-1/10$, $B=-1/5$. Thus

$$
x(t) = c_1 + c_2 e^{-t} - \frac{1}{10}\cos(2t) - \frac{1}{5}\sin(2t).
$$
:::
::::

The examples above are the fundamental ones. If you have a forcing function that is a sum of terms from {numref}`table-undetermined-forcing`, then you can treat each term separately as above and add together the particular solutions found.

## Limitations

There are rules for more complicated combinations of the same functions, but we won't go into them. At some point the calculus/algebra becomes pretty intense. Furthermore, we are not going to cover a refinement of the rules necessary in certain circumstances where our simplified version fails.

(example-undetermined-resonance)=
::::{proof:example}
The equation $x''+x=\cos(\omega t)$ suggests the particular solution $x_p(t)=A\cos(\omega t)+B\sin(\omega t)$. Upon substitution,

$$
[-\omega^2 A\cos(\omega t) - \omega^2 B\sin(\omega t) ] + [ A\cos(\omega t) + B\sin(\omega t)] =\cos(\omega t),
$$

which leads to the conclusion that $B=0$ and, if $\omega^2 \neq 1$, $A=1/(1-\omega^2)$. However, if $\omega = 1$, the substitution would leave us with $0=\cos(t)$, which is impossible to satisfy for all $t$.
::::

The failure of {numref}`Example {number} <example-undetermined-resonance>` at $\omega = 1$ was due to the fact that the $x_p$ we tried is actually a homogeneous solution. This is not too hard to fix, but a general description is not worth the effort; we can always fall back to variation of parameters. 

(example-undetermined-resonance-fix)=
::::{proof:example}
We can make the tricky case $x''+x=\cos(t)$ from {numref}`Example {number} <example-undetermined-resonance>` quite easy by relating it to complex exponentials. Since $\cos(t)$ is the real part of $e^{it}$, it follows that the solution we seek is the real part of any particular solution of 

$$
x'' + x = e^{it}.
$$

Referring to {numref}`Example {number} <example-variation_parameters-resonance>` with $\lambda=i$, we use variation of parameters to find the particular solution

$$
\frac{1}{2i} t e^{i t} = -\frac{i}{2}t [\cos(t) + i\sin (t)].
$$

Upon taking the real part, we get

$$
x_p(t) = \frac{1}{2} t \sin(t).
$$
::::
