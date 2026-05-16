/* func_02031864: C-27 pool-dup — init-loop with multiple helper calls.
 *
 *     push  {r4, r5, r6, lr}
 *     ldr   r0, .L_02031914       ; r0 = &data_0219acd8 (pool 1)
 *     ldr   r1, .L_02031918       ; r1 = 0x4f4
 *     ldr   r5, .L_0203191c       ; r5 = &data_0219acec
 *     bl    func_02034704
 *     ldr   r6, .L_02031920       ; r6 = &data_020fe37c
 *     mov   r4, #0x0
 * .L_020318d4:
 *     mov   r0, r5
 *     bl    func_02031850
 *     add   r0, r5, #0x30
 *     bl    func_02031850
 *     ldrb  r0, [r6], #0x1
 *     add   r4, r4, #0x1
 *     cmp   r4, #0xc
 *     str   r0, [r5, #0x60]
 *     add   r5, r5, #0x64
 *     blt   .L_020318d4
 *     ldr   r0, .L_02031924
 *     bl    func_02031850
 *     ldr   r0, .L_02031928       ; r0 = &data_0219acd8 (pool 2 — alias)
 *     mov   r1, #0x1
 *     str   r1, [r0, #0x4]
 *     pop   {r4, r5, r6, pc}
 * .L_02031914: .word data_0219acd8
 * .L_02031918: .word 0x4f4
 * .L_0203191c: .word data_0219acec
 * .L_02031920: .word data_020fe37c
 * .L_02031924: .word data_0219b19c
 * .L_02031928: .word data_0219acd8     <- duplicate
 */

extern void *data_0219acd8;
extern void *data_0219adb8_alias;
extern unsigned char data_0219acec[];
extern unsigned char data_020fe37c[];
extern void *data_0219b19c;
extern void func_02034704(void *p, unsigned int size);
extern void func_02031850(void *p);

void func_02031864(void) {
    int i;
    unsigned char *p5, *p6;
    p5 = data_0219acec;
    func_02034704(&data_0219acd8, 0x4f4);
    p6 = data_020fe37c;
    for (i = 0; i < 0xc; i++) {
        func_02031850(p5);
        func_02031850(p5 + 0x30);
        *(unsigned int *)(p5 + 0x60) = *p6++;
        p5 += 0x64;
    }
    func_02031850(&data_0219b19c);
    *(int *)((char *)&data_0219adb8_alias + 4) = 1;
}
