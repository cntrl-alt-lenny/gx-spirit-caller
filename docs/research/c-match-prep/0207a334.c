/* CAMPAIGN-PREP candidate for func_0207a334 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     C: nested if-chain on field2 then field4; reload ev->field8 each call (3 ldr); asr#8&0xff field extract
 *   risk:       Case 0xf reloads ev[+8] before each of 3 calls (orig: ldr r0,[r4,#8] ×3) — if mwcc binds it to one reg, 3 ldr collapse and stores diverge. Also default-branch arg r2=ev[2] vs 0 ordering. permuter-class / reshape-able (force reloads via volatile-style reread).
 *   confidence: low
 */
/* func_0207a334 — sibling dispatcher: if ev->field2==0 branch on
 * ev->field4 (0xe/0xf/other), else default. Case 0xf reads ev->field8
 * (an object ptr), extracts (obj->field0xe >> 8) & 0xff and runs a
 * teardown trio (func_0207cdd0 / func_020928cc / func_0207cd34).
 * Other cases set-state + post message via func_0207b13c.
 * Ships as .s in-tree (brief 302) — known reg-alloc/scheduling wall.
 */

extern char *data_021a088c;
extern void func_0207af28(void);
extern void func_0207b038(int state);
extern void func_0207b13c(int a, void *ctx, int c, int d);
extern void func_0207cd34(void *obj);
extern void func_0207cdd0(int v);
extern void func_020928cc(void *obj, int v);

void func_0207a334(unsigned short *ev) {
    char *root;
    if (ev[1] == 0) {
        unsigned short f4 = ev[2];
        if (f4 == 0xe) {
            root = *(char **)data_021a088c;
            if (*(int *)(root + 0x2260) == 0xc) {
                func_0207b038(8);
                func_0207af28();
                return;
            }
            func_0207b038(9);
            root = *(char **)data_021a088c;
            func_0207b13c(0, root + 0x2140, 0, 0x872);
            return;
        }
        if (f4 == 0xf) {
            void *obj = *(void **)(ev + 4);
            func_0207cdd0((*(unsigned short *)((char *)obj + 0xe) >> 8) & 0xff);
            func_020928cc(*(void **)(ev + 4), 0x620);
            func_0207cd34(*(void **)(ev + 4));
            return;
        }
        func_0207b038(0xb);
        root = *(char **)data_021a088c;
        func_0207b13c(7, root + 0x2140, ev[2], 0x881);
        return;
    }
    func_0207b038(0xb);
    root = *(char **)data_021a088c;
    func_0207b13c(7, root + 0x2140, 0, 0x88c);
}
