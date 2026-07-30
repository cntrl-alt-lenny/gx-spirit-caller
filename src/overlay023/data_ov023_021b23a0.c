/* data_ov023_021b23a0 (8 bytes, .bss): proof-of-concept bss carve for
 * cm-bss-carve-scope. Split out of src/overlay023/bss/data_ov023_bss.s's
 * anonymous `.space 0x8` -- the real type was already proven by the
 * already-matched consumer func_ov023_021b2314.c, which declares
 * `extern Ov023DispatchState data_ov023_021b23a0;` and reads/writes both
 * fields (`.idx` as a dispatch-table index, `.f4` cleared on handler
 * completion). No byte content exists to preserve or verify (.bss is
 * zero-initialized at runtime) -- the only correctness requirement is
 * the size (8 bytes, exactly matching the struct, exactly matching the
 * original .space 0x8) and staying non-const (a const global with no
 * initializer is not valid C, so .bss placement is self-enforcing here,
 * not just a convention).
 */

typedef struct {
    int idx;
    int f4;
} Ov023DispatchState;

Ov023DispatchState data_ov023_021b23a0;
