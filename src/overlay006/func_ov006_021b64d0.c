/* func_ov006_021b64d0: 021b805c setup family — guarded variant that seeds from
 * a main-table handle instead of 0. */
extern void func_ov006_021b805c(void *p);
extern void func_02012454(int h, void *p);
extern void func_ov006_021b8d6c(void *p);
extern char data_021040ac[];
int func_ov006_021b64d0(char *p, int flag) {
    if (flag != 0) {
        func_ov006_021b805c(p);
        func_02012454(*(int *)(data_021040ac + 0xc3c), p + 292);
    }
    func_ov006_021b8d6c(p);
    return 1;
}
