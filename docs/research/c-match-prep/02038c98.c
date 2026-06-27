/* CAMPAIGN-PREP candidate for func_02038c98 (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     branch-table dispatch; selector u8; shared case 3/7 body; cmp#7 bound
 *   risk:       mwcc may not emit add-pc table or may fold cases 3/7 placement; reshape-able via case ordering. Offsets f14/f1e/f20 struct-guessed.
 *   confidence: med
 */
/* func_02038c98 (cls D): pre-call + jump-table dispatch (cases 2/3/7) + trailing call.
 * obj held in r5 across; selector = obj->f1e (u8). cases 3,7 share body. */

typedef struct obj_s obj_t;

extern void *data_0219b330;
extern void func_0207d318(obj_t *o, int n);
extern void func_0207d458(void *p, obj_t *o);
extern int  func_02089024(int h);
extern void func_02096060(void *p);
extern void func_020960ac(void *p);

struct obj_s {
    char _pad_00[0x14];
    int           field14;   /* 0x14 */
    char _pad_18[0x1e - 0x18];
    unsigned char field1e;   /* 0x1e: switch selector */
    char _pad_1f[1];
    char          field20;   /* 0x20: &obj->field20 passed to handler */
};

void func_02038c98(obj_t *o, int n) {
    func_0207d318(o, n);
    if (n != 0) {
        switch (o->field1e) {
        case 2:
            if (func_02089024(o->field14) != 0)
                func_020960ac(&o->field20);
            break;
        case 3:
        case 7:
            if (func_02089024(o->field14) != 0)
                func_02096060(&o->field20);
            break;
        }
    }
    func_0207d458(data_0219b330, o);
}
