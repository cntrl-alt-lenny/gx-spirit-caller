/* func_0202b0b4: card-ID → u16 lookup with sentinel. For IDs below
 * 0xfa0 returns 0 (invalid / reserved range); above that, indexes into
 * a u16 table hung off `data_0219a93c.p0->table_34` by `(id - 0xfa0)`.
 *
 * Anchor of the mega-cascade cluster found by #207's
 * `find_mega_cascades.py`: 9 direct callers, 41 indirect at depth 4,
 * 50 functions total. Sibling lookups (`func_0202b0e0`, `func_0202b100`,
 * `func_0202b31c`, `func_0202b33c`, …) all go through the same
 * `data_0219a93c.p0->...` shape with different field offsets.
 *
 *     cmp   r0, #0xfa0
 *     movlt r0, #0x0
 *     bxlt  lr
 *     ldr   r1, .L_0202b0dc          ; &data_0219a93c
 *     sub   r0, r0, #0xfa0
 *     ldr   r1, [r1, #0x0]           ; r1 = data_0219a93c.p0
 *     mov   r0, r0, lsl #0x1         ; id_off * sizeof(u16)
 *     ldr   r1, [r1, #0x34]          ; r1 = p0->table_34
 *     ldrh  r0, [r1, r0]
 *     bx    lr
 *
 * 10 insns + 1 pool word = 0x2c bytes.
 *
 * Note the interleaving: `sub` fills the load-use gap between the
 * two `ldr`s (pool → p0 deref), then `lsl` fills the gap between
 * the p0 deref and the table-34 deref. Classic mwcc-ARM scheduling
 * for 2-level pointer chases.
 */

typedef struct card_inner {
    /* 0x00 ..0x33: other tables (see siblings: 0xc, 0x30) */
    char              _pad_0x00[0x34];
    unsigned short   *table_34;       /* u16 array, id-offset-indexed */
} card_inner_t;

typedef struct card_ctx {
    card_inner_t     *p0;             /* offset 0x0 — ptr to the card inner struct */
    /* rest: 0x8 = void **slot (see func_0202c4b4) — not modelled here */
} card_ctx_t;

extern card_ctx_t data_0219a93c;

unsigned short func_0202b0b4(int id) {
    if (id < 0xfa0) return 0;
    return data_0219a93c.p0->table_34[id - 0xfa0];
}
