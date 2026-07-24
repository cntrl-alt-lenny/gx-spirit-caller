/* func_0208e61c: copy the DS 3D geometry engine's VECMTX_RESULT (3x3
 * fixed-point matrix at 0x04000680) into the caller-supplied buffer,
 * but only if the engine is not busy. Returns -1 if busy, 0 on success.
 *
 *     stmfd sp!, {lr}
 *     sub   sp, sp, #0x4
 *     ldr   r2, .L_GXSTAT
 *     mov   r1, r0                ; r1 = out buffer (preserved across the ands)
 *     ldr   r0, [r2]              ; r0 = REG_GXSTAT
 *     ands  r0, r0, #0x08000000   ; test bit 27 (matrix-stack busy)
 *     addne sp, sp, #0x4
 *     mvnne r0, #0                ; r0 = -1
 *     ldmnefd sp!, {lr}
 *     bxne  lr
 *     ldr   r0, .L_VECMTX
 *     bl    MI_Copy36B          ; MTX_Copy33(src=VECMTX, dst=out)
 *     mov   r0, #0
 *     add   sp, sp, #0x4
 *     ldmfd sp!, {lr}
 *     bx    lr
 * .L_GXSTAT: .word 0x04000600
 * .L_VECMTX: .word 0x04000680
 *
 * Pair with func_0208e664 which does the same for the 4x4 CLIPMTX_RESULT
 * (matrix at 0x04000640, copied via MI_Copy64B / MTX_Copy44).
 *
 * 16 insns + 2 pool words = 0x48 bytes.
 */

#include <nitro/types.h>

extern void MI_Copy36B(const int *src, int *dst);  /* MTX_Copy33 */

int func_0208e61c(int *out) {
    vu32 *gxstat = (vu32 *)0x04000600;
    if (*gxstat & 0x08000000) return -1;
    MI_Copy36B((const int *)0x04000680, out);
    return 0;
}
