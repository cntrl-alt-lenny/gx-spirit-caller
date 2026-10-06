extern int data_02102d04[][2];
extern char *data_020c3cc8[];
extern int data_020b46e0[][2];
extern void func_02001ba4(void);
extern int func_02006c0c(char *buf, int a, int b);
extern int OS_SPrintf(char *buf, const char *fmt, ...);

void func_020018d4(int mask) {
    char buf[32];
    int i;
    int j;
    int idx;
    int r;

    func_02001ba4();
    for (i = 0; i < 9; i++) {
        if ((mask >> i) & 1) {
            for (j = 0; j < 2; j++) {
                idx = 0;
                if (i >= 5) {
                    idx = 1;
                }
                OS_SPrintf(buf, data_020c3cc8[idx], data_020b46e0[i][j]);
                r = func_02006c0c(buf, 4, 2);
                if (r != 0) {
                    data_02102d04[i][j] = r;
                }
            }
        }
    }
}
