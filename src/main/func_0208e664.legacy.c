/* func_0208e664: copy the DS 3D geometry engine's CLIPMTX_RESULT (4x4
 * fixed-point matrix at 0x04000640) into the caller-supplied buffer,
 * only if the engine is not busy. Returns -1 if busy, 0 on success.
 *
 * Pair with func_0208e61c (VECMTX_RESULT 3x3 / MTX_Copy33). This one
 * uses the larger MTX_Copy44 helper (MI_Copy64B). Routed through
 * .legacy.c (mwcc 1.2/sp2p3) for the same reason as 0208e61c — the
 * MMIO base-folding wall (C-23) would otherwise collapse the GXSTAT
 * + CLIPMTX_RESULT pool loads into a single base+offset.
 */

#include <nitro/types.h>

extern void MI_Copy64B(const int *src, int *dst);  /* MTX_Copy44 */

int func_0208e664(int *out) {
    vu32 *gxstat = (vu32 *)0x04000600;
    if (*gxstat & 0x08000000) return -1;
    MI_Copy64B((const int *)0x04000640, out);
    return 0;
}
