/* func_02093a20: ported from pokediamond arm9/lib/NitroSDK/src/OS_ownerInfo.c::OS_GetMacAddress
 * brief 069 wave 1 — cross-project byte-identical port.
 * Renamed symbols: {'MI_CpuCopy8': 'func_02094688'}
 */

#include <nitro/types.h>

extern void func_02094688();


void func_02093a20(u8 *macAddress)
{
    func_02094688((void *)0x027FFCF4, macAddress, 0x6);
}
