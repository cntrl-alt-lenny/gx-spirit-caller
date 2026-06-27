/* CAMPAIGN-PREP candidate for func_02212488 (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     ca2b8 1-arg + ac64 5-arg(stack) protos; call afb74 INSIDE each branch (not hoisted) -> orig's duplicated bl; :1 bitfield dispatch
 *   risk:       Compile-verified BYTE-IDENTICAL (full body incl. recovered .L_120/.L_14c tail). Key: ac64 needs 5 args (stack 0) and afb74 must sit in each arm; orig deliberately duplicates the call. No expected divergence.
 *   confidence: high
 */
typedef unsigned short u16;
struct F02212488_F2 { u16 bit0 : 1; u16 rest : 15; };
struct F02212488_Self { u16 id; struct F02212488_F2 f2; };
extern char data_ov002_022ce288[];
extern int  func_ov002_021ae400(int a, int b);
extern int  func_ov002_021af9d0(int a, int b, int c, int d);
extern int  func_ov002_021afb74(void);
extern int  func_ov002_021bc618(int a);
extern int  func_ov002_021ca2b8(int a);
extern int  func_ov002_0223f6c4(void *self);
extern int  func_ov002_0225368c(int a, int b, int c);
extern int  func_ov002_0227ac64(int a, int b, int c, int d, int e);
extern int  func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02212488(struct F02212488_Self *self) {
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x7e) {
        if (self->id == 0x114a) {
            func_ov002_0227ac64(self->f2.bit0, func_ov002_021afb74(), 1, 0, 0);
        } else {
            func_ov002_0227adb8(self->f2.bit0, func_ov002_021afb74(), 1, 0);
        }
        return 0;
    }
    if (state == 0x7f) {
        int r = func_ov002_0223f6c4(self);
        func_ov002_021af9d0(self->f2.bit0, 6, self->id, r);
        return 0x7e;
    }
    if (state == 0x80) {
        int r;
        if (func_ov002_021ca2b8(self->f2.bit0) == 0) return 0;
        if (func_ov002_021bc618(self->f2.bit0) == 0) return 0;
        r = func_ov002_0223f6c4(self);
        if (func_ov002_0225368c(self->f2.bit0, self->id, r) == 0) return 0;
        func_ov002_021ae400(self->f2.bit0, 0x1a);
        return 0x7f;
    }
    return 0;
}
