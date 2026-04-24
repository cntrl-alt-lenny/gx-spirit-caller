/* func_0202b33c: return table_c[lookup_u16(id)] as u16.
 *
 *     stmdb sp!, {r3, lr}
 *     bl    func_0202b0b4                ; idx = lookup_u16(id)
 *     ldr   r1, =data_0219a93c
 *     mov   r0, r0, lsl #0x1              ; idx * sizeof(u16)
 *     ldr   r1, [r1, #0x0]                ; p0
 *     ldr   r1, [r1, #0xc]                ; table_c
 *     ldrh  r0, [r1, r0]
 *     ldmia sp!, {r3, pc}
 *
 * 8 insns + 1 pool = 0x24 bytes (… wait, actually 8*4 + 4 = 0x24).
 *
 * Scheduling detail: the `lsl` on r0 (arithmetic on the call-return
 * value) is interleaved between the two r1 loads (pool → p0 deref)
 * so the compiler can fill the r1 load-use gap.
 */

typedef struct card_inner {
    char              _pad_0x00[0xc];
    unsigned short   *table_c;
} card_inner_t;

typedef struct card_ctx {
    card_inner_t     *p0;
} card_ctx_t;

extern card_ctx_t data_0219a93c;
extern unsigned short func_0202b0b4(int id);

unsigned short func_0202b33c(int id) {
    return data_0219a93c.p0->table_c[func_0202b0b4(id)];
}
