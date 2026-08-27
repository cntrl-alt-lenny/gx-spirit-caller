/* func_ov016_021b75ac: sibling of func_ov014_021b3a9c with 5 iterations
 * instead of 2. mode is selected via an explicit 5-case switch (compiles
 * to a jump table + range check) even though it always equals i.
 */

extern void func_0208f370(void);
extern void func_0208f2fc(void *p, int b, int c);
extern void func_0208f2a4(void);
extern void Task_InvokeLocked(void *p);
extern void *data_ov016_021bb050[];

void func_ov016_021b75ac(void) {
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
        if (data_ov016_021bb050[i] != 0) {
            func_0208f370();
            func_0208f2fc((char *)data_ov016_021bb050[i] + 0x28, mode << 9, 0x200);
            func_0208f2a4();
            Task_InvokeLocked(data_ov016_021bb050[i]);
            data_ov016_021bb050[i] = 0;
        }
    }
}
