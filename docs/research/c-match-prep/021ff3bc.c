/* CAMPAIGN-PREP candidate for func_021ff3bc (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     dual 1-bit bitfields (b0,b14) eor (b14 first), guard call, bool-return call
 *   risk:       single ldrh shared across both bitfields; eor operand order (b14^b0) picks dest reg; value-map of final call to 0/1
 *   confidence: med
 */
/* func_ov002_021ff3bc: x = self->f2.b14 ^ self->f2.b0; require
 * func_021ff2b8(self, x) != 0, then return func_021ca2b8(x) != 0.
 *   b0  = bit 0  of self->f2 (lsl#31;lsr#31)
 *   b14 = bit 14 of self->f2 (lsl#17;lsr#31)
 *   x   = b14 ^ b0   (eor first source = b14 -> write b14 first)
 * Both fields come from ONE ldrh (same container -> single load).
 */
typedef unsigned short u16;

struct Ov002Self021ff3bc {
    u16 f0;
    struct {
        u16 b0  : 1;
        u16 mid : 13;
        u16 b14 : 1;
        u16 top : 1;
    } f2;
};

extern int func_ov002_021ff2b8(struct Ov002Self021ff3bc *self, int x);
extern int func_ov002_021ca2b8(int x);

int func_ov002_021ff3bc(struct Ov002Self021ff3bc *self) {
    int x = self->f2.b14 ^ self->f2.b0;
    if (func_ov002_021ff2b8(self, x) == 0) return 0;
    return func_ov002_021ca2b8(x) != 0;
}
