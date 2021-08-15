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
(section-second-undamped)=
# Pure oscillation

```{code-cell}
---
tags: [remove-cell]
---
using Plots,LaTeXStrings,Printf
default(linewidth=2,label="")
```

The equation 

$$
x'' +  \omega_0^2 x = 0 
$$

has characteristic roots that are purely imaginary: 

$$
\lambda = \pm i\, \omega_0. 
$$

One option is to express the solution using complex exponentials,

$$
x(t) = c_1 e^{i\omega_0 t} + c_2 e^{-i\omega_0 t},
$$

where $c_1$ is complex, and $c_2=\overline{c_1}$ ensures a real-valued solution. For any complex $z=u+iv$, 

$$
z+\overline{z} = u + iv + u - iv = 2u = 2\Re(z).
$$

Hence we can also write 

:::{math}
:label: second-undamped-complex
x(t) = \Re \left( c_1 e^{i\omega_0 t} \right), \qquad c_1 \in \mathbb{C},
:::

having absorbed a factor of 2 into the arbitrary constant. 

Suppose we define

$$
a_1 = \Re(c_1), \; a_2=-\Im(c_1) \quad \Longleftrightarrow \quad c_1 = a_1 - i a_2.
$$

Then by Euler's identity,

$$
c_1 e^{i\omega_0 t} = (a_1 - i a_2)[ \cos(\omega_0 t) + i \sin(\omega_0 t) ] = a_1 \cos(\omega_0 t) + a_2 \sin(\omega_0 t) + i\,[\cdots],
$$

and the stuff in the final brackets disappears upon taking the real part. So equivalently to {eq}`second-undamped-complex`, we can write

:::{math} 
:label: second-undamped-sincos
x(t) = a_1\cos(\omega_0 t) + a_2 \sin(\omega_0 t), \qquad a_1,a_2 \in \mathbb{R}.
:::

There is an important *third* equivalent form.

## Amplitude–phase form

Returning to {eq}`second-undamped-complex`, let us write $c_1$ in polar form:

$$
c_1 = R e^{i\theta} \quad \Longleftrightarrow \quad  R = |c_1|, \: e^{i \theta} = \frac{c_1}{|c_1|}.
$$

Then

\begin{align*}
x(t) & = \Re \left( c_1 e^{i\omega_0 t} \right)\\
& = \Re \left( R e^{i\theta} e^{i\omega_0 t} \right) \\
& = R\, \Re \left( e^{i(\omega_0 t+\theta)} \right) \\
& = R \cos(\omega_0 t+\theta),
\end{align*}

where the last line follows from Euler's identity. This is the **amplitude–phase form**,

:::{math}
:label: second-undamped-ampphase
x(t) = R \cos(\omega_0 t+\theta), \qquad R,\theta \in \mathbb{R}.
:::

A useful aspect of this form is that the solution oscillates between $\pm R$, which is the **amplitude** of the oscillation. 

Equations {eq}`second-undamped-complex`, {eq}`second-undamped-sincos`, and {eq}`second-undamped-ampphase` are all equivalent expressions of the general solution. We can convert between them using the identities

$$
a_1 - i a_2 = c_1 = R e^{i\theta},
$$

which amounts to simple polar/Cartesian conversions.

::::{proof:example}
Find the solution in amplitude-phase form of $2x''+32x=0$ with $x(0)=1$, $x'(0)=-8$.

:::{dropdown} Solution

First divide through by 2 to get the standard form, $x''+16x=0$. Then we have $\omega_0=\sqrt{16}=4$, so

$$
x(t) = a_1 \cos(4 t) + a_2 \sin(4 t).
$$

We then derive $1=x(0)=a_1$ and $-8=x'(0)=4a_2$, so

$$
x(t) = \cos(4 t) -2 \sin(4 t).
$$

Converting $(1,-2)$ to polar form gives $R=\sqrt{5}$ and $\tan \theta = -2/1$. In order to find $\theta$ numerically, you need to use a [four-quadrant arctangent](https://www.mathworks.com/help/matlab/ref/atan2.html#buct8h0-4). In MATLAB it would be `atan2(-2,1)`. 
:::
::::

::::{proof:example}
Find the amplitude of the solution to $x''+9x=0$, $x(0)=-4$, $x'(0)=6$.

:::{dropdown} Solution

The characteristic polynomial $\lambda^2+9$ gives the roots $\pm 3i$. We can write the solution as $x(t) = R \cos(3 t + \theta)$ and apply the initial conditions to get

\begin{align*}
-4 &= x(0) = R \cos(\theta), \\
6 &= x'(0) = -3R \sin(\theta).
\end{align*}

We are asked only for the amplitude, so there is no need to solve for $\theta$. It's clear that

$$
[R \cos(\theta)]^2 + [R \sin(\theta)]^2 = (-4)^2 + (-2)^2 = 20,
$$

which gives $R=\sqrt{20}=2\sqrt{5}$. 
:::
::::

# Free oscillations

The most common use of second-order equations is the modeling of oscillatory or other periodic behavior. This behavior occurs in myriad contexts. When an oscillating system is not subjected to any external forces, we call it an unforced oscillator or **free oscillator**.

## Mechanical oscillator

An object attached to an ideal spring satisfies the ODE

```{math}
:label: secondlin-massspring-free
mx'' + b x' + kx = 0,
```

where $x(t)$ is the displacement from the natural resting position, $m$ is the mass of the object, $b$ is an attenuation coefficient due to friction or mechanical damping, and $k$ is a property of the spring called the **spring constant**. This constant is the ratio of the restoring force of the spring to the amount by which it is stretched or compressed.

```{attention}
All named parameters such as $m$, $k$, and $b$ are assumed to be nonnegative unless stated otherwise.
```

```{note}
Equation {eq}`secondlin-massspring-free` applies equally well to horizontal and vertical oscillations. Gravity does not appear in the vertical case because it is accounted for by measuring $x$ from the static equilibrium position.
```

If given, initial values for {eq}`secondlin-massspring-free` supply the initial position and initial velocity, which determine the solution uniquely.

A pendulum is a different type of mechanical oscillator. The proper ODE is

```{math}
\theta'' + \gamma \theta + \frac{g}{L}\sin (\theta) = 0,
```

where $\theta(t)$ is the angle made with vertical-down position, $L$ is the arm length, and $g$ is gravitational acceleration. This equation is nonlinear and difficult to analyze without developing new tools. But if the angle remains small, then a reasonable approximation is

```{math}
\theta'' + \gamma \theta + \frac{g}{L}\theta = 0,
```

which is a linear oscillator with constant coefficients.

## Electrical oscillators

An AC circuit typically has elements of resistance, capacitance, and inductance. These analogize perfectly to friction/damping, spring constant, and mass. If these elements are wired in series, the governing ODE is

```{math}
LI'' + RI' + \frac{1}{C}I = 0,
```

where $I(t)$ is the current flowing through the circuit, $L$ is inductance, $R$ is resistance, and $C$ is capacitance.

## Unifying notation

When you have many versions of the same root problem, each using different symbols and units, you have three options.

1. Solve each new problem from scratch.
2. Derive custom formulas for each application.
3. Find a minimal set of parameters and express the problem and solution in terms of them.

Option 1 is highly inefficient. Option 2 would be appropriate for an engineering course. Here, we take option 3 and develop generalized knowledge that can be reinterpreted for each new application.

The ODE of free mass-spring oscillator, when written in our standard form, is
  
```{math}
x'' + \frac{b}{m} x' + \frac{k}{m} x = 0.
```

Right away this suggests that we only need two parameters, not three, to express the full range of behavior. (An added convenience is that both $b/m$ and $\sqrt{k/m}$ have units of inverse time.) Accordingly, we introduce

```{math}
\omega_0 = \sqrt{\frac{k}{m}}, \qquad Z = \frac{b/m}{2\omega_0} = \frac{b}{\sqrt{4km}}.
```

The parameter $\omega_0$ is known as the **natural frequency`, with units of inverse time, and $Z$ is a dimensionless {term}`damping coefficient** describing the relative intensity of the damping.

::::{important}
In math we usually use *frequency* to mean the multiplier of $t$ in a sin or cos function. That is our usage. In some fields this is called **angular frequency** and *frequency* is used to mean the number of cycles per time unit, as in Hz.
::::

Now the ODE of a free oscillator becomes

```{math}
:label: secondlin-unified-free
x'' + 2 Z \omega_0\, x' + \omega_0^2\, x = 0.
```

A similar derivation can be done starting from the pendulum or AC circuit equations.

The characteristic roots of the ODE are  

```{math}
\lambda_{1,2} = -Z \omega_0 \pm \omega_0 \sqrt{Z^2-1}.
```

The discussion now splits into four cases, marked by increasing values of $Z$.

## Undamped oscillator, $Z=0$

The case $x'' + \omega_0^2x = 0$ was discussed in {numref}`section-second-undamped`. It results in pure oscillation at frequency $\omega_0$. This is known as **simple harmonic motion**.

::::{proof:example}
When a 2 kg mass is hung on a spring, the spring stretches by 0.25 m. What is the natural frequency of the mass-spring system? Suppose the mass is pulled down 0.2 m past equilibrium and then thrown upward at 1 m/s. What is the amplitude of the motion?

:::{dropdown} Solution
Hooke's Law for a spring states that $F=k x$, so we find the spring constant from $k=F/x=2g/0.25=8g$, where $g=9.8$ m per second squared. The ODE for free motion of the system is thus $2 x'' + 8g x = 0$, or

$$
x'' + 4g x   = 0.
$$

From this we identify the natural frequency

```{math}
\omega_0 = \sqrt{4g} = 2\sqrt{g} \approx 6.26 \text{s}^{-1}. 
```

We can apply the initial conditions directly to the amplitude-phase form:

\begin{align*}
-0.2 & = x(0) = R\cos(\theta) \\
1 & = x'(0) = -\omega_0 R\sin(\theta).
\end{align*}

Therefore,

```{math}
R^2 = [R\cos(\theta)]^2 + [R\sin(\theta)]^2 =  0.04 + \omega_0^{-2},
```

which works out to $R \approx 0.256 \text{m}$.
:::
::::

## Underdamped oscillator, $0<Z<1$

For $0< Z < 1$ the roots of {eq}`secondlin-unified-free` are complex, with negative real part:

```{math}
\lambda_{1,2} = -Z \omega_0 \pm i \omega_0 \sqrt{1-Z^2}.
```

Define the damped frequency $\omega_d=\omega_0 \sqrt{1-Z^2}$. The amplitude–phase form easily generalizes to

```{math}
x_h(t) = R\, e^{-Z\omega_0 t} \cos( \omega_d t + \theta),
```

where $R$ and $\theta$ are determined by the initial conditions. This solution is pseudoperiodic, combining oscillation at frequency $\omega_d < \omega_0$ inside an exponential decay envelope. We call this an **underdamped oscillator**.

## Critically damped oscillator, $Z=1$
		
At $Z=1$ the complex roots coalesce into a double real root,

```{math}
\lambda_1 = \lambda_2 = -\omega_0,
```

with general homogeneous solution

```{math}
x_h(t) = e^{-\omega_0 t} (c_1 + c_2 t).
```

There is no longer any oscillation present, and we have a **critically damped** system. The linear growth of $c_2 t$ doesn't make much of a difference against the exponential decay, and $x_h\to0$ as $t\to\infty$.

## Overdamped, $Z>1$

For $Z>1$ the roots are

```{math}
\lambda_{1,2} = -Z \omega_0 \pm \omega_0 \sqrt{Z^2-1},
```

which are negative and real. This gives an exponentially decaying homogeneous solution. In this case we have an **overdamped** oscillator.

```{list-table} Damping coefficient and characteristic values
:header-rows: 1
:name: table-secondlin-oscillators

* - Damping coefficient 
  - Root property
  - Description
* - $Z=0$
  - imaginary
  - undamped
* - $0 < Z < 1$
  - complex
  - underdamped
* - $Z=1$
  - real, negative, repeated
  - critically damped
* - $Z > 1$
  - real, negative, distinct 
  - overdamped
```

::::{proof:example}

A 5 kg mass is hung on a spring with constant $11$ N per m and connected to a dashpot that provides 8 N-sec per meter of resistance. Is this system underdamped, overdamped, or critically damped?

:::{dropdown} Solution
The ODE for the mass-spring system is

\begin{align*}
    5 x'' + 8x' + 11 x  & = 0 ,\\
    x'' + 1.6 x' + 2.2 x  & = 0, 
\end{align*}

from which we identify the natural frequency

```{math}
  \omega_0 = \sqrt{2.2} \approx 1.483 \text{s}^{-1}.
```

The damping coefficient is therefore

```{math}
  Z = \frac{1.6}{2\omega_0} \approx 0.539.
```

Since this value is less than one, the system is underdamped.
:::
::::

::::{admonition} Example (continued)
:class: tip

Suppose the system from the previous example is initially at equilibrium when the mass is suddenly pushed downward at 0.5 m/sec. Find the motion of the mass.

:::{dropdown} Solution
We derived the governing ODE $x'' + 1.6 x' + 2.2 x = 0$. The roots are the roots of $\lambda^2 + 1.6\lambda + 2.2$, which are found numerically to be

```{math}
  \lambda \approx -0.8000 \pm 1.2490i.
```

(The imaginary part is smaller than the natural frequency found in the last example, as it must be.) Choosing the sin-cos form of the general solution, we have

$$
x_h(t) = a_1 e^{-0.8 t} \cos(1.249 t) + a_2 e^{-0.8 t} \sin(1.249 t).
$$

We apply the initial conditions $x(0)=0$, $x'(0)=-0.5$ to find

\begin{align*}
0 & = x_h(0) = a_1, \\ 
-0.5 & = x_h'(0) = a_1( -0.8 ) + a_2 (1.249 ),
\end{align*}

thus $a_2 = -0.4003$. The motion is therefore given by $x(t)=-0.4003\, e^{-0.8 t} \sin(1.249 t)$.
:::
::::

Here is a short video showing how solutions of 

$$
x'' + bx' + c x = 0
$$

vary with the parameters $b$ and $c$, or equivalently, $\omega_0$ and $Z$. (I use the term "eigenvalues" to mean characteristic values of the ODE.) 

<div>
<iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_qa9wnwpt&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_eyxlu0a8" width="400" height="285" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player"></iframe>
</div>

## Forced oscillations

Our standard form for oscillators is

```{math}
:label: secondlin-unified-forced
x'' + 2 Z \omega_0\, x' + \omega_0^2\, x = f(t),
```

where again $\omega_0$ is the natural frequency, $Z$ is the nonnegative damping coefficient, and $f$ is a forcing function. The most important type of forcing in applications is harmonic, as exemplified by 

$$
f(t) = \cos(\omega t).
$$ 

Let's start by using a trick of linearity. Define $g(t)=\sin(\omega t)$, and suppose that $u$ solves the ODE with forcing $f(t)+i g(t)$:

$$
\opA[u] = f + i g.
$$

We should expect $z$ to be complex-valued. If we break it into real and imaginary parts, so that $u(t)=x(t)+i y(t)$, then linearity tell us that 

$$
f+i g = \opA[x+i y] = \opA[x] + i \opA[y].
$$

The only way to make these identically true is if $\opA[x]=f$ and $\opA[y]=g$. In summary, we can (1) *complexify* the original forcing $\cos(\omega t)$ to be $e^{i\omega t}$, (2) solve the ODE, and then (3) take the real part of that solution at the end to get a particular solution for the original forcing.

A justification for this roundabout procedure is that exponential forcing is by far the easiest kind to solve for. Using undetermined coefficients, we let $x_p(t)=Ae^{i\omega t}$ and insert it into the ODE with complexified forcing to get

$$
A e^{i\omega t} \bigl[ (i\omega)^2 + 2Z\omega_0(i\omega) + \omega_0^2 \bigr] = e^{i\omega t},
$$

so that

```{math}
:label: secondlin-coeff-complex
A = \frac{1}{\omega_0^2-\omega^2 + 2iZ\omega_0\omega}.
```

As we work through detailed cases below, bear in mind that none of this affects the homogeneous solution $x_h$, which has natural oscillation at natural frequency $\omega_0$ with some level of damping.

### Undamped

Things are simplest in the undamped case, $Z=0$. Then the particular solution for complexified forcing $e^{i\omega t}$ is

$$
u_p(t) = \frac{1}{\omega_0^2-\omega^2} e^{i\omega t}.
$$

The real part of this gives an $x_p$ for $f(t)=\cos(\omega t)$, which is our standard for harmonic forcing. 

(formula-secondlin-nonresonant)=

````{proof:formula} Undamped oscillator with $f(t)=\cos(\omega t)$
$$
x_p(t) = \frac{1}{\omega_0^2-\omega^2} \cos(\omega t), \qquad \omega \neq \omega_0.
$$
````

(More on the exceptional case $\omega=\omega_0$ in a moment.) The amplitude of $x_p$ grows without bound as $\omega\to \omega_0$.

The general solution is a combination of $x_h$, which oscillates at the natural frequency $\omega_0$, and $x_p$, which oscillates at the driving frequency $\omega$:

$$
x(t) = a_1 \cos(\omega_0 t) + a_2 \sin(\omega_0 t) + \frac{1}{\omega_0^2-\omega^2} \bigl[ -\cos(\omega_0 t) + \cos(\omega t)\bigr].
$$

#### Beats

Things get interesting when $\omega \approx \omega_0$. Suppose the initial conditions are chosen so that the complete solution is

$$
x(t) = \frac{1}{\omega_0^2-\omega^2} \bigl[ -\cos(\omega_0 t) + \cos(\omega t)\bigr].
$$

Let's express the frequencies in terms of their average value $\hat{\omega}$ and their separation $2\epsilon$:

$$
\omega = \hat{\omega} - \epsilon, \qquad \omega_0 = \hat{\omega} + \epsilon.
$$

Some trig identity manipulation leads to

```{math}
:label: secondlin-beats
x(t) = \frac{1}{4\epsilon\hat{\omega}} \bigl[ 2 \sin(\epsilon t) \sin(\hat{\omega} t) \bigr] 
= \frac{\sin(\epsilon t)}{2\epsilon \hat{\omega}} \sin(\hat{\omega} t).
```

If $\epsilon$ is small, we can interpret this solution as an oscillation at the average frequency inside an envelope that oscillates at the much lower frequency $\epsilon$. This phenomenon is called **beating** and is audible as a modulating change in volume when two instruments slightly out of tune play together. You can hear this phenomenon demonstrated in [this video](https://youtu.be/rmvDu6EY2lE?t=10), among many others.

#### Resonance

{numref}`Formula {number}<formula-secondlin-nonresonant>` cannot account for the case $\omega=\omega_0$. This situation is known as **resonance**. It's an idealization of pushing someone on a swing at *exactly* the right moment in each cycle.

We can obtain the resonant solution by taking the limit $\epsilon\to 0$ in {eq}`secondlin-beats`. (Alternatively, we can start from scratch and use an enhanced form of the method of undetermined coefficients.) Since $\sin(\theta)/\theta \to 1$, we get the following.

(formula-secondlin-resonant)=

````{proof:formula} Undamped oscillator at resonance
$$
x_p(t) = \frac{t}{2\omega_0} \sin(\omega_0 t).
$$
````

We see that the amplitude of oscillations grows linearly forever. This physically impossible situation will be ruled out when we put some damping back into the system.

### Damped

We now turn to the physically realistic situation of $Z>0$. First, recall that the complete solution is a sum of $x_h$ and $x_p$. With nonzero damping, $x_h(t)\to 0$ exponentially as $t\to\infty$, and this is often called the **transient** part of the solution as a result. It matters in the sense of satisfying initial conditions, but has no effect on the long-term or **steady** behavior. That is entirely due to the real part of $u_p= A \exp(i \omega t)$, with $A$ defined in {eq}`secondlin-coeff-complex`. 

To soften up the notation a bit, we define the frequency ratio $\rho$ as

$$
\rho = \frac{\omega}{\omega_0}.
$$

Then the coefficient $A$ is

$$
A = \frac{1}{\omega_0^2} \cdot \frac{1}{1-\rho^2 + 2i\rho Z}.
$$

Taking the modulus of $A$ gives a quantity called the **gain**,

$$
g(\rho) = \frac{1}{\rule{0pt}{1em} \omega_0^2 \sqrt{\rule{0pt}{0.8em}(1-\rho^2)^2 + 4\rho^2 Z^2 } }.
$$

The gain is the ratio of the amplitudes of the particular solution and the forcing. i.e., the factor by which the forcing is amplified in the response. 

The particular or steady solution in modified amplitude-phase form is

$$
x_p(t) = g(\rho) \cos\bigl(\omega t + \theta(\rho)\bigr),
$$

with the phase $\theta$ determined by the polar angle of $A$.

#### Pseudoresonance 

A little calculus shows that as a function of $\rho$, the gain is maximized at

```{math}
:label: secondlin-rhomax
\rho_\text{max} = \begin{cases} 
\sqrt{1-2Z^2}, & \text{ if } 0 < Z^2 < \frac{1}{2},\\ 0, & \text{ if } \frac{1}{2} \le Z^2.
\end{cases}
```

When $0 < Z^2 < 1/2$, this value satisfies $0 < \rho_\text{max}<1$, i.e., the gain is maximized at a nonzero forcing frequency smaller than the natural frequency. We can consider this to be a **pseudoresonance**.[^pseudo] The peak value of the gain at pseudoresonance is found to be

[^pseudo]: Since pure resonance cannot be observed in real physical systems, one usually refers to pseudoresonance as simply resonance in practice.

```{math}
:label: secondlin-gainmax
g_\text{max} = g(\rho_\text{max}) = \frac{1}{2Z\omega_0^2\sqrt{1-Z^2}}.
```

The gain remains finite for all $\rho$ when $Z>0$, but it becomes proportional to $1/Z$ as $Z\to 0$. The following graph shows the gain as a function of the damping $Z$ and forcing frequency $\omega$ when $\omega_0=1$. The white curve shows the path of pseudoresonance.

```{code-cell} 
---
tags: [hide-input]
---
ω = range(0,1.5,length=90)
ζ = range(1e-3,1,length=90)
A = [ 1/(-ω^2 + 2im*z*ω + 1) for ω in ω, z in ζ ]
log_g = @. log10(abs(A))
contour(ω,ζ,log_g,yflip=true,xlabel="driving frequency",ylabel="damping coefficient",zlabel=L"log_{10}(g)")
#ζ = range(1e-3,1,length=300)
#rhomax = @. real( sqrt(1-2ζ^2) ) 
#plot!(rhomax,ζ,1e-2+log_g(rhomax,Z),'w','linew',2)
```

Here's a short video showing how the gain of an oscillator varies with the forcing frequency $\omega$. (I use the term "eigenvalues" to mean characteristic values here.) 

<div>
<iframe id="kaltura_player" src="https://cdnapisec.kaltura.com/p/2358381/sp/235838100/embedIframeJs/uiconf_id/43030021/partner_id/2358381?iframeembed=true&playerId=kaltura_player&entry_id=1_izrey0ty&flashvars[streamerType]=auto&amp;flashvars[localizationCode]=en&amp;flashvars[leadWithHTML5]=true&amp;flashvars[sideBarContainer.plugin]=true&amp;flashvars[sideBarContainer.position]=left&amp;flashvars[sideBarContainer.clickToClose]=true&amp;flashvars[chapters.plugin]=true&amp;flashvars[chapters.layout]=vertical&amp;flashvars[chapters.thumbnailRotator]=false&amp;flashvars[streamSelector.plugin]=true&amp;flashvars[EmbedPlayer.SpinnerTarget]=videoHolder&amp;flashvars[dualScreen.plugin]=true&amp;flashvars[Kaltura.addCrossoriginToIframe]=true&amp;&wid=1_s72ikzpz" width="400" height="285" allowfullscreen webkitallowfullscreen mozAllowFullScreen allow="autoplay *; fullscreen *; encrypted-media *" sandbox="allow-forms allow-same-origin allow-scripts allow-top-navigation allow-pointer-lock allow-popups allow-modals allow-orientation-lock allow-popups-to-escape-sandbox allow-presentation allow-top-navigation-by-user-activation" frameborder="0" title="Kaltura Player"></iframe>
</div>

