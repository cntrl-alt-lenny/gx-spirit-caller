#include <nitro/os_thread.h>

/* Byte-identical to OSThreadQueue's 2-pointer head/tail shape, but the
 * nodes actually linked are alarm/timer-deadline records (callback fn-ptr
 * + 64-bit deadline + prev/next), not OSThread instances. Reusing the
 * OSThreadQueue typedef is a judgment call, not a byte-level necessity --
 * the shape is confirmed clean (only +0x0/+0x4 ever touched, across all 4
 * real consumers), and this project's own OSi_InsertLinkToQueue primitive
 * is already used generically across OSMutex/OSMessageQueue/this case. */
OSThreadQueue data_021a66d4;
