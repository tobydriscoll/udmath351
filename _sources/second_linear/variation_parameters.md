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
(section-second_linear-vop)=
# Variation of parameters

```{index} variation of parameters
```

{numref}`section-second_linear-const_coeff` and {numref}`section-second_linear-complex` explained how to find the general solution $x_h(t)$ of a homoegenous linear system $\opA[x]=0$. We need to perform that same step for a nonhomogeneous problem $\opA[x]=f$, but then also find a particular solution of the original equation. One possibility is to adapt the *variation of parameters* technique used for first-order problems in {numref}`section-first_order-vop`.

The form of the homogeneous solution is

$$
x_h(t) = c_1 x_1(t) + c_2 x_2(t),
$$

where $x_1$ and $x_2$ are indepdendent homogeneous solutions. Now we replace the constants $c_1$ and $c_2$ with functions of $t$:

:::{math}
:label: eq-vop-ansatz
x_p(t) = u_1(t) x_1(t) + u_2(t) x_2(t).
:::

It follows that

$$
x_p' = u_1'x_1 + u_1 x_1' + u_2'x_2 + u_2 x_2'. 
$$ 

We are trying to find a way to choose $u_1$ and $u_2$ that makes $x_p$ a particular solution. Our lives will be a lot easier if we start with the constraint

:::{math}
:label: eq-variation_parameters-eq1
u_1'x_1 + u_2'x_2 = 0,
:::

which implies $x_p' = u_1 x_1' + u_2 x_2'$. Let's see if we can get away with that. We differentiate again to get

$$
x_p'' = u_1'x_1' + u_1 x_1'' + u_2'x_2' + u_2 x_2''.
$$

Since $\opA[x] = x'' + bx' +k$, we get

$$
\opA[x_p] = u_1 (x_1'' + bx_1' + kx_1) + u_2 (x_2'' + bx_2' + kx_2) + ( u_1'x_1' + u_2'x_2').
$$

We are in great shape now. Since $x_1$ and $x_2$ are homogeneous solutions, we just have $\opA[x_p] = u_1'x_1' + u_2'x_2'$. So we need only to introduce the additional requirement

:::{math}
:label: eq-variation_parameters-eq2
u_1'x_1' + u_2'x_2' = f,
:::

and then $x_p$ will be the desired particular solution.

Equations {eq}`eq-variation_parameters-eq1` and {eq}`eq-variation_parameters-eq2` impose

$$
x_1 u_1' + x_2 u_2' &= 0, \\ 
x_1'u_1' + x_2'u_2' &= f.
$$

Writing $u_1'=v_1$ and $u_2'=v_2$, we see that this is a pair of linear equations for $v_1$ and $v_2$, which is routine to solve, leading to the following.

(formula-variation_parameters)=
::::{proof:formula} Variation of parameters (2nd order)
Let 

$$
u_1 = \int \frac{-x_2 f}{W}\, dt, \quad u_2 = \int \frac{x_1 f}{W}\, dt,
$$

where $W$ is the Wronskian of independent homogeneous solutions $x_1$ and $x_2$. Then a particular solution of $\opA[x]=f$ is 

$$
x_p(t) = u_1(t) x_1(t) + u_2(t) x_2(t).
$$
::::

:::{note}
Isn't it handy now that the Wronskian is never zero?
:::

:::{note}
The integration constants for $u_1$ and $u_2$ can be taken to be zero. Any value is valid, and we need just one particular solution.
:::

(example-variation_parameters-const)=
::::{proof:example} 
Find a particular solution of $x'' - x = 4$. 

:::{dropdown} Solution
There's no getting around the need for the homogeneous solution here. The characteristic roots are $\pm 1$, so we take $x_1=e^t$, $x_2=e^{-t}$. Then $W=(e^t)(-e^{-t}) - (e^{-t})(e^t) = 2$, and 

$$
u_1' = \frac{-4 e^{-t}}{-2}, \quad u_2' = \frac{4 e^{t}}{-2}.
$$

From here we find $u_1 = -2e^{-t}$ and $u_2 = -2e^t$. Hence 

$$
x_p = (-2e^{-t})(e^t) + (-2e^t)(e^{-t}) = -4.
$$

You can instantly check that this result is correct.
:::
::::

(example-variation_parameters-resonance)=
::::{proof:example} 
Find a particular solution of $x'' - \lambda^2 x = 2 e^{\lambda t}$, where $\lambda\neq 0$. 

:::{dropdown} Solution
The homogeneous equation has roots $\pm \lambda$. We choose $x_1=e^{\lambda t}$, $x_2=e^{-\lambda t}$. Now

$$
W = \twodet{e^{\lambda t}}{e^{-\lambda t}}{\lambda e^{\lambda t}}{-\lambda e^{-\lambda t}} = -2\lambda.
$$

This gives

$$
u_1' = \frac{ - 2 e^{-\lambda t} e^{\lambda t}}{-2\lambda}, \quad u_2' = \frac{ 2 e^{\lambda t} e^{\lambda t} }{-2\lambda}.
$$

Thus,

$$
u_1 = \frac{1}{\lambda} \int dt = \frac{t}{\lambda}, \quad 
u_2 = -\frac{1}{\lambda} \int e^{2 \lambda t}\, dt  = -\frac{1}{2 \lambda^2} e^{2 \lambda t}.
$$

Finally,

$$
x_p(t) = \frac{1}{\lambda} t e^{\lambda t}  - \frac{1}{2 \lambda^2} e^{\lambda t}
$$

is a particular solution. However, the second term is a constant mutiple of $x_1$, so we could drop it and still have a particular solution.
:::
::::

As you can see, the VoP formula is pretty great if you happen to be a robot. [Note to editor: insert CAPTCHA here.] Us humans, though, could use something a little easier, and that is coming next.