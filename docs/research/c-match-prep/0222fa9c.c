/* CAMPAIGN-PREP candidate for func_0222fa9c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C/D: loop with mla parity*0x868 base re-derived per use; reload f2; *0x868+0xc count
 *   risk:       permuter-class: 8-register loop (r4-sl) with i as both index(r7) and byte-offset(r8) and base re-mla'd each use; mwcc loop reg-alloc/induction-var choice is a scheduling coin-flip a C reshape rarely pins. dec extract may need bitfield form. count reload offset struct-guessed.
 *   confidence: low
 */
/* func_ov002_0222fa9c (ov002, D) loop over per-parity entry table with mla index.
 * Entity *e in r0(=r9); e->f2(+2) halfword. state0x7f -> tail 02214720. state0x80:
 * parity=(f2&1); base=data_022cf16c+0x868*parity; count=*(base+0xc); entries word
 * table at base+0x120 indexed by i*4. Per entry: coord-decode dec=2*((w>>22)&0xff)+
 * ((w>>13)&1) -> 021b3fd8(0xb, w?, dec, 0x12a1-ish); if ==0 found -> 0226aef0(parity,
 * 1,0,0) return 0x7f. Loop while ++i < count. orig RELOADS e->f2 each iteration and
 * re-derives parity+base via mla each use (i held in r8 as byte offset, r7 as index). */
typedef struct { unsigned short f0; unsigned short f2; } Ent;
struct GState { char pad[0x5a8]; int state; };
extern struct GState data_ov002_022ce288;
extern unsigned char data_ov002_022cf16c[];
extern int *data_ov002_022cf178;
extern int  func_ov002_021b3fd8(int a,int b,int c,int d);
extern void func_ov002_02214720(void);
extern void func_ov002_0226aef0(int p,int a,int b,int c);
int func_ov002_0222fa9c(Ent *e) {
    int st = data_ov002_022ce288.state;
    if (st == 0x7f) { func_ov002_02214720(); return 0; }
    if (st != 0x80) return 0;
    {
        unsigned parity0 = ((e->f2 << 31) >> 31) & 1;
        int count = *(int *)((char *)&data_ov002_022cf178 + parity0 * 0x868);
        int i = 0;
        if (count <= 0) return 0;
        do {
            unsigned p = ((e->f2 << 31) >> 31) & 1;
            unsigned w = *(unsigned *)(data_ov002_022cf16c + p * 0x868 + 0x120 + i * 4);
            int dec = (((w << 2) >> 24) << 1) + ((w << 18) >> 31);
            int r = func_ov002_021b3fd8(0xb, (int)w, dec, 0x12a1);
            if (r == 0) {
                func_ov002_0226aef0((int)((e->f2 << 31) >> 31), 1, 0, 0);
                return 0x7f;
            }
            i++;
            {
                unsigned pp = ((e->f2 << 31) >> 31) & 1;
                count = *(int *)(data_ov002_022cf16c + pp * 0x868 + 0xc);
            }
        } while (i < count);
        return 0;
    }
}
