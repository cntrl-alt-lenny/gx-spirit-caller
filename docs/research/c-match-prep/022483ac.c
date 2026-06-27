/* CAMPAIGN-PREP candidate for func_022483ac (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     mul off=(player&1)*0x868 CSE'd; bound base; :13 key bitfield; void early-return
 *   risk:       Gate compare is `ldmls` (unsigned <=0) not `ldmeq`; reading the count as u32 ==0 should pick `ls`, but eq-vs-ls is a mwcc coin-flip. reshape-able (unsigned cast). Minor: base+0x418 two-add split order.
 *   confidence: med
 */
/* func_ov002_022483ac (cls C): per-player counted scan; mul base reused for
 * the cf180 gate and the cf16c row; func_0202b878(key)==0x17 -> sink kind 0xe. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ent { u32 key : 13; };   /* element word, low 13 bits keyed */

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf180[];
extern int  func_0202b878(int key);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_022483ac(int player) {
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
        if (func_0202b878(p[i].key) == 0x17)
            func_ov002_02253458(player, 0xe, i);
    }
}
