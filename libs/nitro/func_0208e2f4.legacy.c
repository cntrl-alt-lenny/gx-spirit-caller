/* func_0208e2f4: ported from pokediamond arm9/lib/NitroSDK/src/GX_g2.c::G2x_SetBlendBrightness_
 * brief 069 wave 1 — cross-project byte-identical port.
 * Renamed symbols: (none)
 */

#include <nitro/types.h>



void func_0208e2f4(volatile u16 *ptr, fx32 a, fx32 brightness){
    if (brightness < 0)
    {
        ptr[0] = (u16)(a | 0xC0);
        ptr[2] = (u16)(-brightness);
    }
    else
    {
        ptr[0] = (u16)(a | 0x80);
        ptr[2] = (u16)brightness;
    }
}
