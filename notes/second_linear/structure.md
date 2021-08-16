(section-second_linear-structure)=
# Structure of solutions

````{proof:definition} Second-order ODE
A **second-order ODE** is an equation of the form

$$
x'' = F(t,x,x'),
$$

to be solved for $x(t)$.
````

:::{note}
Technically, this is not the most general form possible, since an equation in the implicit form $F(t,x,x',x'')=0$ might be impossible to manipulate into an explicit expression for $x''$. We won't be considering such equations.
:::

As with first-order problems, we can learn a little from the trivial case $x''=0$. This ODE implies that $x'$ is constant, so $x(t)=c_1 t + c_2$ for arbitrary constants $c_1,c_2$. While a generalization of this observation is far from obvious at this point, it is nonetheless true.

:::{note}
The general solution of second-order ODE has two integration constants.
:::

As a consequence, we note that two initial conditions are now needed to specify the integration constants to get a unique solution.

````{proof:definition} Second-order IVP
A **second-order IVP** (initial-value problem) is

```{math}
x'' = F(t,x,x'), \quad x(a) = x_0,\, x'(a) = v_0.
```
````

## Linear problems

We will focus on linear problems,

```{math}
:label: secondlin-linear
x'' + p(t)x' + q(t) x = f(t).
```

Equation {eq}`secondlin-linear` is in the form of $\opA[x]=f$ for the linear operator

```{math}
\opA[x] = \ddd{x}{t} + p \dd{x}{t} + q x.
```

```{index} superposition, general solution, homogeneous equation
```

We now reap rewards for using the abstract language of operators with first-order problems, because much of what we learned there applies here as well. In particular, we still have a [superposition theorem](theorem-linear-super), and  {numref}`Algorithm {number} <algorithm-linear-solve>` still provides a blueprint for the solution process:

1. Find the general solution $x_h$ of the associated homogeneous problem $\opA[x]=0$.
2. Find any particular solution $x_p$ of the original $\opA[x]=f$.
3. Add them.
4. If given, use initial conditions to solve for the integration constants.

The second-order problem does bring in a new wrinkle with the homogeneous solution, however. 

## Independence

Consider again the trivial problem $x''=0$. It's certainly true that $x=t$ and $x=5t$ are different solutions of this equation. So it would be tempting to write the general solution of this homogeneous problem as 

$$
c_1\cdot (t) + c2\cdot (5t)
$$

for arbitrary constants $c_1$ and $c_2$. While this expression does always give a solution, it doesn't give all of them, such as $x=2$. 

The issue is that $t$ and $5t$ are not "different enough," in a way we now make precise. 

```{index} ! linear independence
```

(definition-structure-independence)=
::::{proof:definition} Linear independence
Functions $u_1(t),u_2(t),\ldots,u_n(t)$, are **linearly dependent** on interval $I$ if there is a way to choose constants $c_1,\ldots,c_n$, *not all zero*, such that

$$
c_1u_1(t) + c_2u_2(t) + \cdots c_n u_n(t) = 0
$$

for all $t \in I$. If the functions are not linearly dependent, then they are **linearly independent** on $I$.
::::

:::{note} 
Linear independence is a notion that extends beyond differential equations. In fact, we will see it in another form in Chapter 5.
:::

:::{proof:example}
The functions $u_1=t$ and $u_2=5t$ are linearly dependent on any interval, because $-5u_1 + u_2 = -5t+5t=0$ for all $t$.
:::

:::{proof:example}
The functions $u_1=\cos(t)$ and $u_2=\sin(t)$ are independent on the real line $(-\infty,\infty)$, because the equation

$$
c_1\cos(t) + c_2\sin(t) = 0
$$

is equivalent to $\tan(t)=-c_1/c2$ if $c_2\neq 0$, which is impossible for all $t$. Hence $c_2=0$, which implies that $c_1 \cos(t)=0$ for all $t$, and this requires $c_1=0$ as well.
:::

## Wronskian

There is a mechanical way to determine the indepdence of given functions.

```{index} ! Wronskian
```

(definition-structure-wronskian)=
::::{proof:definition} 
Suppose $u_1,\ldots,u_n$ all have at least $n-1$ continuous derivatives. Their **Wronskian** is 

:::{math}
:label: eq-structure-wronskian
W(t) = \begin{vmatrix} 
u_1 & u_2 & \cdots & u_n \\ 
u_1' & u_2' & \cdots & u_n' \\ 
\vdots & \vdots &  & \vdots  \\ 
u_1^{(n-1)} & u_2^{(n-1)} & \cdots & u_n^{(n-1)}
\end{vmatrix}.
:::
::::

:::{attention}
Equation {eq}`eq-structure-wronskian` is a *determinant*, which we will not learn in general for a while yet. But for now we only care about the $2\times 2$ case, in which 

$$
\begin{vmatrix} a & b \\ c & d \end{vmatrix} = ad-bc.
$$
:::

Here's the punch line.

(theorem-structure-wronskian)=
::::{proof:theorem} 
If $x_1,\ldots,x_n$ are solutions of a linear homogeneous ODE $\opA[x]=0$, all defined for all $t\in I$, then they are linearly independent on $I$ if and only if their Wronskian is nonzero at all $t\in I$.
::::

The upshot is that we can check the Wronskian at any one value of $t$ we want; zero means linear dependence, and nonzero means independence.

(example-structure-wronskian)=
::::{proof:example} 
You can check that $\cos(t)$ and $\sin(t)$ are solutions of $x''+x=0$. Since

$$
W(t) = \twodet{\cos(t)}{\sin(t)}{-\sin(t)}{\cos(t)} = \cos^2(t) + \sin^2(t) = 1,
$$

they are linearly independent.
::::

## General solution

```{index} general solution
```

Now we can state precisely what goes into a general solution in the linear, second-order case.

(theorem-structure-general)=
::::{proof:theorem} 
Suppose $x_1$ and $x_2$ are linearly independent solutions of the second-order linear problem $\opA[]=0$. Then the general solution of $\opA[]=0$ is  

$$
x(t) = c_1 x_1(t) + c_2 x_2(t),
$$

where $c_1$ and $c_2$ are arbitrary constants. Furthermore, the general solution of the nonhomogeneous problem $\opA[]=f$ is

$$
x(t) = x_h(t) + x_p(t),
$$

where $x_h$ is the general homogeneous solution and $x_p$ is any one particular solution of $\opA[]=f$.
::::
