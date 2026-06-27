/* CAMPAIGN-PREP candidate for func_021ac478 (ov000, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Fill32 then :9/:9 then :8/:8 then |3 RMW; exact store-order
 *   risk:       reshape-able: arg3 is masked to a byte EARLY (r2 held across the w0 inserts) — if mwcc defers the &0xff to the w4 store, scheduling diverges; bind a byte temp `int b3=arg3&0xff` before the w0 writes. r3-r7 callee-save count is store-order sensitive.
 *   confidence: low
 */
/* func_ov000_021ac478 (ov000, D) — 5-arg builder on arg0 struct (+ Fill32).
 *   Fill32(0, p, 0x14)                        ; zero first 0x14 bytes
 *   p->w0: field :9 @ bit7  := arg1  (mask 0x0000ff80, pool 0xffff007f)
 *          field :9 @ bit16 := arg2  (mask 0x01ff0000, pool 0xfe00ffff)
 *   p->w4: byte :8 @ bit0   := arg3  (and #0xff, computed early as r2)
 *          byte :8 @ bit8   := arg4  (5th arg at [sp,#0x18])
 *   p->w0: clear bit0, set bits0,1  (bic #1; orr #3)  -> last, separate RMW
 * arg3 is masked to a byte EARLY (r2 = arg3 & 0xff, before the w0 inserts);
 * arg4 read from the stack. Store order: w0 (2 fields), w4 (2 bytes), w0 |3. */
extern void Fill32(unsigned int value, void *dest, int size_bytes);
struct Ov000Build {
    unsigned : 7; unsigned f0_7 : 9; unsigned f0_16 : 9; unsigned : 7;   /* +0 */
    unsigned f4_0 : 8; unsigned f4_8 : 8; unsigned : 16;                 /* +4 */
};

void func_ov000_021ac478(struct Ov000Build *p, int arg1, int arg2, int arg3, int arg4) {
    Fill32(0, p, 0x14);
    p->f0_7 = arg1;
    p->f0_16 = arg2;
    p->f4_0 = arg3;
    p->f4_8 = arg4;
    *(unsigned *)p = (*(unsigned *)p & ~1u) | 3u;
}
