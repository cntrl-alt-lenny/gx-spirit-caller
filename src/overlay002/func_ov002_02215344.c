/* func_ov002_02215344: nested loop (j:0..1, i:0..4), both calls in the
 * inner body. The "start" and "a" values the disassembly carries in
 * callee-saved regs never change from 0 across the whole function. */
extern int func_ov002_0225764c(int arg0, int j, int i);
extern void func_ov002_021d5a08(int arg0, int j, int i, int f0, int two, int a);

int func_ov002_02215344(void *arg0) {
    int j;
    for (j = 0; j < 2; j++) {
        int i;
        for (i = 0; i < 5; i++) {
            if (func_ov002_0225764c((int)arg0, j, i) != 0) {
                unsigned short f0 = *(unsigned short *)arg0;
                func_ov002_021d5a08((int)arg0, j, i, f0, 2, 0);
            }
        }
    }
    return 0;
}
