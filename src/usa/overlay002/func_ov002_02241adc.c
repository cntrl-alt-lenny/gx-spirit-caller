/* func_ov002_02241adc: switch-on-ldrh dispatch.
 *
 *     push  {r3, lr}
 *     ldrh  r2, [r0, #12]
 *     cmp   r2, #1
 *     beq   .case1
 *     cmp   r2, #2
 *     beq   .case2
 *     b     .default
 *   .case1: bl helper; pop
 *   .case2: mov r0, #1; pop
 *   .default: mov r0, #1; pop
 *
 * Brief 244 pattern 7. Recipe: gotcha 7 — 2-arg function makes
 * r1 live for the helper call, forcing the switch temp to r2.
 */
struct FuncOv00202241bc4Self { char pad[12]; unsigned short f12; };

extern int func_ov002_0223f59c(struct FuncOv00202241bc4Self *self, int arg);

int func_ov002_02241adc(struct FuncOv00202241bc4Self *self, int arg) {
    switch (self->f12) {
    case 1: return func_ov002_0223f59c(self, arg);
    case 2: return 1;
    default: return 1;
    }
}
