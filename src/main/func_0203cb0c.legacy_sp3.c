extern void *func_0203c900(int);
extern void Copy32(void *, void *, int);

void func_0203cb0c(int arg0, void *arg1) {
    void *table = func_0203c900(0x10);
    Copy32(arg1, (char *)table + (arg0 << 8), 0xf0);
}
