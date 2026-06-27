/* CAMPAIGN-PREP candidate for func_02221050 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     state if-chain; counter RELOADED each use (no bind); :1 field; cnt*2 element addr
 *   risk:       permuter-class: the @+0x5ac counter is RELOADED before each use (3 ldr in orig); if mwcc binds it to one reg the ldr count diverges, and the adb8 arg packing (mla + two adds) is scheduling-sensitive.
 *   confidence: low
 */
/* func_ov002_02221050 (ov002, D) — dispatch on state @+0x5a8 with a per-call
 * iterator counter @+0x5ac. card(r5) u16 f0/f2/f4/f6. State 0x80: init path,
 * reset counter to 0, return 0x7f. State 0x7f: bounds-check counter vs f6 hi byte
 * ((f6<<0x10>>0x18)), walk one element (card + counter*2 at +8), validate, submit,
 * bump counter, return 0x7f / 0x7e. f2:1 at bit0. deck-table for adb8 arg via
 * cf16c + (f2&1)*0x868 + 0x18 + 0x400 + r4*4 (separate products). */
typedef unsigned short u16;
struct Card { u16 f0; u16 f2; u16 f4; u16 f6; };
extern char data_ov002_022ce288[];      /* state @+0x5a8, counter @+0x5ac */
extern char data_ov002_022cf16c[];
extern int  func_ov002_021b99b4(int a, int b);
extern int  func_ov002_021bc618(int a);
extern int  func_ov002_021c33e4(int a, int b, int c);
extern void func_ov002_021e2b3c(void);
extern int  func_ov002_021e2c5c(void);
extern int  func_ov002_021ff3bc(void);
extern void func_ov002_0227adb8(int a, int b, int c, int d);

int func_ov002_02221050(struct Card *c) {
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x80) {
        if (!func_ov002_021ff3bc()) return 0;
        func_ov002_021e2b3c();
        *(int *)(data_ov002_022ce288 + 0x5ac) = 0;
        return 0x7f;
    }
    if (state == 0x7f) {
        int cnt = *(int *)(data_ov002_022ce288 + 0x5ac);
        int r4;
        if (cnt >= ((c->f6 >> 8) & 0xff)) return 0x7e;
        if (!func_ov002_021bc618(c->f2 & 1)) return 0x7e;
        cnt = *(int *)(data_ov002_022ce288 + 0x5ac);
        r4 = func_ov002_021b99b4(c->f2 & 1, *(u16 *)((char *)c + cnt * 2 + 0x8));
        if (r4 >= 0 &&
            func_ov002_021c33e4(c->f2 & 1, c->f2 & 1, r4)) {
            char *base = data_ov002_022cf16c + (c->f2 & 1) * 0x868
                       + 0x18 + 0x400 + r4 * 4;
            func_ov002_0227adb8((int)base, 1, c->f0, 0);
        }
        cnt = *(int *)(data_ov002_022ce288 + 0x5ac);
        *(int *)(data_ov002_022ce288 + 0x5ac) = cnt + 1;
        return 0x7f;
    }
    if (state == 0x7e)
        return func_ov002_021e2c5c();
    return 0;
}
