
(section-linear_system-nullspace)=
# Homogeneous systems

There are only three possible outcomes for a linear system, all deducible from the RRE form of the augmented matrix:

1. There is a leading 1 in the last column, in which case there are no solutions.
2. There are fewer pivot columns than variables, in which case there are infinitely many solutions.
3. There is a unique solution.

There is an important situation where we can rule out case 1 above.

```{index} ! homogeneous; linear system
```

(definition-nullspace-def)=
::::{proof:definition} Homogeneous linear system
A **homogeneous** linear system is one that has forcing vector $\bfb$ equal to zero.
::::

As the following theorem points out, we can work with just the RRE form of the coefficient matrix $\bfA$ instead of the augmented matrix of a homogeneous system.

(theorem-nullspace-rref)=
::::{proof:theorem}
The last column of the RRE form of the augmented matrix of a homogeneous linear system is a zero vector.
::::
:::{proof:proof}
Row operations don't change the zeros in that column.
:::

## Null space

(definition-nullspace-nullspace)=
::::{proof:definition}
The **null space** of a matrix $\bfA$, written $\nullsp(\bfA)$, is the set of all solutions to the homogeneous linear system with coefficient matrix $\bfA$.
::::

:::{note}
Sometimes the null space is called the *kernel* of the matrix.
:::

As the name implies, the null space is our first example of what we will call a **subspace**. We won't worry about that definition just yet.

For a homogeneous linear system, the zero vector $\bfx=\bfzero$ is always a solution; hence, the system is consistent. The question becomes whether zero is the *only* solution. Thus, we only need to look at case 2 at the beginning of the section.

The following pretty much just follows immediately from our definitions. (That happens a lot in linear algebra: the work is in the setup, not the punchline.)

(theorem-nullspace-uniqueness)=
::::{proof:theorem}
A homogeneous system in $n$ variables with coefficient matrix $\bfA$ has a unique solution if and only if $\rank(\bfA)=n$.
::::

(corollary-nullspace-uniqueness)=
::::{proof:corollary}
A homogeneous linear system with more variables than equations has infinitely many solutions.
::::
:::{proof:proof}
$\rank(\bfA) \le m < n$.
:::

## Spanning sets

When we do have infinitely many solutions in a homogeneous linear system, it's nice to have a finite description of all of them. This takes us on a considerable side quest.

```{index} ! linear combinations, ! span
```

(definition-nullspace-linear-comb)=
::::{proof:definition} Linear combination and span
A **linear combination** of vectors $\bfv_1, \ldots, \bfv_k$ with **coefficients** $c_1,\ldots,c_k$ is the vector

$$
c_1 \bfv_1 + c_2 \bfv_2 + \cdots + c_k \bfv_k.
$$

The set of all linear combinations of $\bfv_1,\ldots,\bfv_k$ is known as the **span** of those vectors. The span of an empty set is the set consisting of only the zero vector.
::::

Statements about linear combinations can be transformed into statements about linear systems of equations.

(example-nullspace-combo)=
::::{proof:example}
Show that $\bfv=[1,4,3]$ is in the span of $\bfu_1=[1,-2,-1]$ and $\bfu_2=[3,0,1]$. (That is, $\bfv$ can be written as a linear combination of these two vectors.)
:::{dropdown} Solution
Suppose that $\bfv = c_1 \bfu_1 + c_2 \bfu_2$. Looking at each component of this vector equation, we conclude that

$$
  c_1 + 3c_2 &= 1 \\
  -2c_1 + 0c_2 &= 4 \\
  -c_1 + c_2 &= 3,
$$

which is a linear system with augmented matrix

$$
\begin{bmatrix}
  1 & 3 & 1 \\ -2 & 0 & 4 \\ -1 & 1 & 3
\end{bmatrix}.
$$

The RRE form of this matrix is

$$
\begin{bmatrix}
 1 & 0 & -2 \\
 0 & 1 & 1 \\
 0 & 0 & 0 \\
\end{bmatrix},
$$

which is consistent. In fact, the unique solution is $c_2=1$, $c_1=2$.
:::
::::


A nontrivial null space (i. e., containing more than the zero vector) can always be described as the span of finitely many vectors.

(example-nullspace-span)=
::::{proof:example}
Suppose the RRE form of a matrix $\bfA$ is

$$
\mathbf{R} = 
\begin{bmatrix}
0 & 1 & 4 & 0 & 1 \\
0 & 0 & 0  & 1 & -3 \\
0 & 0 & 0  & 0 & 0  \\
0 & 0 & 0  & 0 & 0
\end{bmatrix}.
$$

Therefore, the RRE form of the augmented matrix $[\mathbf{A}\: \boldsymbol{0}]$ is $[\mathbf{R}\: \boldsymbol{0}]$. The pivot columns are 2 and 4, which makes $x_1=r$, $x_3=s$, and $x_5=t$ free variables. The nonzero rows lead to

$$
x_2 + 4x_3 + x_5 &= 0 &\quad ⇒ \quad x_2 &= -4s-t,\\
x_4 -3x_5 &= 0 & \quad ⇒ \quad x_4 &= 3t.
$$

One way to express a generic solution vector in the null space is by a linear combination of constant vectors:

$$
\begin{bmatrix}
  r \\ -4s-t \\ s \\ 3t\\ t
\end{bmatrix}
= r \begin{bmatrix}
  1 \\ 0 \\ 0 \\ 0 \\ 0
\end{bmatrix}
+ s \begin{bmatrix}
  0 \\ -4 \\ 0 \\ 1 \\ 0
\end{bmatrix}
+ t \begin{bmatrix}
  0 \\ -1 \\ 0 \\ 3 \\ 1
\end{bmatrix} = r\bfv_1 + s\bfv_2 + t\bfv_3 .
$$

Hence $\nullsp(\bfA)=\span(\bfv_1,\bfv_2,\bfv_3)$, where the $\bfv_j$ are the constant vectors above.
::::

## Independence

Now that we have a finite description of the null space, we want to refine it to make sure that it is as simple as possible. For this, we need a new take on an old friend.

```{index} ! linear independence; of vectors
```

(definition-nullspace-indepdendence)=
::::{proof:definition} Linear independence
Vectors $\bfv_1,\bfv_2,\ldots,\bfv_n$ are **linearly dependent** if there is a way to choose constants $c_1,\ldots,c_n$, *not all zero*, such that

$$
c_1\bfv_1 + c_2\bfv_2 + \cdots c_n \bfv_n = 0.
$$

If the vectors are not linearly dependent, then they are **linearly independent**.
::::

:::{note}
Sound familiar? Stay tuned!
:::

Because linear combinations are equivalent to linear systems, statements about linear independence are equivalent to statements about homogeneous linear systems, and therefore about null spaces.

(example-nullspace-dependent)=
::::{proof:example}
Determine whether the vectors $\bfv_1=\threevec{1}{0}{-2}$, $\bfv_2=\threevec{1}{0}{1}$, and $\bfv_3 = \threevec{0}{0}{-1}$ are linearly independent.
:::{dropdown} Solution
These vectors are dependent if, and only if, we can find $c_1,c_2,c_3$, not all zero, such that

$$
c_1 \bfv_1 + c_2 \bfv_2 + c_3 \bfv_3 = \bfzero.
$$

Equating components on the two sides of this equation leads to the linear system with augmented matrix

$$
\begin{bmatrix}
  1 & 1 & 0 & 0 \\ 0 & 0 & 0 & 0 \\ -2 & 1 & -1 & 0
\end{bmatrix}.
$$

The RRE form of this system is

$$
\begin{bmatrix}
 1 & 0 & \frac{1}{3} & 0 \\
 0 & 1 & -\frac{1}{3} & 0 \\
 0 & 0 & 0 & 0 \\
\end{bmatrix},
$$

whose solutions are $[-t/3,t/3,t]$ for all $t$. Since there are nonzero solutions to the linear system, the original set of vectors is linearly dependent.
:::
::::

The result of the preceding example is worth stating on the record. It's basically just a fusion of equivalent terminology.

(theorem-nullspace-dependence)=
::::{proof:theorem}
Suppose $\bfv_1,\ldots,\bfv_k$ are vectors in $\real^n$, and let $\bfA$ be the matrix whose columns are $\bfv_1,\ldots,\bfv_k$. Then these vectors are linearly dependent if and only if $\bfA$ has a null space containing more than the zero vector.
::::

Dependent vectors can lengthen the description of a spanned space without actually contributing any information.

(example-nullspace-dependentspan)=
::::{proof:example}
The result of {numref}`Example {number} <example-nullspace-dependent>` is that $\bfv_1=\threevec{1}{0}{-2}$, $\bfv_2=\threevec{1}{0}{1}$, and $\bfv_3 = \threevec{0}{0}{-1}$ are linearly dependent. For instance,

$$
\bfv_1 - \bfv_2 + 3 \bfv_3 = \bfzero.
$$

Therefore, any vector in $\span(\bfv_1,\bfv_2,\bfv_3)$ can be written as

$$
c_1 \bfv_1 + c_2 \bfv_2 + c_3 \bfv_3 &= c_1(\bfv_2 - 3 \bfv_3) + c_2 \bfv_2 + c_3 \bfv_3 \\
&= (c_1+c_2) \bfv_2 + (c_3- 3c_1)\bfv_3.
$$

Hence $\span(\bfv_1,\bfv_2,\bfv_3) = \span(\bfv_2,\bfv_3)$.
::::

:::{note}
In {numref}`Example {number} <example-nullspace-dependentspan>`, we could have removed $\bfv_2$ or $\bfv_3$ from the spanning set instead without changing the spanned result. The only requirement is that the coefficient of the removed vector is not zero in the linear combination of them that makes zero.
:::

A set of vectors that both spans the null space and is linearly independent is called a **basis** of the null space. We'll formalize that idea when we discuss subspaces more generally. For now, just know that a basis is a minimal set of vectors that can get the spanning job done.
