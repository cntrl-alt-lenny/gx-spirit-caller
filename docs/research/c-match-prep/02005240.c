/* CAMPAIGN-PREP candidate for func_02005240 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D: bitfield extract + store-order (global[0x10]=0 before [0x8]); reload field24 for orr
 *   risk:       reshape-able store/reload order BUT the 5-arg stack marshalling is struct-guessed like 5188/51cc; biggest divergence is whether mwcc reloads field24 (asm has 2 ldr) — keep two separate reads.
 *   confidence: low
 */
/* func_02005240: zero global[0x10]; extract bits17..20 of s->field24
 * into global[0x8]; OR 0x10000 into s->field24 (set bit 16); then
 * call func_02004ef4 with two reloaded stack args + fnptr func_02003400.
 * Store ORDER matters: global[0x10]=0 FIRST, then global[0x8]=field,
 * then s->field24 |= 0x10000. field24 is RELOADED for the orr (the asm
 * does a second `ldr ip,[r0,#0x24]`), so read it twice in C. */
typedef struct {
    char _pad_00[0x24];
    unsigned int field24;   /* bits17..20 extracted; bit16 set via |=0x10000 */
} Obj_02005240;

typedef struct {
    char _pad_00[0x8];
    unsigned int sel;       /* +0x8 */
    char _pad_0c[0x4];
    unsigned int flag;      /* +0x10, zeroed first */
} Glob_02102c7c_c;

extern Glob_02102c7c_c data_02102c7c;
extern void func_02003400(void);
extern void func_02004ef4(int a0, int a1, void *fn, int a3, int a4);

void func_02005240(Obj_02005240 *obj, int a1, int a2, int a3, int a4) {
    data_02102c7c.flag = 0;
    data_02102c7c.sel = (obj->field24 << 0xb) >> 0x1c;
    obj->field24 |= 0x10000;
    func_02004ef4(a3, a4, func_02003400, a3, a4);
}
