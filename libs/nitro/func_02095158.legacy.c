/* func_02095158: ported from pokediamond arm9/lib/NitroSDK/src/SND_interface.c::SND_SetTrackPan
 * brief 069 wave 1 — cross-project byte-identical port.
 * Brief 136 — symbol resolution fix: callee is the canonical SDK function
 * `SNDi_SetTrackParam`, which lives at 0x02094d18 in EUR but at 0x02094c24
 * in USA/JPN (different addresses across regions). symbols.txt in each
 * region maps `SNDi_SetTrackParam` to its region-specific address; using
 * the canonical SDK name here resolves correctly in all 3 regions.
 */

#include <nitro/types.h>

extern void SNDi_SetTrackParam();


void func_02095158(s32 player, u32 trackBitMask, s32 pan) {
    SNDi_SetTrackParam(player, trackBitMask, 9, (u32)pan, 1);
}
