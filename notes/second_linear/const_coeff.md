(section-second_linear-const_coeff)=
# Homogeneous solutions

The linear second-order problem $\opA[x]=f$ has a nice structure, but only a few such problems are straightforward to solve. We will now, and for the rest of the chapter, limit ourselves to the **constant-coefficient** problem

```{math}
:label: second_linear-cc-def
x'' + bx' + k x = f(t),
```

in which $b$ and $k$ are constant, and $f(t)$ is a forcing function.

:::{note}
In {eq}`second_linear-cc-def` the coefficient $b$ has units $1/T$, the coefficient $k$ has units $1/T^2$, and $f(t)$ has units $X/T^2$, where $X$ and $T$ are the units of $x$ and $t$, respectively.
:::

## Characteristic polynomial

We start with solutions of the homogeneous equation

$$
x'' + b x' +  k x = 0.
$$

We will use $x_h$ to name the general solution, since it might be part of the solution to a nonhomogeneous equation.

The boss of ODE solution methods is to guess the answer and then show that it works. In that tradition, we try

$$
x_h(t) = e^{\lambda t}
$$

for a to-be-determined value of $\lambda$. We substitute it into the ODE and get

\begin{align*}
0 &= \lambda^2 e^{\lambda t} + b \bigl(\lambda e^{\lambda t}\bigr) + k \bigl(e^{\lambda t}\bigr)\\ 
&= e^{\lambda t} \bigl(\lambda^2 + b \lambda + k \bigr).
\end{align*}

We therefore know that $x_h$ is a homogeneous solution provided that $\lambda^2 + b \lambda + k =0$.

```{index} ! characteristic polynomial; of a linear ODE
```

::::{proof:definition} Characteristic polynomial of a linear ODE
The **characteristic polynomial** of the linear operator $\opA[x]=x''+bx'+kx$ is

$$
p(s) = s^2 + b s + k.
$$

Its roots are called the **characteristic values** of $\opA$. For brevity, we will often refer to these as simply the **roots** of $\opA$, although this usage is not standard.
::::

(theorem-second_linear-homogeneous-distinct)=
````{proof:theorem} Homogeneous solution, distinct roots
Let $\lambda_1,\lambda_2$ be the characteristic values of $\opA$, where $\opA[x]=x''+bx'+kx.$ If  $\lambda_1\neq \lambda_2$, then the general solution of $\opA[x]= 0$ is

```{math}
:label: eq-const_coeff-distinct
x_h(t) = c_1 e^{\lambda_1 t} + c_2 e^{\lambda_2 t}.
```
````

Part of what makes {eq}`eq-const_coeff-distinct` work is that $e^{\lambda_1 t}$ and $e^{\lambda_2 t}$ are indepdendent solutions, because

$$
\twodet{e^{\lambda_1 t}}{e^{\lambda_2 t}}{\lambda_1 e^{\lambda_1 t}}{\lambda_2 e^{\lambda_2 t}}
= (\lambda_2-\lambda_1)e^{(\lambda_1+\lambda_2)t},
$$

which is never zero.

We have to handle the case $\lambda_1=\lambda_2$ separately. 

(theorem-second_linear-homogeneous-repeated)=
````{proof:theorem} Homogeneous solution, repeated root
Let $\lambda$ be a double root of $\opA$, where $\opA[x]=x''+bx'+kx.$ The general solution of $\opA[x]= 0$ is

```{math}
:label: second_linear-homogeneous-repeated
x_h(t) = e^{\lambda t} \bigl( c_1 t + c_2 \bigr).
```
````

::::{proof:example}
The trivial problem $x''=0$ is linear, with $b=k=0$. The characteristic polynomial is $s^2$, which makes $\lambda=0$ a double root. So the general solution is

$$
x_h(t) = e^{0t} (c_1 t + c_2) = c_1 t + c_2.
$$

This was not exactly a mystery to us, but it's a good idea to check new formulas on cases you already understand.
::::

::::{proof:example}
Find the general solution of $x''-x'-2x=0$.

:::{dropdown} Solution
The characteristic polynomial is $s^2-s-2$, which has roots $\lambda_1=-1$, $\lambda_2=2$. This gives the general solution $x_h(t)=c_1 e^{-t} + c_2 e^{2t}$.
:::
::::

::::{proof:example}
Solve the IVP $x'' - 5 x = 0$, $x(0)=6$, $x'(0)=0$.

:::{dropdown} Solution
The roots of $s^2-5$ are $\lambda_1=\sqrt{5}$, $\lambda_2=-\sqrt{5}$. The general solution is

$$
x(t) = c_1 e^{\sqrt{5}\, t} + c_2 e^{-\sqrt{5}\, t}.
$$

The initial conditions lead to

\begin{align*}
6 &= x(0) = c_1 e^0 + c_2 e^0 = c_1 + c_2, \\ 
0 &= x'(0) = \sqrt{5} c_1 e^0 - \sqrt{5} c_2 e^0 = \sqrt{5}(c_1-c_2).
\end{align*}

It's easy to conclude from here that $c_1=c_2=3$. In general we might have to solve a $2\times 2$ linear algebraic system for the constants.
:::
::::

## Complex characteristic values

All seems well, until you remember that the roots of a real quadratic polynomial may come as a complex conjugate pair. How then do we interpret {eq}`eq-const_coeff-distinct` or {eq}`second_linear-homogeneous-repeated`? The answer is what makes second-order problems really different from first-order ones, and we tackle it by taking a brief deep dive into complex numbers.
