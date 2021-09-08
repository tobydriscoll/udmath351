# Introduction to systems

A **vector-valued ODE** is an equation in the form

:::{math}
:label: eq-intro-vector-ode
\frac{d \bfx}{dt} = \bff(t,\bfx), 
:::

where $\bfx$ is an $n$-dimensional vector. An equivalent point of view and terminology is a coupled system of scalar ODEs,

:::{math}
\begin{split}
\frac{dx_1}{dt} &= f_1(t,x_1,\ldots,x_n),\\
& \vdots \\
\frac{dx_n}{dt} &= f_n(t,x_1,\ldots,x_n).
\end{split}
:::

::::{proof:example}
A famous system of three ODEs is the **Lorenz system**,

:::{math}
\begin{split}
\dot{x} & = \sigma(y-x), \\
\dot{y} & = \rho x - y - x z, \\
\dot{z} & = -\beta z + x y,
\end{split}
:::

where the dots indicate time derivatives and $\sigma$, $\rho$, and $\beta$ are constant parameters. Conversion to the system notation follows from the definitions $x_1=x$, $x_2=y$, and $x_3=z$, though of course the ordering is arbitrary.
::::

To define an initial-value problem, we supplement {eq}`eq-intro-vector-ode` with the initial condition

$$
\bfx(0) = \bfx_0.
$$

## Linear problems

We will be limited to linear problems.

(definition-intro-linear-ODE-system)=
::::{proof:definition} Linear system of ODEs
A **linear ODE system** is an equation of the form

:::{math}
:label: eq-intro-vector-linear-ode
\mathbf{x}' = \mathbf{A}(t)\mathbf{x} + \bff(t),
:::

where $\mathbf{x}$ is an $n$-dimensional vector, $\mathbf{A}$ is an $n\times n$ **coefficient matrix**, and $\bff(t)$ is an $n$-dimensional **forcing function**. If the coefficient matrix does not depend on time, the system is said to be **constant-coefficient**. 

If given, an **initial condition** of the system is a time $t_0$ and vector $\mathbf{x}_0$ such that $\mathbf{x}(t_0)=\mathbf{x}_0$. 
::::

(example-intro-twotanks)=
::::{proof:example}

Consider two connected tanks holding brine. Tank 1 holds 100 L, has an input of 4 L/hr of brine of concentration 3 kg/L, and an output of 6 L/hr. Tank 2 holds 200 L, has an input of 7 L/hr of brine of concentration 5 kg/L, and an output of 5 L/hr. Tank 1 pumps 1 L/hr into tank 2, and tank 2 pumps 3 L/hr into tank 1. 

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

## Conversion of higher-order ODEs

:::{proof:observation}
Order can be exchanged for dimension.
:::

::::{proof:example}
The simple harmonic oscillator

$$
x'' + 2 \zeta \omega_0 x' + \omega_0^2 x = f(t)
$$

can be converted to an equivalent first-order system using the definitions

$$
u_1 = x, \quad u_2 = x'.
$$

We can easily derive an ODE for $\bfu$ without reference to $x$. First, by definition, $u_1'=u_2$. Next, $u_2' = x''$, and we can isolate $x''$ in the original equation to get

$$
u_2' = f - 2 \zeta \omega_0 x' - \omega_0^2 x = f - 2 \omega_0\zeta  u_2 - \omega_0^2 u_1.
$$

Hence

:::{math}
u_1' &= u_2,\\
u_2' &= f - 2 \omega_0 \zeta  u_2 - \omega_0^2 u_1.
:::

In vector form this is

$$
\bfu' = \twomat{0}{1}{-\omega_0^2}{-2 \omega_0 \zeta} \bfu + \twovec{0}{f}.
$$
::::

<!-- ::::{proof:example}
A frictionless pendulum is governed by the nonlinear equation $\theta''+ \frac{g}{L}\sin(\theta)=0$, where $\theta(t)$ is the angle made by the pendulum from the straight-down position. Define 

$$
u_1=\theta, \quad u_2=\theta'.
$$ 

Then $u_1'=u_2$. Since $u_2'=\theta''$, we can use the original ODE to express it in terms of $\theta$ and $\theta'$, and hence in terms of $u_1$ and $u_2$. Altogether the system is, in vector notation, 

:::{math}
\twovec{u_1'}{u_2'} = \twovec{u_2}{- \frac{g}{L}\sin(u_1)}.
:::
:::: -->

:::{attention}
While every high-order problem can be converted to a first-order system, the converse is not true. That is, there are first-order systems that are not equivalent to any higher-order problem. 
:::

The technique illustrated above generalizes to equations of any order, and to systems of equations of any orders (including nonlinear problems). 

<!-- The formal procedure is a bit complicated to describe but fully automatic; there are no decisions to make. The key is to *include a component for each of the lower-order derivatives of each variable*, whether or not those terms appear explicitly in the original problem. Everything else flows from these definitions.

::::{proof:example}
Two pendulums hanging from a bar and swinging in parallel planes are coupled through torsion on the bar, obeying

\begin{align*}
\theta_1''+ b\theta_1' + \frac{g}{L}\sin(\theta_1) + \kappa(\theta_1-\theta_2) & = 0 \\
\theta_2''+ b\theta_2' + \frac{g}{L}\sin(\theta_2) + \kappa(\theta_2-\theta_1) & = 0 \\
\end{align*}

Express this as a first-order system.

:::{dropdown} Solution
We define 

$$
u_1 = \theta_1, \quad u_2 = \theta_1', \quad u_3 = \theta_2, \quad u_4 = \theta_2'.
$$

Two differential equations, $u_1'=u_2$ and $u_3'=u_4$, follow immediately from these definitions. The remaining two come from substituting into the original ODEs: 

\begin{align*}
	u_2' = \theta_1'' & = - b u_2 - \frac{g}{L}\sin(u_1) - \kappa(u_1-u_3)\\
	u_4' = \theta_2'' & = - b u_4 - \frac{g}{L}\sin(u_3) - \kappa(u_3-u_1)\\
\end{align*}

The result is a four-dimensional, first-order system $\mathbf{u}'=\mathbf{f}(t,\mathbf{u})$.
:::
:::: -->

