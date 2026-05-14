/* func_0208e29c: ported from pokediamond arm9/lib/NitroSDK/src/GX_g2.c::G2x_SetBlendBrightnessExt_
 * brief 069 wave 1 — cross-project byte-identical port.
 * Renamed symbols: (none)
 */

#include <nitro/types.h>



void func_0208e29c(u16 *ptr, fx32 a, fx32 b, fx32 c, fx32 d, fx32 brightness){
    ptr[1] = (u16)(c | (d << 0x8));
    if (brightness < 0)
    {
        ptr[0] = (u16)(0xC0 | a | (b << 0x8));
        ptr[2] = (u16)(-brightness);
    }
    else
    {
        ptr[0] = (u16)(0x80 | a | (b << 0x8));
        ptr[2] = (u16)brightness;
    }
}
