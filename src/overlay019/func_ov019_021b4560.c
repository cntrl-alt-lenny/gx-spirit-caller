/* func_ov019_021b4560: stop the two render tasks in data_b6834. For each live
 * handle, quiesce the engine (func_0208f458), retarget the job (func_0208f3e4
 * at handle+0x28), resume (func_0208f38c), run it locked once, and clear the
 * slot. The first slot retargets with (0x200,0x200), the second with (0,0x200).
 */

extern void func_0208f458(void);
extern void func_0208f3e4(int a, int b, int c);
extern void func_0208f38c(void);
extern void Task_InvokeLocked(int h);
extern char data_ov019_021b6834[];

void func_ov019_021b4560(void) {
    if (*(int *)data_ov019_021b6834 != 0) {
        func_0208f458();
        func_0208f3e4(*(int *)data_ov019_021b6834 + 0x28, 0x200, 0x200);
        func_0208f38c();
        Task_InvokeLocked(*(int *)data_ov019_021b6834);
        *(int *)data_ov019_021b6834 = 0;
    }
    if (*(int *)(data_ov019_021b6834 + 4) != 0) {
        func_0208f458();
        func_0208f3e4(*(int *)(data_ov019_021b6834 + 4) + 0x28, 0, 0x200);
        func_0208f38c();
        Task_InvokeLocked(*(int *)(data_ov019_021b6834 + 4));
        *(int *)(data_ov019_021b6834 + 4) = 0;
    }
}
