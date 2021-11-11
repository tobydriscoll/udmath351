# The matrix exponential

As we well know by now, the solution of the scalar linear IVP $x'=ax$, $x(0)=x_0$ is 

$$
x(t) = e^{at} x_0.
$$

Wouldn't it be interesting if in the vector case $\mathbf{x}'=\mathbf{A} \mathbf{x}$, $\bfx(0)=\bfx_0$, we could write

$$
\bfx(t) = e^{\bfA t} \bfx_0 ?
$$

Funny you should ask. 

## Diagonalization

Let's review the process of solving $\mathbf{x}'=\mathbf{A} \mathbf{x}$ using {numref}`Theorem {number} <theorem-cc-eigensolution>`. If $\bfA$ has a diagonalization $\bfA=\bfV \mathbf{D}\bfV^{-1}$, where $\bfV$ has eigenvector columns and $\mathbf{D}$ is a diagonal matrix of the eigenvalues, then the general solution is

$$
\bfx(t) = c_1 e^{t \lambda_1} \mathbf{v}_1 + \cdots + c_n e^{t \lambda_n} \mathbf{v}_n = \bfV \bfE(t) \bfc,
$$

for a constant vector $\bfc$, where

$$
\bfE(t) = \begin{bmatrix} e^{t \lambda_1} & & & \\ & e^{t \lambda_2} & & \\ & & \ddots & \\ & & & e^{t \lambda_n} \end{bmatrix}.
$$

If we also have an initial condition $\bfx(0)=\bfx_0$, then 

$$
\bfx_0 = \bfx(0) = \bfV \bfE(0) \bfc = \bfV \bfc,
$$

so that $\bfc = \bfV^{-1} \bfx_0$. Hence the IVP solution is

$$
\bfx(t) = \bfV \bfE(t) \bfV^{-1} \bfx_0.
$$

The matrix $\bfV \bfE(t) \bfV^{-1}$ is essentially a special fundamental matrix $\fundm$ for which $\fundm(0)=\meye$, which makes it especially convenient for an IVP.

## Change of basis

Given the diagonalization $\bfA=\bfV \mathbf{D}\bfV^{-1}$, we can rewrite the ODE $\bfx'=\bfA\bfx$ as 

$$
\bfx'=\bfV \mathbf{D}\bfV^{-1} \bfx.
$$

We multiply by $\bfV^{-1}$ on the left and, observing that $\bfV$ and its inverse are constant with respect to time, we get

$$
(\bfV^{-1} \bfx)'= \mathbf{D} (\bfV^{-1} \bfx) \quad \Rightarrow \quad  \bfy' = \mathbf{D} \bfy,
$$

where we defined

$$
\bfy = \bfV^{-1}\bfx.
$$

Note that $\bfy$ is simply the coordinate vector for $\bfx$ in the basis of eigenvectors. The diagonal system $\bfy' = \mathbf{D} \bfy$ completely decouples into $n$ scalar equations

$$
y_i' = \lambda_i y_i, \quad i=1,\ldots,n.
$$

These are trivial to solve:

<!-- $$
\bfy(t) = \begin{bmatrix}
  e^{\lambda_1 t} & & & \\ & e^{\lambda_2 t} & & \\ & & \ddots & \\ & & & e^{\lambda_n t}
\end{bmatrix} \mathbf{c}.
$$ -->

$$
y_i(t) = e^{\lambda_i t}y_i(0), \quad i=1,\ldots,n, \Longrightarrow \bfy = \bfE(t) \bfy(0).
$$

Changing back to standard coordinates returns us again to 

$$
\bfx(t) = \bfV \bfE(t) \bfV^{-1} \bfx(0).
$$

## Power series

The matrix $\bfE(t)$ has a nice structure:

$$
\bfE(t) &= \diagm{1 + (\lambda_1 t) + \frac{1}{2!} (\lambda_1 t)^2 + \cdots }{1 + (\lambda_2 t) + \frac{1}{2!} (\lambda_2 t)^2 + \cdots }{1 + (\lambda_n t) + \frac{1}{2!} (\lambda_n t)^2 + \cdots }\\ 
&= \diagm{1}{1}{1} + t \diagm{\lambda_1}{\lambda_2}{\lambda_n} + \frac{t^2}{2!} \diagm{\lambda_1^2}{\lambda_2^2}{\lambda_n^2} + \cdots.
$$

The simplicity of the diagonal matrix $\bfD$ lets us write

$$
\bfE(t) = \meye + t\bfD + \frac{t^2}{2!}\bfD^2 + \cdots.
$$

This strongly hints at the definition 

:::{math}
:label: eq-matrix_exp-series
e^{t\mathbf{A}} = \mathbf{I} + t\mathbf{A} + \frac{1}{2!}t^2 \mathbf{A}^2 + \frac{1}{3!} t^3 \mathbf{A}^3 + \cdots
:::

for a square matrix $\bfA$, so that $\bfE(t) = e^{t\bfD}$. Let's not worry too much about whether this series converges (it does). What are its properties? 

(fs-thm-matrixexp)=
::::{proof:theorem} Matrix exponential
Let $\mathbf{A},\mathbf{B}$ be $n\times n$ matrices. Then 

1. $e^{t\mathbf{A}}=\mathbf{I}$ if $t=0$,
2. $\displaystyle \dd{}{t}e^{t\mathbf{A}} = \mathbf{A} e^{t\mathbf{A}} = e^{t\mathbf{A}}\mathbf{A}$,
3. $[e^{t\mathbf{A}}]^{-1} = e^{-t\mathbf{A}}$,
4. $e^{(s+t)\mathbf{A}} = e^{s\bfA} \cdot e^{t\bfA} = e^{t\bfA} \cdot e^{s\bfA}$
5. If $\mathbf{A}\mathbf{B}=\mathbf{B}\mathbf{A}$, then $e^{t(\mathbf{A}+\mathbf{B})} = e^{t\mathbf{A}}\cdot e^{t\mathbf{B}} = e^{t\mathbf{B}}\cdot e^{t\mathbf{A}}$.
::::

These conclusions follow pretty easily from the series definition {eq}`eq-matrix_exp-series`. They are all essential to what we normally expect from an exponential function, although in the last case we have a new restriction.

From these properties we can make the connection to the IVP.

```{proof:theorem}
If $\bfA$ is a constant square matrix, then

$$
\bfx(t) = e^{t \bfA} \bfx_0
$$

solves the initial-value problem $\mathbf{x}'=\mathbf{A} \mathbf{x}$, with $\bfx(0)=\bfx_0$.
```

```{proof:proof}
With $\bfx$ as defined in the theorem statement, we calculate

$$
\dd{}{t} \bfx(t) = \Bigl( \dd{}{t}e^{t \bfA} \Bigr) \bfx_0 =  \mathbf{A} e^{t\mathbf{A}} \bfx_0 = \bfA \bfx(t),
$$

using property 2 above. Furthermore,

$$
\bfx(0) = e^{0 \bfA} \bfx_0 = \meye \bfx_0 = \bfx_0,
$$

using property 1 above.
```

## Computation

Summing the infinite series of matrices in {eq}`eq-matrix_exp-series` seems a daunting project. Fortunately we have a number of ways to avoid that.

### Diagonal matrix

As derived above, if $\bfD$ is diagonal with $\lambda_1,\ldots,\lambda_n$ on the diagonal, then $e^{t\bfD}$ is diagonal with $e^{t\lambda_1},\ldots,e^{t\lambda_n}$ on the diagonal.

### (Shifted) nilpotent matrix

A **nilpotent** matrix $\bfA$ satisfies $\bfA^k=\bfzero$ for some integer $k$. If all the eigenvalues of a matrix equal a single number $\lambda$, then $(\bfA-\lambda\meye)$ is nilpotent. This fact can be used to make the series truncate finitely.

::::{proof:example}
Find $e^{t\mathbf{A}}$ if $\bfA=\twomat{4}{1}{0}{4}$.

:::{dropdown} Solution
You can check that $\lambda=4$ is the only eigenvalue, with algebraic multiplicity equal to 2. Let $\bfB=\bfA-4\meye$. You can easily calculate that $\bfB^2=\bfzero$, so  

$$
e^{t\bfB} = \meye + t \bfB = \twomat{1}{t}{0}{1}.
$$

From the exponential properties we have 

$$
e^{t\bfA}=e^{t\bfb+4t\meye} = e^{4t\meye} \, e^{\bfB} = e^{4t} \twomat{1}{t}{0}{1}. 
$$
:::
::::

::::{proof:example}
A critically damped free oscillator with natural frequency $\omega_0$ is equivalent to a system with the matrix

$$
\bfA = \twomat{0}{1}{-\omega_0^2}{-2\omega_0}.
$$

The characteristic polynomial is $\lambda^2 + 2\omega_0\lambda + \omega_0^2$, which has the double root $\lambda=-\omega_0$. Clearly this matrix is not a multiple of $\meye$, so it is defective. We compute

$$
\bfA - \lambda\meye = \twomat{\omega_0}{1}{-\omega_0^2}{-\omega_0}.
$$

This gives the exponential

$$
e^{t\mathbf{A}} = e^{-t\omega_0} \twomat{1+t\omega_0}{t}{-t\omega_0^2}{1-t\omega_0},
$$

which is a fundamental matrix. The oscillator position is the first component of the general solution,

$$
e^{-t\omega_0}[ c_1 (1+t\omega_0) + c_2 t],
$$

which is equivalent to the general solution we saw before for this problem, $e^{-t\omega_0}(c_1+c_2t)$.
::::

### Fundamental matrix

::::{proof:formula} Matrix exponential by fundamental matrix
If $\fundm(t)$ is any fundamental matrix for $\bfx'=\bfA\bfx$, then 

$$
e^{t\bfA} = \fundm(t) \fundm(0)^{-1}.
$$
::::

::::{proof:example}
Given 

:::{math}
\mathbf{A} = \twomat{1}{1}{4}{1}
:::

and the eigenpairs $\lambda_1=3$, $\mathbf{v}_1 = \twovec{1}{2}$ and $\lambda_2=-1$, $\mathbf{v}_2=\twovec{1}{-2}$, find $e^{t\mathbf{A}}$.

:::{dropdown} Solution
We start with the fundamental matrix

$$
\fundm(t) = \begin{bmatrix} e^{3t} \mathbf{v}_1 & e^{-t} \mathbf{v}_2 \end{bmatrix}
= \twomat{e^{3t}}{e^{-t}}{2e^{3t}}{-2e^{-t}}.
$$

Now we find

$$
\fundm(0)^{-1} = \twomat{1}{1}{2}{-2}^{-1} = \frac{1}{-4} \twomat{-2}{-1}{-2}{1}.
$$

Thus

$$
e^{t\mathbf{A}} = \frac{1}{4} \twomat{e^{3t}}{e^{-t}}{2e^{3t}}{-2e^{-t}} 
\twomat{2}{1}{2}{-1} = \frac{1}{4} \twomat{2e^{3t}+2e^{-t}}{e^{3t}-e^{-t}}{4e^{3t}-4e^{-t}}{2e^{3t}+2e^{-t}} .
$$
:::
::::

### Diagonalization

We derived the formula $e^{t\bfA} = \bfV e^{t\bfD} \bfV^{-1}$. If the diagonalization is fully known, this is handy, but otherwise it's no easier than using the fundamental matrix method above.

### Polynomial representation

Thanks to a result known as the Cayley–Hamilton theorem, the following is true. 

::::{proof:formula} Matrix exponential by polynomial
If $\bfA$ has eigenvalues $\lambda_1,\ldots,\lambda_n$, then there exist functions $c_0(t),\ldots,c_{n-1}(t)$ such that if we define

:::{math}
:label: eq-matrix_exp-polydef
f(t,z) = c_0(t) + c_1(t) z + \cdots + c_{n-1}(t) z,
:::

then

:::{math}
:label: eq-matrix_exp-polylam
f(t,\lambda_k) = e^{t\lambda_k}, \qquad k=1,\ldots,n,
:::

and

:::{math}
:label: eq-matrix_exp-polymat
e^{t\bfA} = f(t,\bfA) = c_0(t)\meye + c_1(t)\bfA + \cdots + c_{n-1}(t)\bfA^{n-1}.
:::
::::

The idea is to use the eigenvalues to define the linear system in {eq}`eq-matrix_exp-polylam`, which is solved to determine the $c_k(t)$ functions. The matrix exponential is then computed from {eq}`eq-matrix_exp-polymat`. The eigenvectors aren't needed at all. 

::::{proof:example}
Given that

$$
\mathbf{A} = \twomat{1}{1}{4}{1}
$$

has eigenvalues $\lambda_1=3$ and $\lambda_2=-1$, find $e^{t\bfA}$. 

:::{dropdown} Solution
We write out {eq}`eq-matrix_exp-polylam`:

$$
c_0 + 3c_1 &= e^{3t}   \\ 
c_0 - c_1 &= e^{-t}.
$$

Cramer's rule leads to

$$
c_0 = \frac{-e^{3t}-3e^{-t}}{-4}, \qquad c_1 = \frac{e^{-t}-e^{3t}}{-4}. 
$$

Inserting these into {eq}`eq-matrix_exp-polymat` gives

$$
e^{t\bfA} &= \frac{e^{3t}+3e^{-t}}{4}\, \meye + \frac{e^{3t}-e^{-t}}{4} \, \bfA \\ 
&= \frac{1}{4}\twomat{2(e^{3t}+e^{-t})}{e^{3t}-e^{-t}}{4(e^{3t}-e^{-t})}{2(e^{3t}+e^{-t})}.
$$
:::
::::

The process is modified a bit for complex eigenvalues. Note that the $c_k$ functions in {eq}`eq-matrix_exp-polydef` must be real.

::::{proof:example}
Given that 

:::{math}
\mathbf{A} = \twomat{1}{-1}{5}{-3}
:::

has eigenvalues $-1\pm i$, find $e^{t\bfA}$ and the solution of the IVP $\bfx'=\mathbf{A}\bfx$, $\bfx(0)=\twovec{2}{1}$.

:::{dropdown} Solution

Rather than writing out {eq}`eq-matrix_exp-polylam` for both conjugate eigenvalues, we use just one and apply Euler's formula to take the real and imaginary parts:

$$
e^{-t+it} = c_0 + c_1 (-1+i) \quad \Rightarrow \quad e^{-t}\cos(t) = c_0 - c_1, \quad e^{-t}\sin(t) = c_1.
$$

This gives us $c_1=e^{-t}\sin(t)$ and $c_0 = e^{-t}[\cos(t)+\sin(t)]$. Thus,

$$
e^{t\bfA} &= e^{-t}[\cos(t)+\sin(t)]\, \meye + e^{-t}\sin(t)\, \bfA \\ 
&= e^{-t}\twomat{\cos(t)+2\sin(t)}{-\sin(t)}{5\sin(t)}{\cos(t)-2\sin(t)}.
$$

The solution of the IVP is then

$$
\bfx(t) = e^{t\bfA} \bfx(0) = e^{-t}\twomat{\cos(t)+2\sin(t)}{-\sin(t)}{5\sin(t)}{\cos(t)-2\sin(t)} \twovec{2}{1} = e^{-t} \twovec{2\cos(t)+2\sin(t)}{\cos(t)+8\sin(t)}. 
$$
:::
::::

The process also to be modified if there are repeated eigenvalues. Suppose $\lambda_1=\lambda_2$ has algebraic multiplicity 2. In that case, the second equation in the linear system {eq}`eq-matrix_exp-polylam` is a duplicate of the first. We replace it with 

$$
\pp{f}{z}(t,\lambda_1) = \pp{}{z} \bigl[ e^{tz}  \bigr]_{z=\lambda_1} = t e^{\lambda_1 t}.
$$

If $\lambda_1=\lambda_2=\lambda_3$, then the first three equations are 

$$
f(\lambda_1) &= e^{\lambda_1 t} \\ 
f_z(\lambda_1) &= t e^{\lambda_1 t} \\ 
f_{zz}(\lambda_1) &= t^2 e^{\lambda_1 t}.
$$

In principle, the method generalizes to any algebraic multiplicity.

(example-matrix_exp-repeat)=
::::{proof:example} 
The matrix $\bfA = \begin{bmatrix} {2}& {1}& {1}\\ {1} & {2} & {1}\\ {-2}& {-2} & {-1} \end{bmatrix}$ has a triple eigenvalue $\lambda_1=1$. Find $e^{t\bfA}$.

:::{dropdown} Solution
The system to solve is

$$
c_0 + \lambda_1 c_1 + \lambda_1^2 c_2 &= e^{\lambda_1 t} \\ 
c_1 + 2\lambda_1 c_2 &= t e^{\lambda_1 t} \\ 
2c_2 &= t^2 e^{\lambda_1 t},
$$

which is 

$$
c_0 + c_1 + c_2 &= e^{t} \\ 
c_1 + 2 c_2 &= te^{t} \\ 
2 c_2 &= t^2e^{t}.
$$

This has solution $c_0 = \left(1-t+\frac{1}{2}t^2\right)e^t$, $c_1=(t-t^2)e^t$, $c_2=\frac{1}{2} t^2 e^{t}$. To finish the problem we calculate

$$
e^t \left[ \left(1-t+\frac{1}{2}t^2\right) \meye + (t-t^2)\bfA + \frac{1}{2} t^2 \bfA^2 \right] = e^t \begin{bmatrix} 
 t+1 & t & t \\
 t & t+1 & t \\
 -2 t & -2 t & 1-2 t \\
\end{bmatrix}.
$$
:::
::::

