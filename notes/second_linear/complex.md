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

(section-second_linear-complex)=
# Complex solutions

```{code-cell}
---
tags: [remove-cell]
---
using Plots,LaTeXStrings,Printf
default(linewidth=2,label="",size=(400,280))
using Logging
disable_logging(Logging.Info)
```

*For a really smart and entertaining introduction to complex numbers, I recommend [this video series](https://youtu.be/T647CGsuOVU).*

There's often a lot of wariness about complex numbers. Terminology is part of the reason. Using "real" and "imaginary" to label numbers is the residue of a value judgment that ruled mathematics for centuries. But complex numbers are actually just as "real" as so-called real numbers. If anything, they are arguably more fundamental.

As a practical matter, you can pretty much always replace a complex value with two real ones, and vice versa. But the complex point of view often provides a unifying perspective. Sometimes the formula manipulations are easier in the complex form, too; in particular, you may be able to replace trigonometry with algebra.

## The reality of imaginary numbers (optional)
`````{toggle}

Let's rewind a bit. We can probably take for granted the positive integers 1, 2, 3, and so on, and we'll throw in zero as well, though this too was controversial for centuries. It's not long before we want to solve a problem like $x+1=0$. Annoyingly, we can pose the problem using just nonnegative integers, but we can't solve it. So we accept the existence of the negative integers.

I can imagine quite a bit of skepticism about this historically. ("Sure, Wei. Ever seen a negative goat?") But if you've ever taken out a loan, you know that negative numbers can have very real consequences.

Eventually, the negative integers seem "obvious" and perfectly natural. But then we run into a problem like

```{math}
2x - 1 = 0.
```

We can pose this problem with integers, but we can't solve it. So we get used to accepting rational numbers, too.

Rational numbers are pretty weird. Between any pair of them, you have infinitely more rational numbers! Yet it turns out they have (huge) gaps as well. You can't solve

```{math}
x^2 - 2 = 0
```

using only rational numbers. So, you're willing to take on irrational numbers too. Talk about weird--every one of them has an infinite, non-repeating decimal expansion.

So much for the "real" numbers. At least we have filled in the so-called number line. But then you get to

```{math}
x^2 + 1 = 0,
```

which is purely "real" but insolvable. Solutions to this equation were widely resisted for a very long time (say, the 18th century), to the point they were called "imaginary" (looking at you here, Descartes).

Yet something amazing happens if you do accept imaginary numbers, and their expansion to the complex numbers. Namely, *The Fundamental Theorem of Algebra*, which states that if you write down a polynomial using complex numbers, it will have only complex numbers as solutions. So there's no infinite ladder of hypercomplex numbers that we have to ascend--just one rung past the "real" one is all we need to tidy things up perfectly.
`````
## Basic arithmetic

We can write a complex number $z\in \complex$ as $z=x+iy$, where $i^2=-1$ and $x$ and $y$ are real numbers known as the **real part** and **imaginary part** of $z$,

```{math}
z = x + i y \quad \Leftrightarrow \quad x = \Re(z), \quad y = \Im(z).
```

Writing a complex number this way is equivalent to using rectangular or Cartesian coordinates in the plane to specify a point $(x,y)$. Thus complex numbers are on a number *plane* rather than a number line.

The generalization of absolute value to complex numbers is known as the **modulus** or **magnitude**, a real nonnegative quantity defined as

```{math}
|z|^2 = [\text{Re}(z)]^2 + [\text{Im}(z)]^2.
```

Like the absolute value, $|z|$ is the distance from $z$ to the origin, and $|w-z|$ is the distance between two complex numbers. Here, though, the distances are in the plane rather than on a line.

An important operation on complex numbers that has no real-value counterpart is the **conjugate**,

```{math}
\bar{z} =\text{Re}(z) - i \,\text{Im}(z).
```

Geometrically the conjugate is the reflection across the real axis of the plane. No matter how complicated an expression is, you just replace $i$ by $-i$ everywhere to get the conjugate.

You add, subtract, and multiply complex numbers by applying the usual algebraic rules, applying $i^2=-1$ as needed. They should give little trouble. Division can be a little trickier, even though the rules are always the same. One trick is to give a complex ratio a purely real denominator:

```{math}
\frac{w}{z} = \frac{w \bar{z}}{z \bar{z}} = \frac{w \bar{z}}{|z|^2}.
```

This is a lot like rationalizing a denominator with square roots. 

::::{proof:example}
$$
\frac{2-i}{3+2i} = \frac{2-i}{3+2i}\cdot \frac{3-2i}{3-2i}
= \frac{6-4i-3i+2i^2}{3^2+2^2} = \frac{4-7i}{13}.
$$
::::

::::{proof:example}
Suppose that $|z|=1$. Then 

$$
\frac{1}{z} = \frac{1}{z}\cdot \frac{\bar{z}}{\bar{z}} = \frac{\bar{z}}{|z|^2} = \bar{z}.
$$
::::

```{tip}
Memorize the special case $\dfrac{1}{i} = -i$.
```

Here are some more simple rules to know:

````{proof:property} Complex arithmetic
For complex numbers $w$ and $z$,

1. $|\bar{z}| = |z|$
1. $|wz| = |w|\cdot |z|$
1. $|w+z|\le |w| + |z|$ (triangle inequality)
1. $\left| \dfrac{1}{z} \right| = \dfrac{1}{|z|}$
1. $\overline{wz}=\bar{w}\cdot \bar{z}$
1. $\overline{w+z}=\bar{w}+\bar{z}$
1. $\overline{\left(\dfrac{1}{z} \right)} = \dfrac{1}{\bar{z}}$
1. $|z|^2 = z\cdot \bar{z}$
````

## Euler's identity

For second-order equations we need to make sense of $e^{\lambda t}$ when $\lambda$ is complex. The key is one of the most famous equations in mathematics.

````{proof:formula} Euler's identity
```{math}
:label: secondlin-euler
e^{it} = \cos(t) + i \sin(t)
```
````

```{note}
Euler is a German name, and as such, it rhymes with "boiler," not "Bueller."
```

::::{dropdown} Explanation (optional, but easy)
Consider the first-order IVP $w'=i w$, $w(0)=1$, where $i^2=-1$. Assume that the solution $w(t)=e^{it}$ takes on complex values at all times. We can write it in real and imaginary parts as $w(t) = u(t) + iv(t)$. Then the ODE becomes 

$$
(u+iv)'=i u - v,
$$

which, on taking real and imaginary parts, is a coupled *real* system:

$$
u' = -v, \quad v' = u,
$$

along with $u(0)=1$ and $v(0)=0$. It should not take you long to confirm that $u(t)=\cos(t)$, $v(t)=\sin(t)$ is the result.
::::

Euler's identity shows that imaginary exponents produce oscillation, rather than the growth/decay of real exponents.

```{code-cell}
:tags: [hide-input]
c = t -> real(exp(1im*t))
s = t -> imag(exp(1im*t))
@gif for t in range(0,4π,length=60)
	plot([c s],0,t,label=["Re part" "Im part"],xaxis=(L"t",(0,4π)),yaxis=(L"e^{it}",(-1.05,1.05)))
	title!("Complex exponential")
end
```

Alternatively, if we take $x$ and $y$ to be the real and imaginary parts of $z=e^{it}$, then they parametrically describe a unit circle in the complex plane.

```{code-cell}
:tags: [hide-input]
@gif for t in range(0,4π,length=60)
	plot(c,s,0,t,aspect_ratio=1,xaxis=("Re z",(-1.1,1.1)),yaxis=("Im z",(-1.1,1.1)))
	title!("Complex exponential = unit circle")
end
```

## Polar form

Suppose $z$ is any nonzero complex value. We can write it in the form

$$
z = |z|\cdot \frac{z}{|z|},
$$

where $|z|$ is the modulus (distance from origin in the plane). Since $\frac{z}{|z|}$ has modulus equal to 1, it must lie on the unit circle. Hence there is a real $\theta$ such that

```{math}
:label: secondlin-polar
z = |z|\, e^{i\theta}.
```

We call {eq}`secondlin-polar` the **polar form** of a complex number, because it expresses $z$ as a distance from zero and an angle from the positive Re axis. Just as with any point in the plane, we can express a complex number either in Cartesian form using Re and Im parts, or in polar form using modulus and Euler's identity.

::::{proof:example}
Suppose $r$ is a positive real number. Then $-r$ lies at a distance $r$ from the origin along the negative real axis. Hence

$$
-r = |r|\, e^{i\pi}.
$$

Supposing that we may take the log of both sides, we get

$$
\ln(-r) = \ln |r| + i\pi.
$$

Using complex numbers, then, we can take the log of a negative number. You will find that this is the case in MATLAB.
::::

::::{proof:example}
What's the square root of $i$?

:::{dropdown} Solution
Since $i$ lies at a distance 1 from the origin along the positive imaginary axis, its polar form is $e^{i\pi/2}$. Then the square root is

$$
\bigl( e^{i\pi/2} \bigr)^{1/2} = e^{i\pi/4}.
$$

Appealing to Euler's formula, this is equivalent to $\frac{1}{\sqrt{2}}(1+i)$. We should note that of course, the negative of this value is also a square root.
:::
::::

## Complex exponentials

Exponential functions still obey the properties you already know, even when the exponents are imaginary or complex numbers. This allows us to handle the exponential of any complex number. Writing $a+i \omega$ for real $a$ and $\omega$, we have the function

````{proof:formula} Complex exponential function
```{math}
:label: secondlin-complex-exp
e^{(a+i \omega)t} = e^{at} \cdot e^{i\omega t} = e^{at} \bigl[ \cos(\omega t) + i \sin(\omega t)\bigr].
```
````

Thus in the function $e^{\lambda t}$, the real part of $\lambda$ controls growth or decay in time, as we are familiar with, and the imaginary part of $\lambda$ controls a frequency of oscillation around a circle in the complex plane.

### Growing

If $\text{Re} \lambda > 0$, the magnitude of the function grows exponentially. The result is an outward spiral. The imaginary part of $\lambda$ controls the frequency or pitch of the spiral. The real and imaginary parts of $e^{\lambda t}$ oscillate between two growing real exponentials.

```{code-cell}
---
tags: [hide-input]
---
a = 0.025;  ω = 0.75;
t = range(0, 25, length=120)
z = @. exp((a+1im*ω)*t)

@gif for k in [eachindex(t);fill(length(t),5)]
    plot(t[1:k],real(z[1:k]),imag(z[1:k]),xaxis=("t",(0,30),:flip),yaxis=("Re z",(-2,2)),zaxis=("Im z",(-2,2)))
    plot!(t[1:k],real(z[1:k]),fill(-1.5,k))
    plot!(t[1:k],fill(2,k),imag(z[1:k]))
    plot!(fill(30,k),real(z[1:k]),imag(z[1:k]),l=:black)
    title!(@sprintf("Growth and oscillation: a = %.2f, ω = %.2f",a,ω))
end
```

### Neutral

When $\lambda$ is purely imaginary, the function values stay on the unit circle in the complex plane. Taking the real and imaginary parts of $e^{\lambda t}$ gives cosine and sine, respectively.

```{code-cell}
---
tags: [hide-input]
---
a = 0.;  ω = 0.75;
t = range(0, 25, length=120)
z = @. exp((a+1im*ω)*t)

@gif for k in [eachindex(t);fill(length(t),5)]
    plot(t[1:k],real(z[1:k]),imag(z[1:k]),xaxis=("t",(0,30),:flip),yaxis=("Re z",(-2,2)),zaxis=("Im z",(-2,2)))
    plot!(t[1:k],real(z[1:k]),fill(-1.5,k))
    plot!(t[1:k],fill(2,k),imag(z[1:k]))
    plot!(fill(30,k),real(z[1:k]),imag(z[1:k]),l=:black)
    title!(@sprintf("Pure oscillation: a = %.2f, ω = %.2f",a,ω))
end
```

### Decaying

Finally, if $\text{Re} \lambda < 0$, the spiral is a decaying one. The real and imaginary parts are attenuated oscillations.

```{code-cell}
---
tags: [hide-input]
---
a = -0.07;  om = 2.4;
t = range(0, 25, length=120)
z = @. exp((a+1im*ω)*t)

@gif for k in [eachindex(t);fill(length(t),5)]
    plot(t[1:k],real(z[1:k]),imag(z[1:k]),xaxis=("t",(0,30),:flip),yaxis=("Re z",(-2,2)),zaxis=("Im z",(-2,2)))
    plot!(t[1:k],real(z[1:k]),fill(-1.5,k))
    plot!(t[1:k],fill(2,k),imag(z[1:k]))
    plot!(fill(30,k),real(z[1:k]),imag(z[1:k]),l=:black)
    title!(@sprintf("Decay and oscillation: a = %.2f, ω = %.2f",a,ω))
end
```

## Homogeneous solutions

Now we can finish the story of computing solutions to homogeneous constant-coefficient ODEs. We can still use {numref}`Theorem {number} <theorem-second_linear-homogeneous-distinct>` and {numref}`Theorem {number} <theorem-second_linear-homogeneous-repeated>`, with the complex-valued interpretations of the exponentials.

(example-complex-simple)=
::::{proof:example}
Solve the IVP $x''+9x=0$, $x(0)=2$, $x'(0)=-12$.

:::{dropdown} Solution
The characteristic polynomial is $s^2+9$, giving the roots $\pm 3i$. Hence the general solution is $x_h(t) = c_1e^{3it} + c_2e^{-3it}$.

The initial conditions require

\begin{align*}
2 &= x(0) = c_1e^0 + c_2e^0 = c_1 +c_2,\\ 
-12 &= x'(0) = 3i c_1e^0 - 3i c_2e^0 = 3i c_1 - 3i c_2.
\end{align*}

This system is easy to solve for $c_1$ and $c_2$ to get $c_1=1+2i$, $c_2=1-2i$.
:::
::::

There are some helpful nuances to point out about the preceding example.

````{proof:observation}
If a real second-order IVP has complex conjugate characteristic values, then the integration constants satisfy $c_2=\overline{c_1}$.
````

This can simplify the algebra a bit. If we set $c_1=\alpha + i\beta$, then

```{math}
:label: secondlin-add-subtract
c_1 + c_2 = 2\alpha, \quad c_1-c_2 = 2i\beta.
```

In {numref}`Example {number} <example-complex-simple>` this would have led us right to $2\alpha=2$ and $3i(2i\beta)=-12$.

It might seem odd to use complex numbers to represent what we know must be a real-valued solution. There's nothing wrong with doing so, but we can also convert it to an explicitly real form. The following is easily proved using Euler's identity.

````{proof:formula}
The general homogeneous solution

$$
x_h(t) = c_1 e^{\lambda_1 t} + c_2 e^{\lambda_2 t},
$$

where $\lambda_{1,2} = a \pm i\omega$ are complex, is equivalent to the real expression

$$
x_h(t) = e^{at} \bigl[ b_1 \cos(\omega t) + b_2 \sin(\omega t) \bigr],
$$

where $b_1,b_2$ are real constants.
````

::::{proof:example} Example
In {numref}`Example {number} <example-complex-simple>`, the roots were $0 \pm 3i$. Thus another expression for the general solution is

$$
x_h(t) = c_1\cos(3t) + c_2\sin(3t).
$$

The initial conditions now yield

\begin{align*}
2 &= x(0) = c_1\cos(0) + c_2\sin(0) = c_1,\\
-12 &= x'(0) = -3 c_1 \sin(0) + 3 c_2 \cos(0) = 3c_2.
\end{align*}

Hence the IVP solution is $2\cos(3t) - 4\sin(3t).$
::::

(example-complex-complex1)=
::::{proof:example} 
Solve the IVP $x'' + 4x' + 5x=0$, $x(0)=6$, $x'(0)=0$.

:::{dropdown} Solution
The roots of $s^2+4s+5$ are $-2\pm i$. Thus the general solution is

$$
x(t) = c_1 e^{(-2+i)t} + \overline{c_1}e^{(-2-i)t}.
$$

Note that

$$
x'(t) = c_1 (-2+i) e^{(-2+i)t} + \overline{c_1}(-2-i) e^{(-2-i)t}.
$$

Writing $c_1=\alpha + i\beta$, the initial condition on $x$ requires that

$$
6 = x(0) =  \alpha + i\beta + \alpha - i\beta = 2\alpha,
$$

so $\alpha=3$. The other initial condition leads to

$$
0 = x'(0) &= (3+i\beta) (-2+i)\cdot 1 + (3-i\beta) (-2-i)\cdot 1  \\ 
&= (-6-2i+3i-\beta) + (-6+2i-3i-\beta) = -12 - 2\beta,
$$

which yields $\beta=-6$. 
:::
::::

:::{tip}
When you have a complex expression "stuff $+$ conjugate of that stuff", the result has to be real, so you needn't bother computing the imaginary part of that stuff.
:::

(example-complex-complex2)=
::::{proof:example} 
Solve the IVP of {numref}`Example {number} <example-complex-complex1>` without using complex numbers.

:::{dropdown} Solution
The roots of $s^2+4s+5$ are $-2\pm i$. Thus the general solution is

$$
x(t) = b_1 e^{-2t}\cos(t) + b_2 e^{-2t}\sin(t).
$$

Note that

$$
x'(t) = b_1[ -2e^{-2t}\cos(t) - e^{-2t}\sin(t)] + b_2[  -2e^{-2t}\sin(t) + e^{-2t}\cos(t)].
$$

The initial condition on $x$ requires that

$$
6 = x(0) = b_1,
$$

so $b_1=6$. The other initial condition leads to

$$
0 = x'(0) = 6(-2+0) + b_2(0+1) = -12 + b2,
$$

which yields $b_2=12$. 
:::
::::

Since complex exponentials are much less familiar to you than sin and cos, the real form might seem more appealing to you. If you acquaint yourself with complex exponentials, though, there is nothing wrong with leaving things in that form, and you have less to memorize.

