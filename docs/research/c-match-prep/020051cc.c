/* CAMPAIGN-PREP candidate for func_020051cc (main, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     class D bitfield clone of 5188; same 4-bit extract, swap callee+fnptr
 *   risk:       Same as 5188: the 5-arg stack-marshalling (slots reloaded from incoming frame + fnptr) is struct-guessed; reshape-able once the real func_020048c0 prototype/stack layout is known.
 *   confidence: low
 */
/* func_020051cc: byte-identical clone of func_02005188 with a
 * different callee (func_020048c0) and different fnptr slot value
 * (func_02003e98). Same bits17..20 extract -> global[0x8] store. */
typedef struct {
    char _pad_00[0x24];
    unsigned int field24;
} Obj_020051cc;

typedef struct {
    char _pad_00[0x8];
    unsigned int sel;
} Glob_02102c7c_b;

extern Glob_02102c7c_b data_02102c7c;
extern void func_02003e98(void);
extern void func_020048c0(int a0, int a1, void *fn, int a3, int a4);

void func_020051cc(Obj_020051cc *obj, int a1, int a2, int a3, int a4) {
    data_02102c7c.sel = (obj->field24 << 0xb) >> 0x1c;
    func_020048c0(a3, a4, func_02003e98, a3, a4);
}
