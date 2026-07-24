/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_thread.c
 *   function: OSi_RemoveMutexLinkFromQueue
 *   target:   OSi_RemoveMutexLinkFromQueue (0x02092124, size 0x30)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/os_thread.h>
#include <nitro/types.h>
OSMutex *OSi_RemoveMutexLinkFromQueue(OSMutexQueue *queue)
{
    OSMutex *mutexHead = queue->head;

    if (mutexHead)
    {
        OSMutex *next = mutexHead->link.next;

        queue->head = next;

        if (next)
        {
            next->link.prev = NULL;
        }
        else
        {
            queue->tail = NULL;
        }
    }

    return mutexHead;
}
