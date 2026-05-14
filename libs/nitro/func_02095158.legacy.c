/* func_02095158: ported from pokediamond arm9/lib/NitroSDK/src/SND_interface.c::SND_SetTrackPan
 * brief 069 wave 1 — cross-project byte-identical port.
 * Renamed symbols: {'SNDi_SetTrackParam': 'func_02094d18'}
 */

#include <nitro/types.h>

extern void func_02094d18();


void func_02095158(s32 player, u32 trackBitMask, s32 pan) {
    func_02094d18(player, trackBitMask, 9, (u32)pan, 1);
}
