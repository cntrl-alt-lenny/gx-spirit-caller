/* func_ov006_021b63d0: 021b805c setup family — guarded variant that seeds from
 * a main-table handle instead of 0. */
extern void func_ov006_021b7f5c(void *p);
extern void func_02012420(int h, void *p);
extern void func_ov006_021b8c6c(void *p);
extern char data_02103fcc[];
int func_ov006_021b63d0(char *p, int flag) {
    if (flag != 0) {
        func_ov006_021b7f5c(p);
        func_02012420(*(int *)(data_02103fcc + 0xc3c), p + 292);
    }
    func_ov006_021b8c6c(p);
    return 1;
}
