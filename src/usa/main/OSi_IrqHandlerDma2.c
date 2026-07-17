/* OSi_IrqHandlerDma2: NitroSDK IRQ-handler thunk — posts IRQ event `2` via
 * OSi_PostIrqEvent (still func_020903ec in this region's symbols.txt).
 * Ported from src/main/OSi_IrqHandlerDma2.c (EUR) — pure register-args thunk,
 * no region-shifted data. */

extern void func_020903ec(int event);

void OSi_IrqHandlerDma2(void) {
    func_020903ec(2);
}
