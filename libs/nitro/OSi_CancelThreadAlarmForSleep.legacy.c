/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_thread.c
 *   function: OSi_CancelThreadAlarmForSleep
 *   target:   OSi_CancelThreadAlarmForSleep (0x02091b30, size 0x2c)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/os_thread.h>
extern int func_020933bc();  // OS_CancelAlarm

void OSi_CancelThreadAlarmForSleep(OSThread *thread)
{
    OSAlarm *alarm = thread->alarmForSleep;

    if (alarm)
    {
        func_020933bc(alarm);
    }
}
