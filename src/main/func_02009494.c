extern void *func_02007230(void);
extern int func_02007240(void *a, void *b);
extern int func_02090868(void);
extern void func_020908c0(int);
/* Original calls supply only the handle, unlike the four-argument thunk definitions. */
extern int func_0209bfd4();
extern int func_0209bfe4();
extern void *func_0209c0cc(void);
extern int func_0209c7dc(int, int, int, int, int, int, int, int, int);
extern void func_02021008(void);
typedef struct { int unused; int error; } State;
extern State data_02104f3c;

int func_02009494(void *src) {
    int handle;
    int header[2];
    int result;
    if (func_0209c0cc() != 0) {
        handle = func_02090868();
        if (handle != -3) {
            header[0] = 0x59474652;
            header[1] = func_02007240(src, (void *)0x13b0);
            func_0209bfe4((unsigned short)handle);
            data_02104f3c.error |= !func_0209c7dc(0, (int)&result, 4, 0, 0, 0, 6, 1, 0);
            if (data_02104f3c.error == 0) {
                data_02104f3c.error |= !func_0209c7dc((int)header, 0x8000, 8, 0, 0, 0, 7, 10, 2);
                if (data_02104f3c.error == 0) {
                    data_02104f3c.error |= !func_0209c7dc((int)src, 0x8008, 0x13b0, 0, 0, 0, 7, 10, 2);
                }
            }
            func_0209bfd4(handle & 0xffff);
            func_020908c0((unsigned int)(handle << 16) >> 16);
        }
    }
    if (func_02007230() != 0) func_02021008();
    return data_02104f3c.error == 0;
}


