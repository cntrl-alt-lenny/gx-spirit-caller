/* func_020115e0: 3x3 matrix-with-translation init. Sets diagonal
 * to 0x1000 (fixed-point 1.0), zeros off-diagonal, and stores
 * translation row from args 1-3.
 *
 *     stmdb sp!, {r3, lr}
 *     mov   lr, #0x1000
 *     str   lr, [r0, #0x0]                 ; m00 = 0x1000
 *     mov   ip, #0x0
 *     str   ip, [r0, #0x4]
 *     str   ip, [r0, #0x8]
 *     str   ip, [r0, #0xc]
 *     str   lr, [r0, #0x10]                ; m11 = 0x1000
 *     str   ip, [r0, #0x14]
 *     str   ip, [r0, #0x18]
 *     str   ip, [r0, #0x1c]
 *     str   lr, [r0, #0x20]                ; m22 = 0x1000
 *     str   r1, [r0, #0x24]                ; tx
 *     str   r2, [r0, #0x28]                ; ty
 *     str   r3, [r0, #0x2c]                ; tz
 *     ldmia sp!, {r3, pc}
 */

typedef struct {
    int m00, m01, m02, m03;
    int m10, m11, m12, m13;
    int m20, m21, m22, m23;
} mtx33_t;

void func_020115e0(mtx33_t *m, int tx, int ty, int tz) {
    m->m00 = 0x1000;
    m->m01 = 0;
    m->m02 = 0;
    m->m03 = 0;
    m->m10 = 0x1000;
    m->m11 = 0;
    m->m12 = 0;
    m->m13 = 0;
    m->m20 = 0x1000;
    m->m21 = tx;
    m->m22 = ty;
    m->m23 = tz;
}
