/* CAMPAIGN-PREP candidate for func_02248ce8 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     022483ac skeleton, compare constant 0x16; mul-off CSE; :13 key; void
 *   risk:       Same family as 022483ac (sibling): the only gate divergence is eq-vs-ls on the cf180 count==0 test. reshape-able (read count as unsigned to steer `ls`). High structural confidence since it mirrors a proven shape.
 *   confidence: med
 */
/* func_ov002_02248ce8 (cls C): identical skeleton to 022483ac; guard compare
 * constant is 0x16 (vs 0x17). func_0202b878(key)==0x16 -> sink kind 0xe. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ent { u32 key : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_0202b878(int key);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_02248ce8(int player) {
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
        if (func_0202b878(p[i].key) == 0x16)
            func_ov002_02253458(player, 0xe, i);
    }
}
