/* func_02065e6c: lazily create a cached handle via func_02054144 (a
 * sized allocator taking a ctor function pointer), then drive a
 * zeroed 0x40-byte local buffer + the handle through 3 more calls. */

#include "game/types.h"

extern s32 data_0219e888;
extern void func_02065f04(void);

extern int func_02054008(int a, void *buf);
extern int func_0205405c(int a, int b);
extern int func_020540cc(int a);
extern int func_02054144(int size, int count, void (*fn)(void));

void func_02065e6c(void)
{
    u32 buf[0x10] = {0};
    int r;

    if (data_0219e888 == 0)
        data_0219e888 = func_02054144(0x40, 4, func_02065f04);

    func_02054008(data_0219e888, buf);
    r = func_020540cc(data_0219e888);
    func_0205405c(data_0219e888, r - 1);
}
