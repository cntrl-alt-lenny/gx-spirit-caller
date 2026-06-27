/* CAMPAIGN-PREP candidate for func_02027ee4 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     Class D: addls-pc switch; :5 bitfield at bit8 for masked DISPCNT RMW; b0&&b1 short-circuit
 *   risk:       permuter-class: relies on mwcc emitting the addls-pc jump table AND a volatile :5-bitfield |=/&= as the exact two-load and-0x1f00/bic/orr RMW; the goto-converged case bodies likely schedule differently.
 *   confidence: low
 */
/* func_02027ee4 (main, class D) - state switch toggling a BG-enable bit (1<<n) in
 * DISPCNT bits 8..12 of the main (0x04000000) or sub (0x04001000) engine.
 *   switch(state): 1..4 -> main, layer=1,2,4,8 ; 5..7(8) -> sub, layer=1,2,4,8
 *   if (b0 && b1) eng.bg_enable |= layer; else eng.bg_enable &= ~layer;
 * Modeled as a :5 bitfield at bit8 so the masked RMW (and 0x1f00/bic/orr) matches.
 * default/case0 -> return 1. */
typedef unsigned int u32;

typedef struct Dispcnt {
    u32 _lo:8, bg_enable:5, _hi:19;   /* bits 8..12 */
} Dispcnt;

#define MAIN (*(volatile Dispcnt *)0x04000000)
#define SUB  (*(volatile Dispcnt *)0x04001000)

typedef struct Obj27ee4 {
    char _p0[0xd4];
    short state;        /* 0xd4 */
    char _p1[0xde - 0xd6];
    unsigned short b0:1, b1:1;   /* 0xde */
} Obj27ee4;

int func_02027ee4(Obj27ee4 *p) {
    int layer;
    switch (p->state) {
    case 1: layer = 1; goto eng_main;
    case 2: layer = 2; goto eng_main;
    case 3: layer = 4; goto eng_main;
    case 4: layer = 8;
    eng_main:
        if (p->b0 && p->b1) MAIN.bg_enable |= layer;
        else                MAIN.bg_enable &= ~layer;
        break;
    case 5: layer = 1; goto eng_sub;
    case 6: layer = 2; goto eng_sub;
    case 7: layer = 4; goto eng_sub;
    case 8: layer = 8;
    eng_sub:
        if (p->b0 && p->b1) SUB.bg_enable |= layer;
        else                SUB.bg_enable &= ~layer;
        break;
    }
    return 1;
}
