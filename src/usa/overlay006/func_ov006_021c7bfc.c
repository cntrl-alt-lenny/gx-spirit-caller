/* func_ov006_021c7bfc: release a pending handle in *obj, run two reset passes,
 * then release the deferred task at obj+0x38; return 1. */
extern void func_02021278(int h);
extern void func_ov006_021c80b4(int *obj, int z);
extern void func_ov006_021c8110(int *obj, int z);
extern void Task_InvokeLocked(int h);
int func_ov006_021c7bfc(int *obj) {
    if (*obj != 0) {
        func_02021278(*obj);
        *obj = 0;
    }
    func_ov006_021c80b4(obj, 0);
    func_ov006_021c8110(obj, 0);
    if (obj[14] != 0) {
        Task_InvokeLocked(obj[14]);
        obj[14] = 0;
    }
    return 1;
}
