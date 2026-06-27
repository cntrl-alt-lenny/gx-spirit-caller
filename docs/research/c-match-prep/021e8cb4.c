/* CAMPAIGN-PREP candidate for func_021e8cb4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: parity*0x868+idx*20 indexing; bitfield+range guards; tst bit9; packed compare
 *   risk:       permuter-class AND struct-guessed: orig keeps off=(id&1)*0x868 and row=idx*20 in fixed regs across many indexed loads (r4/r5); mwcc's reload-vs-bind and scheduling is coin-flip; all offsets inferred.
 *   confidence: low
 */
/* func_ov002_021e8cb4: same parity*0x868 + idx*20 table indexing; a 13-bit
 * field guard, a 5<=idx<=10 range check, a halfword + bit9 guard with a
 * helper, then a packed-bitfield compare vs entity, then 2 helper guards.
 * Struct offsets/strides RECONSTRUCTED from the asm. */
extern int func_0202b878(void);
extern int func_ov002_021c1ef0(void *ent, int id, int idx);
extern int func_ov002_021c2084(void *ent, int id, int idx, int flag);

typedef struct {
    unsigned short f0;
    unsigned short f2;
    unsigned short f4;       /* +0x4: bits[14:9] */
} Entity021e8cb4;

extern unsigned char data_ov002_022cf16c[]; /* _LIT1: word at +0x30 of each row */
extern unsigned char data_ov002_022cf1a4[]; /* _LIT2: halfword table */
extern unsigned char data_ov002_022cf1ac[]; /* _LIT3: word table (bit9) */

int func_ov002_021e8cb4(Entity021e8cb4 *ent, int id, int idx) {
    unsigned int parity = (unsigned int)id & 1;
    unsigned int off = parity * 0x868;
    unsigned int row = (unsigned int)idx * 20;
    unsigned int w, lhs, rhs;
    w = *(unsigned int *)(data_ov002_022cf16c + off + row + 0x30);
    if ((((unsigned int)w << 19) >> 19) == 0)        /* bits[12:0] */
        return 0;
    if (idx < 5 || idx > 10)
        return 0;
    if (*(unsigned short *)(data_ov002_022cf1a4 + off + row) != 0) {
        unsigned int v = *(unsigned int *)(data_ov002_022cf1ac + off + row);
        if (((v >> 9) & 1) == 0) {
            if (func_0202b878() == 0x17)
                return 0;
        }
    }
    w = *(unsigned int *)(data_ov002_022cf16c + off + row + 0x30);
    lhs = (((w << 2) >> 24) << 1) + ((w << 18) >> 31); /* bits[29:22]*2 + bit13 */
    rhs = ((unsigned int)ent->f4 << 17) >> 23;          /* bits[14:9] */
    if (lhs == rhs)
        return 0;
    if (func_ov002_021c1ef0(ent, id, idx) == 0)
        return 0;
    return func_ov002_021c2084(ent, id, idx, 1) != 0;
}
