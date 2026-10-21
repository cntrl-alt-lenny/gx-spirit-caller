extern void Task_InvokeLocked(void *p);
extern void func_0208f38c(void);
extern void func_0208f3e4(void *a, int b, int n);
extern void func_0208f458(void);
extern char *data_ov017_021b877c[];
void func_ov017_021b6774(void) {
    int i;
    int slot;
    for (i = 0; i < 3; i++) {
        switch (i) {
        case 0: slot = 2; break;
        case 1: slot = 3; break;
        case 2: slot = 4; break;
        }
        if (data_ov017_021b877c[i]) {
            func_0208f458();
            func_0208f3e4(data_ov017_021b877c[i] + 0x28, slot << 9, 0x200);
            func_0208f38c();
            Task_InvokeLocked(data_ov017_021b877c[i]);
            data_ov017_021b877c[i] = 0;
        }
    }
}
