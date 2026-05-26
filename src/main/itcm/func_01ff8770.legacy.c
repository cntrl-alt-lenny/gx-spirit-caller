/* func_01ff8770: ITCM DMA channel programmer — set SAD/DAD/CNT.
 *
 *     stmdb sp!, {r4, r5, r6, r7, lr}
 *     sub   sp, sp, #0x4
 *     mov   r7, r0                      ; r7 = ch
 *     mov   r6, r1                      ; r6 = sad
 *     mov   r5, r2                      ; r5 = dad
 *     mov   r4, r3                      ; r4 = ctrl
 *     bl    OS_DisableIrq
 *     mov   r1, #0xc
 *     mul   r3, r7, r1                  ; r3 = ch*12
 *     ldr   r1, .L_DMA_BASE             ; r1 = 0x040000b0
 *     add   r2, r3, #0x4000000          ; r2 = ch*12 + 0x04000000
 *     str   r6, [r2, #0xb0]             ; *(0x040000b0 + ch*12) = sad
 *     add   r1, r3, r1                  ; r1 = ch*12 + 0x040000b0
 *     str   r5, [r1, #0x4]              ; *DMAxDAD = dad
 *     str   r4, [r1, #0x8]              ; *DMAxCNT = ctrl
 *     bl    OS_RestoreIrq
 *     add   sp, sp, #0x4
 *     ldmia sp!, {r4, r5, r6, r7, lr}
 *     bx    lr
 *
 * Brief 201 / 221 C-23 + StyleA composite: explicit char-arithmetic
 * + `volatile int *dma_base` keeps the two pool views of 0x040000b0
 * separate (one via imm-form `add #0x04000000`, one via pool-loaded
 * `r1 = 0x040000b0`). `.legacy.c` -> mwcc 1.2/sp2p3 emits the
 * StyleA epilogue.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

void func_01ff8770(int ch, int sad, int dad, int ctrl) {
    int mask = OS_DisableIrq();
    *(volatile int *)(0x04000000 + ch * 12 + 0xb0) = sad;
    {
        volatile int *dma_base = (volatile int *)0x040000b0;
        *(volatile int *)((char *)dma_base + ch * 12 + 4) = dad;
        *(volatile int *)((char *)dma_base + ch * 12 + 8) = ctrl;
    }
    OS_RestoreIrq(mask);
}
