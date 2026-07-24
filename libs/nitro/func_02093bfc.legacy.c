/* func_02093bfc: ported from pokediamond arm9/lib/NitroSDK/src/OS_terminate_proc.c::OS_Terminate
 * brief 069 wave 1 — cross-project byte-identical port.
 * Renamed symbols: {'OS_DisableInterrupts': 'OS_DisableIrq', 'OS_Halt': 'OS_Halt'}
 */

#include <nitro/types.h>

extern void OS_DisableIrq();
extern void OS_Halt();


void func_02093bfc(void)
{
    while (TRUE)
    {
        (void)OS_DisableIrq();
        OS_Halt();
    }
}
