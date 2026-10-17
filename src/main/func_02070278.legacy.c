/* func_02070278: poll loop; waits up to 0x17 ticks (48-bit timer >> 16)
 * while the callback at data_0219ef14 stays non-zero. */
extern int (*data_0219eee4)(void);
extern int (*data_0219ef14)(void);
extern int data_0219ef1c;
extern unsigned char data_0219eec4;
extern void func_02073738(int a);
extern void func_02091768(int n);
extern void func_02074498(int n);
extern unsigned long long func_020930b0(void);

void func_02070278(void) {
    unsigned int t0;

    data_0219eee4();
    if (data_0219ef1c == 0) {
        return;
    }
    func_02073738(data_0219ef1c);
    func_02091768(100);
    func_02073738(data_0219ef1c);
    t0 = (unsigned int)(func_020930b0() >> 16);
    while (data_0219ef14() != 0 && (int)((unsigned int)(func_020930b0() >> 16) - t0) < 0x17) {
        if (data_0219eec4 != 0) {
            func_02074498(4);
            return;
        }
        func_02091768(100);
    }
}
