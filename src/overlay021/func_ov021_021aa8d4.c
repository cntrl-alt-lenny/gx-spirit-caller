/* func_ov021_021aa8d4: per-state "enter" — init the two subobjects and the input
 * handler, then advance the state word to 1. Returns 1. (ov021_core.h) */
extern void func_ov021_021aa9fc(void *);
extern void func_ov021_021ab05c(void *);
extern void func_ov021_021aa7d8(void);
extern char data_ov021_0222ced4[];
extern char data_ov021_0222cf44[];
extern int  data_ov021_021ace80[];
int func_ov021_021aa8d4(void) {
    func_ov021_021aa9fc(data_ov021_0222ced4);
    func_ov021_021ab05c(data_ov021_0222cf44);
    func_ov021_021aa7d8();
    data_ov021_021ace80[0] = 1;
    return 1;
}
