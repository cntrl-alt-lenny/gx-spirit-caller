/* func_ov006_021b6870: run a fixed 3-step setup over a subobject; return 1. */
extern void func_ov006_021b805c(void *p);
extern void func_02012454(int z, void *p);
extern void func_ov006_021b8d6c(void *p);
int func_ov006_021b6870(char *p) {
    func_ov006_021b805c(p);
    func_02012454(0, p + 292);
    func_ov006_021b8d6c(p);
    return 1;
}
