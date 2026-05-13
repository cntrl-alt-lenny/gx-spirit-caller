/* func_020a66a4: ported from pokediamond arm9/lib/NitroSDK/src/MATH_pop.c::MATH_CountPopulation
 * brief 069 wave 1 — cross-project byte-identical port.
 * Renamed symbols: (none)
 */

#include <nitro/types.h>



u8 func_020a66a4(u32 x) {
    x -= (x >> 1) & 0x55555555;
    x = (x & 0x33333333) + ((x >> 2) & 0x33333333);
    x += x >> 4;
    x &= 0x0f0f0f0f;
    x += x >> 8;
    x += x >> 16;
    return (u8)x;
}
