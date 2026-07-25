/* func_02066ea0: SETTER + byte-copy, sp3-tier (Style B: stmfd{lr};
 * sub sp,#4 ... add sp,#4; ldmfd{pc}).
 *
 * dst->b[0] = tag; copies src[0..3] into dst->b[1..4] via an intermediate
 * pointer p = &dst->b[1] (matches the target's `add lr, r0, #1` base-reg
 * reuse); dst->f_800 = 5.
 *
 * Residual after routing + pointer-materialization alone (16/16 words,
 * only the 4-byte copy body diverged): mwcc's scheduler swapped the load
 * order within each 2-load batch (loads src[1] before src[0], and src[3]
 * before src[2]), which also flipped which physical register (ip vs r3)
 * ended up holding which value. A `volatile`-cast read on the FIRST load
 * of each pair pins it at its source position and prevents the scheduler
 * from reordering it ahead of its neighbor — byte-identical result.
 */
typedef struct {
    unsigned char b[5];        /* +0x00..+0x04 */
    char          _pad[0x800 - 5];
    int           f_800;       /* +0x800 */
} obj_02066ea0_t;

void func_02066ea0(obj_02066ea0_t *dst, unsigned char tag, const unsigned char *src) {
    unsigned char *p = &dst->b[1];
    unsigned char b0, b1, b2, b3;
    dst->b[0] = tag;
    b0 = *(volatile unsigned char *)&src[0];
    b1 = src[1];
    p[0] = b0;
    p[1] = b1;
    b2 = *(volatile unsigned char *)&src[2];
    b3 = src[3];
    p[2] = b2;
    p[3] = b3;
    dst->f_800 = 5;
}
