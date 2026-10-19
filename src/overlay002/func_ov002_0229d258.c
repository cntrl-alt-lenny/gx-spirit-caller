extern short data_020bff80[];
extern short data_020c1f80[];
extern char data_ov002_022d0f98[];
extern int data_ov002_022d100c[];
/* The existing definition uses (void), but its body consumes r0, r1 and r2. */
extern void func_0208b0fc();
extern int func_0207ef90(void *arg0, int *arg1);

void func_ov002_0229d258(void) {
    int matrix[4];
    func_0208b0fc(matrix, data_020bff80[0], data_020bff80[1]);
    data_ov002_022d100c[0] = func_0207ef90(data_ov002_022d0f98, matrix);
    func_0208b0fc(matrix, data_020c1f80[0], data_020c1f80[1]);
    data_ov002_022d100c[1] = func_0207ef90(data_ov002_022d0f98, matrix);
}
