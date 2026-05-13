/* func_0202b08c: read the 13-bit low field of `entries_30[id]`.
 *
 * No sentinel, no call — direct index into the 8-byte-stride table
 * and a shift-shift zero-extend.
 *
 *     ldr  r1, =data_0219a85c
 *     ldr  r1, [r1, #0x0]               ; p0
 *     ldr  r1, [r1, #0x30]              ; entries_30 (8-byte stride)
 *     ldr  r0, [r1, r0, lsl #0x3]        ; w = entries_30[id].w0
 *     mov  r0, r0, lsl #0x13
 *     mov  r0, r0, lsr #0x13             ; (w << 19) >> 19 — zero-ext bottom 13
 *     bx   lr
 *
 * 7 insns + 1 pool = 0x20 bytes. Leaf (no stmdb).
 */

/* The low 13 bits of w0 is a field of its own; mwcc at -O4 zero-extends
 * a bit-field read via `lsl #19; lsr #19` (rather than `and #0x1fff`,
 * which also needs a pool word for the mask). Using a bit-field pins
 * that shape. */
typedef struct {
    unsigned int bits_lo13 : 13;
    unsigned int bits_hi19 : 19;
    unsigned int w1;
} card_entry_t;

typedef struct card_inner {
    char            _pad_0x00[0x30];
    card_entry_t   *entries_30;
} card_inner_t;

typedef struct card_ctx {
    card_inner_t   *p0;
} card_ctx_t;

extern card_ctx_t data_0219a85c;

unsigned int func_0202b08c(int id) {
    return data_0219a85c.p0->entries_30[id].bits_lo13;
}
