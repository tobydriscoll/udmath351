# Identity and inverse

You solve $ax=b$ for nonzero $a$ without thinking about it: $x=b/a$. If we do break it down a little, we can see that when we multiply both sides of $ax=b$ by the number $1/a$, then on the left the terms $1/a$ and $a$ combine to give $1$, and $1x=x$. So the key to the solution is the presence of a *multiplicative identity* value $1$, and the existence of the *multiplicative inverse* $1/a$ when $a\neq 0$. These two items are also a way to discuss the vector case $\bfA\bfx=\bfb$.

## Identity matrix

Suppose we are given an $m\times n$ matrix $\bfA$. Writing its columns as the vectors $\bfa_1,\ldots,\bfa_n$, we can make the rather obvious observations

\begin{align*}
\bfa_1 &= 1\cdot \bfa_1 + 0 \cdot \bfa_2 + \cdots + 0\cdot \bfa_n,\\
\bfa_2 &= 0\cdot \bfa_1 + 1 \cdot \bfa_2 + \cdots + 0\cdot \bfa_n,\\
&\; \vdots \\
\bfa_n &= 0\cdot \bfa_1 + 0 \cdot \bfa_2 + \cdots + 1\cdot \bfa_n.
\end{align*}

The purpose in using these expressions is to interpret them as linear combinations, and thus as matrix-vector products. Let's define $\bfe_j$ for $j=1,\ldots,n$ as follows.

```{index} ! standard vectors
```

::::{proof:definition} Standard vectors
$$
\text{$i$th component of }\bfe_j = \begin{cases} 1, & i=j, \\ 0, & i\neq j. \end{cases}
$$
::::

Now we can write

```{math}
\bfa_j = \bfA \bfe_j, \quad j=1,\ldots,n.
```

Furthermore, we can use the definition of matrix products as a concatenation of matrix-vector products to derive

\begin{align*}
\bfA &= \begin{bmatrix} \bfa_1 & \bfa_2 & \cdots & \bfa_n \end{bmatrix} \\
	&=  \begin{bmatrix} \bfA\bfe_1 & \bfA\bfe_2 & \cdots & \bfA\bfe_n \end{bmatrix}\\
	&=  \bfA \begin{bmatrix} \bfe_1 & \bfe_2 & \cdots & \bfe_n \end{bmatrix}.
\end{align*}

```{index} ! identity matrix
```

::::{proof:definition} Identity matrix
The $n\times n$ **identity matrix** is

```{math}
\meye = \begin{bmatrix} \bfe_1 & \bfe_2 & \cdots & \bfe_n \end{bmatrix} = 
	\begin{bmatrix}
	1 & 0 & \cdots & 0 & 0 \\
	0 & 1 & \cdots & 0 & 0 \\
	& & \ddots & & \\
	0 & 0 & \cdots & 1 & 0 \\
	0 & 0 & \cdots & 0 & 1
	\end{bmatrix}.
```
::::

::::{note}
Sometimes, when we need to indicate the size of the identity, we use a subscript, as in $\meye_4$ to represent the $4\times 4$ case. Usually, though, it's implied by the context.
::::

::::{proof:theorem} Multiplicative identity
If $\bfA$ is $m\times n$, then $\bfA = \meye_m \bfA = \bfA \meye_n$.
::::

::::{proof:example}
Compute

$$
\begin{bmatrix}
7 & -2 & 11 \\ 1131 & \pi & -\sqrt{13}
\end{bmatrix}
\begin{bmatrix}
2 & 0 & 0 \\ 0 & 2 & 0 \\ 0 & 0 & 2
\end{bmatrix}.
$$

:::{dropdown} Solution
You can grind through the multiplication algorithm, of course, but there is a shortcut:

$$
\begin{bmatrix} 7 & -2 & 11 \\ 1131 & \pi & -\sqrt{13} \end{bmatrix}
\begin{bmatrix} 2 & 0 & 0 \\ 0 & 2 & 0 \\ 0 & 0 & 2 \end{bmatrix}
= \begin{bmatrix} 7 & -2 & 11 \\ 1131 & \pi & -\sqrt{13} \end{bmatrix}
\left( 2 \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix} \right)
= 2 \begin{bmatrix} 7 & -2 & 11 \\ 1131 & \pi & -\sqrt{13} \end{bmatrix} \meye 
= \begin{bmatrix} 14 & -4 & 22 \\ 2262 & 2\pi & -2\sqrt{13} \end{bmatrix}.
$$
:::
::::

## Inverse

We are now going to introduce a major simplification.

```{index} ! square matrix
```

(definition-inverse-square)=
::::{proof:definition} Square matrix
A **square** matrix has the same number of rows as columns.
::::

Here is what we seek from a multiplicative inverse.

```{index} ! matrix inverse, ! inverse of a matrix, ! invertible matrix, ! singular matrix
```

::::{proof:definition} Inverse
Suppose $\bfA$ is a square matrix. A matrix $\mathbf{Z}$ of the same size such that $\mathbf{Z}\bfA = \meye$ and $\bfA\mathbf{Z}=\meye$ is called the **inverse** of $\bfA$, written $\mathbf{Z} = \bfA^{-1}$. In this case we say $\bfA$ is **invertible**. A matrix that has no inverse is **singular**.
::::

Verifying whether a given matrix is the inverse of another matrix is simply a matter of multiplying them together and seeing if the result is an identity matrix.

::::{proof:example}
The matrix $\mathbf{R}(\theta) = \begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\ \sin(\theta) & \cos(\theta) 
\end{bmatrix}$
performs rotation in the plane around the origin by angle $\theta$. Show that $\mathbf{R}(-\theta)$ is the inverse of $\mathbf{R}(\theta)$.

:::{dropdown} Solution
All we need to do is to check that the product (in either order) is the identity matrix:

\begin{align*}
\mathbf{R}(-\theta)\mathbf{R}(\theta) &= \begin{bmatrix}
\cos(-\theta) & -\sin(-\theta) \\ \sin(-\theta) & \cos(-\theta) 
\end{bmatrix} \begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\ \sin(\theta) & \cos(\theta) 
\end{bmatrix} \\ 
&= \begin{bmatrix}
\cos(\theta) & \sin(\theta) \\ -\sin(\theta) & \cos(\theta) 
\end{bmatrix} \begin{bmatrix}
\cos(\theta) & -\sin(\theta) \\ \sin(\theta) & \cos(\theta) 
\end{bmatrix} \\ 
 &= \begin{bmatrix}
\cos^2(\theta)+\sin^2(\theta) & -\cos(\theta)\sin(\theta) + \sin(\theta)\cos(\theta) \\
  -\sin(\theta)\cos(\theta) + \cos(\theta)\sin(\theta)  & \sin^2(\theta) + \cos^2(\theta) 
\end{bmatrix} = \meye.
\end{align*} 
:::
::::

### Properties

There are some facts about inverses that we will take for granted without justification.

::::{proof:theorem}
1. If $\bfA$ is invertible, the inverse is unique.
2. If either $\mathbf{Z}\bfA = \meye$ or $\bfA\mathbf{Z}=\meye$ is true, then both are true and $\mathbf{Z}=\bfA^{-1}$.
3. $(\bfA^{-1})^{-1} = \bfA$; that is, $\bfA$ is the inverse of $\bfA^{-1}$.
4. If $\bfA$ is invertible and $c$ is a nonzero number, then $(c\bfA)^{-1}= \dfrac{1}{c}\bfA^{-1}$.
5. If $\bfA$ and $\bfB$ are invertible and the same size, then $\bfA\bfB$ is invertible, and

$$
(\bfA\bfB)^{-1} = \bfB^{-1}\bfA^{-1}.
$$
::::

The last identity above is easy to get wrong, so it bears restatement in words. The following also holds for products of three or more invertible matrices.

:::{attention}
The inverse of a product is the product of the inverses *in the reverse order*.
:::

## Singular matrices

Since a matrix of zeros times any matrix of compatible size is also a matrix of zeros, a zero matrix is singular—no inverse is possible. That much is the same as with numbers. However, there is a major difference with matrices.

:::{attention}
Some nonzero matrices are singular.
:::

(example-inverse-singular)=
::::{proof:example} 
Let $\bfA = \twomat{0}{0}{1}{0}$. Suppose that 

$$
\meye = \twomat{a}{b}{c}{d} \bfA = \twomat{b}{0}{d}{0}.
$$

This is clearly impossible.
::::

::::{proof:example} 
Again let $\bfA = \twomat{0}{0}{1}{0}$. Note that 

$$
\bfA^2 = \twomat{0}{0}{1}{0} \cdot \twomat{0}{0}{1}{0} = \twomat{0}{0}{0}{0}.
$$

As a result, when you see $\bfA\bfB = \bfzero$, you cannot just "cancel out" the $\bfA$ to conclude $\bfB=\bfzero$. However, if $\bfA$ is invertible, then $\bfB=\bfA^{-1}\cdot \bfzero = \bfzero$ is true. 
::::

## Connection to linear systems

The following theorem is in every linear algebra course, but it does not have a universally accepted name.

(theorem-FTLA1)=
::::{proof:theorem} Fundamental Theorem of Linear Algebra (FTLA)
If $\bfA$ is an $n\times n$ matrix, then each of these statements is equivalent to all of the others.

1. $\bfA$ is invertible.
2. The linear system $\bfA\bfx=\bfb$ has a unique solution for each $\bfb$.
3. The null space of $\bfA$ is just the zero vector.
4. The RRE form of $\bfA$ is the identity matrix.
::::

```{note}
The statement "$\bfA$ is singular" for the linear system $\bfA\bfx = \bfb$ is the multidimensional equivalent of "$a$ is zero" in the 1D problem $ax=b$. For a singular matrix, a unique solution is impossible–the system has either no solution or infinitely many of them.
```

::::{proof:proof}
We'll only look at statement 1 implying statement 2. Let $\bfx$ be any vector that solves $\bfb=\bfA\bfx$. Multiply both sides on the left by $\bfA^{-1}$. Then

```{math}
\bfA^{-1} \bfb =  \bfA^{-1}(\bfA\bfx)= (\bfA^{-1}\bfA) \bfx= \meye \bfx = \bfx.
```

Since the inverse is unique, $\bfx$ is unique as well.
::::

## Computing the inverse

The solution formula $\bfx=\bfA^{-1}\bfb$ from the proof of {numref}`Theorem {number} <theorem-FTLA1>` is incomplete without knowing how to calculate the matrix inverse. Doing so in general is harder than just doing row elimination on the original linear system. But in the $2\times 2$ case the inverse is so easy that it's worth committing to memory.

```{index} ! inverse of a matrix; $2\times 2$ case
```

(formula-linalg-inverse2by2)=
::::{proof:formula} Inverse of $2\times 2$

```{math}
:label: linalg-inverse2by2
\begin{bmatrix} a & b \\ c & d \end{bmatrix}^{-1} = \frac{1}{ad-bc}\: \begin{bmatrix} d & -b \\ -c & a \end{bmatrix}.
```

This formula breaks down if $ad=bc$, in which case the matrix is singular. 
::::

Beyond $2\times 2$ we won't bother with computing inverses.

