/* func_02023d44: 3-block predicated struct copy. If output pointer is
 * non-null, copy 12-byte block from arg0+0x68 / +0x74 / +0x80. Returns 1.
 * C-2a struct-copy form.
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0
 *     movs  lr, r1
 *     addne r0, r4, #0x68
 *     mov   ip, r2
 *     ldmneia r0, {r0, r1, r2}
 *     stmneia lr, {r0, r1, r2}
 *     cmp   ip, #0x0
 *     addne r0, r4, #0x74
 *     ldmneia r0, {r0, r1, r2}
 *     stmneia ip, {r0, r1, r2}
 *     cmp   r3, #0x0
 *     addne r0, r4, #0x80
 *     ldmneia r0, {r0, r1, r2}
 *     stmneia r3, {r0, r1, r2}
 *     mov   r0, #0x1
 *     ldmia sp!, {r4, pc}
 */

typedef struct {
    unsigned int w[3];   /* 12 bytes */
} triple_02023d44_t;

typedef struct {
    char              _pad0[0x68];
    triple_02023d44_t f_68;
    triple_02023d44_t f_74;
    triple_02023d44_t f_80;
} src_02023d44_t;

int func_02023d44(src_02023d44_t *src, triple_02023d44_t *o1,
                  triple_02023d44_t *o2, triple_02023d44_t *o3) {
    if (o1 != 0) *o1 = src->f_68;
    if (o2 != 0) *o2 = src->f_74;
    if (o3 != 0) *o3 = src->f_80;
    return 1;
}
