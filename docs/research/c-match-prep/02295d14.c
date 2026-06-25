/* CAMPAIGN-PREP candidate for func_02295d14 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield re-read guards (1-bit0) + tail call
 *   risk:       Tail call self->bit0 re-reads + 021bae7c return-0 polarity proven; struct +2/bit0 offset assumed
 *   confidence: high
 */
/* func_ov002_02295d14: two 021bae7c(1-bit0,code,-1) guards then tail-call
 * 02291248(self,arg1). Mirror of func_ov002_021ca698's guard idiom and
 * func_ov002_02200650's re-read-self->bit0 shape. */
typedef unsigned short u16;

struct S02295d14 {
    u16 f0;
    u16 bit0 : 1;
};

extern int func_ov002_021bae7c(int player, int code, int arg);
extern int func_ov002_02291248(struct S02295d14 *self, int arg1);

int func_ov002_02295d14(struct S02295d14 *self, int arg1) {
    if (func_ov002_021bae7c(1 - self->bit0, 0x1614, -1) != 0)
        return 0;
    if (func_ov002_021bae7c(1 - self->bit0, 0x17c2, -1) != 0)
        return 0;
    return func_ov002_02291248(self, arg1);
}
