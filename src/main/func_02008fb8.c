typedef struct { int pad; unsigned int error; } State;
extern State data_02104f3c;
extern void *func_02007230(void);
extern int func_02007240(void *a, void *b);
extern void func_02021008(void);
extern void func_02008c84(int rec, int n, int val);
extern int func_02090868(void);
extern void func_020908c0(int);
extern void func_020928e8(void *, int);
/* Original supplies only the handle to these four-argument thunks. */
extern int func_0209bfd4();
extern int func_0209bfe4();
extern void *func_0209c0cc(void);
extern int func_0209c7dc(int,int,int,int,int,int,int,int,int);
int func_02008fb8(int slot, signed char *p) {
    int handle;
    unsigned int address;
    unsigned int header[2];
    int scratch;
    int zero;
    if (func_0209c0cc() != 0) {
        handle = func_02090868();
        if (handle != -3) {
            address = (slot << 9) + 0x10000;
            func_0209bfe4((unsigned short)handle);
            if (p != 0 && p[1] != 0) {
                header[0] = 0x59475243;
                header[1] = func_02007240(p, (void *)0x124);
                func_020928e8(header, 8);
                func_020928e8(p, 0x124);
                data_02104f3c.error |= !func_0209c7dc(0, (int)&scratch, 4, 0, 0, 0, 6, 1, 0);
                if (data_02104f3c.error == 0) {
                    data_02104f3c.error |= !func_0209c7dc((int)header, address, 8, 0, 0, 0, 7, 10, 2);
                    if (data_02104f3c.error == 0) {
                        data_02104f3c.error |= !func_0209c7dc((int)p, address + 8, 0x124, 0, 0, 0, 7, 10, 2);
                    }
                }
            } else {
                zero = 0;
                data_02104f3c.error |= !func_0209c7dc((int)&zero, address, 4, 0, 0, 0, 7, 10, 2);
            }
            func_0209bfd4(handle & 0xffff);
            func_020908c0((unsigned int)handle << 16 >> 16);
        }
    }
    if (data_02104f3c.error == 0) func_02008c84(0, slot, 1);
    if (func_02007230() != 0) func_02021008();
    return data_02104f3c.error == 0;
}


