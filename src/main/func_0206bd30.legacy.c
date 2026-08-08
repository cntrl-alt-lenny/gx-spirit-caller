/* func_0206bd30: probe a fixed hardware/system address, then claim
 * data_0219ecd8 (if unclaimed) as param0 and run the follow-up init pair. */

extern void func_02000b60(void *addr);
extern void *data_0219ecd8;
extern void func_0206bb68(void);
extern int func_0206bcec(void);

int func_0206bd30(void *param0) {
    func_02000b60((void *)0x02000bc4);
    if (data_0219ecd8 != 0) {
        return 0;
    }
    data_0219ecd8 = param0;
    func_0206bb68();
    return func_0206bcec();
}
