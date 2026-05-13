/* func_02095180: ported from pokediamond arm9/lib/NitroSDK/src/SND_interface.c::SND_SetTrackPitch
 * brief 069 wave 1 — cross-project byte-identical port.
 * Renamed symbols: {'SNDi_SetTrackParam': 'func_02094d18'}
 */

#include <nitro/types.h>

extern void func_02094d18();


void func_02095180(s32 player, u32 trackBitMask, s32 pitch) {
    func_02094d18(player, trackBitMask, 12, (u32)pitch, 2);
}
