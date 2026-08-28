/* func_ov006_021c4700: clear a func_0208dcb4()+0xc40 buffer, init
 * self+0x10 as a 0x20/3 text box, feed it data_02104e6c[1]'s low 3-bit
 * field, reconfigure it as kind 5, then look up a signed table entry
 * from data_ov006_021cdcbc (indexed by self->f60/f5c) and route it
 * through func_0202c06c/func_02005538 to build a func_02004f3c call. */
extern void *func_0208dcb4(void);
extern void func_02094410(int a, void *b, int c);
extern void func_02001cec(void *a, int b, int c);
extern void func_02001d48(int a);
extern void func_02001d78(void *a, int b);
extern int func_0202c06c(int a);
extern int func_02005538(int a, int b, int c);
extern void func_02004f3c(void *a, int b, void *c, int d, int e, int f);
extern int data_02104e6c[];
extern short data_ov006_021cdcbc[];

int func_ov006_021c4700(char *self) {
    void *base = func_0208dcb4();

    func_02094410(0, (char *)base + 0xc40, 0xc00);
    func_02001cec(self + 0x10, 0x20, 3);
    func_02001d48((int)((unsigned)(data_02104e6c[1] << 29) >> 29));
    func_02001d78(self + 0x10, 5);

    {
        int idx = *(int *)(self + 0x60) * 4 + 1 + *(int *)(self + 0x5c);
        short tval = data_ov006_021cdcbc[idx];
        int a = func_0202c06c(tval);
        int b = func_02005538(a, 0xc, 5);
        int c = 0x74 - b / 2;
        func_02004f3c(self + 0x10, a, base + 0xc40, c, 7, 0xc);
    }

    func_02001d78(self + 0x10, -1);
    return 1;
}
