(section-system-const_coeff)=
# Constant-coefficient problems

While the theory of homogeneous linear ODE systems is straightforward, the good news for the general case pretty much ends there. In most problems we cannot get a useful expression for a fundamental matrix. But there is a very important special case in which we can say a lot: when the coefficient matrix is constant. 

Accordingly, we now specialize to

$$
\bfx' = \bfA \bfx,
$$

where $\bfA$ is an $n\times n$ constant matrix. We are finally ready to see the significance of the eigenvalue condition

:::{math}
\mathbf{A} \mathbf{v} = \lambda \mathbf{v}.
:::

If we seek a solution in the form $\mathbf{x}(t)=g(t)\mathbf{v}$ for this eigenvector, then 

$$
g'\mathbf{v} = \mathbf{A}(g\mathbf{v}) = g\cdot (\mathbf{A}\mathbf{v}) = (g\lambda) \mathbf{v},
$$

which can be satisfied if $g'=\lambda g$. That is, we have a solution

$$
\bfx(t) = e^{\lambda t} \bfv.
$$

## Homogeneous solution

Counting algebraic multiplicities, we know that $\mathbf{A}$ has eigenvalues $\lambda_1,\ldots,\lambda_n$. Say that we have eigenvectors $\mathbf{v}_1,\ldots,\mathbf{v}_n$ to go with them. Then we have $n$ homogeneous solutions

:::{math}
\mathbf{x}_j(t) = e^{t \lambda_j} \mathbf{v}_j, \quad j=1,\ldots,n.
:::

Our next move is to determine whether

$$
\bigl[ \mathbf{x}_1(t) \; \mathbf{x}_2(t) \; \cdots \; \mathbf{x}_n(t)  \bigr]
$$

is a fundamental matrix. According to [Abel's theorem](theorem-fs-abel), we can ask that question at any value of $t$, including $t=0$. So the key issue is whether 

:::{math}
:label: eigenmat
\bfV = \bigl[ \mathbf{v}_1 \; \mathbf{v}_2 \; \cdots \; \mathbf{v}_n  \bigr]
:::

is invertible. If so, then we have the ingredients of the general homogeneous solution.

(theorem-cc-eigensolution)=
::::{proof:theorem} Solution by eigenvectors
Let $\mathbf{A}$ have eigenvalues $\lambda_1,\ldots,\lambda_n$ and corresponding eigenvectors $\mathbf{v}_1,\ldots,\mathbf{v}_n$. If the matrix $\bfV$ in {eq}`eigenmat` is invertible, then

:::{math}
:label: fs-eq-eigenfundamental
\fundm(t) = \begin{bmatrix} 
e^{t \lambda_1} \mathbf{v}_1 & \cdots & e^{t \lambda_n} \mathbf{v}_n
\end{bmatrix}
:::

is a fundamental matrix for $\mathbf{x}'=\mathbf{A}\mathbf{x}$. Hence the general solution can be expressed as 

:::{math}
:label: eq-cc-eigengeneral
\mathbf{x}(t) = \fundm(t)\mathbf{c} = c_1 e^{t \lambda_1} \mathbf{v}_1 + \cdots + c_n e^{t \lambda_n} \mathbf{v}_n.
:::
::::

We are guaranteed an invertible  $\bfV$ can be found if (and only if) $\bfA$ is diagonalizable. Solutions for defective matrices will have to wait for now.

(fs-ex-eigen-real)=
::::{proof:example}
Given that 

$$
\mathbf{A} = \begin{bmatrix} 1 & 1 \\ 4 & 1 \end{bmatrix}
$$

has eigenpairs 

$$
\lambda_1=3,\: \mathbf{v}_1 = \twovec{1}{2}, \quad \lambda_2=-1,\: \mathbf{v}_2=\twovec{1}{-2},
$$

find the general solution of $\bfx'=\bfA\bfx$. 

:::{dropdown} Solution
The determinant of 

$$
\bfV = \twomat{1}{1}{2}{-2}
$$

is $-4$, so this matrix is not singular. Hence a general solution is 

$$
\mathbf{x}(t) =  c_1 e^{3t} \twovec{1}{2} + c_2 e^{-t} \twovec{1}{-2} 
= \twovec{ c_1 e^{3t} + c_2 e^{-t}}{2c_1 e^{3t} - 2 c_2e^{-t}}. 
$$

:::
::::

We can often skip the singularity check in the previous example.

:::{proof:theorem}
If the eigenvalues of $\bfA$ are distinct, then their corresponding eigenvectors are the columns of an invertible matrix.
:::


## Complex eigenvalues

The expressions above work fine if the eigenvalues and eigenvectors are complex. However, sometimes you are required to write the solution in a form that makes no reference to complex numbers.

Suppose that 

$$
\lambda = r + i\omega, \qquad \bfv = \bfu_1 + i\, \bfu_2.
$$

Then 

$$
e^{\lambda t} \bfv = e^{rt} (\cos(\omega t) + i\sin(\omega t) )\, (\bfu_1 + i\, \bfu_2).
$$

The real and imaginary parts of the above product form the basis of the real solution. Specifically,

:::{math}
:label: sys-complex-real-form
\bfx(t) = a_1 e^{rt} \Bigl( \cos(\omega t)\,\bfu_1 - \sin(\omega t) \,\bfu_2(t) \Bigr) + a_2 e^{rt} \Bigl( \cos(\omega t)\,\bfu_2 + \sin(\omega t) \,\bfu_1(t) \Bigr),
:::

for arbitrary real $a_1$ and $a_2$.

::::{proof:example}
Find the general solution of

```{math}
\bfx' = \twomat{1}{1}{-1}{1} \bfx.
```
:::{dropdown} Solution
In the first chapter [we found](../linalg/eigenvalues.md) the eigenvalues $1\pm i$ and corresponding eigenvectors $\twovec{1}{\pm i}$. This leads to the solution

$$
\bfx(t) = c_1 e^{(1+i)t} \twovec{1}{i} + c_2 e^{(1-i)t} \twovec{1}{-i}.
$$

If we expect a real solution (because of real initial values, say), then $c_2 = \overline{c_1}$ and the result is real.

Instead, we use Euler's formula to write out 

$$
e^{(1+i)t} \twovec{1}{i} = e^t \twovec{\cos t + i \sin t}{i\cos t - \sin t} 
= e^t \twovec{\cos t}{-\sin t} + i e^t \twovec{\sin t}{\cos t}.
$$

The real and imaginary parts of the last line are independent real solutions, and 

$$
\bfx(t) = a_1 e^t \twovec{\cos t}{-\sin t} + a_2 e^t \twovec{\sin t}{\cos t}
$$

for arbitrary real $a_1$ and $a_2$.
:::
::::

## The oscillator reloaded 

Earlier we showed that the harmonic oscillator

$$
u'' + 2 Z \omega_0 u' + \omega_0^2 u = 0
$$

can be converted to the constant-coefficient system

$$
\bfx' = \twomat{0}{1}{-\omega_0^2}{-2Z\omega_0} \bfx.
$$

via $x_1=u$, $x_2=u'$. The eigenvalues of the coefficient matrix are the roots of the characteristic polynomial

$$
\twodet{-z}{1}{-\omega_0^2}{-2 \zeta \omega_0-z} = z^2 + 2 \zeta \omega_0 z + \omega_0^2.
$$

This is identical to what we called the characteristic polynomial of the oscillator ODE! That is, the characteristic values we used there are the eigenvalues here. 

In the underdamped case $\zeta < 1$, for instance, the eigenvalues are complex: $\lambda = -\zeta \omega_0 \pm i \omega_d$, where $\omega_d=\omega_0 \sqrt{1-\zeta^2}$. The first eigenvalue $\lambda_1$ has eigenvector

$$
\twovec{1}{\lambda_1}.
$$

If we want the general solution of just the original $u$ variable, then we only need the first component of the eigenvector, and the general solution combines the real and imaginary parts of $e^{\lambda_1 t}$:

$$
u(t) = x_1(t) = a_1 e^{-\zeta \omega_0t} \cos(\omega_d t) + a_2 e^{-\zeta \omega_0t} \sin(\omega_d t).
$$

Again, the second-order problem is fully covered by the equivalent first-order system.
