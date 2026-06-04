/* func_ov019_021b49bc: scene-B teardown. Sync the engine (func_020058b4), then
 * for each of the two staged edits (at +0x54 and +0xb0) flush it via
 * func_0201ef3c and clear its pending/dirty pair; after each, if the matching
 * task handle in data_b6834 is live, run it locked. Returns 1.
 */

extern void func_020058b4(void);
extern void func_0201ef3c(int handle, void *dst, void *src);
extern void Task_InvokeLocked(int h);
extern char data_ov019_021b6834[];

int func_ov019_021b49bc(char *a0) {
    func_020058b4();
    if (*(int *)(a0 + 0x54) != 0) {
        func_0201ef3c(*(int *)(a0 + 0x0), a0 + 0x8, a0 + 0x54);
        *(int *)(a0 + 0x58) = 0;
        *(int *)(a0 + 0x54) = 0;
    }
    if (*(int *)data_ov019_021b6834 != 0) {
        Task_InvokeLocked(*(int *)data_ov019_021b6834);
    }
    if (*(int *)(a0 + 0xb0) != 0) {
        func_0201ef3c(*(int *)(a0 + 0x5c), a0 + 0x64, a0 + 0xb0);
        *(int *)(a0 + 0xb4) = 0;
        *(int *)(a0 + 0xb0) = 0;
    }
    if (*(int *)(data_ov019_021b6834 + 4) != 0) {
        Task_InvokeLocked(*(int *)(data_ov019_021b6834 + 4));
    }
    return 1;
}
