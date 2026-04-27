/* func_020341a4: minimal pass-through thunk to Task_InvokeLocked. */

extern void Task_InvokeLocked(void *p);

void func_020341a4(void *p) {
    Task_InvokeLocked(p);
}
