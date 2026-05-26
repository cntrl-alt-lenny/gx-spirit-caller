/* func_020115a8: flat 12-field struct init with sparse non-zero fields.
 *
 *     str r1, [r0, #0x0]
 *     mov r1, #0x0
 *     str r1, [r0, #0x4]
 *     str r1, [r0, #0x8]
 *     str r1, [r0, #0xc]
 *     str r2, [r0, #0x10]
 *     str r1, [r0, #0x14]
 *     str r1, [r0, #0x18]
 *     str r1, [r0, #0x1c]
 *     str r3, [r0, #0x20]
 *     str r1, [r0, #0x24]
 *     str r1, [r0, #0x28]
 *     str r1, [r0, #0x2c]
 *     bx  lr
 *
 * Sets words 0/4/8 (offsets 0/0x10/0x20) to v1/v2/v3 and zeros the
 * rest of the 0x30-byte block. mwcc 1.2/sp2p3 (`.legacy.c`) emits
 * the StyleA epilogue + sparse-init shape (single `mov r1, #0`
 * reused for all zero stores) that matches orig.
 */

struct s_020115a8 {
    int a;       /* offset 0x00 */
    int z0, z1, z2;
    int b;       /* offset 0x10 */
    int z3, z4, z5;
    int c;       /* offset 0x20 */
    int z6, z7, z8;
};

void func_020115a8(struct s_020115a8 *p, int v1, int v2, int v3) {
    p->a = v1;
    p->z0 = 0;
    p->z1 = 0;
    p->z2 = 0;
    p->b = v2;
    p->z3 = 0;
    p->z4 = 0;
    p->z5 = 0;
    p->c = v3;
    p->z6 = 0;
    p->z7 = 0;
    p->z8 = 0;
}
