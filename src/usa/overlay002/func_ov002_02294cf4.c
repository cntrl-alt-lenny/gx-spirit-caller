/* func_ov002_02294cf4: family 44c0a sibling of 022928d8 — helpers
 * func_021bbf50 / func_02291214.
 *
 *     push  {r3, r4, r5, lr}
 *     mov   r5, r0 ; ldrh r0, [r5, #0x2] ; mov r4, r1
 *     lsl r0, r0, #0x1f ; lsr r0, r0, #0x1f ; rsb r0, r0, #0x1
 *     bl    func_ov002_021bbe70
 *     cmp r0, #0x0 ; moveq r0, #0x0 ; popeq {r3, r4, r5, pc}
 *     mov r0, r5 ; mov r1, r4 ; bl func_ov002_02291104
 *     pop   {r3, r4, r5, pc}
 */

typedef unsigned short u16;

struct S02294e04 {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
};

extern int func_ov002_021bbe70(int x);
extern int func_ov002_02291104(struct S02294e04 *self, int arg);

int func_ov002_02294cf4(struct S02294e04 *self, int arg) {
    if (func_ov002_021bbe70(1 - self->bit0) == 0) return 0;
    return func_ov002_02291104(self, arg);
}
