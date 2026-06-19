/* func_ov019_021b48a8: scene-B teardown. Sync the engine (func_02005898), then
 * for each of the two staged edits (at +0x54 and +0xb0) flush it via
 * func_0201eee8 and clear its pending/dirty pair; after each, if the matching
 * task handle in data_b6834 is live, run it locked. Returns 1.
 */

extern void func_02005898(void);
extern void func_0201eee8(int handle, void *dst, void *src);
extern void Task_InvokeLocked(int h);
extern char data_ov019_021b6734[];

int func_ov019_021b48a8(char *a0) {
    func_02005898();
    if (*(int *)(a0 + 0x54) != 0) {
        func_0201eee8(*(int *)(a0 + 0x0), a0 + 0x8, a0 + 0x54);
        *(int *)(a0 + 0x58) = 0;
        *(int *)(a0 + 0x54) = 0;
    }
    if (*(int *)data_ov019_021b6734 != 0) {
        Task_InvokeLocked(*(int *)data_ov019_021b6734);
    }
    if (*(int *)(a0 + 0xb0) != 0) {
        func_0201eee8(*(int *)(a0 + 0x5c), a0 + 0x64, a0 + 0xb0);
        *(int *)(a0 + 0xb4) = 0;
        *(int *)(a0 + 0xb0) = 0;
    }
    if (*(int *)(data_ov019_021b6734 + 4) != 0) {
        Task_InvokeLocked(*(int *)(data_ov019_021b6734 + 4));
    }
    return 1;
}
