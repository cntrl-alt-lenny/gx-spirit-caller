/* func_ov019_021b4460: stop the two render tasks in data_b6834. For each live
 * handle, quiesce the engine (func_0208f370), retarget the job (func_0208f2fc
 * at handle+0x28), resume (func_0208f2a4), run it locked once, and clear the
 * slot. The first slot retargets with (0x200,0x200), the second with (0,0x200).
 */

extern void func_0208f370(void);
extern void func_0208f2fc(int a, int b, int c);
extern void func_0208f2a4(void);
extern void Task_InvokeLocked(int h);
extern char data_ov019_021b6734[];

void func_ov019_021b4460(void) {
    if (*(int *)data_ov019_021b6734 != 0) {
        func_0208f370();
        func_0208f2fc(*(int *)data_ov019_021b6734 + 0x28, 0x200, 0x200);
        func_0208f2a4();
        Task_InvokeLocked(*(int *)data_ov019_021b6734);
        *(int *)data_ov019_021b6734 = 0;
    }
    if (*(int *)(data_ov019_021b6734 + 4) != 0) {
        func_0208f370();
        func_0208f2fc(*(int *)(data_ov019_021b6734 + 4) + 0x28, 0, 0x200);
        func_0208f2a4();
        Task_InvokeLocked(*(int *)(data_ov019_021b6734 + 4));
        *(int *)(data_ov019_021b6734 + 4) = 0;
    }
}
