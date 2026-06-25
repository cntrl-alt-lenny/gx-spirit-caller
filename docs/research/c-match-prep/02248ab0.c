/* CAMPAIGN-PREP candidate for func_02248ab0 (ov002, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bind key in a local (held r9) reused by 3 && guards; cf184 gate; offset 0x3a0/count 0x18
 *   risk:       key (r9) must stay live across 3 calls — declaring `int key` reused should hold it callee-saved; risk is mwcc reloading p[i].key after a call instead. reshape-able (the local bind is exactly the lever); same eq-vs-ls gate coin-flip.
 *   confidence: med
 */
/* func_ov002_02248ab0 (cls C): cf184 gate + cf16c row @+0x3a0, count @+0x18;
 * key held in r9 across THREE guard calls (&&) before sink kind 0xc. */
typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ent { u32 key : 13; };

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf184[];
extern int  func_02030808(int key);
extern int  func_02030b84(int key);
extern int  func_ov002_021ca3f0(int player, int key);
extern void func_ov002_02253458(int player, int kind, int idx);

void func_ov002_02248ab0(int player) {
    int off;
    char *base;
    struct Ent *p;
    int i;

    off = (player & 1) * 0x868;
    if (*(u32 *)(data_ov002_022cf184 + off) == 0)
        return;
    base = data_ov002_022cf16c + off;
    p = (struct Ent *)(base + 0x3a0);
    for (i = 0; i < *(int *)(base + 0x18); i++) {
        int key = p[i].key;
        if (func_02030808(key) != 0 &&
            func_02030b84(key) != 0 &&
            func_ov002_021ca3f0(player, key) != 0)
            func_ov002_02253458(player, 0xc, i);
    }
}
