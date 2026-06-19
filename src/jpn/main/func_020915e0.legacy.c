/* func_020915e0: IRQ-bracketed saturating-pre-increment counter.
 * Returns pre-increment value; on saturation (UINT_MAX) the
 * register holding `prev` is never written, so caller observes
 * a stale value. The asm is the canonical W-A / C-9 shape from
 * brief 040's wall page.
 *
 *     stmdb sp!, {r4, lr}
 *     bl    OS_DisableIrq
 *     ldr   r2, .L_020916fc
 *     mvn   r1, #0x0                 ; r1 = UINT_MAX cap
 *     ldr   r3, [r2, #0x0]
 *     cmp   r3, r1
 *     addlo r1, r3, #0x1              ; predicated body, 3 ops
 *     movlo r4, r3
 *     strlo r1, [r2, #0x0]
 *     bl    OS_RestoreIrq
 *     mov   r0, r4
 *     ldmia sp!, {r4, lr}
 *     bx    lr
 *  .L_020916fc: .word data_021a62dc
 *
 * **C-9 coercion (codegen-walls.md):** declare `prev`
 * UNINITIALISED. With `prev = 0;` mwcc 1.2/sp2p3 inserts a
 * spurious `mov r4, #0` (4 bytes over). The uninitialised form
 * relies on -w off to silence the warning.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);
extern unsigned int data_021a62dc;

unsigned int func_020915e0(void) {
    unsigned int prev;          /* leave UNINITIALISED — C-9 trick */
    int saved = OS_DisableIrq();
    unsigned int v = data_021a62dc;
    if (v < 0xffffffffu) {
        prev = v;
        data_021a62dc = v + 1;
    }
    OS_RestoreIrq(saved);
    return prev;
}
