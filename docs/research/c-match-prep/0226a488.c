/* CAMPAIGN-PREP candidate for func_0226a488 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D countdown loop; chained 1-bit bitfield RMW; store-order
 *   risk:       reshape-able: orig coalesces a=1 & b=a into ONE strh then a 2nd ldrh/strh for c=b; if mwcc splits/merges stores differently, model as two adjacent bitfield stmts then a reload-forcing 3rd.
 *   confidence: med
 */
typedef unsigned short u16;
typedef signed int s32;

/* stride 0x18 (24) array */
typedef struct {
    u16 id;        /* +0x00 (passed to func_02031794) */
    u16 pad2;      /* +0x02 */
    u16 flags;     /* +0x04: bit1=a, bit2=b, bit3=c */
    u16 pad6;      /* +0x06 */
    u8  rest[0x10];/* +0x08 .. 0x18 */
} Ent;
typedef unsigned char u8;

extern Ent data_ov002_022ce588[];
extern s32 func_02031794(u16 id);

s32 func_ov002_0226a488(s32 arg0, s32 count) {
    s32 i;
    Ent *e;

    for (i = count - 1; i >= 0; i--) {
        e = &data_ov002_022ce588[i];
        if (func_02031794(e->id) == 0) {
            /* 1-bit bitfields a@bit1, b@bit2, c@bit3 in flags (u16) */
            u16 f = e->flags;
            f |= 0x2;                 /* a = 1 (bit1) */
            f = (f & ~0x4) | (((f >> 1) & 1) << 2);   /* b = a */
            e->flags = f;
            f = e->flags;
            f = (f & ~0x8) | (((f >> 2) & 1) << 3);   /* c = b */
            e->flags = f;
        }
    }
    return 1;
}
