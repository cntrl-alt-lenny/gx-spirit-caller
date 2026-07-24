#include <nitro/types.h>

extern void func_020453b4(void *);
extern void func_02054148(void *);

void func_02061f20(void *a0) {
    u8 *p = (u8 *)a0;
    if (*(void **)(p + 0x38) != NULL) func_020453b4(*(void **)(p + 0x38));
    if (*(void **)(p + 0x44) != NULL) func_020453b4(*(void **)(p + 0x44));
    if (*(void **)(p + 0x50) != NULL) func_020453b4(*(void **)(p + 0x50));
    if (*(void **)(p + 0x5c) != NULL) func_02054148(*(void **)(p + 0x5c));
    if (*(void **)(p + 0x60) != NULL) func_02054148(*(void **)(p + 0x60));
    if (*(void **)(p + 0x98) != NULL) func_02054148(*(void **)(p + 0x98));
    if (*(void **)(p + 0x9c) != NULL) func_02054148(*(void **)(p + 0x9c));
    func_020453b4(a0);
}
