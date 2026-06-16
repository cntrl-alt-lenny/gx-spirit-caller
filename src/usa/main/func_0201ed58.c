/* func_0201ed58: family 2 sibling (helper2 = func_0207e608). */
extern int func_0201ecd4(int arg1);
extern int func_0207e608(int h, int arg0);
extern void Task_InvokeLocked(int h);

int func_0201ed58(int arg0, int arg1) {
    int h = func_0201ecd4(arg1);
    if (h != 0) {
        if (func_0207e608(h, arg0) != 0) return h;
        Task_InvokeLocked(h);
    }
    return 0;
}
