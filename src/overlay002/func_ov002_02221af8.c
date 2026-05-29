/* func_ov002_02221af8: C-39 bit-extract, self passed LAST so the temp
 * register frees up (gotcha 7 — `mov r3, r0` to free r0 for bit0).
 * helper(bit0, 0xb, &func_02221ab8, self); return 0. The pool word is a
 * FUNCTION pointer, not data.
 *
 *     push  {r3, lr}
 *     mov   r3, r0
 *     ldrh  r0, [r3, #0x2]
 *     ldr   r2, .L_02221b20      ; .word func_ov002_02221ab8
 *     mov   r1, #0xb
 *     lsl   r0, r0, #0x1f
 *     lsr   r0, r0, #0x1f        ; bit0
 *     bl    func_ov002_021b42e4
 *     mov   r0, #0x0
 *     pop   {r3, pc}
 */

typedef unsigned short u16;

struct S02221af8 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern void func_ov002_02221ab8(void);
extern void func_ov002_021b42e4(int a, int b, void *fn, struct S02221af8 *self);

int func_ov002_02221af8(struct S02221af8 *self) {
    func_ov002_021b42e4(self->bit0, 0xb, (void *)func_ov002_02221ab8, self);
    return 0;
}
