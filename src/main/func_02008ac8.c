extern void *func_0209c0cc(void);
extern int func_02090868(void);
extern int func_0209bfe4();
extern int func_0209bfd4();
extern void func_020908c0(int a);
extern int func_0209c7dc(int,int,int,int,int,int,int,int,int);
extern void *func_02007230(void);
extern void func_02021008(void);
extern int data_02104f3c[];
int func_02008ac8(void) {
    int handle;

    int value;
    int i;
    int *p;
    int address;
    if (func_0209c0cc()) {
        handle = func_02090868();
        if (handle != -3) {
            int buf[4] = {0,0,0,0};
            func_0209bfe4((unsigned short)handle, 0, &buf);
            data_02104f3c[1] |= !func_0209c7dc(0, (int)&value, 4, 0, 0, 0, 6, 1, 0);
            i = 0; address = 0x20000;
            do {
                data_02104f3c[1] |= !func_0209c7dc((int)&buf, address, 16, 0, 0, 0, 7, 10, 2);
                address += 0x4000; i++;
            } while (i < 8);
            func_0209bfd4(handle & 0xffff);
            func_020908c0((unsigned int)handle % 0x10000);
        }
    }
    if (func_02007230()) func_02021008();
    return data_02104f3c[1] == 0;
}











