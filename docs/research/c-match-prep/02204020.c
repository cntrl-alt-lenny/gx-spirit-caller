/* CAMPAIGN-PREP candidate for func_02204020 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0 (lsl;lsr) + tail-call sink
 *   risk:       sink arity guessed 3; r3 left live may mean a 4th forwarded arg
 *   confidence: med
 */
/* func_ov002_02204020: bit0(self+2) -> list/command sink tail-call.
 *   ldrh r0,[r0,#2]; lsl#31; lsr#31   (bit0 of u16@+2 = b0)
 *   mov r1,#0xb; mov r2,#0x14c0; bx func_ov002_021b4098
 */
typedef unsigned short u16;
struct Ov002Self { u16 f0; u16 b0 : 1; };
extern int func_ov002_021b4098(int player, int kind, int tag);

int func_ov002_02204020(struct Ov002Self *self) {
    return func_ov002_021b4098(self->b0, 0xb, 0x14c0);
}
