/* CAMPAIGN-PREP candidate for func_0207ae74 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: guard chain as early-return ifs; switch on (state-8)->jump-table; shared fallthrough epilogue
 *   risk:       permuter-class/reshape-able: guard chain emits addne/ldmnefd/bxne inline-epilogue per check; mwcc may instead branch to one shared epilogue, diverging the cond-suffix prologue restore.
 *   confidence: low
 */
/* func_0207ae74: guard chain (kind@+2==8 && sub@+4==0x16 && f6@+6==0x25),
 * then 5-way jump-table on (g->state(0x2260) - 8).
 * case 0(state8): set(0xc). cases 1/4(state9/0xc): af28(). case 3(state0xb): set(0xc).
 * default/case2 (0xa,0xd..): fallthrough epilogue. */
typedef unsigned short u16;
typedef unsigned char  u8;

typedef struct {
    u8  _pad0[0x2260];
    int state;         /* +0x2260 */
} GxState;

typedef struct {
    u16 _r0;
    u16 kind;          /* +0x2 */
    u16 sub;           /* +0x4 */
    u16 f6;            /* +0x6 */
} GxMsg;

extern GxState *data_021a088c;
extern void func_0207af28(void);
extern void func_0207b038(int code);

void func_0207ae74(GxMsg *msg) {
    if (msg->kind != 8) return;
    if (msg->sub != 0x16) return;
    if (msg->f6 != 0x25) return;
    switch (((GxState *)data_021a088c)->state - 8) {
    case 0:
        func_0207b038(0xc);
        return;
    case 1:
    case 4:
        func_0207af28();
        return;
    case 3:
        func_0207b038(0xc);
        return;
    default:
        return;
    }
}
