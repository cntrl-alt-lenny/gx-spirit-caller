/* func_0202c44c: stride-8 indexed table read on `data_0219a93c.p1`.
 *
 *     ldr r1, .L_0202c468
 *     mov r0, r0, lsl #0x1
 *     ldr r2, [r1, #0x4]              ; r2 = data->p1
 *     ldmia r2, {r1, r2}              ; r1 = p1->table; r2 = p1->base
 *     ldr r0, [r1, r0, lsl #0x2]      ; r0 = table[idx * 2]
 *     add r0, r2, r0
 *     bx  lr
 *  .L_0202c468: .word data_0219a93c
 *
 * Sibling of func_0202b7cc on the inner pointer at offset 4 (instead
 * of the offset-0 anchor `p0`). The compound `lsl #1` + `lsl #2` is
 * mwcc's emit for `idx * 2` indexed by an int* — `int*` access scales
 * the resulting product by 4 again.
 *
 * The `ldmia r2, {r1, r2}` fusion fires because table+base sit at
 * offsets 0 and 4 of the inner struct.
 */

typedef struct {
    int  *table;          /* +0x0 */
    char *base;           /* +0x4 */
} card_inner3_t;

typedef struct {
    char           _pad[0x4];
    card_inner3_t *p1;
} card_ctx3_t;

extern card_ctx3_t data_0219a93c;

char *func_0202c44c(int idx) {
    card_inner3_t *p = data_0219a93c.p1;
    return p->base + p->table[idx * 2];
}
