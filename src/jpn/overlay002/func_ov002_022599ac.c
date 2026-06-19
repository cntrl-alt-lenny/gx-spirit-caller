/* func_ov002_022599ac: family d1b39ebf — stash two args into a global
 * block, kick a helper with (1, 1, 0), return 1.
 *
 *     push  {r3, lr}
 *     ldr   r1, .L_02259abc      ; .word data_ov002_022d008c
 *     str   r0, [r1, #0xd70]
 *     mov   r0, #0x1
 *     str   r2, [r1, #0xd60]
 *     mov   r1, r0               ; r1 = 1
 *     mov   r2, #0x0
 *     bl    func_ov002_02271988  ; (1, 1, 0)
 *     mov   r0, #0x1
 *     pop   {r3, pc}
 */

extern char data_ov002_022d008c[];
extern void func_ov002_02271988(int a, int b, int c);

int func_ov002_022599ac(int a, int b, int c) {
    *(int *)(data_ov002_022d008c + 0xd70) = a;
    *(int *)(data_ov002_022d008c + 0xd60) = c;
    func_ov002_02271988(1, 1, 0);
    return 1;
}
