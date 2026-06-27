/* CAMPAIGN-PREP candidate for func_0222ed1c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: lsl/lsr->:8 bitfield decode; parity*0x868 base bind; field6*20 sub-index
 *   risk:       struct-guessed: the secondary gate 'ldrh r2,[r3,r2]' reuses r3(=0x14 leftover) as the index reg into data_022cf1a4 — my poff/2 index may not match that exact addressing; the bitfield combine (2*hi8+b13) is the codegen-sensitive part.
 *   confidence: med
 */
/* func_ov002_0222ed1c (ov002, D) pure coord-decode guard then one call, no branches
 * besides the two early returns. Entity *e in r0; e->f2(+2),e->f4(+4) halfwords.
 * parity=(f2&1); field6=(f2>>5)&0x3f indexes 20-byte sub-table at base+0x30;
 * packed word decoded via lsl/lsr bitfields -> dec=2*hi8+b13; compare against
 * (e->f4>>8)&0x7f; then a halfword secondary table data_022cf1a4 gate; then call.
 * _LIT0=0x868 stride, _LIT1=data_022cf16c, _LIT2=data_022cf1a4. */
typedef union { unsigned u; struct { unsigned lo13:13; unsigned b13:1; unsigned mid8:8; unsigned hi8:8; unsigned top2:2; } b; } PackW;
typedef struct { unsigned short f0; unsigned short f2; unsigned short f4; } Ent;
extern unsigned char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern void func_ov002_022101c4(void);
int func_ov002_0222ed1c(Ent *e) {
    unsigned short f2 = e->f2;
    unsigned short f4 = e->f4;
    unsigned parity = ((f2 << 31) >> 31) & 1;
    unsigned poff = parity * 0x868;
    unsigned field6 = (f2 << 26) >> 27;
    unsigned char *base = data_ov002_022cf16c + poff;
    PackW pw; pw.u = *(unsigned *)(base + 0x30 + field6 * 0x14);
    unsigned dec = (pw.b.hi8 << 1) + pw.b.b13;
    unsigned efield = (f4 << 17) >> 23;
    if (efield != dec) return 0;
    if (data_ov002_022cf1a4[poff / 2] == 0) return 0;
    func_ov002_022101c4();
    return 0;
}
