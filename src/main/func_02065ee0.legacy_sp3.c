/* func_02065ee0: lazily create a cached handle via func_020541b8 (a
 * sized allocator taking a ctor function pointer), then drive a
 * zeroed 0x40-byte local buffer + the handle through 3 more calls. */

#include "game/types.h"

extern s32 data_0219e968;
extern void func_02065f78(void);

extern int func_0205407c(int a, void *buf);
extern int func_020540d0(int a, int b);
extern int func_02054140(int a);
extern int func_020541b8(int size, int count, void (*fn)(void));

void func_02065ee0(void)
{
    u32 buf[0x10] = {0};
    int r;

    if (data_0219e968 == 0)
        data_0219e968 = func_020541b8(0x40, 4, func_02065f78);

    func_0205407c(data_0219e968, buf);
    r = func_02054140(data_0219e968);
    func_020540d0(data_0219e968, r - 1);
}
