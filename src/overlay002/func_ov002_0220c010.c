/* func_ov002_0220c010: brief 236 C-39e — arg1-only variant (self unused).
 *
 * Orig (60 B):
 *   push {r4, lr}              ; only r4 saved (no r5 → self not preserved)
 *   movs r4, r1                ; r4 = arg1, flags
 *   moveq r0, #0
 *   popeq {r4, pc}             ; if arg1 == 0, return 0
 *   ldrh r0, [r4]              ; r0 = arg1->f0
 *   bl func_0202b878
 *   cmp r0, #23
 *   movne r0, #0
 *   popne {r4, pc}             ; if helper != 23, return 0
 *   mov r0, r4
 *   bl func_ov002_021b6600     ; helper2(arg1)
 *   cmp r0, #0
 *   movne r0, #1
 *   moveq r0, #0
 *   pop {r4, pc}
 *
 * Variant of C-39e where self isn't used past the null-check entry —
 * mwcc doesn't save r5 because no use after r0 gets overwritten by arg1->f0.
 */

struct F0220c010_Arg {
    unsigned short f0;
};

extern int func_0202b878(unsigned short f0);
extern int func_ov002_021b6600(struct F0220c010_Arg *arg1);

int func_ov002_0220c010(int self_unused, struct F0220c010_Arg *arg1) {
    (void)self_unused;
    if (arg1 == 0) return 0;
    if (func_0202b878(arg1->f0) != 23) return 0;
    return func_ov002_021b6600(arg1) != 0;
}
