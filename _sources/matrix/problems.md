# Solving matrix problems

There is always a natural correspondence between a collection of vectors and the matrix having those vectors as columns:

$$ 
    \bfa_1,\bfa_2,\ldots,\bfa_n \text{ in } \real^m 
    \quad \Longleftrightarrow \quad 
    \bfA = \bigl[\, \bfa_1 \; \bfa_2 \; \cdots \; \bfa_n \bigr] \text{ in } \rmn{m}{n}
$$

| Problem |  | Strategy |
|----------|-------|-------|
| Solve linear system with augmented matrix $[\bfA \:\aug \: \bfb]$ | | Reduce to RRE | 
|  | **OR** | ($2\times 2$ case) Cramer's Rule |
| Is linear system $[\bfA \:\aug \: \bfb]$ inconsistent? | | Does $\text{RRE}([\bfA \:\aug \: \bfb])$ have a leading 1 in the last column? | 
| Is $\bfb$ in $\span(\bfa_1,\ldots,\bfa_n)$? | | Is linear system $[\bfA \:\aug \: \bfb]$ consistent? |
| Solve linear system $\bfA\bfx=\bfb$ | | Solve linear system with augmented matrix $[\bfA \:\aug \: \bfb]$ |
| Express $\bfb$ as a linear combination of $\bfa_1,\ldots,\bfa_n$ |  | Solve linear system $\bfA\bfx=\bfb$ | 
| Are $\bfa_1,\ldots,\bfa_n$ independent? | | Does the nullity of $\bfA$ equal zero? |
| Compute matrix product | | Dot products of rows and columns |
|   | **OR** | Linear combinations of columns |
| Find matrix inverse | | Diagonal or $2\times 2$ formula, or a trick |
| Find basis of $\nullsp(\bfA)$ | | Solve $\bfA \bfx = \bfzero$ | 
| Find basis of $\colsp(\bfA)$ | | Reduce $\bfA$ to RRE |
| Find basis of $\span(\bfa_1,\ldots,\bfa_n)$ | | Find basis of $\colsp(\bfA)$ |
| Find rank or nullity of $\bfA$ | | Count leading/free variables in RRE | 
| Compute determinant | | Cofactor expansion | 
| Do $\bfa_1,\ldots,\bfa_n$ span $\real^m$? | | Does $\rank(\bfA)=m$? |
| Is $\bfA$ singular? ($m=n$ only)| | Is the determinant of $\bfA$ zero? |
| | **OR** | Is $\rank(\bfA) < n$? |
| | **OR** | Is $\nullity(\bfA) > 0$? |
| | **OR** | Does $\bfA$ have a zero eigenvalue? |
