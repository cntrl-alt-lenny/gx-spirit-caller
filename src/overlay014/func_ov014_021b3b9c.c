/* func_ov014_021b3b9c: for i in 0,1: if data_ov014_022350e0[i] is set,
 * reset it via func_0208f458/f3e4/f38c + Task_InvokeLocked, then clear
 * the slot. mode is a per-iteration constant selected by a small
 * switch (0 for i==0, 1 for i==1) rather than derived from i directly.
 */

extern void func_0208f458(void);
extern void func_0208f3e4(void *p, int b, int c);
extern void func_0208f38c(void);
extern void Task_InvokeLocked(void *p);
extern void *data_ov014_022350e0[];

void func_ov014_021b3b9c(void) {
    int i;
    for (i = 0; i < 2; i++) {
        int mode;
        switch (i) {
        case 0: mode = 0; break;
        case 1: mode = 1; break;
        }
        if (data_ov014_022350e0[i] != 0) {
            func_0208f458();
            func_0208f3e4((char *)data_ov014_022350e0[i] + 0x28, mode << 9, 0x200);
            func_0208f38c();
            Task_InvokeLocked(data_ov014_022350e0[i]);
            data_ov014_022350e0[i] = 0;
        }
    }
}
