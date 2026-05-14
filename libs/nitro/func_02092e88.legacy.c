/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_protectionRegion.c
 *   function: OS_SetProtectionRegion2
 *   target:   func_02092e88 (0x02092e88, size 0x8)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */


#include <nitro/types.h>
asm void func_02092e88(u32 param)
{
    mcr p15, 0x0, r0, c6, c2, 0x0 //Protection Unit Data Region 2
    bx lr
}
