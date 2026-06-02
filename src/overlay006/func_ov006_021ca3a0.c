/* func_ov006_021ca3a0: release a pending handle in *base (if any), then run
 * two reset passes over base; return 1. */
extern void func_020212cc(int h);
extern void func_ov006_021ca400(int *base, int z);
extern void func_ov006_021ca45c(int *base, int z);
int func_ov006_021ca3a0(int *base) {
    if (*base != 0) {
        func_020212cc(*base);
        *base = 0;
    }
    func_ov006_021ca400(base, 0);
    func_ov006_021ca45c(base, 0);
    return 1;
}
