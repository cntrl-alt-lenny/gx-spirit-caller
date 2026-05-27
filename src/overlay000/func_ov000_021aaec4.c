/* func_ov000_021aaec4: C-42 — multi-call thunk with field load + zero-write.
 *
 * Orig shape (32 B, 8 ARM insns):
 *
 *     push  {r4, lr}
 *     mov   r4, r0                    ; save self
 *     bl    func_ov000_021aaeb8       ; helper1(self)
 *     ldr   r0, [r4, #80]             ; r0 = self->field50
 *     bl    func_ov000_021b3810_unk   ; helper2(self->field50)
 *     mov   r0, #0
 *     str   r0, [r4, #80]             ; self->field50 = 0
 *     pop   {r4, pc}
 *
 * Brief 237 C-42 — multi-call thunk with struct-field operations.
 * See `func_ov002_021b0c34.c` for the recipe rationale.
 */

struct Func021aaec4Self {
    int pad[20];     /* offsets 0..76 */
    int field50;     /* offset 80 */
};

extern int func_ov000_021aaeb8(struct Func021aaec4Self *self);
extern int func_ov000_021b3810_unk(int x);

void func_ov000_021aaec4(struct Func021aaec4Self *self) {
    func_ov000_021aaeb8(self);
    func_ov000_021b3810_unk(self->field50);
    self->field50 = 0;
}
