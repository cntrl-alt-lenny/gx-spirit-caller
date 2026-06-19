/* func_02031e3c: IRQ-bracketed u16 getter at obj[0x28].
 *
 *     stmdb sp!, {r4, lr}
 *     mov   r4, r0                    ; cache obj
 *     bl    OS_DisableIrq              ; r0 = saved (kept in r0)
 *     ldrh  r4, [r4, #0x28]           ; r4 reused: was obj, now u16 value
 *     bl    OS_RestoreIrq              ; r0 still has saved
 *     mov   r0, r4                    ; return = u16 value
 *     ldmia sp!, {r4, pc}
 *
 * 7 ARM instructions, 0x1c bytes.
 *
 * Two register-reuse tricks to match baserom:
 *   - r0 holds saved mask from OS_DisableIrq through to OS_RestoreIrq
 *     (str doesn't clobber r0, but the ldrh would — unless the ldrh
 *     target is r4 not r0)
 *   - r4 is reused for obj initially then u16 value (since obj is
 *     only needed once for the ldrh)
 */

extern int  OS_DisableIrq(void);
extern void OS_RestoreIrq(int mask);

unsigned short func_02031e3c(void *obj) {
    int saved = OS_DisableIrq();
    unsigned short v = *(unsigned short *)((char *)obj + 0x28);
    OS_RestoreIrq(saved);
    return v;
}
