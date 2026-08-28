/* func_0206bcbc: probe a fixed hardware/system address, then claim
 * data_0219ebf8 (if unclaimed) as param0 and run the follow-up init pair. */

extern void func_02000b60(void *addr);
extern void *data_0219ebf8;
extern void func_0206baf4(void);
extern int func_0206bc78(void);

int func_0206bcbc(void *param0) {
    func_02000b60((void *)0x02000bc4);
    if (data_0219ebf8 != 0) {
        return 0;
    }
    data_0219ebf8 = param0;
    func_0206baf4();
    return func_0206bc78();
}
