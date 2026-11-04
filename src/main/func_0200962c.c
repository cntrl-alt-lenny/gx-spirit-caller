extern void *func_0209c0cc(void);
extern int func_02090868(void);
/* The original calls these thunks with only r0 initialized. */
extern int func_0209bfe4();
extern int func_0209bfd4();
extern void func_020908c0(int);
extern int func_0209c7dc(int,int,int,int,int,int,int,int,int);
extern void *func_02007230(void);
extern void func_02021008(void);
extern int data_02104f3c[];

int func_0200962c(void) {
    int id;
    if (func_0209c0cc()) {
        id = func_02090868();
        if (id != -3) {
            unsigned int a;
            func_0209bfe4((unsigned short)id);
            if ((data_02104f3c[1] |= !func_0209c7dc(0, (int)(char *)&a, 4, 0, 0, 0, 6, 1, 0)) == 0) {
                a = 0;
                data_02104f3c[1] |= !func_0209c7dc((int)&a, 0x8000, 4, 0, 0, 0, 7, 10, 2);
            }
            func_0209bfd4(id & 0xffff);
            func_020908c0((unsigned int)id << 16 >> 16);
        }
    }
    if (func_02007230()) func_02021008();
    return data_02104f3c[1] == 0;
}
