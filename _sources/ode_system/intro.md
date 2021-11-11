# Introduction to systems

A **vector-valued ODE** is an equation in the form

:::{math}
:label: eq-intro-vector-ode
\frac{d \bfx}{dt} = \bff(t,\bfx), 
:::

where $\bfx$ is an $n$-dimensional vector. An equivalent point of view and terminology is a coupled system of scalar ODEs,

:::{math}
:label: eq-intro-system
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

We will shortly be limiting our attention to systems in which the dependence in {eq}`eq-intro-system` of each $f_i$ on each $x_j$ is linear. First, though, we mention an important connection between first-order systems and higher-order problems.
## Conversion of higher-order ODEs

The restriction to first-order ODEs in {eq}`eq-intro-vector-ode` is actually no limitation at all. Any higher-order equation, or system of higher-order equations, can be converted to a first-order system by increasing the dimension.

:::{proof:observation}
Order of derivative can be exchanged for dimension.
:::

(example-intro-pendulum)=
::::{proof:example}
The nonlinear pendulum equation

$$
\theta'' + \frac{g}{L} \sin(\theta) = f(t)
$$

can be transformed by the change of variables $x_1=\theta$, $x_2=\theta'$ into 

$$
\begin{aligned}
x_1' &= x_2 \\ 
x_2' &= f(t) - \frac{g}{L}\sin(x_1),	
\end{aligned}
$$

which is of the form {eq}`eq-intro-vector-ode`.
::::

The transformation in {numref}`Example {number} <example-intro-pendulum>` has the physical interpretation of using position and angular momentum as the dependent unknowns; together these are the **state** of the system. The technique is straightforward to generalize to any problem or system having ODEs of order greater than one, and most software for solving ODEs numerically requires you to make that transformation yourself. We will encounter just one more significant example, though.

(example-intro-sho-system)=
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

