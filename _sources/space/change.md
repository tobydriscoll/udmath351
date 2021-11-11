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
(section-space-change)=
# Change of basis

In the examples of {numref}`section-space-basis` we saw that questions about (finite-dimensional) abstract vector spaces can be intepreted in terms of ordinary vectors and matrices. The link between the different forms is the expression of vectors in terms of a basis.

## Coordinates

```{index} ! coordinates
```

(definition-basis-coordinates)=
::::{proof:definition} Coordinates
Suppose $\bfv_1,\ldots,\bfv_k$ is a basis $\mathcal{B}$ of vector space $V$. If $\bfu\in \mathcal{B}$ satisfies

$$
\bfu = c_1 \bfv_1 + \cdots + c_k\bfv_k,
$$

then $c_1,\ldots,c_k$ are the **coordinates** of $\bfu$ with respect to $\mathcal{B}$, and we write

$$
[\bfu]_\mathcal{B} = \begin{bmatrix}
  c_1 \\ \vdots \\ c_k
\end{bmatrix}.
$$
::::

:::{warning}
Although we often write a basis as a set, and ordering of members doesn't matter to a set, the ordering *does* matter when it comes to the coordinates, so be careful. 
:::

The coordinates of the polynomial $a+bx+cx^2$ in $\mathcal{P}_2$ are simply $[a,b,c]$. For nonstandard bases, a little work is required.

(example-change-coordinates)=
::::{proof:example} 
Find the coordinates of $2+2x$ in terms of the basis $\mathcal{B}$ given by $1-x$, $1+x^2$, $x+2x^2$. 
:::{dropdown} Solution
We have to express the given vector as a linear combination of the members of the basis: 

$$
2+2x = c_1(1-x) + c_2(1+x^2) + c_3(x+2x^2).
$$

We can easily turn this into a linear system by matching powers of $x$. But instead note that if we call the standard basis $\mathcal{T}$, then

$$
[2+2x]_\mathcal{T} &= c_1[1-x]_\mathcal{T} + c_2[1+x^2]_\mathcal{T} + c_3[x+2x^2]_\mathcal{T} \\ 
\threevec{2}{2}{0} &= c_1\threevec{1}{-1}{0} + c_2\threevec{1}{0}{1} + c_3\threevec{0}{1}{2} \\ 
&= \begin{bmatrix}
  1 & 1 & 0 \\ -1 & 0 & 1 \\ 0 & 1 & 2
\end{bmatrix} \threevec{c_1}{c_2}{c_3}.
$$

Solving the linear system gives $[2+2x]_\mathcal{B} = \mathbf{c} = [-6,8,-4]$.
:::
::::

:::{note}
When working in $\real^n$, there is a subtle technical distinction between a vector and its coordinates in the standard basis. For example, if $\mathcal{B}$ is the standard basis of $\real^2$, and $\bfv = 3\bfe_1 - 4 \bfe_2$, then we can say $[\bfv]_\mathcal{B} = [3,-4]$, but it's slightly improper to say that $\bfv = [3,-4]$. Rather than avoid this natural and convenient expression, however, we'll just pause here to acknowledge that it bends the rules a bit.
:::

## Change of basis matrix

Suppose $\mathcal{B}$ is a basis of $\real^n$ consisting of vectors $\bfv_1,\ldots,\bfv_n$. If $\bfu\in \real^n$ has coordinate vector $[\bfu]_\mathcal{B} = \mathbf{c}$, this means that

$$
\bfu = c_1 \bfv_1 + \cdots c_n \bfv_n.
$$

If we let $\mathcal{T}$ stand for the standard basis of $\real^n$, then it's also true that

$$
[\bfu]_\mathcal{T} &= c_1 [\bfv_1]_\mathcal{T} + \cdots c_n [\bfv_n]_\mathcal{T} \\ 
&= \bigl[ [\bfv_1]_\mathcal{T}\; [\bfv_2]_\mathcal{T}\;  \cdots\; [\bfv_n]_\mathcal{T} \bigr] \cdot \mathbf{c} \\ 
&= \bfV [\bfu]_\mathcal{B}.
$$

That is, by letting $\bfV$ be the columnwise expression of the members of $\mathcal{B}$ in terms of basis $\mathcal{T}$, we find that left-multiplication by $\bfV$ transforms $\mathcal{B}$-coordinates to $\mathcal{T}$-coordinates. It follows that also

$$
[\bfu]_\mathcal{B} = \bfV^{-1} [\bfu]_\mathcal{T}.
$$

We can be certain that the inverse exists, because the members of $\mathcal{B}$ are independent.

The textbook uses the notation $\bfV = \mathbf{P}_{\mathcal{T}←\mathcal{B}}$ and $\bfV^{-1} = \mathbf{P}_{\mathcal{B}←\mathcal{T}}$ to mean a **change of basis matrix**. But I prefer to write

$$
[\mathcal{B}]_\mathcal{T}
$$

for the matrix $\bfV$ above. It means both to express the members of $\mathcal{B}$ in terms of $\mathcal{T}$, and to transform a $\mathcal{B}$-coordinate vector to $\mathcal{T}$-coordinates. We summarize two key properties in this notation. While we started the discussion with $\real^n$ as the vector space and $\mathcal{T}$ as the standard basis, those assumptions are not necessary.

(theorem-change-cob)=
::::{proof:theorem} 
Suppose $\mathcal{B}$ and $\mathcal{C}$ are bases of vector space $V$. Let $[\mathcal{B}]_\mathcal{C}$ be the matrix whose columns are the $\mathcal{C}$-coefficients of the members of $\mathcal{B}$. Then for any $\bfv\in V$, 

:::{math}
:label: eq-change-system
 [\bfv]_\mathcal{C} = [\mathcal{B}]_\mathcal{C} [\bfv]_\mathcal{B}.
:::

Moreover,

:::{math}
:label: eq-change-inverse
[\mathcal{C}]_\mathcal{B} = [\mathcal{B}]_\mathcal{C}^{-1}.
:::
::::

(example-change-cob1)=
::::{proof:example} 
The coefficient matrix appearing in {numref}`Example {number} <example-change-coordinates>` is the matrix $[\mathcal{B}]_\mathcal{T}$ for that problem.
::::

(example-change-cob2)=
::::{proof:example} 
Both $\mathcal{B}=(1,1-x)$ and $\mathcal{C}=(1+x,x)$ are bases of $\mathcal{P}_1$. Find the matrix that transforms $\mathcal{C}$-coordinates to $\mathcal{B}$-coordinates.

:::{dropdown} Solution
It may be easiest to use the standard basis $\mathcal{T}=(1,x)$ as an intermediary, because that is how both bases in the problem are expressed. We have

$$
[\mathcal{B}]_\mathcal{T} = \twomat{1}{1}{0}{-1}, \qquad [\mathcal{C}]_\mathcal{T} = \twomat{1}{0}{1}{1}.
$$

For any vector $\bfv$,

$$
[\bfv]_\mathcal{B} = [\mathcal{T}]_\mathcal{B} [\bfv]_\mathcal{T} =  [\mathcal{T}]_\mathcal{B} \, [\mathcal{C}]_\mathcal{T} [\bfv]_\mathcal{C}.
$$

Hence

$$
[\mathcal{C}]_\mathcal{B} = [\mathcal{T}]_\mathcal{B} \, [\mathcal{C}]_\mathcal{T} = \twomat{1}{1}{0}{-1}^{-1} \twomat{1}{0}{1}{1} = \twomat{2}{1}{-1}{-1}
$$
:::
::::

:::{attention}
There's not a whole lot going on, but it can get confusing. Right-to-left in the example above, multiplying by $[\mathcal{C}]_\mathcal{T}$ gets you from $\mathcal{C}$-coordinates to $\mathcal{T}$-coordinates, and then multiplying by $[\mathcal{B}]_\mathcal{T}^{-1}$ takes you from $\mathcal{T}$ to $\mathcal{B}$. The notation works by "cancelling" normal scripts with subscripts. 
:::