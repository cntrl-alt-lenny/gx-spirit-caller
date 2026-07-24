/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_vramExclusive.c
 *   function: OsCountZeroBits
 *   target:   OsCountZeroBits (0x02079e70, size 0x8)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */


#include <nitro/types.h>
asm u32 OsCountZeroBits(register u32 bitmap)
{
    clz r0, r0
    bx lr
}
