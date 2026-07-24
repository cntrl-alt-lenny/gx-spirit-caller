/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_mutex.c
 *   function: OSi_EnqueueTail
 *   target:   OSi_EnqueueTail (0x02092668, size 0x24)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/os_thread.h>
#include <nitro/types.h>
void OSi_EnqueueTail(OSThread *thread, OSMutex *mutex)
{
    OSMutex *prev = thread->mutexQueue.tail;

    if (!prev)
    {
        thread->mutexQueue.head = mutex;
    }
    else
    {
        prev->link.next = mutex;
    }

    mutex->link.prev = prev;
    mutex->link.next = NULL;
    thread->mutexQueue.tail = mutex;
}
