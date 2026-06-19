/* func_02032f74: IRQ-bracketed u32 setter at obj[0xecc]. One of
 * 8 siblings at 0x02032f74..0x02033038.
 *
 *     stmdb sp!, {r3, r4, r5, lr}
 *     mov   r5, r0
 *     mov   r4, r1
 *     bl    OS_DisableIrq              ; r0 = saved mask
 *     str   r4, [r5, #0xecc]
 *     bl    OS_RestoreIrq              ; r0 still has saved (str doesn't clobber)
 *     ldmia sp!, {r3, r4, r5, pc}
 *
 * 7 ARM instructions, 0x1c bytes.
 *
 * The saved mask lives in r0 from OS_DisableIrq through the str to
 * OS_RestoreIrq — no intermediate `mov saved, r0` / `mov r0, saved`
 * shuffle. The C form `OS_RestoreIrq(OS_DisableIrq())` as bookending
 * a store doesn't work in standard C (sequence point ordering), but
 * `int saved = OS_DisableIrq(); store; OS_RestoreIrq(saved);` with
 * `saved` kept register-resident reproduces the byte pattern.
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

void func_02032f74(void *obj, int value) {
    int saved = OS_DisableIrq();
    *(int *)((char *)obj + 0xecc) = value;
    OS_RestoreIrq(saved);
}
