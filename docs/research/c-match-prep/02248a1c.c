/* CAMPAIGN-PREP candidate for func_02248a1c (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     as 022483ac; invariant 0x12e5 hoisted to a held reg; guard !=0 skips
 *   risk:       Needs 0x12e5 literal-load HOISTED out of the loop into a callee-saved reg (orig r9); mwcc -O4 usually hoists loop-invariant pool loads but may reload per-iter. reshape-able (hoist is automatic); same eq-vs-ls gate coin-flip as 022483ac.
 *   confidence: med
 */
/* func_ov002_02248a1c (cls C): same skeleton as 022483ac, guard call takes a
 * 2nd invariant arg (0x12e5, hoisted to r9); func_0202df78(key,0x12e5)!=0. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ent { u32 key : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_0202df78(int key, int tag);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_02248a1c(int player) {
    int off;
    char *base;
    struct Ent *p;
    int i;

    off = (player & 1) * 0x868;
    if (*(u32 *)(data_ov002_022cf180 + off) == 0)
        return;
    base = data_ov002_022cf16c + off;
    p = (struct Ent *)(base + 0x418);
    for (i = 0; i < *(int *)(base + 0x14); i++) {
        if (func_0202df78(p[i].key, 0x12e5) != 0)
            func_ov002_02253458(player, 0xe, i);
    }
}
