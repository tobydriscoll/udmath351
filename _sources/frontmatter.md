# MATH 351 Notes

These are notes on MATH 351 at UD by Toby Driscoll. Copyrighted, all rights reserved.

## Schedule for Fall 2021

### First-order ODEs

| Date   | Section                                                     | Zill  | Suggested practice |
| ------ | ----------------------------------------------------------- | ----- | ------------------ |
| Sep 1  | [Intro](first_order/preview)                                | --    |                    |
| Sep 1  | [IVPs](first_order/ivp)                                     | --    |                    |
| Sep 3  | [Qualitative methods](first_order/qualitative)              | 2.1   |                    |
| Sep 3  | [Separable equations](first_order/separable)                | 2.2   |                    |
| Sep 8  | [Linear equations](first_order/linear)                      | 2.3   |                    |
| Sep 10 | [Homogeneous problems](first_order/homogeneous)             | (2.3) |                    |
| Sep 10 | [Variation of parameters](first_order/variation_parameters) | (2.3) |                    |
| Sep 13 | [Modeling](first_order/modeling)                            | 2.7   |                    |

### Second-order ODEs

| Date   | Section                                                       | Zill | Suggested practice |
| ------ | ------------------------------------------------------------- | ---- | ------------------ |
| Sep 15 | [Structure of solutions](second_linear/structure)             | 3.1  |                    |
| Sep 17 | [Constant-coefficient problems](second_linear/const_coeff)    | 3.3  |                    |
| Sep 17 | [Complex solutions](second_linear/complex)                    | 3.3  |                    |
| Sep 20 | [Variation of parameters](second_linear/variation_parameters) | 3.5  |                    |
| Sep 22 | [Undetermined coefficients](second_linear/undetermined)       | 3.4  |                    |
| Sep 24 | [Oscillators](second_linear/oscillators)                      | 3.8  |                    |

### Linear algebra

| Date   | Section                                          | Poole                | Suggested practice |
| ------ | ------------------------------------------------ | -------------------- | ------------------ |
| Sep 27 | [Intro to linear systems](linear_system/problem) | 2.1                  |                    |
| Sep 29 | [Row elimination](linear_system/row_elimination) | 2.2                  |                    |
| Oct 1  | **EXAM 1**                                       | Goals A1–A13, B1–B10 |                    |
| Oct 4  | [Elimination/RRE form](linear_system/RREF)       | 2.2                  |                    |
| Oct 6  | [RRE form](linear_system/RREF)                   | 2.2                  |                    |
| Oct 8  | [Homogeneous systems](linear_system/nullspace)   | 2.2, 2.3             |                    |
| Oct 11 | [Algebraic operations](matrix/operations)        | 3.1                  |                    |
| Oct 13 | [Algebraic operations](matrix/operations)        | 3.1, 3.2             |                    |
| Oct 18 | [Identity and inverse](matrix/inverse)           | 3.3                  |                    |
| Oct 20 | [Subspaces](matrix/subspaces)                    | 3.5                  |                    |
| Oct 22 | [Determinants](matrix/determinants)              | 4.2                  |                    |
| Oct 25 | [Eigenvalues (properties)](matrix/eigenvalues)   | 4.1                  |                    |
| Oct 27 | [Eigenvalues (computing)](matrix/computing)      | 4.3                  |                    |
| Oct 29 | [Diagonalization](matrix/diagonalization)        | 4.4                  |                    |
| Nov 1  | **EXAM 2**                                       | Goals C1–C7, D1–D12  |                    |
| Nov 3  | [Similarity](matrix/similarity)                  | 4.4                  |                    |
| Nov 5  | [Vector spaces](space/spaces)                    | 6.1                  |                    |
| Nov 8  | [Span, independence, basis](space/basis)         | 6.1, 6.2             |                    |
| Nov 10 | [Change of basis](space/change)                  | 6.3                  |                    |
### Linear ODE systems

| Date   | Section                                             | Zill      | Suggested practice |
| ------ | --------------------------------------------------- | --------- | ------------------ |
| Nov 12 | [Linear ODE systems](ode_system/intro)              | 10.1      |                    |
| Nov 15 | [Solution structure](ode_system/structure)          | 10.1      |                    |
| Nov 17 | [Homogeneous c-c systems](ode_system/const_coeff)   | 10.2      |                    |
| Nov 19 | [Phase plane and stability](ode_system/phase_plane) | 11.2      |                    |
| Nov 29 | [Diagonalization](ode_system/diagonal)              | 10.3      |                    |
| Dec 1  | **EXAM 3**                                          | Goals TBD |                    |
| Dec 3  | [Matrix exponential](ode_system/exp)                | 10.4      |                    |
| Dec 6  | [Linearization](ode_system/linearization)           | 11.3      |                    |
| Dec 8  |                                                     |           |                    |
| Dec 10 |                                                     |           |                    |

## Learning goals

### A. First-order scalar ODEs
1. Verify an ODE or IVP solution.
2. Sketch or interpret a direction field for a scalar nonautonomous problem.
3. Sketch or interpret a phase diagram for an autonomous equation.
4. Find the steady states/equilibria of an autonomous equation.
5. Classify the stability of an equilibrium solution.
6. Solve separable equations that have tractable integrals, in explicit or implicit form.
7. Distinguish between linear and nonlinear equations.
8. Convert between standard and operator expressions of a linear equation.
9. Assemble a general solution from homogeneous and particular solutions.
10. Solve an initial-value problem if given, or after finding, a general solution.
11. Find the general homogeneous solution of a linear equation.
12. Use variation of parameters or an integrating factor to find a particular solution of a linear equation.
13. Interpret and apply linear models of stirred tanks, Newtonian cooling/heating, and population dynamics.

### B. Second-order linear ODEs
1. Assemble a general solution from homogeneous and particular solutions.
2. Use initial values to solve for the integration constants in a general solution.  
3. Compute the Wronskian of two functions.
4. Use a Wronskian to determine the linear independence of given solutions.
5. Solve a homogeneous linear constant-coefficient equation by way of its characteristic polynomial.
6. Convert between complex exponentials and real exponentials/oscillations using Euler's identity.
7. Use variation of parameters to find a particular solution.
8. Use undetermined coefficients to find a particular solution with polynomial, exponential, or harmonic forcing.
9. Relate a linear constant-coefficient equation to a mechanical oscillator, and classify as undamped, underdamped, critically damped, or overdamped. 
10. Identify resonance or pseudoresonance for a harmonically forced oscillator.

### C. Linear algebraic systems

1. Convert between linear systems and matrix–vector representations of them.
2. Distinguish matrices in RRE form from other matrices.
3. Perform row elimination to put a matrix into triangular or RRE form.
4. Use the RRE form of a linear system to find its solution(s).
5. Connect null space to a homogeneous linear system.
6. Find the null space and rank of a matrix.
7. Find a basis for a null space.

### D. Matrix algebra

1. Convert between a linear combination and an equivalent matrix–vector mutiplication.
2. Compute products of matrices.
3. Apply properties of matrix algebra.
4. Recognize or produce an identity matrix.
5. Apply properties of inverse matrices.
6. Apply the equivalencies in the Fundamental Theorem of Linear Algebra.
7. Use a matrix inverse to solve a linear system. 
8. Compute the inverse of a 2x2 matrix.
9. Find a basis for the row space or the column space of a matrix.
10. Find the dimension of a subspace.
11. Compute the determinant of a small matrix.
12. Use a determinant to determine whether a matrix is singular.
13. Apply the definition and properties of eigenvalues and eigenvectors.
14. Compute eigenvalues and eigenspaces of a 2x2 matrix or certain 3x3 matrices. 
15. Compute algebraic and geometric multiplicities of an eigenvalue.
16. Determine whether an eigenvalue or matrix is defective.
17. Express a nondefective matrix in terms of its diagonalization.

### E. Vector spaces

### F. Linear ODE systems

<!-- 1. Write a linear ODE system in matrix-vector form.
2. Describe the properties of a fundamental matrix.
3. Compute a Wronskian and use it to determine the independence of solutions.
4. Solve a constant-coefficient system by eigenvalues and eigenvectors (nondefective case).
5. Interpret complex exponentials and convert a complex solution form to a real form.
6. Deduce the stability and character of the origin in a homogeneous linear system from its eigenvalues or a phase plane diagram.
7. Compute the exponential of a 2x2 matrix, and use it to solve an IVP.
8. Use variation of parameters to find a particular solution.
 -->
