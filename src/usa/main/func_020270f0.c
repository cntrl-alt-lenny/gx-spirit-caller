/* CAMPAIGN-PREP candidate for func_020270f0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     null-guard early-return + :1 bitfield test (bit2) + param-in-r0 reuse
 *   risk:       field0/0xde offsets guessed; bitfield bit-numbering must put b2 at bit 2 of the u16
 *   confidence: high
 */
/* func_020270f0 — null-guard + bit2 bitfield test + conditional invoke + clear */
typedef unsigned short u16;

typedef struct Obj27144 {
    int field0;                       /* 0x00 — guarded != 0, cleared at end */
    char _pad[0xde - 4];              /* up to 0xde */
    u16 b0:1, b1:1, b2:1;            /* 0xde — bit 2 tested (<<29>>31) */
} Obj27144;                          /* sizeof = 0xe0 */

extern void func_02027d88(Obj27144 *p);

int func_020270f0(Obj27144 *p) {
    if (p->field0 == 0)
        return 0;
    if (p->b2)
        func_02027d88(p);
    p->field0 = 0;
    return 1;
}
