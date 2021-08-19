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

(section-first_order-preview)=
# Quick tour

For this part of the course we will be concerned with a **first-order ODE** (ordinary differential equation) written in the standard form

```{math}
:label: eq-preview-standard
\dd{x}{t} = f(t,x).
```

```{index} !dependent variable, !independent variable
```

We call $x$ the **dependent variable** and $t$ the **independent variable**. We use these particular variable names for theoretical discussion, but in practice the variables could be named anything. The term *first-order* indicates that only the first derivative appears and not $x''$, $x'''$, etc.

Given $f(t,x)$, the goal is to find the unknown function $x(t)$. A **solution*  to the ODE is a function $x(t)$ that makes {eq}`eq-preview-standard` a true equation when inserted. Finding solutions usually takes some effort, and for most realistic problems it cannot be done at all. However, if someone proposes a solution, it's easy to check whether that is the case: substitute it into the ODE and manipulate it until you can ascertain whether the equation holds. Some examples follow below.

Rather than getting too bogged down with generalities at this point, let's dive in to some illustrative archetypes of first-order equations.

(archetype-constant-change)=

## Constant change

You won't find an ODE easier than

```{math}
\dd{x}{t} = a, 
```

where $a$ is a constant. What kind of function has a constant derivative? A linear function. The solution is $x(t) = at + C$, where $C$ is an arbitrary constant. In words, the ODE says the solution has a constant rate of change, and therefore the solution must have a constant slope.

This problem is a special case of

$$
\dd{x}{t} = f(t).
$$

Unlike in the general ODE {eq}`eq-preview-standard`, the function $f$ here does not depend on the unknown solution. Therefore, the solution is an indefinite integral: $x(t) = \int f(t) \, dt$. As usual, the indefinite integration implies an arbitrary constant. As simple as this problem is, it reveals an important fact.

```{proof:observation} Nonuniqueness
Solutions of ODEs are not necessarily unique.
```

Now let's move one rung up the ladder of complexity.

## Constant growth

Suppose $x(t)$ represents a quantity of something that reproduces itself at a constant rate. In addition to biological agents such as bacteria and infected individuals, this could be upvoted memes on a social network, for example. Mathematically we have a fixed growth rate per capita, i.e.,

$$
\frac{1}{x} \dd{x}{t} = a
$$

for a positive constant $a$. This gives the ODE

```{math}
:label: eq-preview-const-growth
\dd{x}{t} = ax \qquad (a > 0). 
```

```{index} ! parameter
```

```{tip}
A named quantity such as $a$ that is neither the independent nor the dependent variable is often called a **parameter**. A parameter is assumed to be constant unless it is otherwise written, e.g., as $a(t)$, to show the dependence on $t$. A common convention is to make parameters be positive where reasonable. In that case, a negative value would include an explicit sign such as in $-a$.
```

It's trivial to check that

:::{math}
:label: eq-preview-const-growth-solution
x(t) = C e^{at}
:::

is a solution for any constant $C$. This reveals unbounded exponential growth in the solution as $t\to\infty$.

```{index} general solution
```

Again we get an integration constant, but this time it appears multiplicatively rather than additively. That is, the **general solution** {eq}`eq-preview-const-growth-solution` of the ODE is an entire family of functions, parameterized by $C$, describing many individual particular solutions. 

## Constant decay

Now consider

```{math}
:label: eq-preview-const-decay
\dd{x}{t} = -ax  \qquad (a > 0). 
```

This is constant per capita decay, which is true of radioactive isotopes and organism populations dying faster than they can breed. The general solution is 

$$
x(t) = C e^{-at},
$$

which is exponential decay to zero as $t\to\infty$.

```{index} ! autonomous equation
```

In this and the preceding archetype, the function $f$ in {eq}`eq-preview-standard` depends only on the solution $x$ and not explicitly on the independent variable $t$. Such an ODE is called **autonomous** or time-invariant.

Our next case study is *non-autonomous*.

## Variable growth/decay

Comparing

```{math}
:label: eq-preview-var-growth
\dd{x}{t} = 2tx
```

to constant growth, $x'=ax$, we could say that $2t$ plays the role of the growth rate $a$ here. In other words, this is a situation of *accelerating* growth. The general solution is

:::{math}
:label: eq-preview-var-growth-solution
x(t) = C e^{t^2},
:::

which grows superexponentially as $t\to\infty$. 

:::{proof:example}
Substituting {eq}`eq-preview-var-growth-solution` into {eq}`eq-preview-var-growth` yields

$$
\frac{d}{dt} \left( C e^{t^2} \right) &= 2t \left( C e^{t^2} \right) \\ 
C \left(2t e^{t^2} \right) &= 2t \left( C e^{t^2} \right),
$$

which is evidently true. Hence we have established {eq}`eq-preview-var-growth-solution` as a solution for any constant $C$. 
:::

More general variable growth looks like $x'=a(t)x$. If $a$ changes sign, the character of the equation flips between momentary growth and decay.

### Linear equations

```{index} linear ODE; first-order
```

All of the examples so far in this section have an ODE in the form

:::{math}
:label: eq-preview-linear
\dd{x}{t} = a(t) x + b(t),
:::

in which the dependent variable appears (if at all) just as itself to the first power. This is called a **linear** first-order ODE, because the dependence on $x$ is linear. 

Our final archetype is nonlinear.

## Nonlinear growth

Comparing

:::{math}
:label: eq-preview-nonlinear
\dd{x}{t} = x^2
:::

to constant growth $x'=ax$, it is irresistable to interpret this equation as a growth process whose rate at any instant is the momentary value of the solution itself. This suggests a kind of runaway feedback loop.

The general solution is

:::{math}
:label: eq-preview-nonlinear-solution
x(t) = \frac{1}{C-t}.
:::

(example-preview-nonlinear)=
::::{proof:example} 
The derivative of {eq}`eq-preview-nonlinear-solution` leads to

$$
\dd{x}{t} = -(C-t)^{-2}\cdot \dd{}{t}(C-t) = (C-t)^{-2} = x^2.
$$

This proves we have a solution of {eq}`eq-preview-nonlinear`.
::::

```{index} finite-time singularity
```

Note that for $C>0$ in {eq}`eq-preview-nonlinear`, $x(t)\to \infty$ as $t\to C^{-1}$. This is a *finite-time blowup*, which we did not observe in any of the linear growth processes.

```{note}
You might rightly wonder about the validity of a mathematical model that leads to an infinite result in finite time. But this particular ODE describes, for instance, the evolution of the slope of the line of sight to an airplane flying straight over you. When the airplane is directly overhead, the slope is infinite. So while the model becomes mathematically invalid at that moment, it does describe a concrete physical situation.
```

That concludes the movie trailer for first-order equations. We'll have our hands full understanding how to solve linear problems, so we will not return to nonlinear problems for a while.
