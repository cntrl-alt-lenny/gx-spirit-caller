/* func_ov015_021b59a4: tear down the active text job — if a job is running, stop
 * its task and free its work record; release the font handle; then free the two
 * cached cell buffers if present. Returns 1. (ov015_core.h) */
extern void Task_InvokeLocked(int);
extern void func_ov005_021abbfc(int);
extern void func_ov005_021aaf40(int);
extern void func_02006e1c(int);
extern char data_ov015_021b5e28[];
extern char data_ov015_021b5e44[];
int func_ov015_021b59a4(void) {
    char *s = data_ov015_021b5e44;
    if (*(int *)(data_ov015_021b5e28 + 0x898) != 0) {
        Task_InvokeLocked(*(int *)(s + 0x87c));
        func_ov005_021abbfc(*(int *)(s + 0x878));
    }
    func_ov005_021aaf40(*(int *)(s + 0x874));
    if (*(int *)(s + 0xa78) != 0) {
        func_02006e1c(*(int *)(s + 0xa78));
        *(int *)(s + 0xa78) = 0;
    }
    if (*(int *)(s + 0xa7c) != 0) {
        func_02006e1c(*(int *)(s + 0xa7c));
        *(int *)(s + 0xa7c) = 0;
    }
    return 1;
}
