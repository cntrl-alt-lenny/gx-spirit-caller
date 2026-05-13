/* func_0208e254: ported from pokediamond arm9/lib/NitroSDK/src/GX_g2.c::G2x_ChangeBlendBrightness_
 * brief 069 wave 1 — cross-project byte-identical port.
 * Renamed symbols: (none)
 */

#include <nitro/types.h>



void func_0208e254(u16 *ptr, fx32 brightness){
    u32 temp = *ptr;
    if (brightness < 0)
    {
        if ((temp & 0xC0) == 0x80)
        {
            ptr[0] = (u16)((temp & ~0xC0) | 0xC0);
        }
        ptr[2] = (u16)(-brightness);
    }
    else
    {
        if ((temp & 0xC0) == 0xC0)
        {
            ptr[0] = (u16)((temp & ~0xC0) | 0x80);
        }
        ptr[2] = (u16)brightness;
    }
}
