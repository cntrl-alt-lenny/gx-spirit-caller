/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_mutex.c
 *   function: OSi_DequeueItem
 *   target:   OSi_DequeueItem (0x02092644, size 0x24)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/os_thread.h>
void OSi_DequeueItem(OSThread *thread, OSMutex *mutex)
{
    OSMutex *next = mutex->link.next;
    OSMutex *prev = mutex->link.prev;

    if (!next)
    {
        thread->mutexQueue.tail = prev;
    }
    else
    {
        next->link.prev = prev;
    }

    if(!prev)
    {
        thread->mutexQueue.head = next;
    }
    else
    {
        prev->link.next = next;
    }
}
