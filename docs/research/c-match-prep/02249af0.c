/* CAMPAIGN-PREP candidate for func_02249af0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mla side-base, bitfield :13 to local, guard-chain, store-order none
 *   risk:       reshape-able: orig binds extracted :13 (r5) once and reuses across 4 calls; ensure single local `kind` holds it (no re-extract). mla fuses (id&1)*0x868 + base + r6<<2; if mwcc splits into add+mul the mla diverges — keep base as data ptr so reloc folds.
 *   confidence: med
 */
typedef struct Entry { unsigned int kind : 13; unsigned int pad : 19; } Entry;

extern unsigned int data_ov002_022cf16c[2][0x868 / 4];

extern int func_0202b8c0(int x);
extern int func_0202e234(int x);
extern int func_020317c0(int x);
extern int func_ov002_021b8f80(int x);
extern int func_ov002_021bd030(int x);
extern void func_ov002_02253458(int a, int b, int c);

extern void func_ov002_02249af0(int arg0, int unused1, int arg2);

void func_ov002_02249af0(int arg0, int unused1, int arg2)
{
    int side = arg0 & 1;
    unsigned int w = *(unsigned int *)((char *)data_ov002_022cf16c[side] + arg2 * 4 + 0x120);
    int kind = (w << 0x13) >> 0x13;

    if (func_0202e234(kind) != 0) {
        if (func_020317c0(kind) == 0)
            return;
    }
    if (func_ov002_021b8f80(kind) != 0)
        return;
    if (func_ov002_021bd030(arg0) < 0) {
        if (func_0202b8c0(kind) != 0x2)
            return;
    }
    func_ov002_02253458(arg0, 0xb, arg2);
}
