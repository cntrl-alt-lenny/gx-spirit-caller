extern void *func_0209c0cc(void);
extern int func_02090868(void);
/* These thunks accept four arguments, but this caller supplies only the handle. */
extern int func_0209bfe4();
extern int func_0209bfd4();
extern int func_0209c7dc(int,int,int,int,int,int,int,int,int);
extern void func_020908c0(int);
extern void *func_02007230(void);
extern void func_02021008(void);
typedef struct { int pad; unsigned int error; } State;
extern State data_02104f3c;
int func_02008ac8(void) {
    int handle;
    int header;

    int i;
    unsigned int address;
    if (func_0209c0cc()) {
        handle = func_02090868();
        if (handle != -3) {
            int zeros[4] = {0,0,0,0};
            func_0209bfe4((unsigned short)handle);
            data_02104f3c.error |= !func_0209c7dc(0,(int)&header,4,0,0,0,6,1,0);
            for (i=0,address=0x20000; i<8; i++) {
                data_02104f3c.error |= !func_0209c7dc((int)zeros,address,16,0,0,0,7,10,2);
                address += 0x4000;
            }
            func_0209bfd4(handle & 0xffff);
            func_020908c0((unsigned int)handle << 16 >> 16);
        }
    }
    if (func_02007230()) func_02021008();
    return data_02104f3c.error == 0;
}


