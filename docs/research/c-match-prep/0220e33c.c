/* CAMPAIGN-PREP candidate for func_0220e33c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :6 + :1 bitfields; mla parity*0x868 base; if-assign return 0/1
 *   risk:       bind/reload: orig holds r4,r5 from g[1],g[8] across uses; the parity-select mla r0=r3*0x868+r2 may emit add+add vs single mla -- reshape-able (bind base once).
 *   confidence: low
 */
/* func_ov002_0220e33c (ov002, cls D): guard chain on a 6-bit type field (==0x12),
 * a :1 parity flag compared to *(g+4), and a *(g+8)==0 gate; on pass calls
 * 021b9ecc(*(g+4),*(g+0x20)) then 0202ed90, and if true reads a halfword from
 * data_022cf1a4[parity*0x868 + r5*0x14] (0x868 = LIT0, mla parity-select), ret !=0.
 * data_022cd3f4 is g: holds f4=*(g+4), f5=*(g+0x20), and *(g+8) gate. */
struct Ent2 { unsigned short f0:1; unsigned short f1:5; unsigned short ty:6; };
extern int   data_ov002_022cd3f4[];
extern unsigned short data_ov002_022cf1a4[];
extern int  func_0202ed90(int a, int b);
extern int  func_ov002_021b9ecc(int a, int b);
int func_ov002_0220e33c(struct Ent2 *self) {
    unsigned short h = *(unsigned short *)((char *)self + 2);
    int r4, r5;
    if (((struct Ent2 *)&h)->ty != 0x12)
        return 0;
    r4 = data_ov002_022cd3f4[1];
    r5 = data_ov002_022cd3f4[8];
    if (r4 != (h & 1) || data_ov002_022cd3f4[2] == 0)
        return 0;
    func_ov002_021b9ecc(r4, r5);
    if (func_0202ed90(0, 0) == 0)
        return 0;
    if (*(unsigned short *)((char *)data_ov002_022cf1a4 + (r4 & 1) * 0x868 + r5 * 0x14) != 0)
        return 1;
    return 0;
}
