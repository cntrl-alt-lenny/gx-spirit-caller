/* func_0202b2c8: return &entries_30[lookup_u16(id)].
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0202b060                ; idx = lookup_u16(id)
 *     ldr   r1, =data_0219a85c
 *     ldr   r1, [r1, #0x0]                ; p0
 *     ldr   r1, [r1, #0x30]               ; entries_30
 *     add   r0, r1, r0, lsl #0x3          ; &entries_30[idx]
 *     ldmia sp!, {r3, pc}
 *
 * 7 insns + 1 pool = 0x20 bytes.
 */

typedef struct { unsigned int w0; unsigned int w1; } card_entry_t;

typedef struct card_inner {
    char            _pad_0x00[0x30];
    card_entry_t   *entries_30;
} card_inner_t;

typedef struct card_ctx {
    card_inner_t   *p0;
} card_ctx_t;

extern card_ctx_t data_0219a85c;
extern unsigned short func_0202b060(int id);

card_entry_t *func_0202b2c8(int id) {
    return &data_0219a85c.p0->entries_30[func_0202b060(id)];
}
