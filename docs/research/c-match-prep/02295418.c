/* CAMPAIGN-PREP candidate for func_02295418 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0, pooled const arg, frameless tail-call thunk (bx ip)
 *   risk:       minimal; only that mwcc emits bx-ip thunk (no frame) for the 2-arg tail call
 *   confidence: high
 */
/* func_ov002_02295418: frameless tail-call thunk. self->b0 + pooled 0x15a3.
 *
 *     ldrh r0,[r0,#2]; ldr ip,=func_02281994; ldr r1,=0x15a3
 *     lsl#31; lsr#31; bx ip            -> return func_02281994(self->b0, 0x15a3)
 */

typedef unsigned short u16;

struct FuncOv00202295418Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_02281994(unsigned int b0, int k);

int func_ov002_02295418(struct FuncOv00202295418Self *self) {
    return func_ov002_02281994(self->b0, 0x15a3);
}
