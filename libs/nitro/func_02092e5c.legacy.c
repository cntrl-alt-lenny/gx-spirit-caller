/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_protectionUnit.c
 *   function: OS_DisableProtectionUnit
 *   target:   func_02092e5c (0x02092e5c, size 0x10)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */

asm void func_02092e5c(void)
{
    mrc p15, 0x0, r0, c1, c0, 0x0 //Control Register
    bic r0, r0, #0x1
    mcr p15, 0x0, r0, c1, c0, 0x0 //Control Register
    bx lr
}
