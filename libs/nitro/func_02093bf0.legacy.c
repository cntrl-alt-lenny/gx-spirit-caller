/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_terminate_proc.c
 *   function: OS_Halt
 *   target:   func_02093bf0 (0x02093bf0, size 0xc)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

asm void func_02093bf0(void)
{
    mov r0, #0x0
    mcr p15, 0x0, r0, c7, c0, 0x4 //Wait For Interrupt (Halt)
    bx lr
}
