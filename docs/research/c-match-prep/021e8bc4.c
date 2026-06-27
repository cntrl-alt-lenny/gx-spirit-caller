/* CAMPAIGN-PREP candidate for func_021e8bc4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: parity*0x868 + idx*20 indexing; multi-shift bitfield compares; min-style tail
 *   risk:       permuter-class AND struct-guessed: register scheduling around mul (id&1)*0x868 / idx*20 and the two indexed ldr [base,idx*20] (orig reloads the +0x30 word) is coin-flip; all table offsets/strides are inferred from asm.
 *   confidence: low
 */
/* func_ov002_021e8bc4: index two parallel 20-byte-stride tables
 * (base + (id&1)*0x868 + idx*20). Checks a 13-bit field, a halfword,
 * and a packed (8bit*2 + 1bit) vs entity bitfield, then 3 helper guards.
 * Struct offsets/strides RECONSTRUCTED from the asm. */
extern int func_ov002_021c1ef0(void *ent, int id, int idx);
extern int func_ov002_021c2084(void *ent, int id, int idx, int flag);
extern int func_ov002_021c8470(int id, int idx);

typedef struct {
    char _pad30[0x30];
    unsigned int w30;        /* +0x30: bits[12:0], bits[29:22], bit13 */
} RowA021e8bc4;             /* stride 20 within a 0x868 parity block, base _LIT1 */

typedef struct {
    unsigned short hw;       /* +0x0 within stride-20 row, base _LIT2 */
} RowB021e8bc4;

typedef struct {
    unsigned short f0;       /* +0x0 */
    unsigned short f2;       /* +0x2 */
    unsigned short f4;       /* +0x4: bits[14:9] (6-bit) */
} Entity021e8bc4;

extern unsigned char data_ov002_022cf16c[]; /* RowA table base (_LIT1) */
extern unsigned char data_ov002_022cf1a4[]; /* RowB table base (_LIT2) */

int func_ov002_021e8bc4(Entity021e8bc4 *ent, int id, int idx) {
    unsigned int parity = (unsigned int)id & 1;
    RowA021e8bc4 *ra;
    unsigned short *rb;
    unsigned int w, lhs, rhs;
    if (idx > 4)
        return 0;
    ra = (RowA021e8bc4 *)(data_ov002_022cf16c + parity * 0x868 + idx * 20);
    if ((((unsigned int)ra->w30 << 19) >> 19) == 0)   /* bits[12:0] */
        return 0;
    rb = (unsigned short *)(data_ov002_022cf1a4 + parity * 0x868 + idx * 20);
    if (*rb == 0)
        return 0;
    w = ra->w30;
    lhs = (((w << 2) >> 24) << 1) + ((w << 18) >> 31); /* bits[29:22]*2 + bit13 */
    rhs = ((unsigned int)ent->f4 << 17) >> 23;          /* bits[14:9] */
    if (lhs == rhs)
        return 0;
    if (func_ov002_021c2084(ent, id, idx, 1) == 0)
        return 0;
    if (func_ov002_021c1ef0(ent, id, idx) == 0)
        return 0;
    return func_ov002_021c8470(id, idx) <= 1000 ? 1 : 0;
}
