
# Computing eigenvalues and eigenspaces

The most common way to find eigenvalues by hand is to use the determinant to detect when $\bfA-\lambda\meye$ is singular, as required by {numref}`Theorem {number} <theorem-eigenvalues-singular>`. This determinant has a particular form and name.

```{index} ! characteristic polynomial; of a matrix
```

```{proof:definition} Characteristic polynomial of a matrix
Suppose $\bfA$ is an $n\times n$ matrix. The function $p(z) = \det(\bfA-z\meye)$ is a polynomial of degree $n$ in $z$ called the **characteristic polynomial** of $\bfA$.
```

::::{proof:algorithm} Eigenvalues and eigenspaces
Given an $n\times n$ matrix $\bfA$:

1. Find the characteristic polynomial $p$ of $\bfA$.
2. Let $\lambda_1,\ldots,\lambda_k$ be the distinct roots of $p$. These are the eigenvalues. (If $k<n$, it's because one or more roots has multiplicity greater than 1.)
3. For each $\lambda_j$, find the general solution of $(\bfA-\lambda_j\meye)\bfv=\bfzero$. This is the eigenspace associated with $\lambda_j$.
::::

::::{proof:example}
Find the eigenvalues and eigenspaces of

```{math}
\bfA = \begin{bmatrix} 1 & 1 \\ 4 & 1 \end{bmatrix}.
```

:::{dropdown} Solution
Start by computing the characteristic polynomial:

```{math}
\det \left(\twomat{1}{1}{4}{1} - \twomat{\lambda}{0}{0}{\lambda} \right) = \twodet{1-\lambda}{1}{4}{1-\lambda} = (1-\lambda)^2 - 4 = \lambda^2-2\lambda-3.
```

We find eigenvalues by finding its roots, in this case $\lambda_1=3$ and $\lambda_2=-1$. 

For $\lambda_1=3$,

```{math}
\bfA-3 \meye = \twomat{-2}{1}{4}{-2} \quad \overset{\text{RREF}}{\Longrightarrow} \quad \twomat{1}{-1/2}{0}{0}.
```

The homogeneous solution can be expressed as $x_1=s/2$, $x_2=s$, or $\bfx=s\cdot[1/2;\,1]$. So $[1/2;\,1]$ is a basis for this eigenspace. Since eigenvectors can be rescaled at will, we prefer to use $\twovec{1}{2}$ as the basis vector.

For $\lambda_2=-1$,

```{math}
\bfA+ \meye = \twomat{2}{1}{4}{2} \quad \overset{\text{RREF}}{\Longrightarrow} \quad \twomat{1}{1/2}{0}{0},
```

leading to the eigenspace basis $[-1/2;\,1]$ or equivalently, $\twovec{-1}{2}$.
:::
::::

Because eigenvalues are the roots of the characteristic polynomials, real matrices can have complex eigenvalues occurring in conjugate pairs. We catch a little break from the following fact. 

:::{proof:observation}
If $\bfv$ is an eigenvector for a complex eigenvalue $\lambda$ of a real matrix, then its conjugate $\overline{\bfv}$ is an eigenvector for $\overline{\lambda}$.
:::

(example-eigenvalues-complex)=
::::{proof:example} 
Find eigenvalues and eigenspaces of $\bfA = \begin{bmatrix} 0 & 0 & 6 \\ 0 & 0 & -3 \\ -3 & -3 & 0 \end{bmatrix}.$

:::{dropdown} Solution

$$
\det(\bfA - z\meye) = \begin{vmatrix}
  -z & 0 & 6 \\ 0 & -z & -3 \\ -3 & -3 & -z
\end{vmatrix}
= -z(z^2-9) + 6(-3z) = -z(z^2+18-9) = -z(z+3i)(z-3i),
$$

which gives us $\lambda_1=0$, $\lambda_2=3i$, $\lambda_3=-3i$. 

The eigenspace for $\lambda_1$ is the null space of

$$
\bfA - (0)\meye = \begin{bmatrix} 0 & 0 & 6 \\ 0 & 0 & -3 \\ -3 & -3 & 0 \end{bmatrix}
\quad \overset{\text{RREF}}{\Longrightarrow} \quad 
\begin{bmatrix} 1 & 1 & 0 \\ 0 & 0 & 1 \\ 0 & 0 & 0 \end{bmatrix}.
$$

The only free column is the second, and a basis for this eigenspace is $[-1,1,0]$.

The eigenspace for $\lambda_2$ is the null space of

$$
\bfA - (3i)\meye = \begin{bmatrix} -3i & 0 & 6 \\ 0 & -3i & -3 \\ -3 & -3 & -3i \end{bmatrix}
\quad \overset{\text{RREF}}{\Longrightarrow} \quad 
\begin{bmatrix} 1 & 0 & 2i \\ 0 & 1 & -i \\ 0 & 0 & 0 \end{bmatrix}.
$$

The third column is free, and a basis for this eigenspace is $[-2i,i,1]$.

Because $\lambda_3$ is the conjugate of $\lambda_2$, its eigenspace has basis $[2i,-i,1]$.
:::
::::

## Eigenvectors for $2\times 2$

Finding the exact roots of a cubic polynomial is rarely easy. Thus most of our hand computations will be for $2\times 2$ matrices. This allows some shortcuts.

Suppose $\lambda$ is known to be an eigenvalue of $\bfA$. Then $\bfA-\lambda\meye$ must be singular, and its RRE form has at least one free column. In the $2\times 2$ case, row elimination must therefore zero out the second row entirely, which spares us from having to do the process at all.

In summary, we can deduce the following.

```{proof:algorithm} Eigenvectors for $2\times 2$
Given an eigenvalue $\lambda$ of $2\times 2$ matrix $\bfA$, let the first row of $\bfA-\lambda\meye$ be written as the vector $[\alpha,\beta]$. 

- If $\alpha=\beta=0$, then $\bfA-\lambda\meye$ is a zero matrix and all of $\complex^2$ is the eigenspace of $\lambda$.
- Otherwise, the vector $[\beta;\,-\alpha]$ is a basis of the eigenspace of $\lambda$.
```

::::{proof:example}
Find the eigenstuff of 

```{math}
\bfA = \twomat{1}{1}{-1}{1}.
```
:::{dropdown} Solution
We start by finding eigenvalues. 

$$
\det(\bfA - \lambda \meye) = \twodet{1-\lambda}{1}{-1}{1-\lambda} = (1-\lambda)^2 + 1.
$$

The eigenvalues are therefore roots of $\lambda^2 - 2\lambda + 2$, or 

$$
\lambda = 1 \pm \sqrt{1-2} = 1 \pm i.
$$

This is our first case of a real matrix that has complex eigenvalues. We continue as always, only using complex arithmetic.

The eigenspace for $\lambda_1=1+i$ is the homogeneous solution of 

$$
\bfA - (1+i) \meye = \twomat{-i}{1}{-1}{-i}.
$$

To find a basis we just use the first row as explained above, getting $\twovec{1}{i}$. 

Since the matrix is real, a basis for the other eigenspace can be found by conjugating this one to get $\twovec{1}{-i}$.
:::
::::
