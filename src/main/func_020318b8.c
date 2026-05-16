/* func_020318b8: C-27 pool-dup — init-loop with multiple helper calls.
 *
 *     push  {r4, r5, r6, lr}
 *     ldr   r0, .L_02031914       ; r0 = &data_0219adb8 (pool 1)
 *     ldr   r1, .L_02031918       ; r1 = 0x4f4
 *     ldr   r5, .L_0203191c       ; r5 = &data_0219adcc
 *     bl    func_02034754
 *     ldr   r6, .L_02031920       ; r6 = &data_020fe45c
 *     mov   r4, #0x0
 * .L_020318d4:
 *     mov   r0, r5
 *     bl    func_020318a4
 *     add   r0, r5, #0x30
 *     bl    func_020318a4
 *     ldrb  r0, [r6], #0x1
 *     add   r4, r4, #0x1
 *     cmp   r4, #0xc
 *     str   r0, [r5, #0x60]
 *     add   r5, r5, #0x64
 *     blt   .L_020318d4
 *     ldr   r0, .L_02031924
 *     bl    func_020318a4
 *     ldr   r0, .L_02031928       ; r0 = &data_0219adb8 (pool 2 — alias)
 *     mov   r1, #0x1
 *     str   r1, [r0, #0x4]
 *     pop   {r4, r5, r6, pc}
 * .L_02031914: .word data_0219adb8
 * .L_02031918: .word 0x4f4
 * .L_0203191c: .word data_0219adcc
 * .L_02031920: .word data_020fe45c
 * .L_02031924: .word data_0219b27c
 * .L_02031928: .word data_0219adb8     <- duplicate
 */

extern void *data_0219adb8;
extern void *data_0219adb8_alias;
extern unsigned char data_0219adcc[];
extern unsigned char data_020fe45c[];
extern void *data_0219b27c;
extern void func_02034754(void *p, unsigned int size);
extern void func_020318a4(void *p);

void func_020318b8(void) {
    int i;
    unsigned char *p5, *p6;
    p5 = data_0219adcc;
    func_02034754(&data_0219adb8, 0x4f4);
    p6 = data_020fe45c;
    for (i = 0; i < 0xc; i++) {
        func_020318a4(p5);
        func_020318a4(p5 + 0x30);
        *(unsigned int *)(p5 + 0x60) = *p6++;
        p5 += 0x64;
    }
    func_020318a4(&data_0219b27c);
    *(int *)((char *)&data_0219adb8_alias + 4) = 1;
}
