/* CAMPAIGN-PREP candidate for func_02291bfc (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     D: :13 at +0x30 (movs lsr — set flags); out-param &locals; per-branch swapped x1c/x20 compare order; index inlined
 *   risk:       struct-guessed: the sp+0x1c/0x20 box layout and func_021c4c9c's first arg (r0 carried, not freshly set — likely self->f2.bit0 from prior mla, declared as i placeholder) are inferred from the writeback; confirm 021c4c9c signature and frame offsets. Also predicated ret-1 exits (addlt sp; movlt). permuter-class once struct fixed.
 *   confidence: low
 */
/* func_ov002_02291bfc (ov002, class D, MED). mla + bitfield loop, stack out-params.
 * func_02280a1c(self->f2.bit0, &sp4, &sp0, 1);  (sp0/sp4 out-params)
 * for i in 0..4: p = cf16c + (1 - self->f2.bit0 & 1)*0x868 + i*0x14;
 *   if ((p->f30 (:13 at +0x30)) != 0 && *(u16*)(p+0x38) != 0):     (movs;ldrneh;cmpne)
 *     func_021c4c9c(p? no: self?, i, &buf8);  -> (bit?, i, out) — args r0 carried, r1=i, r2=&sp8
 *     if *(u16*)(p2+0x36) != 0:  hi=sp20; lo=sp1c; cmp against b=sp4 -> return 1 if b<hi && b>lo
 *     else: lo=sp1c; hi=sp20; return 1 if b<lo? mirrored.
 * return 0.
 * NOTE per-access index recomputed from re-read self->f2.bit0 (rsb #1 = 1-bit0). Out-param
 * frame offsets sp+0x1c/0x20/0x36 are struct-guessed against func_021c4c9c's writeback. */
typedef unsigned short u16;
typedef unsigned int   u32;
struct F2 { u16 bit0 : 1; u16 rest : 15; };
struct Self { u16 pad0; struct F2 f2; };
struct Rec { u32 f30 : 13; };
struct Box { int pad0[7]; int x1c; int x20; };          /* sp+8 base: 0x1c,0x20 from start-of-frame */
extern char data_ov002_022cf16c[];
extern int  func_ov002_02280a1c(int bit, int *outA, int *outB, int flag);
extern void func_ov002_021c4c9c(int bit, int i, struct Box *out);

int func_ov002_02291bfc(struct Self *self) {
    int i;
    int a, b;
    struct Box box;
    func_ov002_02280a1c(self->f2.bit0, &a, &b, 1);   /* a=sp4, b=sp0 (order per asm add r1,sp,4; add r2,sp,0) */
    for (i = 0; i <= 4; i++) {
        char *p = data_ov002_022cf16c + ((1 - self->f2.bit0) & 1) * 0x868 + i * 0x14;
        if (((struct Rec *)(p + 0x30))->f30 != 0 && *(u16 *)(p + 0x38) != 0) {
            char *q;
            func_ov002_021c4c9c(i, i, &box);
            q = data_ov002_022cf16c + ((1 - self->f2.bit0) & 1) * 0x868 + i * 0x14;
            if (*(u16 *)(q + 0x36) != 0) {
                if (box.x20 > a && box.x1c < a)
                    return 1;
            } else {
                if (box.x1c > a && box.x20 < a)
                    return 1;
            }
        }
    }
    return 0;
}
