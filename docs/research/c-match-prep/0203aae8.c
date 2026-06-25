/* CAMPAIGN-PREP candidate for func_0203aae8 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     decl-order i first; signed bytes for movle; bind self in r8
 *   risk:       permuter-class: loop holds 6 regs (r5/r6 array ptrs, r7 idx, r9 sentinel, sl=0); mwcc may rotate r5/r6/r9 allocation or recompute (1<<i) shift vs holding r4=1.
 *   confidence: low
 */
/* func_0203aae8: per-frame refcount tick over a parallel-array struct.
 * r8 = self (held across whole body). Decrement signed byte at +0x59,
 * clamp <=0 -> 0 (also zeroes +0x4 word and +0x58 byte). Then walk two
 * stride-4 arrays at +0x14 (sentinel 0xffff terminates) and +0x34
 * (object ptr); lazily resolve via func_0203a84c, dec [obj+0x1c] byte
 * refcount, free via func_0203a8dc when it hits 0. */

extern int  func_0203a84c(void);
extern void func_0203a8dc(void *obj);
extern void func_0203a950(void *self);

typedef struct Obj_0203aae8 {
    char          _pad0[0x1c];
    unsigned char refcnt;        /* +0x1c */
} Obj_0203aae8;

typedef struct Self_0203aae8 {
    char          _pad0[0x4];
    int           f_04;          /* +0x04 */
    char          _pad1[0xc];
    int           arrB[8];       /* +0x14, stride 4, 0xffff-terminated */
    char          _pad2[0xc];    /* 0x14+0x20=0x34 */
    Obj_0203aae8 *arrA[8];       /* +0x34, stride 4 */
    char          _pad3[0x1c];   /* 0x34+0x20=0x54 */
    unsigned short f_54;         /* +0x54, bitmask */
    char          _pad4[0x2];
    unsigned char f_58;          /* +0x58 */
    signed char   f_59;          /* +0x59 */
} Self_0203aae8;

void func_0203aae8(Self_0203aae8 *self) {
    int i;
    if (self == 0) return;
    self->f_59--;
    if (self->f_59 <= 0) {
        self->f_04 = 0;
        self->f_58 = 0;
    }
    func_0203a950(self);
    i = -1;
    while (self->arrB[i + 1] != 0xffff) {
        Obj_0203aae8 *obj;
        i++;
        obj = self->arrA[i];
        if (obj == 0 && (self->f_54 & (1 << i)) == 0) {
            obj = (Obj_0203aae8 *)func_0203a84c();
        }
        if (obj != 0) {
            obj->refcnt--;
            if (obj->refcnt == 0) {
                func_0203a8dc(obj);
                self->arrA[i] = 0;
            }
        }
    }
}
