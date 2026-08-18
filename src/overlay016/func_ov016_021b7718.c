/* func_ov016_021b7718: sibling of func_ov014_021b3b9c with 5 iterations
 * instead of 2. mode is selected via an explicit 5-case switch (compiles
 * to a jump table + range check) even though it always equals i.
 */

extern void func_0208f458(void);
extern void func_0208f3e4(void *p, int b, int c);
extern void func_0208f38c(void);
extern void Task_InvokeLocked(void *p);
extern void *data_ov016_021bb1b0[];

void func_ov016_021b7718(void) {
    int i;
    for (i = 0; i < 5; i++) {
        int mode;
        switch (i) {
        case 0: mode = 0; break;
        case 1: mode = 1; break;
        case 2: mode = 2; break;
        case 3: mode = 3; break;
        case 4: mode = 4; break;
        }
        if (data_ov016_021bb1b0[i] != 0) {
            func_0208f458();
            func_0208f3e4((char *)data_ov016_021bb1b0[i] + 0x28, mode << 9, 0x200);
            func_0208f38c();
            Task_InvokeLocked(data_ov016_021bb1b0[i]);
            data_ov016_021bb1b0[i] = 0;
        }
    }
}
