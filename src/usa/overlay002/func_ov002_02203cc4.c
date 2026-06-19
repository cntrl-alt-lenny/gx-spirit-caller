/* func_ov002_02203cc4: C-39 — guard on helper1(bit0, &func_0202e748);
 * else tail helper2(self, arg). The pool word is a function pointer.
 * (family 86235)
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0 ; ldrh r0, [r5, #0x2] ; mov r4, r1
 *     ldr   r1, .L_02203df0      ; .word func_0202e748
 *     lsl   r0, r0, #0x1f ; lsr r0, r0, #0x1f   ; bit0
 *     bl    func_ov002_021bbf20
 *     cmp r0, #0x0 ; moveq r0, #0x0 ; popeq {r3, r4, r5, pc}
 *     mov r0, r5 ; mov r1, r4 ; bl func_ov002_022015cc
 *     pop   {r3, r4, r5, pc}
 */

typedef unsigned short u16;

struct S02203db4 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern void func_0202e748(void);
extern int func_ov002_021bbf20(int bit, void *fn);
extern int func_ov002_022015cc(struct S02203db4 *self, int arg);

int func_ov002_02203cc4(struct S02203db4 *self, int arg) {
    if (func_ov002_021bbf20(self->bit0, (void *)func_0202e748) == 0) return 0;
    return func_ov002_022015cc(self, arg);
}
