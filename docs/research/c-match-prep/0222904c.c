/* CAMPAIGN-PREP candidate for func_0222904c (ov002, class D, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     bitfield-insert stack struct (zero-init then :13 set); store upper before lower; (f0<<16)|0x11 stacked arg
 *   risk:       struct-guessed/permuter-class: the upper-word insert (orig sub r0,#0x2000;and ip,#0 then orr;str = zero high-field + :13 set) is fragile - mwcc may emit a plain mask-store, not the same and/orr, and the two stack-word store-order may reorder
 *   confidence: low
 */
/* func_ov002_0222904c: cls D. self at r0. Scene-state switch on
 * *(int*)(ce288+0x5a8): 0x80 -> gate 02257b48 + 021ca3f0(player,0x1670), tick
 * 021e2b3c, reset +0x5ac, return 0x7f. 0x7f -> if counter(+0x5ac)>=3 return
 * 0x7e; else build a 2-word stack struct (upper = be154[counter] masked to a
 * :13 field, with the high field zeroed; lower = (self->f0<<16)|0x11), call
 * 0227ac64(1-player, &upper, 1, 1, lower), bump +0x5ac, return 0x7f. 0x7e ->
 * tick 021e2c5c then return 0. STORE-ORDER: upper word stored (zero then
 * masked) before the lower word; emit in this order. */
typedef unsigned short u16;

struct Self {
    u16 f0;
    u16 b0 : 1;        /* +0x2 bit0 */
};

/* the stack struct passed by pointer: a :13 field with a zeroed high field */
struct Packed { unsigned int lo : 13; unsigned int hi : 19; };

extern char data_ov002_022ce288[];   /* +0x5a8 scene state, +0x5ac counter */
extern int  data_ov002_022be154[];   /* counter-indexed table             */
extern int  func_ov002_021ca3f0(int player, int a);
extern void func_ov002_021e2b3c(void);
extern void func_ov002_021e2c5c(void);
extern int  func_ov002_02257b48(void);
extern int  func_ov002_0227ac64(int a, struct Packed *p, int c, int d, int e);

int func_ov002_0222904c(struct Self *self) {
    int state = *(int *)(data_ov002_022ce288 + 0x5a8);
    if (state == 0x7e) {
        func_ov002_021e2c5c();
        return 0;
    }
    if (state == 0x7f) {
        int counter = *(int *)(data_ov002_022ce288 + 0x5ac);
        struct Packed v;
        if (counter >= 3)
            return 0x7e;
        *(int *)&v = 0;
        v.lo = data_ov002_022be154[*(int *)(data_ov002_022ce288 + 0x5ac)];
        func_ov002_0227ac64(1 - (self->b0 & 1), &v, 1, 1,
                            (self->f0 << 16) | 0x11);
        *(int *)(data_ov002_022ce288 + 0x5ac) =
            *(int *)(data_ov002_022ce288 + 0x5ac) + 1;
        return 0x7f;
    }
    if (state != 0x80)
        return 0;
    if (func_ov002_02257b48() == 0)
        return 0;
    if (func_ov002_021ca3f0(self->b0 & 1, 0x1670) == 0)
        return 0;
    func_ov002_021e2b3c();
    *(int *)(data_ov002_022ce288 + 0x5ac) = 0;
    return 0x7f;
}
