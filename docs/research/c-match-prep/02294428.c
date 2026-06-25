/* CAMPAIGN-PREP candidate for func_02294428 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0, rsb 1-b0, signed guard, stack-arg 5-arg call, tail call
 *   risk:       mwcc may build -1 via mvn not sub-from-1; stack-arg slot ordering; f022943c4 arity guessed (2-arg pass-through)
 *   confidence: med
 */
/* func_ov002_02294428: bit0-derived 5-arg query, signed guard `< 0x9c4`,
 * then 2-arg tail call. self->b0 is bit0 of the u16 at +2 (lsl#31;lsr#31).
 *
 *     ldrh r0,[r5,#2]; lsl#31; lsr#31      -> self->b0
 *     rsb r1,r0,#1                          -> 1 - b0
 *     sub r2,r3(=1),#2 ; str r3(=1),[sp]    -> args (-1, 1, stack 1)
 *     bl func_02280b74 ; cmp r0,#0x9c4; movlt#0; poplt  -> if(<0x9c4) return 0
 *     mov r0,r5; mov r1,r4; bl func_022943c4; pop          -> tail call
 */

typedef unsigned short u16;

struct FuncOv00202294428Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_02280b74(unsigned int a, unsigned int b, int c, int d, int e);
extern int func_ov002_022943c4(struct FuncOv00202294428Self *self, int arg);

int func_ov002_02294428(struct FuncOv00202294428Self *self, int arg) {
    if (func_ov002_02280b74(self->b0, 1 - self->b0, -1, 1, 1) < 0x9c4) return 0;
    return func_ov002_022943c4(self, arg);
}
