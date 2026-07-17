/* func_01ff86c4: ITCM DMA channel programmer — set SAD/DAD/CNT, no IRQ mask.
 * Sibling of func_01ff8770 (same address-view-split idiom, brief 201/221
 * C-23); this one skips the OS_DisableIrq/OS_RestoreIrq wrap. */

void func_01ff86c4(int ch, int sad, int dad, int ctrl) {
    *(volatile int *)(0x04000000 + ch * 12 + 0xb0) = sad;
    {
        volatile int *dma_base = (volatile int *)0x040000b0;
        *(volatile int *)((char *)dma_base + ch * 12 + 4) = dad;
        *(volatile int *)((char *)dma_base + ch * 12 + 8) = ctrl;
    }
}
