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


## Properties

First, the bad news. 

```{warning}
Matrix multiplication is not commutative. If $\bfA\bfB$ is defined, then $\bfB\bfA$ may not be, and even if it is, it may not equal $\bfA\bfB$. Put another way, you cannot simply change the order of the terms in a matrix product without some explicit justification.
```

Fortunately, other familiar and handy properties of multiplication do come along for the ride:

1. $(\bfA\bfB)\mathbf{C}=\bfA(\bfB \mathbf{C})\qquad$  (association)
2. $\bfA(\bfB+\mathbf{C}) = \bfA\bfB + \bfA\mathbf{C}\qquad$  (right distribution)
3. $(\bfA+\bfB)\mathbf{C} = \bfA\mathbf{C} + \bfB\mathbf{C}\qquad$   (left distribution)

These properties are easy to demonstrate (but not prove!) computationally. 

```{code-cell}
A = [ 1 -1; 0 2; -3 1 ]
B = [ 2 -1 0 4; 1 1 3 2 ]
C = [ 1 -1 2; 2 2 0; 5 -2 -3; 4 -1 -1 ];
```

```{code-cell}
(A*B)*C - A*(B*C)    # always zero in exact artithmetic
```

```{code-cell}
# some random choices
A = rand(1:10,4,4)
B = rand(1:10,4,4)
C = rand(1:10,4,4)

ident1 = ( A*(B+C) ) - ( A*B + A*C )    # should be ≈ zero
```

```{code-cell}
ident2 = ( (A+B)*C ) - ( A*C + B*C )    # should be ≈ zero
```

## Transpose

Here's a curious operation that we won't be using much, but it is important enough to know about.

```{index} ! transpose of a matrix
```

(definition-algebra-transpose)=
::::{proof:definition} Transpose of a matrix
The **transpose** of $m\times n$ matrix $\bfA$, whose elements are $A_{ij}$, is the $n\times m$ matrix $\bfA^T$ with elements $A_{ji}$.
::::

When taking the transpose, rows become columns, and vice versa.

### Properties

For the record:

(theorem-algebra-transpose)=
::::{proof:theorem} 
If $\bfA$ and $\bfB$ are matrices of compatible sizes, and $c$ is a number, then
1. $(\bfA^T)^T = \bfA$
2. $(\bfA+\bfB)^T = \bfA^T + \bfB^T$
3. $(c\bfA^T) = c(\bfA^T)$
4. $(\bfA\bfB)^T = \bfB^T \bfA^T$
::::

Only the last of these is not intuitively clear.

