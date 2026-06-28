[//]: # (markdownlint-disable MD013 MD041)

# Matrix3x4

3-row × 4-column fixed-point matrix used for 3D transformation (typical NDS
geometry engine format). All 12 elements are 32-bit fixed-point integers.

## Confidence: HIGH

Confirmed by fully matched C file `func_020115e0.c` which defines a complete
`mtx33_t` typedef and accesses all 12 elements by name.

## C Definition

```c
typedef struct Matrix3x4 {
    int m00;  /* +0x00  row 0, col 0 */
    int m01;  /* +0x04  row 0, col 1 */
    int m02;  /* +0x08  row 0, col 2 */
    int m03;  /* +0x0C  row 0, col 3 */
    int m10;  /* +0x10  row 1, col 0 */
    int m11;  /* +0x14  row 1, col 1 */
    int m12;  /* +0x18  row 1, col 2 */
    int m13;  /* +0x1C  row 1, col 3 */
    int m20;  /* +0x20  row 2, col 0 */
    int m21;  /* +0x24  row 2, col 1 */
    int m22;  /* +0x28  row 2, col 2 */
    int m23;  /* +0x2C  row 2, col 3 */
} Matrix3x4;  /* sizeof = 0x30 */
```

(The original typedef name in the source is `mtx33_t`; renamed here for clarity.)

## Layout evidence

| Offset | Width | R/W | Source function |
|--------|-------|-----|-----------------|
| 0x00–0x2C | s32 × 12 | r/w | func_020115e0 (all 12 elements) |

Pointer variable `m` of type `mtx33_t *` accesses all 12 fields in a single
function body — unambiguous layout confirmation.

## Using functions

- `func_020115e0` — matrix operation (likely multiply or copy); reads/writes
  all 12 elements via `m->m00 … m->m23`
- Variable name `m` also appears as a `->` base in 13 files (VARNAME stats),
  with fields `m00, m01, m02, m03, m10, m11, m12, m13, m20, m21, m22, m23`
  confirmed — same struct type across multiple callers.

## Notes

NDS uses a 4×4 homogeneous matrix in its geometry engine, but this decomp's
functions operate on a 3×4 form (no homogeneous row). The 4th column (m03,
m13, m23) likely holds the translation vector.
