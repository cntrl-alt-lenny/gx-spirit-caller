/* OSi_IrqHandlerTimer2: NitroSDK IRQ-handler thunk — posts IRQ event `6` via
 * OSi_PostIrqEvent (still func_020903ec in this region's symbols.txt).
 * Ported from src/main/OSi_IrqHandlerTimer2.c (EUR) — pure register-args thunk,
 * no region-shifted data. */

extern void func_020903ec(int event);

void OSi_IrqHandlerTimer2(void) {
    func_020903ec(6);
}
