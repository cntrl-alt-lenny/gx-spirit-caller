/* func_02093cd4: DMA channel `ch` synchronous wait + zero-init (ch == 0).
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0                      ; r4 = ch
 *     bl    OS_DisableIrq
 *     mov   r1, #0x3
 *     mul   r2, r4, r1                  ; r2 = ch * 3       (word offset)
 *     ldr   r1, .L_DMA_BASE             ; r1 = 0x040000b0
 *     add   r2, r2, #0x2                ; r2 = ch*3 + 2
 *     add   r2, r1, r2, lsl #0x2        ; r2 = base + (ch*3+2)*4 = &DMAxCNT
 *   .L_wait:
 *     ldr   r1, [r2, #0x0]
 *     ands  r1, r1, #0x80000000
 *     bne   .L_wait
 *     cmp   r4, #0x0
 *     bne   .L_done
 *     mov   r1, #0xc
 *     mul   ip, r4, r1                  ; ip = ch * 12
 *     ldr   r1, .L_DMA_BASE             ; r1 = 0x040000b0  ← DUPLICATE pool
 *     add   r2, ip, #0x4000000          ; r2 = ip + 0x04000000
 *     mov   r3, #0x0
 *     str   r3, [r2, #0xb0]             ; *DMAxSAD = 0
 *     add   r2, ip, r1                  ; r2 = ip + 0x040000b0
 *     ldr   r1, .L_DMA_CTRL_VAL
 *     str   r3, [r2, #0x4]              ; *DMAxDAD = 0
 *     str   r1, [r2, #0x8]              ; *DMAxCNT = 0x81400001
 *   .L_done:
 *     bl    OS_RestoreIrq
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *
 * **Variable-index C-23 extension — `&base[expr]` forces pool load.**
 * The brief 199 recipe (`volatile int *block; block[CONST_INDEX]`)
 * works for constant-index MMIO. For VARIABLE-index access
 * (`block[ch * 3 + 2]`), mwcc 1.2/sp2p3 will constant-fold and inline
 * the base as `add rN, rN, #0x04000000; ldr [rN, #0xb0]` — losing the
 * pool entry.
 *
 * The brief 203 extension: use `volatile int *dma_ctrl = &dma_base[expr];`
 * (explicit address-of of an array element) — mwcc treats this as a
 * REAL pointer computation that needs the base in a register, so the
 * base is loaded from the pool. Mirror for stores: use byte-offset
 * pointer arithmetic `*(volatile int *)((char *)dma_base + ch*12 + N)`
 * for offsets where the pool-loaded base should be reused.
 *
 * **First write uses different base (`0x04000000`)** — the DMAxSAD
 * register is written via `add r2, ip, #0x04000000; str [r2, #0xb0]`
 * because the source uses the explicit I/O-register-base form
 * `(volatile int *)(0x04000000 + ch * 12 + 0xb0)`. The remaining two
 * writes use the DMA-base form `(char *)dma_base + ch*12 + N` for
 * offsets 4 and 8. This split mirrors the orig disasm exactly.
 *
 * **Style A epilogue.** Orig uses `pop {r4, lr}; bx lr` (separate
 * `bx lr` after the pop). Routing as `.legacy.c` (mwcc 1.2/sp2p3)
 * gives this shape.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

void func_02093cd4(int ch) {
    int mask = OS_DisableIrq();
    {
        volatile int *dma_base = (volatile int *)0x040000b0;
        volatile int *dma_ctrl = &dma_base[ch * 3 + 2];
        while (*dma_ctrl & 0x80000000) {
            /* spin */
        }
    }
    if (ch == 0) {
        *(volatile int *)(0x04000000 + ch * 12 + 0xb0) = 0;
        {
            volatile int *dma_base = (volatile int *)0x040000b0;
            *(volatile int *)((char *)dma_base + ch * 12 + 4) = 0;
            *(volatile int *)((char *)dma_base + ch * 12 + 8) = 0x81400001;
        }
    }
    OS_RestoreIrq(mask);
}
