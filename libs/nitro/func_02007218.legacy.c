/* func_02007218: ported from pokediamond
 * arm9/lib/NitroSDK/src/OS_thread.c::OSi_GetUnusedThreadId.
 * brief 069 wave 1 — cross-project byte-identical port.
 *
 * Uses our EUR placeholder name for the global counter
 * (data_020c3f48 = upstream OSi_ThreadIdCount).
 */

#include <nitro/types.h>

extern s32 data_020c3f48;

s32 func_02007218(void) {
    return ++data_020c3f48;
}
