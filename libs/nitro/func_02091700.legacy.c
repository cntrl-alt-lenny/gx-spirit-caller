/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_thread.c
 *   function: OSi_IdleThreadProc
 *   target:   func_02091700 (0x02091700, size 0x14)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */

extern void func_02093790(void);  // OS_EnableInterrupts
extern void func_02093bf0(void);  // OS_Halt

void func_02091700(void *unused)
{
#pragma unused(unused)
    (void)func_02093790();
    while (1)
    {
        func_02093bf0();
    }
}
