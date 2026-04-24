/* Task_InvokeLocked: second non-trivial hard-tier narrative beat —
 * NULL-checked entry point that takes a lock (disables IRQs),
 * dispatches to a worker through a global state slot, and releases
 * the lock on return.
 *
 * Disassembly (build/eur/asm/_dsd_gap@main_*.s):
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     movs  r5, r0                        ; r5 = p; set flags
 *     ldmeqia sp!, {r3, r4, r5, pc}       ; p == NULL -> return
 *     ldr   r0, .L_020068b0                ; r0 = &data_02104f1c
 *     ldr   r1, [r0, #0x18]
 *     sub   r1, r1, #0x1
 *     str   r1, [r0, #0x18]                ; data_02104f1c._0x18--
 *     bl    OS_DisableIrq                  ; saved = disable_irqs()
 *     ldr   r1, .L_020068b0                ; reload data_02104f1c
 *     mov   r4, r0                         ; cache saved IRQ mask
 *     ldr   r0, [r1, #0x1c]                ; arg0 = data_02104f1c._0x1c
 *     mov   r1, r5                         ; arg1 = p
 *     bl    func_0207d458                  ; worker(_0x1c, p)
 *     mov   r0, r4
 *     bl    OS_RestoreIrq                  ; restore_irqs(saved)
 *     ldmia sp!, {r3, r4, r5, pc}
 *   .L_020068b0: .word data_02104f1c
 *
 * 16 ARM instructions + 1 pool word, 0x44 bytes.
 *
 * Control flow:
 *   - Early return if p is null (`movs` sets flags in place of a
 *     separate `cmp` + `b`; the `ldmeqia` merges the conditional
 *     return).
 *   - Decrements a counter field at offset 0x18.
 *   - OS_DisableIrq is the NDS "disable IRQs, return previous mask"
 *     primitive (writes CPSR.I bit 7). Paired with OS_RestoreIrq
 *     which restores the saved mask — classic enter/exit critical
 *     section pair.
 *   - Between the IRQ bracket, dispatches to func_0207d458 with the
 *     stored "handler" pointer from state offset 0x1c and the
 *     caller's p.
 *
 * The `ldr r1, .L_...` reload after the `bl OS_DisableIrq` is mwcc's
 * standard reload pattern — OS_DisableIrq may clobber r0..r3, so the
 * data pointer needs to be rematerialized. r5 (p) is callee-saved,
 * so that survives.
 */

typedef struct {
    char     _pad_00[0x18];
    int      counter;         /* +0x18 — decremented per call */
    void    *handler_ctx;     /* +0x1c — passed to worker */
} manager_t;

extern manager_t data_02104f1c;
extern int  OS_DisableIrq(void);            /* enter critical section */
extern void OS_RestoreIrq(int saved_mask);  /* exit critical section */
extern void func_0207d458(void *ctx, void *p);

void Task_InvokeLocked(void *p) {
    int saved;

    if (p == 0) return;

    data_02104f1c.counter--;
    saved = OS_DisableIrq();
    func_0207d458(data_02104f1c.handler_ctx, p);
    OS_RestoreIrq(saved);
}
