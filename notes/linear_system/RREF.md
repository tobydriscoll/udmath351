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
# RRE form

It's time to get more formal and precise about row elimination. 

Previously we used row operations going top to bottom on the rows, left to right with the columns, to put the augmented matrix into triangular form. We refer to this process now as the *downward phase* of elimination.

In what follows we use the term **leading nonzero** to mean the first (i.e., leftmost) entry of a row that is not zero.

(definition-linalg-phase1)=
::::{proof:algorithm}  Row elimination downward phase
1. Set $i=1$.
2. Find the leftmost leading nonzero in rows $i$ and below. The column of this leading nonzero is known as the **pivot column**. If no such column exists, stop.
3. As necessary, swap rows and/or multiply a row by a constant to put a 1 in the pivot column of row $i$.
4. Add multiples of row $i$ to the rows below it in order to put zeros into the pivot column.
5. Increment $i$ and return to step 2.
::::

At the end of the downward phase, the augmented matrix is triangular. However, it's not the cleanest form to work with theoretically, so we continue.

(definition-linalg-phase2)=
::::{proof:algorithm} Row elimination upward phase
1. Set $i=m$ (the number of equations).
2. Use multiples of row $i$ to put zeros above the leading 1 in that row.
3. Decrement $i$. If $i> 1$, return to step 2.
::::

At the end of the upward phase, the matrix is in a form that we define formally here.

```{index} ! RRE form (reduced row-echelon form), ! pivot column, ! free column
```

(definition-linalg-RREF)=
::::{proof:definition} RRE form

A matrix is in **RRE form** (reduced row-echelon form) if it meets all of these requirements:

1. Any rows of all zeros appear below all nonzero rows.
2. The leading nonzero of any row is a one.
3. Every leading 1 that is lower than another leading 1 is also to the right of it.
4. Every leading 1 is the only nonzero in its column.

The columns that have leading ones are called **pivot columns**. The other columns are called **free columns**.
::::

There are two things that make RRE form useful. One is that it makes a unique target we can always reach.

(theorem-RREF-unique)=
::::{proof:theorem} 
Every matrix is equivalent to a unique matrix in RRE form.
::::

The other useful fact is that RRE form completely exposes what everything we want to know about a linear system. In a sense, everything else we will do with matrices comes back to the RRE form.

## Example

Here is an example of reduction to RRE form for a linear system 

$$
\bfA = \begin{bmatrix}
2 & 0 & 4 & 3 \\ -2 & 0 & 2 & -13 \\ -4 & 5 & -7 & -10 \\ 1 & 15 & 2 & -4.5
\end{bmatrix}, \qquad 
\bfb = \begin{bmatrix}
4\\40\\9\\29
\end{bmatrix}.
$$

```{code-cell}
A = [
     2    0    4    3 
    -2    0    2  -13
    -4    5   -7  -10 
     1   15    2   -4.5
    ];
b = [ 4, 40, 9, 29 ];

S = [A b]
```

We start at the top, working downward and rightward. In the first row, the leading nonzero occurs in column 1, which is the pivot column for this row. We normalize this row so that the leading nonzero is a 1.

```{code-cell}
S[1,:] = S[1,:]/S[1,1]
S
```

Now multiples of row 1 are added to the rows below it in order to put zeros in the first column.

```{code-cell}
S[2,:] = S[2,:] - S[2,1]*S[1,:]
S[3,:] = S[3,:] - S[3,1]*S[1,:]
S[4,:] = S[4,:] - S[4,1]*S[1,:]
S
```

Looking at rows 2 to 4, we see that the leftmost nonzero occurs in column 2. Since row 2 has a zero there, we swap rows 2 and 3 to bring a nonzero up.

```{code-cell}
S[2:3,:] = S[[3,2],:]
S
```

Now we normalize row 2 so that the leading nonzero is a 1.

```{code-cell}
S[2,:] = S[2,:]/S[2,2]
S
```

Multiples of row 2 are now used to put zeros below it in the pivot column.

```{code-cell}
S[3,:] = S[3,:] - S[3,2]*S[2,:]
S[4,:] = S[4,:] - S[4,2]*S[2,:]
S
```

Rows 3 and 4 have a pivot in column 3, and we only need to normalize row 3 to make it 1. Then we subtract a multiple of row 3 from row 4 to put a zero beneath it.

```{code-cell}
S[3,:] = S[3,:]/S[3,3];
S[4,:] = S[4,:] - S[4,3]*S[3,:]
S
```

We complete the downward phase by normalizing row 4 to get a leading 1.

```{code-cell}
S[4,:] = S[4,:]/S[4,4]
S
```

Now we turn around for the upward phase. The leading 1 in row 4 needs to have zeros above it. We accomplish that by subtracting multiples of row 4 from the others.

```{code-cell}
S[3,:] = S[3,:] - S[3,4]*S[4,:]
S[2,:] = S[2,:] - S[2,4]*S[4,:]
S[1,:] = S[1,:] - S[1,4]*S[4,:]
S
```

We move up to row 3 and use multiples of it to put zeros above its leading 1.

```{code-cell}
S[2,:] = S[2,:] - S[2,3]*S[3,:]
S[1,:] = S[1,:] - S[1,3]*S[3,:]
S
```

The last move is to use a multiple of row 2 to put a zero above its leading 1. As it has played out in this example, this line of code changes nothing because the position was already zero.

```{code-cell}
S[1,:] = S[1,:] - S[1,2]*S[2,:]
S
```

This matrix is in RREF. We interpret it as the trivial linear system

\begin{align*}
x_1 &= -3,\\ x_2 &= 1,\\ x_3 &= 4, \\ x_4 &= -2.
\end{align*}

```{warning}
You can [use Wolfram Alpha]("https://www.wolframalpha.com/input/?i=rref%20%7B%7B1%2C2%2C3%7D%2C%7B4%2C5%2C6%7D%2C%7B7%2C8%2C9%7D%7D") for finding the RRE form of a matrix.
```

## Solution from the RRE form

The RRE form of an augmented matrix represents a linear system that we can solve by inspection:

1. Ignore all zero rows.
2. If a leading one occurs in the last column, the system is inconsistent.
3. Otherwise, each variable associated with a free column is assigned to a free parameter (e.g., $s$, $t$, etc.).
4. Use the pivot columns to solve for their corresponding variables in terms of the free parameters.

(example-RREF-multiple)=
::::{proof:example}
A linear system has an augmented matrix equivalent to the RRE form

$$
\begin{bmatrix}
0 & 1 & -3 & 0 & 2 \\
0 & 0 & 0  & 1 & -4 \\
0 & 0 & 0  & 0 & 0  \\
0 & 0 & 0  & 0 & 0  
\end{bmatrix}.
$$

Find all solutions to the linear system.

:::{dropdown} Solution
The last two rows have no information and can be ignored. Columns 2 and 4 are pivot columns. We give variables from the other columns arbitrary values, $x_1=s$ and $x_3=t$. The pivot variables are solved in terms of these to get $x_2=2+3t$ and $x_4=-4$. All solutions are expressed as the vector

$$
\bfx = \begin{bmatrix}
s \\ 2+3t \\ t \\ -4
\end{bmatrix}, \qquad s,t\in \real.
$$
:::
::::

::::{proof:example}
A linear system has an augmented matrix equivalent to the RRE form

$$
\begin{bmatrix}
1 & 0 & -4 & 0 & 0 \\
0 & 1 & 1  & 0 & 0 \\
0 & 0 & 0  & 1 & 0  \\
0 & 0 & 0  & 0 & 1
\end{bmatrix}.
$$

Find all solutions to the linear system.

:::{dropdown} Solution
Look at the last row of the system. It expresses the equation $0=1$, which is impossible to satisfy. Thus the system is inconsistent.
:::
::::

## Rank

Leaving aside the actual calculation of solutions, a glance at the RRE form tells us at a glance whether the system has no solution, a unique solution, or infinitely many solutions. Because of the requirements on leading ones in the matrix, the outcomes are constrained just by how many of them there are.

```{index} ! rank of a matrix
```

(definition-RREF-rank)=
::::{proof:definition} Rank
The **rank** of a matrix is the number of pivot columns in its RRE form, i. e., the number of leading ones.
::::

(theorem-RREF-rank)=
::::{proof:theorem} 
If $\bfA$ is an $m\times n$ matrix, then $\rank(\bfA) \le m$ and $\rank(\bfA) \le n$.
::::
:::{proof:proof}
Each leading one in the RRE form requires a row and column of its own.
:::

(theorem-RREF-deficient)=
::::{proof:theorem} 
Suppose $\bfA$ is $m\times n$. If $\rank(\bfA)<n$, then the linear system with augmented matrix $[\bfA\: \bfb]$ cannot have a unique solution. It is inconsistent for some choices of $\bfb$ and has infinitely many solutions for other choices of $\bfb$.
::::
:::{proof:proof}
Let $r=\rank(\bfA)$. Then the RRE form of $\bfA$ has is all zero in rows $r+1$ to $m$. Now augment $\bfA$ with $\bfb$ and perform the row operations that reduce $\bfA$ to RRE form. If there are any nonzeros in rows $r+1$ to $m$ of the last column, the system is inconsistent. Otherwise, the system has at least one free variable. We can start with either type of outcome and run the row elimination process backward to find a $\bfb$ that led to it.
:::

(corollary-RREF-nonunique)=
::::{proof:corollary} 
A linear system with more variables than equations cannot have a unique solution.
::::
:::{proof:proof}
$\rank(\bfA) \le m < n$.
::