/*
 * nitro/os_thread.h — OS thread / mutex full struct definitions.
 *
 * Brief 072 (D5 struct vendoring). Brief 071 wave 2 hit 112
 * compile errors on incomplete `struct _OSThread` / `_OSThreadQueue`
 * / `OSMutex` types — `nitro/os.h` had forward decls but cross-
 * project ports needed full bodies to dereference members like
 * `thread->state`, `queue->head`, `mutex->count`.
 *
 * Vendored from pokediamond's `include/nitro/OS_thread_shared.h`
 * + `include/nitro/OS_mutex_shared.h` + `arm9/lib/NitroSDK/include/
 * OS_context.h` + `CP_context.h`. The five-struct closure is
 * exactly the dep set brief 071 wave 2 hit; no further transitive
 * deps needed.
 *
 * Pairs with `nitro/os.h` — `os.h`'s existing typedef forward
 * decls are now backed by the structs defined here. Source files
 * that include `nitro/os.h` and use `thread->state` style member
 * access now compile against these vendored bodies.
 *
 * Field layouts MUST match upstream byte-for-byte. The
 * byte-fingerprint gate in port_external_source.py verifies the
 * compiled output matches our binary; layout drift here would
 * surface as a brief 071 byte-identity miss (loud, fixable),
 * never as silent corruption.
 */

#ifndef NITRO_OS_THREAD_H_
#define NITRO_OS_THREAD_H_

#include <nitro/types.h>

#ifdef __cplusplus
extern "C" {
#endif


/* ---- CP / OS context (transitive deps of _OSThread) ------------------- */

/* CPContext — coprocessor (div + sqrt) save/restore state.
 * Matches pokediamond's `arm9/lib/NitroSDK/include/CP_context.h`. */
typedef struct CPContext {
    u64 div_numer;
    u64 div_denom;
    u64 sqrt;
    u16 div_mode;
    u16 sqrt_mode;
} CPContext;

/* OSContext — full CPU+CP9 register save for a sleeping thread.
 * Matches pokediamond's `arm9/lib/NitroSDK/include/OS_context.h`.
 * Field order is load-bearing: the assembly thread-switch path
 * reads them by offset. */
typedef struct OSContext {
    u32 cpsr;
    u32 r[13];
    u32 sp;
    u32 lr;
    u32 pc_plus4;
    u32 sp_svc;
    CPContext cp_context;
} OSContext;


/* ---- Forward typedefs ------------------------------------------------ */

/* `nitro/os.h` already declares these as typedef'd forward decls.
 * Re-declare here (compatible — same name pointing at same tag)
 * so this header is independently includable without depending
 * on os.h's prior typedef. */
typedef struct OSiAlarm        OSAlarm;
typedef struct _OSThread       OSThread;
typedef struct _OSThreadQueue  OSThreadQueue;
typedef struct _OSThreadLink   OSThreadLink;
typedef struct _OSMutexQueue   OSMutexQueue;
typedef struct _OSMutexLink    OSMutexLink;
typedef struct OSMutex         OSMutex;


/* ---- Queue / link primitives ----------------------------------------- */

/* _OSThreadQueue — linked-list of waiting threads. Used by
 * OS_SleepThread / OS_WakeupThread to model wait-queues per
 * synchronisation primitive. */
struct _OSThreadQueue {
    OSThread *head;
    OSThread *tail;
};

/* _OSThreadLink — embedded list-node within OSThread. Each
 * thread sits in at most one queue at a time; the link is
 * the prev/next pointer pair for that queue. */
struct _OSThreadLink {
    OSThread *prev;
    OSThread *next;
};

/* _OSMutexQueue — head/tail pointers for the per-thread list
 * of mutexes that thread currently holds. */
struct _OSMutexQueue {
    OSMutex *head;
    OSMutex *tail;
};

/* _OSMutexLink — embedded next/prev within OSMutex for the
 * holder-thread's `mutexQueue`. */
struct _OSMutexLink {
    OSMutex *next;
    OSMutex *prev;
};


/* ---- Thread state + callbacks --------------------------------------- */

typedef enum {
    OS_THREAD_STATE_WAITING    = 0,
    OS_THREAD_STATE_READY      = 1,
    OS_THREAD_STATE_TERMINATED = 2
} OSThreadState;

typedef void (*OSSwitchThreadCallback) (OSThread *from, OSThread *to);
typedef void (*OSThreadDestructor)     (void *);


/* ---- The two big structs -------------------------------------------- */

/* OSMutex — counted, owner-aware mutex. Held threads form a
 * doubly-linked list via the owner's `mutexQueue`. */
struct OSMutex {
    OSThreadQueue queue;
    OSThread     *thread;
    s32           count;
    OSMutexLink   link;
};

/* _OSThread — the full thread control block. */
struct _OSThread {
    OSContext       context;
    OSThreadState   state;
    OSThread       *next;
    u32             id;
    u32             priority;
    void           *profiler;

    OSThreadQueue  *queue;
    OSThreadLink    link;

    OSMutex        *mutex;
    OSMutexQueue    mutexQueue;

    u32             stackTop;
    u32             stackBottom;
    u32             stackWarningOffset;

    OSThreadQueue   joinQueue;

    void           *specific[3];
    OSAlarm        *alarmForSleep;
    OSThreadDestructor destructor;
    void           *userParameter;

    u32             systemErrno;
};


/* ---- Thread-info singleton ------------------------------------------ */

typedef struct OSThreadInfo {
    u16        isNeedRescheduling;
    u16        irqDepth;
    OSThread  *current;
    OSThread  *list;
    void      *switchCallback;  /* type: OSSwitchThreadCallback */
} OSThreadInfo;


#ifdef __cplusplus
}
#endif

#endif /* NITRO_OS_THREAD_H_ */
