(section-matrix-subspaces)=
# Subspaces

We encountered the null space of a matrix in {numref}`section-linear_system-nullspace`. It's a special case of a vital type of set.

(definition-subspaces-subspace)=
::::{proof:definition} Subspace
A **subspace** of $\real^n$ is a set $S$ satisfying:
1. The zero vector is in $S$.
2. Every linear combination of vectors in $S$ is also in $S$.
::::

The second property above is called *closure under linear combination*. 

:::{note}
We will be making statements about real spaces like $\real^n$, but everything also works for $\complex^n$, which turns out to be important soon.
:::

(example-subspaces-plane)=
::::{proof:example} 
The equation $x + 2y + 3z = 0$ describes a plane passing through the origin in $\real^3$. It's clear geometrically that scaling a vector in the plane leaves you in the plane, and adding vectors in the plane does as well. This is enough to show that this plane is a subspace of $\real^3$. In fact, it is the null space of the matrix $\begin{bmatrix} 1 & 2 & 3 \end{bmatrix}.$

The equation $x+y+z=1$ is also a plane in $\real^3$, but it does not pass through the origin, so it cannot be a subspace. (It also fails closure for scaling and addition.)
::::

(theorem-subspaces-nullspace)=
::::{proof:theorem} 
The null space of an $m\times n$ matrix is a subspace of $\real^n$.
::::
::::{proof:proof}
Let $S=\nullsp(\bfA)$. If $\bfu$ and $\bfv$ are in $S$, then by definition, $\bfA\bfu = \bfA\bfv = \bfzero$. Then
by basic algebraic properties,

$$
\bfA( c_1 \bfu + c_2 \bfv) = c_1 \bfA \bfu + c_2 \bfA \bfv = \bfzero.
$$

The derivation applies to linear combinations of any length.
::::

There is at least one easy way to generate subspaces. The following is not hard to prove.

(theorem-subspaces-span)=
::::{proof:theorem} 
If $S=\span(\bfv_1,\ldots,\bfv_k)$ for any vectors $\bfv_j$ in $\real^n$, then $S$ is a subspace of $\real^n$.
::::

In addition to the null space, there is another important subspace closely associated with a matrix.

(definition-subspaces-rowcol)=
::::{proof:definition} Column space
Let $\bfA$ be an $m\times n$ matrix. The **column space** of $\bfA$, $\colsp(\bfA)$, is the span of the columns of $\bfA$. 
::::

By {numref}`Theorem {number} <theorem-subspaces-span>`, $\colsp(\bfA)$ is a subspace of $\real^m$. 

## Basis

We defined span and independence in {numref}`section-linear_system-nullspace`. These are two great tastes that taste great together.

(definition-subspaces-basis)=
::::{proof:definition} Basis
A **basis** of a subspace $S$ is any set of linearly independent vectors that spans $S$.
::::

Finding a basis for a null space was demonstrated in {numref}`Example {number} <example-nullspace-span>`. The column space is also found from the RRE form.

:::{proof:theorem}
Let $\bfA$ have RRE form with pivot columns numbered $j_1,\ldots,j_r$. Then columns $j_1,\ldots,j_r$ of $\bfA$ are a basis for $\colsp(\bfA)$.
:::

(example-subspaces-colnull)=
::::{proof:example}
Find bases for the null space and column space of   

$$
\bfA = \begin{bmatrix} 
1 & 2 & 0 & -4 \\
-2 & -4 & 1 & 9 \\
-3 & -6 & 1 & 13 \\
-2 & -4 & 0 & 8   
\end{bmatrix}. 
$$

:::{dropdown} Solution
You can compute that the RRE form of $\bfA$ is 

$$
\begin{bmatrix} 
1 & 2 & 0 & -4 \\
0 & 0 & 1 & 1 \\
0 & 0 & 0 & 0 \\
0 & 0 & 0 & 0   
 \end{bmatrix}.
$$

To get a basis for $\colsp(\bfA)$ we choose columns 1 and 3 of $\bfA$, i. e., $\{[1,-2,-3,-2],  [0,1,1,0] \}$. 

The homogeneous system $\bfA\bfx = \bfzero$ has free variables $x_2=s$, $x_4=t$. Solving for the other variables gives the solution set

```{math}
\bfx = s \begin{bmatrix} -2 \\ 1 \\ 0 \\ 0 \end{bmatrix} + t \begin{bmatrix} 4 \\ 0 \\ -1 \\ 1 \end{bmatrix},
```

which makes $\{[-2,1,0,0],[4,0,-1,1]  \}$ a basis for $\nullsp(\bfA)$.
:::
::::

(example-subspaces-findbasis)=
::::{proof:example}
Find a basis for span of the vectors $\bfv_1=[1,-2,-3,-2]$, $\bfv_2=[2,-4,-6,-4]$, $\bfv_3=[0,1,1,0]$, $\bfv_4=[-4,9,13,8]$.

:::{dropdown} Solution
If we put the given vectors in columns of a matrix, then their span is equivalent to the column space of the matrix:

$$
\colsp\left( 
\begin{bmatrix} 
1 & 2 & 0 & -4 \\
-2 & -4 & 1 & 9 \\
-3 & -6 & 1 & 13 \\
-2 & -4 & 0 & 8   
\end{bmatrix}
\right).
$$

This is the same matrix whose column space was found in {numref}`Example {number} <example-subspaces-colnull>`. Columns 1 and 3 are the pivot columns, and we get the basis $\bfv_1,\bfv_3$ as before. 
:::
::::

## Dimension

You have an intuitive idea of dimension, but it may seem hard to define rigorously. We're set up to do that now. First, we need the following result.

(theorem-subspaces-dimension)=
::::{proof:theorem} 
Every basis for a subspace $S$ has the same number of members. 
::::

```{index} ! dimension
```
(definition-subspaces-dimension)=
::::{proof:definition} Dimension
The **dimension** of a subspace $S$, written $\dim(S)$, is the number of vectors in any basis of $S$.
::::

As you would expect, $\dim(\real^n)=n$. The only way to have $k$ independent vectors that span a subspace $S$ is if $k=\dim(S)$. More specifically:

::::{proof:theorem} 
Suppose $V$ is a set of $k$ vectors in subspace $S$.
1. If $k < \dim(S)$, then $V$ cannot span $S$.
2. If $k > \dim(S)$, then $V$ cannot be linearly independent.
3. Suppose $k=\dim(S)$. If $V$ is independent or if $V$ spans $S$, then $V$ is a basis for $S$.
::::


(example-subspaces-dimension)=
::::{proof:example} 
Determine whether the vectors $\bfv_1=[3,2,1]$, $\bfv_2=[0,-1,2]$, $\bfv_3=[1,1,1]$ are a basis of $\real^3$. 
:::{dropdown} Solution
We find a basis for their span by putting them as columns of a matrix, then looking for the column space. The RRE form of this matrix is a $3\times 3$ identity, so every column is a pivot column. The original three vectors form a basis for their span, so they are independent. Since there are 3 of them, they are also a basis of $\real^3$.
:::
::::

Earlier we defined rank as the number of pivot columns in the RRE form of the matrix. So now we have 

(theorem-subspaces-rank)=
::::{proof:theorem} 
For any $m\times n$ matrix $\bfA$, $\rank(\bfA)=\dim(\colsp(\bfA))$.
::::

The dimension of the null space also gets its own name. 

(definition-subspaces-nullity)=
::::{proof:definition} Nullity
The **nullity** of a matrix $\bfA$, written $\nullity(\bfA)$, is the dimension of $\nullsp(\bfA)$.
::::

Each free variable in the RRE form contributes a vector to the basis of $\nullsp(\bfA)$. That leads to the following.
The following comes from mucking about some more with the RRE form.

(theorem-subspaces-nullity)=
::::{proof:theorem} 
For any $m\times n$ matrix $\bfA$, 
1. $\dim(\nullsp(\bfA))$ is the number of free variables in the RRE form of $\mathbf{A}$.
2. $\rank(\bfA) + \nullity(\bfA) = n$.
::::



<!-- 
::::{proof:example}
The RREF of 

```{math}
\bfA = \begin{bmatrix} 1 & 2 & 3 \\ 4 & 5 & 6 \\ 7 & 8 & 9 \end{bmatrix}
```

is

```{math}
\begin{bmatrix} 1 & 0 & -1 \\ 0 & 1 & 2 \\ 0 & 0 & 0 \end{bmatrix}.
```

Find all solutions of the homogeneous system $\bfA\bfx=\bfzero$.

:::{dropdown} Solution

The RREF of the augmented matrix is

```{math}
\begin{bmatrix} 1 & 0 & -1 & 0\\ 0 & 1 & 2 & 0 \\ 0 & 0 & 0 & 0\end{bmatrix}.
```

Column 3 is free, so the solution starts with $x_3=s$. Rows 1 and 2 then yield

```{math}
x_1 = s, \quad x_2 = -2s,
```

so $\bfx =\threevec{1}{-2}{1}$ for any value of $s$.
:::
::::

 -->
