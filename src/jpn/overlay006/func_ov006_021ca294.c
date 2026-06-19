/* func_ov006_021ca294: release a pending handle in *base (if any), then run
 * two reset passes over base; return 1. */
extern void func_02021278(int h);
extern void func_ov006_021ca2f4(int *base, int z);
extern void func_ov006_021ca350(int *base, int z);
int func_ov006_021ca294(int *base) {
    if (*base != 0) {
        func_02021278(*base);
        *base = 0;
    }
    func_ov006_021ca2f4(base, 0);
    func_ov006_021ca350(base, 0);
    return 1;
}
