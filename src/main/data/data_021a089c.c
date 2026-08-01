#include <nitro/os_thread.h>

typedef void (*Data021a089cCallback)(void *, void *, void *, unsigned short);

typedef struct {
    OSMutex mutex;                 /* +0x00, 24B - real lock/unlock (func_020927b8/
                                    * func_02092748) AND a parallel sentinel-owner
                                    * acquire/release pair share thread(+0x08)/count(+0x0c) */
    int unk18;                     /* +0x18: event-driven word; zeroed at construction,
                                    * set from event.val when event.type==0x12,
                                    * gates success/-4 return in func_0207ca44 */
    Data021a089cCallback callback; /* +0x1c: set via func_0207cbbc(fn); invoked via
                                    * func_0207cd34(a0) */
} Data021a089c;  /* sizeof == 0x20 */

Data021a089c data_021a089c;
