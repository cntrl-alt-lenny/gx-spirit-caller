/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_protectionRegion.c
 *   function: OS_SetDPermissionsForProtectionRegion
 *   target:   OS_SetDPermissionsForProtectionRegion (0x02092e6c, size 0x14)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */



#include <nitro/types.h>
#include <nitro/types.h>
asm void OS_SetDPermissionsForProtectionRegion(register u32 setMask, register u32 flags)
{
    mrc p15, 0x0, r2, c5, c0, 0x2 //Extended Access Permission Data Protection Region
    bic r2, r2, r0
    orr r2, r2, r1
    mcr p15, 0x0, r2, c5, c0, 0x2 //Extended Access Permission Data Protection Region
    bx lr
}
