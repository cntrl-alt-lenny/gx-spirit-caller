/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/CTRDG_common.c
 *   function: CTRDG_IsOptionCartridge
 *   target:   CTRDG_IsOptionCartridge (0x020a60c0, size 0x3c)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1 callee remap.
 */



#include <nitro/types.h>
#include <nitro/types.h>
extern int func_020a5f8c();  // CTRDG_IsExisting
extern int func_020a60a8();  // CTRDGi_IsAgbCartridgeAtInit

BOOL CTRDG_IsOptionCartridge(void)
{
    return (func_020a5f8c() && !func_020a60a8());
}
