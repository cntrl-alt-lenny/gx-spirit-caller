/* func_ov006_021c7d08: release a pending handle in *obj, run two reset passes,
 * then release the deferred task at obj+0x38; return 1. */
extern void func_020212cc(int h);
extern void func_ov006_021c81c0(int *obj, int z);
extern void func_ov006_021c821c(int *obj, int z);
extern void Task_InvokeLocked(int h);
int func_ov006_021c7d08(int *obj) {
    if (*obj != 0) {
        func_020212cc(*obj);
        *obj = 0;
    }
    func_ov006_021c81c0(obj, 0);
    func_ov006_021c821c(obj, 0);
    if (obj[14] != 0) {
        Task_InvokeLocked(obj[14]);
        obj[14] = 0;
    }
    return 1;
}
