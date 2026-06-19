/* func_ov021_021aa7b8: per-state "enter" — kick the full-init (arg 1), bind the
 * two subobjects, then advance the state word to 4. Returns 1. (ov021_core.h) */
extern void func_ov021_021aa4ec(int);
extern void func_ov021_021aa8dc(void *);
extern void func_ov021_021aae7c(void *);
extern char data_ov021_0222cdf4[];
extern char data_ov021_0222ce64[];
extern int  data_ov021_021acda0[];
int func_ov021_021aa7b8(void) {
    func_ov021_021aa4ec(1);
    func_ov021_021aa8dc(data_ov021_0222cdf4);
    func_ov021_021aae7c(data_ov021_0222ce64);
    data_ov021_021acda0[0] = 4;
    return 1;
}
