/*
 * nitro/os_message.h — inter-thread message queue (OSMessageQueue).
 *
 * cm-bss-convert-8. Derived directly from this game's own codegen, not
 * copied from an external reference. Three sibling functions in
 * src/main/ implement a textbook blocking producer/consumer ring
 * buffer: `func_0209256c` (send/append), `func_0209240c`
 * (insert-at-front/jam), `func_020924c0` (receive) -- all taking
 * `(queue, msg, blockFlag)`. Observed field roles, cross-validated
 * against 3 independent standalone `.bss` instances, all exactly
 * 0x20 (32) bytes:
 *   +0x00 OSThreadQueue sendQueue  -- senders block here when full;
 *         calls into the already-shipped func_02091a8c/func_02091a0c
 *         sleep/wake primitives, the same ones OSMutex uses.
 *   +0x08 OSThreadQueue recvQueue  -- receivers block here when empty;
 *         same sleep/wake primitives, opposite direction.
 *   +0x10 void **msgArray          -- ring buffer of message pointers.
 *   +0x14 s32 msgCount             -- ring capacity.
 *   +0x18 s32 firstIndex           -- ring read index.
 *   +0x1c s32 usedCount            -- current queued-message count.
 * Send blocks on sendQueue when usedCount==msgCount, inserts, then
 * wakes recvQueue; receive blocks on recvQueue when usedCount==0,
 * removes, then wakes sendQueue -- an exact mirror pair, matching
 * NitroSDK's real OS_SendMessage/OS_ReceiveMessage semantics.
 */

#ifndef NITRO_OS_MESSAGE_H_
#define NITRO_OS_MESSAGE_H_

#include <nitro/types.h>
#include <nitro/os_thread.h>

#ifdef __cplusplus
extern "C" {
#endif


/* OSMessageQueue — blocking producer/consumer message ring, 32 bytes. */
typedef struct OSMessageQueue {
    OSThreadQueue sendQueue;   /* +0x00: senders block here when full */
    OSThreadQueue recvQueue;   /* +0x08: receivers block here when empty */
    void        **msgArray;    /* +0x10: ring buffer of message pointers */
    s32           msgCount;      /* +0x14: ring capacity */
    s32           firstIndex;      /* +0x18: ring read index */
    s32           usedCount;         /* +0x1c: current queued-message count */
} OSMessageQueue;


#ifdef __cplusplus
}
#endif

#endif /* NITRO_OS_MESSAGE_H_ */
