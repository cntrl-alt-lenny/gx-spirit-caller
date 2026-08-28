extern int func_0202ada4(void *a0);
extern void func_0202adc8(int a0);
extern int data_020b4674;
extern unsigned int func_0202b08c(int id);
extern int func_0202e2a4(void);
extern void func_0202ba40(int a, int b);
extern void func_0202aeec(void);

int func_0200ab94(void) {
    char local_buf[0x3c];
    int i;
    int count;

    func_0202ada4(local_buf);
    func_0202adc8(-1);
    count = data_020b4674;
    for (i = 1; i < count; i++) {
        unsigned int v = func_0202b08c(i);
        if (func_0202e2a4() == 0) {
            func_0202ba40(v, 1);
        }
    }
    func_0202aeec();
    return 1;
}
