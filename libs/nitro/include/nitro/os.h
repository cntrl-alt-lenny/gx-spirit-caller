/*
 * nitro/os.h — OS subsystem core types.
 *
 * Header-only typedefs + enum definitions for the NitroSDK OS module.
 * Pulled verbatim from ntrtwl/NitroSDK's public surface (see
 * libs/nitro/README.md for the provenance notes). No function
 * prototypes yet — those get added piecemeal under nitro/os_*.h as
 * the decomper matches the corresponding .c's.
 *
 * Pairs with `libs/nitro/include/nitro/swi.h` (BIOS thunks) — swi.h
 * is the ARM7/ARM9 BIOS wall; os.h is the SDK layer that calls
 * through it. Their naming is deliberately distinct: swi.h's
 * functions match the bare-name baserom symbols (`Halt`, `Div`);
 * os.h's types + APIs match the `OS_*` NitroSDK convention.
 */

#ifndef NITRO_OS_H_
#define NITRO_OS_H_

#include <nitro/types.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ---- Arena + heap identity ---------------------------------------------- */

/* OSArenaId — the arena index used by OS_*Arena and OS_*Heap APIs.
 * Order and values are load-bearing (array indices into the
 * OSArenaInfo table). Match NitroSDK's `nitro/os/common/arena.h`
 * exactly — any drift breaks the heap layout at link time. */
typedef enum {
    OS_ARENA_MAIN         = 0,
    OS_ARENA_MAIN_SUBPRIV = 1,
    OS_ARENA_MAINEX       = 2,
    OS_ARENA_ITCM         = 3,
    OS_ARENA_DTCM         = 4,
    OS_ARENA_SHARED       = 5,
    OS_ARENA_WRAM_MAIN    = 6,
    OS_ARENA_WRAM_SUB     = 7,
    OS_ARENA_WRAM_SUBPRIV = 8,
    OS_ARENA_MAX          = 9
} OSArenaId;

/* OSHeapHandle — index returned by OS_CreateHeap; used as the ID
 * for subsequent OS_AllocFromHeap / OS_FreeToHeap calls. */
typedef int OSHeapHandle;

/* ---- Time / tick -------------------------------------------------------- */

/* OSTick — 64-bit monotonic counter. OS_GetTick returns one of
 * these; OS_TicksToMilliSeconds etc. consume them. */
typedef u64 OSTick;

/* ---- Interrupt bookkeeping ---------------------------------------------- */

/* OSIrqMask — bitmask of interrupt sources. Bits match the
 * ARM9 IE/IF register layout. */
typedef u32 OSIrqMask;

/* OS_DisableInterrupts / OS_RestoreInterrupts use these as the
 * CPSR mask state. Brief 072 D5: vendored from
 * `nitro/OS_system_shared.h` because `OSIntrMode` was the
 * second-most-common unvendored struct-type hint in brief 071
 * wave 2's compile-fail survey. Values map directly to the
 * ARM CPSR I/F bit positions. */
#define HW_PSR_DISABLE_FIQ      0x40
#define HW_PSR_DISABLE_IRQ      0x80
#define HW_PSR_DISABLE_IRQ_FIQ  0xc0

typedef enum {
    OS_INTRMODE_DISABLE_IRQ = HW_PSR_DISABLE_IRQ,
    OS_INTRMODE_DISABLE_FIQ = HW_PSR_DISABLE_FIQ,
    OS_INTRMODE_ENABLE      = 0,
} OSIntrMode;

/* OSProcMode — CPU privilege/mode. Same source header
 * (`OS_system_shared.h`). Values are the CPSR M field. */
typedef enum {
    OS_PROCMODE_USER  = 16,
    OS_PROCMODE_FIQ   = 17,
    OS_PROCMODE_IRQ   = 18,
    OS_PROCMODE_SVC   = 19,
    OS_PROCMODE_ABORT = 23,
    OS_PROCMODE_UNDEF = 27,
    OS_PROCMODE_SYS   = 31,
} OSProcMode;

/* ---- Thread / sync primitives ------------------------------------------ */

/* Full struct bodies live in `nitro/os_thread.h` (vendored as
 * part of brief 072 D5). Pre-D5 these were forward-declared here
 * with a TODO; cross-project NitroSDK ports need the full layout
 * to compile `thread->state` / `queue->head` style member access.
 *
 * Include order matters: `os_thread.h` defines OSContext +
 * CPContext too, so types/swi/fx callers don't need to know
 * about the layered include. */
#include <nitro/os_thread.h>

/* OSLockWord — 3-u32 word used by OS_LockByWord / OS_SpinWait /
 * OS_TryLockByWord. Volatile because the lock is poked under
 * interrupt from the other CPU (ARM7 ↔ ARM9 lock contention).
 * Matches NitroSDK's `nitro/os/common/spinLock.h`. */
typedef volatile struct OSLockWord {
    u16  lockID;
    u16  extension;
    OSThread *threadID;
} OSLockWord;

#ifdef __cplusplus
}
#endif

#endif /* NITRO_OS_H_ */
