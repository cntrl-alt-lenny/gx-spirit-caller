/* func_ov015_021b588c: tear down the active text job — if a job is running, stop
 * its task and free its work record; release the font handle; then free the two
 * cached cell buffers if present. Returns 1. (ov015_core.h) */
extern void Task_InvokeLocked(int);
extern void func_ov005_021abb1c(int);
extern void func_ov005_021aae60(int);
extern void func_02006e00(int);
extern char data_ov015_021b5d08[];
extern char data_ov015_021b5d24[];
int func_ov015_021b588c(void) {
    char *s = data_ov015_021b5d24;
    if (*(int *)(data_ov015_021b5d08 + 0x898) != 0) {
        Task_InvokeLocked(*(int *)(s + 0x87c));
        func_ov005_021abb1c(*(int *)(s + 0x878));
    }
    func_ov005_021aae60(*(int *)(s + 0x874));
    if (*(int *)(s + 0xa78) != 0) {
        func_02006e00(*(int *)(s + 0xa78));
        *(int *)(s + 0xa78) = 0;
    }
    if (*(int *)(s + 0xa7c) != 0) {
        func_02006e00(*(int *)(s + 0xa7c));
        *(int *)(s + 0xa7c) = 0;
    }
    return 1;
}
