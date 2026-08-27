extern void *func_0204987c(void);
extern void func_02068ee0(int x);
extern void func_02065dcc(void);
extern void func_02049868(int x);
extern void func_0204543c(int a, int b, int c);
extern void func_0204b2fc(void);
extern int data_0219dbb0;

void func_0204f20c(void) {
    int tmp;

    if (func_0204987c() == 0) {
        return;
    }

    if (*(int *)((char *)func_0204987c() + 0xe4) != 0) {
        func_02068ee0(*(int *)((char *)func_0204987c() + 0xe4));
        *(int *)((char *)func_0204987c() + 0xe4) = 0;
    }

    func_02065dcc();
    func_02049868(0);

    tmp = data_0219dbb0;
    if (tmp != 0) {
        func_0204543c(4, tmp, 0);
        data_0219dbb0 = 0;
    }

    func_0204b2fc();
    *(unsigned char *)((char *)func_0204987c() + 0x18) = 1;
}
