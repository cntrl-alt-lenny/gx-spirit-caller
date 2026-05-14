/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/FX.c
 *   function: FX_Init
 *   target:   OS_DefaultIrqHandler (0x02090570, size 0x4)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

void OS_DefaultIrqHandler() {
    return;
}
