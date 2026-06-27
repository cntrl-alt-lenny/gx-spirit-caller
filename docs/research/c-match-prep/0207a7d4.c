/* CAMPAIGN-PREP candidate for func_0207a7d4 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     CLASS C: switch->jump-table; constant args; NULL ptr arg to b13c; shared default epilogue
 *   risk:       permuter-class: register filling order of the four constant args before bl b13c (mov r1=0;r2=r1 mirror vs independent movs) is a scheduling coin-flip.
 *   confidence: low
 */
/* func_0207a7d4: small 5-way jump-table on msg->kind (u16 @ +2), constant args.
 * case 1: set(3), b13c(0,0,0,0x783).  case 2: af28().
 * default(0,3,4): set(0xb), b13c(7,0,0,0x793).
 * b13c here gets a NULL pointer (mov r1,#0). Sibling dispatchers ship .s. */
typedef unsigned short u16;

typedef struct {
    u16 _r0;
    u16 kind;          /* +0x2 */
} GxMsg;

extern void func_0207af28(void);
extern void func_0207b038(int code);
extern void func_0207b13c(int code, void *p, int b, int magic);

void func_0207a7d4(GxMsg *msg) {
    switch (msg->kind) {
    case 1:
        func_0207b038(3);
        func_0207b13c(0, 0, 0, 0x783);
        return;
    case 2:
        func_0207af28();
        return;
    default:
        func_0207b038(0xb);
        func_0207b13c(7, 0, 0, 0x793);
        return;
    }
}
