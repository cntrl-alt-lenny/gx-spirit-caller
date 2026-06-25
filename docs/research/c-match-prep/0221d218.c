/* CAMPAIGN-PREP candidate for func_0221d218 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit2 guard; switch dispatch; bit-test + tail-calls
 *   risk:       2nd bit-test may emit tst#2 vs orig lsr#1;tst#1; switch arm order
 *   confidence: med
 */
/* func_ov002_0221d218: bit2@4 guard -> switch on u16@0xa: case1 tail-call,
 * case2 double bit-test on d016c+0xd0 word then tail-call; else return 0. */
typedef unsigned short u16;

extern char data_ov002_022d016c[];
extern int func_ov002_02217888(void);
extern int func_ov002_022205f8(void);

struct Self0221d218 {
    u16 _0;        /* 0 */
    u16 _2;        /* 2 */
    u16 :2;        /* 4: bits 0-1 */
    u16 b2:1;      /* 4: bit 2 */
    u16 :13;
    u16 _6;        /* 6 */
    u16 _8;        /* 8 */
    u16 fa;        /* 0xa */
};

int func_ov002_0221d218(struct Self0221d218 *self) {
    int v;
    if (self->b2) return 0;
    switch (self->fa) {
    case 1:
        return func_ov002_02217888();
    case 2:
        v = *(int *)(data_ov002_022d016c + 0xd0);
        if (v & 1) return 0;
        v = (unsigned)v >> 1;
        if (!(v & 1)) return 0;
        return func_ov002_022205f8();
    }
    return 0;
}
