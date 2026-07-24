/*
 * Cross-project port:
 *   upstream: pokeheartgold:lib/NitroSDK/src/os/os_thread.c
 *   function: OSi_RemoveLinkFromQueue
 *   target:   OSi_RemoveLinkFromQueue (0x020921a8, size 0x34)
 *
 * Compiles with `.legacy.c` routing (mwcc 1.2/sp2p3 — exact SP match
 * to pokediamond's NitroSDK build flags). Brief 070 D1+D4: callee +
 * data-ref remap via parallel-reloc map.
 */


#include <nitro/os_thread.h>
#include <nitro/types.h>
OSThread *OSi_RemoveLinkFromQueue(OSThreadQueue *queue) {
    OSThread *t = queue->head;
    if (t) {
        OSThread *next = t->link.next;
        queue->head = next;
        if (next) {
            next->link.prev = NULL;
        } else {
            queue->tail = NULL;
            t->queue = NULL;
        }
    }
    return t;
}
