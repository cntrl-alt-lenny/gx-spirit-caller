/* func_ov002_02242e30: switch-dispatch on u16 field.
 *
 *     push  {r3, lr}
 *     ldrh  r2, [r0, #12]
 *     cmp   r2, #2
 *     bne   .L_else
 *     bl    helper
 *     pop   {r3, pc}
 *   .L_else:
 *     mov   r0, #1
 *     pop   {r3, pc}
 *
 * Brief 241 C-42 sub-shape (cmp-dispatch, hard branch). Recipe gotcha:
 * `if (cond == 2) return h(); return 1;` collapses to `movne/popne`
 * (conditional-exec, 7 insns). Switch+case+default form forces the
 * full `bne` branch — 8 insns matching orig.
 */
struct FuncOv00202242e30Self {
    char pad[12];
    unsigned short f12;
};

extern int func_ov002_0223f684(struct FuncOv00202242e30Self *self, int arg);

int func_ov002_02242e30(struct FuncOv00202242e30Self *self, int arg) {
    switch (self->f12) {
    case 2:
        return func_ov002_0223f684(self, arg);
    default:
        return 1;
    }
}
