/* func_ov002_02259ac0: family d1b39ebf sibling of 02259a94 — identical
 * shape, same global block.
 *
 *     push  {r3, lr}
 *     ldr   r1, .L_02259ae8      ; .word data_ov002_022d016c
 *     str   r0, [r1, #0xd70]
 *     mov   r0, #0x1
 *     str   r2, [r1, #0xd60]
 *     mov   r1, r0               ; r1 = 1
 *     mov   r2, #0x0
 *     bl    func_ov002_02271a78  ; (1, 1, 0)
 *     mov   r0, #0x1
 *     pop   {r3, pc}
 */

extern char data_ov002_022d016c[];
extern void func_ov002_02271a78(int a, int b, int c);

int func_ov002_02259ac0(int a, int b, int c) {
    *(int *)(data_ov002_022d016c + 0xd70) = a;
    *(int *)(data_ov002_022d016c + 0xd60) = c;
    func_ov002_02271a78(1, 1, 0);
    return 1;
}
