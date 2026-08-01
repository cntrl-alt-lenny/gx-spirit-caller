/* func_0200195c: for each set bit i (0..8) of flags, for each column j
 * (0..1): if data_02102c24[i][j] is still unassigned (0), sprintf into a
 * stack buffer with data_020c3bf0[i>=5] as the format and
 * data_020b45ec[i][j] as the value, call func_02006ed4(buf, offset,
 * arg2), record the running offset into data_02102c24[i][j], then round
 * offset up to the next multiple of 4 after adding the call's result + 3.
 */
extern void OS_SPrintf(void *out, void *a, int b);
extern int func_02006ed4(void *buf, int a, int b);
extern void *data_020c3bf0[2];
extern int data_02102c24[9][2];
extern int data_020b45ec[9][2];

void func_0200195c(int flags, int offset, int arg2)
{
    char buf[32];
    int i, j;

    for (i = 0; i < 9; i++) {
        if ((flags >> i) & 1) {
            for (j = 0; j < 2; j++) {
                int fmtIdx = 0;
                if (i >= 5) {
                    fmtIdx = 1;
                }
                if (data_02102c24[i][j] == 0) {
                    int result;
                    OS_SPrintf(buf, data_020c3bf0[fmtIdx], data_020b45ec[i][j]);
                    result = func_02006ed4(buf, offset, arg2);
                    data_02102c24[i][j] = offset;
                    offset = (offset + result + 3) & ~3;
                }
            }
        }
    }
}
