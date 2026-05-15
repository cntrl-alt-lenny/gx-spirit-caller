/* func_02034154: minimal pass-through thunk to Task_InvokeLocked. */

extern void Task_InvokeLocked(void *p);

void func_02034154(void *p) {
    Task_InvokeLocked(p);
}
