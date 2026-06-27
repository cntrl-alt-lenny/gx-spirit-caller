/* CAMPAIGN-PREP candidate for func_0222e5e4 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: lsl/lsr->bitfield decode; parity*0x868 base bind; divmod-free *0x12c pack
 *   risk:       struct-guessed: the .s is TRUNCATED at .L_300 (cut mid-instruction); secondary-table base/index and the .L_250 store-arg order are reconstructed from sibling 0222ed1c and WILL need confirming.
 *   confidence: low
 */
/* func_ov002_0222e5e4 (ov002, D) state machine on g->state[0x5a8].
 * Entity *e in r0; e->f2(+2),e->f0(+0),e->f4(+4) halfwords. Coord-decode idiom:
 * parity=e->f2&1 picks a 0x868-stride table off data_022cf16c; a 6-bit field of
 * f2 (bits[10:5]) indexes a 20-byte sub-table at +0x30; packed word decoded by
 * lsl/lsr bitfields. NOTE: the .s dump is TRUNCATED at .L_300 (cut mid-prologue),
 * so the _LIT pool (stride const, secondary-table base) is INFERRED from the
 * sibling idiom func_0222ed1c. */
typedef struct { unsigned short f0; unsigned short f2; unsigned short f4; } Ent;
typedef union { unsigned u; struct { unsigned lo13:13; unsigned b13:1; unsigned mid8:8; unsigned hi8:8; unsigned top2:2; } b; } PackW;
struct GState { char pad[0x5a8]; int state; int v5ac; };
extern struct GState data_ov002_022ce288;
extern unsigned char data_ov002_022cf16c[];
extern unsigned short data_ov002_022cf1a4[];
extern int func_ov002_021b4618(void);
extern void func_ov002_021d59cc(int a,int b,int c,int d);
extern void func_ov002_021de8fc(int a,int b,int c);
extern int func_ov002_02237d60(void);
extern int func_ov002_02257704(void);
int func_ov002_0222e5e4(Ent *e) {
    unsigned short f2 = e->f2;
    if (((f2 << 18) >> 30) == 1) {
        return func_ov002_02237d60();
    }
    {
        int st = data_ov002_022ce288.state;
        if (st == 0x7f) {
            unsigned parity = (f2 << 31) >> 31;
            unsigned poff = (parity & 1) * 0x868;
            unsigned field6 = (f2 << 26) >> 27;
            unsigned char *base = data_ov002_022cf16c + poff;
            PackW pw; pw.u = *(unsigned *)(base + 0x30 + field6 * 0x14);
            unsigned dec = (pw.b.hi8 << 1) + pw.b.b13;
            unsigned efield = (e->f4 << 17) >> 23;
            if (efield != dec) return 0;
            if (data_ov002_022cf1a4[poff / 2 + 0] == 0) return 0;
            {
                int idx = data_ov002_022ce288.v5ac;
                int packed = (idx * 0x12c) << 16 >> 16;
                func_ov002_021d59cc((int)e->f0, 3, (int)0, packed);
            }
            return 0;
        } else if (st == 0x80) {
            int r = func_ov002_02257704();
            func_ov002_021de8fc((int)e, r, 2);
            data_ov002_022ce288.v5ac = func_ov002_021b4618();
            return 0x7f;
        }
        return 0;
    }
}
