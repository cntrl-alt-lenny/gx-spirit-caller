/* OSi_IrqHandlerDma3: NitroSDK IRQ-handler thunk — posts IRQ event `3`
 * (= Dma3) to the kernel's pending-event queue via OSi_PostIrqEvent.
 *
 *     ldr ip, =OSi_PostIrqEvent
 *     mov r0, #3
 *     bx  ip
 *
 * 3 insns + 1 pool = 0x10 bytes. One of 8 sibling thunks for the
 * Timer0..3 / Dma0..3 IRQ vectors. Verified that mwcc-from-C emits
 * the indirect tail-call shape byte-identical to the baserom
 * (#217/#219).
 */

extern void OSi_PostIrqEvent(int event);

void OSi_IrqHandlerDma3(void) {
    OSi_PostIrqEvent(3);
}
