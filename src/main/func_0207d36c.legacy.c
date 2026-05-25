/* func_0207d36c: u16 exchange at struct offset 0x34 — substruct
 * starts at +0x24, field at substruct+0x10.
 *
 *     add  r2, r0, #0x24              ; r2 = &p->sub
 *     ldrh r0, [r2, #0x10]            ; r0 = *(u16 *)(sub + 0x10)
 *     strh r1, [r2, #0x10]            ; *(u16 *)(sub + 0x10) = r1
 *     bx   lr                         ; return old value
 *
 * Brief 215 shipped this as `.s` because the obvious mwcc 2.0
 * recipe (single field access via struct typedef) folded the
 * offset `0x24 + 0x10 -> 0x34` and emitted `ldrh r0, [r0, #0x34]`
 * directly, skipping the `add r2, r0, #0x24` intermediate the
 * orig has.
 *
 * Brief 216 found the orig shape reaches under legacy `mwcc
 * 1.2/sp2p3` from a source that forces a substruct pointer:
 *
 *   1. Declare a `struct Sub` covering the substruct shape.
 *   2. Compute `sub = (struct Sub *)((char *)p + 0x24)` as a
 *      named local — the substruct pointer the orig threads
 *      through r2.
 *   3. Access the field via `sub->field` — mwcc 1.2 keeps the
 *      `add r2, r0, #0x24` because the substruct pointer is
 *      used twice (ldrh + strh), so the cache is worth it.
 *
 * mwcc 2.0 collapses the same source to a single folded offset
 * because its CSE looks at the address-arithmetic level and
 * fuses `(char *)p + 0x24 + 0x10` into a single constant. mwcc
 * 1.2 doesn't apply the fold across the substruct boundary.
 *
 * Routing: `.legacy.c` -> mwcc 1.2/sp2p3.
 */

struct Sub {
    char pad[0x10];
    unsigned short field;
};

unsigned short func_0207d36c(void *p, unsigned short v) {
    struct Sub *sub = (struct Sub *)((char *)p + 0x24);
    unsigned short old = sub->field;
    sub->field = v;
    return old;
}
