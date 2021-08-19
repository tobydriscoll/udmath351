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
# Diagonalization

The eigenvalues of a matrix are the roots of its characteristic polynomial $p$. In the general $n\times n$ case, we can factor $p$ as

```{math}
p(z) = (z-\lambda_1)^{m_1}(z-\lambda_2)^{m_2}\cdots(z-\lambda_k)^{m_k},
```

for positive integer exponents such that $m_1+\cdots+m_k=n$. These exponents are the multiplicities of the roots, and that idea carries to the eigenvalues as well.

```{index} ! multiplicity; algebraic
```

(definition-linalg-algmult)=
::::{proof:definition} Algebraic multiplicity
The **algebraic multiplicity** of an eigenvalue is its multiplicity as a root of the characteristic polynomial.
::::

## Geometric multiplicity

The following example illustrates a possibility for eigenvalues of algebraic multiplicity greater than 1.

(example-diagonalization-defective)=
::::{proof:example}
Find the eigenspaces of $\bfA=\twomat{4}{1}{0}{4}$.

:::{dropdown} Solution
The characteristic polynomial is 

```{math}
\twodet{4-\lambda}{1}{0}{4-\lambda} = (4-\lambda)^2,
```

so the double root $\lambda_1=4$ is the only eigenvalue. Since

```{math}
\bfA - 4\meye = \twomat{0}{1}{0}{0},
```

the eigenspace has basis $\twovec{1}{0}$.
:::
::::

This leads us to define a second notion of multiplicity for an eigenvalue. 

```{index} ! multiplicity; geometric
```

(definition-linalg-geomult)=
::::{proof:definition} Geometric multiplicity
The **geometric multiplicity** of an eigenvalue is the dimension of its associated eigenspace.
::::

Here is an important fact we won't try to justify.

::::{proof:theorem}
If $\text{AM}$ and $\text{GM}$ are the algebraic and geometric multiplicities respectively of an eigenvalue, then 

$$
1 \le \text{GM} \le \text{AM}.
$$
::::

## Defectiveness

In the {numref}`Example {number} <example-diagonalization-defective>` we found a lone eigenvalue $\lambda_1=4$ of algebraic multiplicity 2 whose geometric multiplicity is 1. The identity matrix is a different sort of example.

::::{proof:example}
The $2\times 2$ identity matrix $\meye$ has a lone eigenvalue $\lambda_1=1$ of algebraic multiplicity 2. The system $(\meye - \meye)\bfv=\bfzero$ has an RRE form that is the zero matrix, so there are two free variables and two basis vectors. Hence the geometric multiplicity of $\lambda_1$ is also 2.
::::

The distinction between these cases is significant enough to warrant another definition.

```{index} ! defective; eigenvalue, ! defective; matrix
```

::::{proof:definition} Defectiveness
An eigenvalue $\lambda$ whose geometric multiplicity is strictly less than its algebraic multiplicity is said to be **defective**. A matrix is called defective if any of its eigenvalues are defective.
::::

As we will see later, defective matrices often complicate the application of eigenvalue analysis. 

Since multiplicities are always at least one, there is a simple and common case in which we are certain that a matrix is not defective.

::::{proof:theorem} Distinct eigenvalues
If $\bfA\in\cmn{n}{n}$ has $n$ distinct eigenvalues, then $\bfA$ is not defective.
::::

For $n=2$, the possibilities in the case of algebraic multiplicity equal to 2 are easy to pin down even further. 

(thm-la-2x2defective)=
::::{proof:theorem} $2\times 2$ defectiveness
Any $\bfA\in\cmn{2}{2}$ that has a single repeated eigenvalue is either defective or a multiple of the identity matrix. 
::::

## Diagonalization

Suppose $\bfA$ is $n\times n$ and that it has eigenvalues $\lambda_1,\ldots,\lambda_n$ associated with linearly independent eigenvectors $\bfv_1,\ldots,\bfv_n$. Writing out the equations $\bfA\bfv_j = \lambda_j \bfv_j$ in columns, we find

$$
\begin{bmatrix}
  \bfA \bfv_1 & \bfA \bfv_2 & \cdots & \bfA \bfv_n
\end{bmatrix}
&= \begin{bmatrix}
  \lambda_1 \bfv_1 & \lambda_2 \bfv_2 & \cdots & \lambda_n \bfv_n
\end{bmatrix} \\ 
\bfA \begin{bmatrix}
  \bfv_1 & \bfv_2 & \cdots & \bfv_n
\end{bmatrix}
&= \begin{bmatrix}
  \bfv_1 &  \bfv_2 & \cdots & \bfv_n
\end{bmatrix} \begin{bmatrix}
  \lambda_1 & & & \\ & \lambda_2  & & \\ & & \ddots & \\ & & & \lambda_n
\end{bmatrix} \\ 
\bfA \bfV &= \bfV \mathbf{D},
$$

where we defined

:::{math}
:label: eq-diagonalization-VD
\bfV = \begin{bmatrix} \bfv_1 &  \bfv_2 & \cdots & \bfv_n \end{bmatrix}, \qquad 
\mathbf{D} = \begin{bmatrix}
  \lambda_1 & & & \\ & \lambda_2  & & \\ & & \ddots & \\ & & & \lambda_n
\end{bmatrix}.
:::

Since we assumed that the columns of $\bfV$ are linearly independent vectors, the column space of $\bfV$ is $n$-dimensional. Hence $\rank(\bfV)=n$ and $\bfV$ is invertible. 

```{index} ! diagonalization
```

(definition-diagonalization-diag)=
::::{proof:definition} Diagonalization
A **diagonalization** of square matrix $\bfA$ is the factorization

:::{math}
:label: eq-diagonalization-similar
\bfA = \bfV \mathbf{D} \bfV^{-1},
:::

where (as defined in {eq}`eq-diagonalization-VD`) $\mathbf{D}$ is a diagonal matix of eigenvalues and $\bfV$ is a square matrix whose columns are corresponding eigenvectors.
::::

What can we do about the requirement of linearly independent eigenvectors in the columns of $\bfV$? Without wading into the details, the following wraps this assumption up nicely.

(theorem-diagonalization-diag)=
::::{proof:theorem} 
A matrix has a diagonalization if and only if it is not defective.
::::
