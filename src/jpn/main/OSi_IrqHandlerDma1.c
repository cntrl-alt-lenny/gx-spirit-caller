/* OSi_IrqHandlerDma1: NitroSDK IRQ-handler thunk — posts IRQ event `1` via
 * OSi_PostIrqEvent (still OSi_PostIrqEvent in this region's symbols.txt).
 * Ported from src/main/OSi_IrqHandlerDma1.c (EUR) — pure register-args thunk,
 * no region-shifted data. */

extern void OSi_PostIrqEvent(int event);

void OSi_IrqHandlerDma1(void) {
    OSi_PostIrqEvent(1);
}
