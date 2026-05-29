/* func_ov002_022928d8: C-39 — guard on helper1(1 - bit0); else tail
 * helper2(self, arg). (family 44c0a)
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0 ; ldrh r0, [r5, #0x2] ; mov r4, r1
 *     lsl   r0, r0, #0x1f ; lsr r0, r0, #0x1f ; rsb r0, r0, #0x1   ; 1 - bit0
 *     bl    func_ov002_021bcf00
 *     cmp   r0, #0x0 ; moveq r0, #0x0 ; popeq {r3, r4, r5, pc}
 *     mov   r0, r5 ; mov r1, r4 ; bl func_ov002_02292754
 *     pop   {r3, r4, r5, pc}
 */

typedef unsigned short u16;

struct S022928d8 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern int func_ov002_021bcf00(int x);
extern int func_ov002_02292754(struct S022928d8 *self, int arg);

int func_ov002_022928d8(struct S022928d8 *self, int arg) {
    if (func_ov002_021bcf00(1 - self->bit0) == 0) return 0;
    return func_ov002_02292754(self, arg);
}
