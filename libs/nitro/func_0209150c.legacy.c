/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_printf.c
 *   function: OS_SNPrintf
 *   target:   func_0209150c (0x0209150c, size 0x30)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/types.h>
extern int func_02090c44();  // OS_VSNPrintf

s32 func_0209150c(s8 *buffer, s32 bufsz, const s8 *format, ...)
{
    void *args = (void *)((u32 *)((u32)&format & ~0x3) + 1); // hack since mwccarm doesn't have <stdarg.h> apparently
    return func_02090c44(buffer, bufsz, format, args);
}
