/* func_0202b7cc: `base + table[idx]` — indexed into a table of
 * word-sized offsets, added to a base pointer. Both tables live in
 * the card-data singleton's inner struct.
 *
 *     ldr r1, =data_0219a93c
 *     ldr r2, [r1, #0x0]         ; p0 = data_0219a93c.p0
 *     ldr r1, [r2, #0x10]         ; table_10 = p0->table_10
 *     ldr r2, [r2, #0x14]         ; base_14  = p0->base_14
 *     ldr r0, [r1, r0, lsl #0x2]  ; r0 = table_10[idx]
 *     add r0, r2, r0              ; r0 = base_14 + offset
 *     bx  lr
 *
 * 7 insns + 1 pool = 0x20 bytes. Leaf.
 *
 * This is the shape callers of the 0x0202b7xx sibling set use to
 * build offsets into a concatenated string/data blob.
 */

typedef struct card_inner2 {
    char        _pad_00[0x10];
    int        *table_10;     /* word offsets */
    char       *base_14;
} card_inner2_t;

typedef struct card_ctx2 {
    card_inner2_t *p0;
} card_ctx2_t;

extern card_ctx2_t data_0219a93c;

char *func_0202b7cc(int idx) {
    card_inner2_t *p = data_0219a93c.p0;
    return p->base_14 + p->table_10[idx];
}
