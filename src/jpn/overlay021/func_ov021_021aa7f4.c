/* func_ov021_021aa7f4: per-state "enter" — init the two subobjects and the input
 * handler, then advance the state word to 1. Returns 1. (ov021_core.h) */
extern void func_ov021_021aa91c(void *);
extern void func_ov021_021aaf7c(void *);
extern void func_ov021_021aa6f8(void);
extern char data_ov021_0222cdf4[];
extern char data_ov021_0222ce64[];
extern int  data_ov021_021acda0[];
int func_ov021_021aa7f4(void) {
    func_ov021_021aa91c(data_ov021_0222cdf4);
    func_ov021_021aaf7c(data_ov021_0222ce64);
    func_ov021_021aa6f8();
    data_ov021_021acda0[0] = 1;
    return 1;
}
