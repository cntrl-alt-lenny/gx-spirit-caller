extern void func_02088dc0(void);
extern int data_021a516c;
extern void Fill32(int value, void *dst, int size);
extern int func_0209281c(void *a0, int a1);
extern int func_02088880(int a0, void *a1, void *a2, int a3, int a4, int a5, int a6, int a7,
                          int a8, int a9, int a10, int a11, int a12, int a13, int a14);

int func_02088dfc(void *a0, int a1, int a2, int a3, int a4, int a5, int a6) {
    func_02088dc0();

    if (data_021a516c != 0) {
        return 0;
    }

    Fill32(0, a0, a1);
    func_0209281c(a0, a1);
    return func_02088880(1, a0, (char *)a0 + ((unsigned int)a1 >> 1), (unsigned int)a1 >> 1,
                          a2, 0, 0, 1, a3, 0x7f, 0, 0x7f, a4, a5, a6);
}
