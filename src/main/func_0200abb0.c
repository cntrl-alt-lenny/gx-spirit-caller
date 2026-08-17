extern int func_0202adf8(void *a0);
extern void func_0202ae1c(int a0);
extern int data_020b4768;
extern unsigned int func_0202b0e0(int id);
extern int func_0202e2f8(void);
extern void func_0202ba94(int a, int b);
extern void func_0202af40(void);

int func_0200abb0(void) {
    char local_buf[0x3c];
    int i;
    int count;

    func_0202adf8(local_buf);
    func_0202ae1c(-1);
    count = data_020b4768;
    for (i = 1; i < count; i++) {
        unsigned int v = func_0202b0e0(i);
        if (func_0202e2f8() == 0) {
            func_0202ba94(v, 1);
        }
    }
    func_0202af40();
    return 1;
}
