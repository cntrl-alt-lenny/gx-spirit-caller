#include <nitro/os_thread.h>

extern void func_02093b00(void *p);
extern void func_0207576c(void *a0, int a1);
extern void func_020927b8(char *self);
extern void func_02092748(OSMutex *mutex);
extern void func_02091768(int delay);

int func_02041e18(char *self)
{
    if (*(int *)(self + 0x112c) == 1) {
        func_02093b00(self + 0x19d0);
        func_0207576c(self + 0x19d0, 0x20);
    }
    func_020927b8(self + 0x1bf4);
    if (*(int *)(self + 0x1c0c) == 1) {
        func_02092748((OSMutex *)(self + 0x1bf4));
        return 0;
    }
    func_02092748((OSMutex *)(self + 0x1bf4));
    func_02091768(0xa);
    return 1;
}


