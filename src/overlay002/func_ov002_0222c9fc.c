extern int data_ov002_022d016c[];
extern int func_ov002_0225764c(void *self, int a, int b);
extern int func_ov002_021d6808(void *self, int player, int idx, int arg3, int arg4);

int func_ov002_0222c9fc(void *self) {
    int p;
    int j;
    int i;

    for (i = 0; i < 2; i++) {
        p = *(int *)((char *)data_ov002_022d016c + 0xcec) ^ i;
        for (j = 0; j <= 4; j++) {
            if (func_ov002_0225764c(self, p, j) != 0) {
                func_ov002_021d6808(self, p, j, 0, 1);
            }
        }
    }
    return 0;
}
