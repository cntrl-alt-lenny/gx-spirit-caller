/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_printf.c
 *   function: OS_SPrintf
 *   target:   OS_SPrintf (0x02091554, size 0x30)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/types.h>
extern int func_0209153c();  // OS_VSPrintf

s32 OS_SPrintf(s8 *buffer, const s8 *format, ...)
{
    void *args = (void *)((u32 *)((u32)&format & ~0x3) + 1); // hack since mwccarm doesn't have <stdarg.h> apparently
    return func_0209153c(buffer, format, args);
}
