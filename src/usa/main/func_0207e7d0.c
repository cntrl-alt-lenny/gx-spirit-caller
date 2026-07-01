/* CAMPAIGN-PREP candidate for func_0207e7d0 (main, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     INIT: tail-cached base, sub-init call, ordered constant field stores
 *   risk:       sub[] offset 0x1c must equal real struct; store order/constant reuse depends on mwcc keeping the literal-0 in one reg
 *   confidence: high
 */
/* func_0207e7d0: sub-init call then eight constant field stores.
 *
 *   stmdb sp!, {r4, lr}
 *   mov  r4, r0
 *   add  r0, r4, #0x1c
 *   bl   func_0207e7b8      ; init &self->sub
 *   mov  r1, #0x0           ; shared zero reused
 *   str  r1, [r4]           ; f0  = 0
 *   str  r1, [r4, #0x4]     ; f4  = 0
 *   mov  r0, #0x1
 *   str  r0, [r4, #0x8]     ; f8  = 1
 *   str  r1, [r4, #0xc]     ; fc  = 0
 *   mov  r0, #0x1000
 *   str  r0, [r4, #0x10]    ; f10 = 0x1000
 *   str  r1, [r4, #0x14]    ; f14 = 0
 *   str  r1, [r4, #0x18]    ; f18 = 0
 *   ldmia sp!, {r4, pc}
 *
 * Field stores in exact asm order (STORE-ORDER); the shared #0 in r1
 * comes from writing the zero fields with literal 0.
 */

typedef struct {
    int  f0;    /* +0x0 */
    int  f4;    /* +0x4 */
    int  f8;    /* +0x8 */
    int  fc;    /* +0xc */
    int  f10;   /* +0x10 */
    int  f14;   /* +0x14 */
    int  f18;   /* +0x18 */
    char sub[4];/* +0x1c sub-object passed to func_0207e7b8 */
} S0207e8b8;

extern void func_0207e7b8(void *p);

void func_0207e7d0(S0207e8b8 *self) {
    func_0207e7b8(&self->sub);
    self->f0  = 0;
    self->f4  = 0;
    self->f8  = 1;
    self->fc  = 0;
    self->f10 = 0x1000;
    self->f14 = 0;
    self->f18 = 0;
}
