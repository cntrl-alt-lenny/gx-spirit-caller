/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/MI_swap.c
 *   function: MI_SwapWord
 *   target:   func_020947c8 (0x020947c8, size 0x8)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */


#include <nitro/types.h>
asm u32 func_020947c8(register u32 setData, register vu32 * destp)
{
    swp setData, setData, [destp]
    bx lr
}
