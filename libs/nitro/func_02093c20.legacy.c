/* func_02093c20: ported from pokediamond arm9/lib/NitroSDK/src/MI_dma.c::MIi_CheckDma0SourceAddress
 * brief 069 wave 1 — cross-project byte-identical port.
 * Renamed symbols: {'OS_Terminate': 'func_02093bfc'}
 */

#include <nitro/types.h>

extern void func_02093bfc();


void func_02093c20(u32 dmaNo, u32 src, u32 size, u32 dir) {
    if (!dmaNo) {
        u32 addStart = src & 0xff000000;
        u32 addEnd;

        switch (dir) {
        case 0: // dma_src_inc
            addEnd = src + size;
            break;
        case 0x800000: // dma_src_dec
            addEnd = src - size;
            break;
        default:
            addEnd = src;
            break;
        }
        addEnd &= 0xff000000;

        if (addStart == 0x04000000 || addStart >= 0x08000000 || addEnd == 0x04000000 || addEnd >= 0x08000000) {
            func_02093bfc();
        }
    }
}
