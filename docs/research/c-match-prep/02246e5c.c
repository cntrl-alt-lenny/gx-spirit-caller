/* CAMPAIGN-PREP candidate for func_02246e5c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: 32-bit holder struct{u32 id:13; u32 hi:13;} gives both (x<<19)>>19 and (x<<6)>>19; read once by value (r2 held); 0x1716=0x1698+0x7e incremental const
 *   risk:       reshape-able: reading struct by value should keep cacc0[arg1] in one reg for both fields; if mwcc spills/reloads, the held-r2 diverges. 0x1716 may load via pool instead of add #0x7e.
 *   confidence: med
 */
/* func_ov002_02246e5c — node lookup cacc0[arg1]; match a 13-bit hi field or
 * dispatch by arg0 against two ids carrying the low 13-bit field. */
typedef unsigned short u16;

struct NodeE5C { unsigned int id : 13; unsigned int hi : 13; };

extern struct NodeE5C data_ov002_022cacc0[];
extern int func_ov002_021b9128(int a, int b);

int func_ov002_02246e5c(int arg0, int arg1) {
    struct NodeE5C n = data_ov002_022cacc0[arg1];
    if (arg0 == (int)n.hi)
        return 1;
    if (arg0 == 0x1698)
        return func_ov002_021b9128(n.id, 2);
    if (arg0 == 0x1716)
        return func_ov002_021b9128(n.id, 5);
    return 0;
}
