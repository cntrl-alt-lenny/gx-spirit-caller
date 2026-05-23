/* B-18 stub for brief 198 permuter wave — ITCM DMA channel setup.
 *
 *     push  {r4, r5, r6, r7, lr}
 *     sub   sp, sp, #4
 *     mov   r7, r0; mov r6, r1; mov r5, r2; mov r4, r3
 *     bl    OS_DisableIrq
 *     mov   r1, #12
 *     mul   r3, r7, r1                ; r3 = channel * 12
 *     ldr   r1, =0x040000b0
 *     add   r2, r3, #0x04000000
 *     str   r6, [r2, #0xb0]
 *     add   r1, r3, r1
 *     str   r5, [r1, #0x4]
 *     str   r4, [r1, #0x8]
 *     bl    OS_RestoreIrq
 *     ...
 */

extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int irq);

void func_01ff8770(int channel, unsigned int src, unsigned int dst, unsigned int ctrl) {
    int irq = OS_DisableIrq();
    int off = channel * 12;
    *(volatile unsigned int *)(off + 0x040000b0) = src;
    *(volatile unsigned int *)(off + 0x040000b4) = dst;
    *(volatile unsigned int *)(off + 0x040000b8) = ctrl;
    OS_RestoreIrq(irq);
}
