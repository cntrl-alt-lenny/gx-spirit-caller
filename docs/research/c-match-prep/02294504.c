/* CAMPAIGN-PREP candidate for func_02294504 (ov002, class A) — brief 494.
 * UNVERIFIED: built-free swarm draft. The campaign drops this into src/,
 * runs ninja + objdiff, and tweaks per the risk note if <100%.
 *   recipe:     bitfield bit0, fn-ptr pooled arg, sign-guard >=0, shared-epilogue nested if, value-map !=0
 *   risk:       final !=0 may predicate vs branch; func_0228c864 arg order/types guessed; movs-vs-cmp on sign test
 *   confidence: med
 */
/* func_ov002_02294504: query -> sign-guard (>=0) -> bool of fn(b0).
 * 3rd arg to func_0228c864 is the ADDRESS of func_021bd5f4 (pool literal).
 * Both ret-0 paths share .L_d4 -> inverted-polarity nested if.
 *
 *     bl func_022576d8(self)
 *     ldrh; lsl#31;lsr#31 -> b0 ; ldr r2,=func_021bd5f4
 *     bl func_0228c864(b0, prev, &func_021bd5f4)
 *     movs r1,r0; bmi .L_d4                 -> if(<0) return 0
 *     ldrh; b0 ; bl func_021bd5f4(b0); cmp#0; movne#1; popne
 *  .L_d4: mov r0,#0; pop
 */

typedef unsigned short u16;

struct FuncOv00202294504Self { u16 f0; u16 b0 : 1; };

extern int func_ov002_021bd5f4(unsigned int b0);
extern int func_ov002_022576d8(struct FuncOv00202294504Self *self);
extern int func_ov002_0228c864(unsigned int b0, int prev, int (*fn)(unsigned int));

int func_ov002_02294504(struct FuncOv00202294504Self *self) {
    if (func_ov002_0228c864(self->b0, func_ov002_022576d8(self), func_ov002_021bd5f4) >= 0) {
        if (func_ov002_021bd5f4(self->b0) != 0) return 1;
    }
    return 0;
}
