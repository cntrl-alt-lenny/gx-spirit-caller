/*
 * Cross-project port:
 *   upstream: pokediamond:arm9/lib/NitroSDK/src/OS_thread.c
 *   function: OSi_InsertLinkToQueue
 *   target:   OSi_InsertLinkToQueue (0x020921dc, size 0x78)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/os_thread.h>
#include <nitro/types.h>
void OSi_InsertLinkToQueue(OSThreadQueue *queue, OSThread *thread)
{
    OSThread *next = queue->head;

    while (next && next->priority <= thread->priority)
    {
        if (next == thread)
            return;
        next = next->link.next;
    }

    if (!next)
    {
        OSThread *prev = queue->tail;

        if (!prev)
        {
            queue->head = thread;
        }
        else
        {
            prev->link.next = thread;
        }

        thread->link.prev = prev;
        thread->link.next = NULL;
        queue->tail = thread;
    }
    else
    {
        OSThread *prev = next->link.prev;

        if (!prev)
        {
            queue->head = thread;
        }
        else
        {
            prev->link.next = thread;
        }

        thread->link.prev = prev;
        thread->link.next = next;
        next->link.prev = thread;
    }
}
