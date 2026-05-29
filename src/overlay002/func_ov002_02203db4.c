/* func_ov002_02203db4: C-39 — guard on helper1(bit0, &func_0202e79c);
 * else tail helper2(self, arg). The pool word is a function pointer.
 * (family 86235)
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0 ; ldrh r0, [r5, #0x2] ; mov r4, r1
 *     ldr   r1, .L_02203df0      ; .word func_0202e79c
 *     lsl   r0, r0, #0x1f ; lsr r0, r0, #0x1f   ; bit0
 *     bl    func_ov002_021bc000
 *     cmp r0, #0x0 ; moveq r0, #0x0 ; popeq {r3, r4, r5, pc}
 *     mov r0, r5 ; mov r1, r4 ; bl func_ov002_022016bc
 *     pop   {r3, r4, r5, pc}
 */

typedef unsigned short u16;

struct S02203db4 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern void func_0202e79c(void);
extern int func_ov002_021bc000(int bit, void *fn);
extern int func_ov002_022016bc(struct S02203db4 *self, int arg);

int func_ov002_02203db4(struct S02203db4 *self, int arg) {
    if (func_ov002_021bc000(self->bit0, (void *)func_0202e79c) == 0) return 0;
    return func_ov002_022016bc(self, arg);
}
