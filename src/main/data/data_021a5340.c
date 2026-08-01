#include <nitro/os_thread.h>

typedef struct {
    OSThread thread;               /* +0x000: confirmed via func_02091d24.s (17 offsets, 0 contradictions) */
    unsigned char reserved[0x400]; /* +0x0c0: adjacent unclaimed BSS -- NOT proven to be this thread's own stack (the real stack buffer is the separate data_021a5800 symbol, passed explicitly at the creation call site) */
} data_021a5340_t;

data_021a5340_t data_021a5340;
