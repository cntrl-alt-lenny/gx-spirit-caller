/* func_ov002_0228ab68: brief 236 C-39e — canonical with helper != 22 check.
 *
 * Orig (56 B):
 *   push {r3, r4, r5, lr}
 *   movs r4, r1                ; r4 = arg1, set flags
 *   mov  r5, r0                ; r5 = self
 *   moveq r0, #0
 *   popeq {r3, r4, r5, pc}     ; if arg1 == 0, return 0
 *   ldrh r0, [r4]              ; r0 = arg1->f0
 *   bl func_0202b878
 *   cmp r0, #22
 *   movne r0, #0
 *   popne {r3, r4, r5, pc}     ; if helper != 22, return 0
 *   mov r0, r5
 *   mov r1, r4
 *   bl func_ov002_0228a974     ; tail-call helper2(self, arg1)
 *   pop {r3, r4, r5, pc}
 *
 * Canonical C-39e with `!= K` intermediate check (K=22 here).
 */

struct F0228ab68_Self {
    unsigned short pad0;
};

struct F0228ab68_Arg {
    unsigned short f0;
};

extern int func_0202b878(unsigned short f0);
extern int func_ov002_0228a974(struct F0228ab68_Self *self, struct F0228ab68_Arg *arg1);

int func_ov002_0228ab68(struct F0228ab68_Self *self, struct F0228ab68_Arg *arg1) {
    if (arg1 == 0) return 0;
    if (func_0202b878(arg1->f0) != 22) return 0;
    return func_ov002_0228a974(self, arg1);
}
