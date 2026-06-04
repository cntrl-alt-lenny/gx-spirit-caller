/* func_ov021_021aa898: per-state "enter" — kick the full-init (arg 1), bind the
 * two subobjects, then advance the state word to 4. Returns 1. (ov021_core.h) */
extern void func_ov021_021aa5cc(int);
extern void func_ov021_021aa9bc(void *);
extern void func_ov021_021aaf5c(void *);
extern char data_ov021_0222ced4[];
extern char data_ov021_0222cf44[];
extern int  data_ov021_021ace80[];
int func_ov021_021aa898(void) {
    func_ov021_021aa5cc(1);
    func_ov021_021aa9bc(data_ov021_0222ced4);
    func_ov021_021aaf5c(data_ov021_0222cf44);
    data_ov021_021ace80[0] = 4;
    return 1;
}
