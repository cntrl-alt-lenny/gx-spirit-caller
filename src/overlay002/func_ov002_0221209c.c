extern struct { char _pad[0xcec]; int f_cec; } data_ov002_022d016c;
extern int func_ov002_0225764c(void *a, int b, int c);
extern void func_ov002_021d63fc(void *a, int b, int c, int d);

int func_ov002_0221209c(void *a) {
    int i;
    int x;
    int j;
    for (i = 0; i < 2; i++) {
        x = data_ov002_022d016c.f_cec ^ i;
        for (j = 0; j <= 10; j++) {
            if (func_ov002_0225764c(a, x, j)) {
                func_ov002_021d63fc(a, x, j, 1);
            }
        }
    }
    return 0;
}
