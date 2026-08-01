#include <nitro/os_thread.h>

typedef struct {
    OSMutex mutex;       /* +0x00, 24B - thread(+0x08)/count(+0x0c) confirmed via
                          * func_0209268c/func_020927b8/func_02092748 */
    char pad_18[0x48];   /* +0x18..+0x5f, 72B, unconfirmed: relocs.txt proves exactly
                          * ONE relocation to this symbol exists in the whole ROM
                          * (func_020a95e4), and it never indexes past +0x0c. No
                          * consumer anywhere touches this range. */
} Data021aa0d0;  /* sizeof == 0x60 */

Data021aa0d0 data_021aa0d0;
