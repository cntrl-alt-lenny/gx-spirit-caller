/* CAMPAIGN-PREP candidate for func_020287b0 (main, class B) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard + :1 bitfield bit2 two-way branch + param-in-r0 reuse
 *   risk:       0x19a offset>0xff forces add #0x100 split (expected); field offsets guessed
 *   confidence: high
 */
/* func_020287b0 — null-guard + bit2 two-way dispatch + clear (twin of 0x245e8) */
typedef unsigned short u16;

typedef struct Obj28804 {
    int field0;                       /* 0x00 — guarded != 0, cleared at end */
    char _pad[0x19a - 4];            /* up to 0x19a */
    u16 b0:1, b1:1, b2:1;            /* 0x19a — bit 2 tested (<<29>>31) */
} Obj28804;

extern void func_02029404(Obj28804 *p);
extern void func_020298a4(Obj28804 *p);

int func_020287b0(Obj28804 *p) {
    if (p->field0 == 0)
        return 0;
    if (p->b2)
        func_02029404(p);
    else
        func_020298a4(p);
    p->field0 = 0;
    return 1;
}
