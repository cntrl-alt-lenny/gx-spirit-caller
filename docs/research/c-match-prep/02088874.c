/* CAMPAIGN-PREP candidate for func_02088874 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: signed>=0 if-assign for flag; gate as one local; bind base across uses
 *   risk:       reshape-able: orig reloads o->field2c at the 1<<n shift (r1 live) and reuses flag(r7) 4x; if mwcc spills flag or recomputes >=0, cmp/mov sequence diverges.
 *   confidence: med
 */
/* func_02088874 (main, class D): enabled-guard + (field2c>=0) flag,
 * r2 = (flag ? 1<<field2c : 0), shutdown call, optional unregister
 * loop, then conditional teardown chain keyed on the same flag.
 *   movge r7,#1 / movlt r7,#0  => signed (field2c >= 0) test.
 *   r7 reused across whole body as the gate -> single local `flag`. */
typedef struct {
    int  active;        /* +0x00 */
    int  field04;       /* +0x04 */
    char _pad_08[0x18]; /* +0x08 */
    int  field20;       /* +0x20 */
    int  field24;       /* +0x24 */
    int  field28;       /* +0x28 */
    int  field2c;       /* +0x2c */
} Obj_02088874;

extern Obj_02088874 data_021a524c;
extern int data_021a520c[];

extern void func_02087328(int);
extern void func_0208738c(void);
extern void func_020873cc(void);
extern int  func_020924c0(int *base, int a, int b);
extern void func_02094dd8(int, int, int, int);
extern void func_02095030(int a0, int a1, int mask);
extern int  func_020955a8(void);
extern void func_020955e8(int);
extern void func_02095678(int);

void func_02088874(void) {
    Obj_02088874 *o = &data_021a524c;
    int flag;
    int mask;
    int handle;
    int i;

    if (o->active == 0) {
        return;
    }

    flag = (o->field2c >= 0);
    if (flag) {
        mask = 1 << o->field2c;
    } else {
        mask = 0;
    }
    func_02095030(o->field24, o->field28, mask);

    if (flag) {
        handle = func_020955a8();
        func_02095678(1);
        func_020955e8(handle);
        i = 0;
        while (func_020924c0(data_021a520c, i, i) != 0) {
            ;
        }
    }

    if (o->field28 != 0) {
        func_0208738c();
    }
    if (o->field20 != 0) {
        func_020873cc();
    }
    if (flag) {
        func_02087328(o->field2c);
    }
    if (o->field04 == 1) {
        func_02094dd8(0, 0, 0, 0);
    }
    o->active = 0;
}
