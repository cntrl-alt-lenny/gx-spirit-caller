extern int func_02098228(void *self, int a1, int a2, void *buf);
extern int func_02097e5c(void *self, void *buf);

int func_02097e18(void *self, int a1) {
    int buf[4];
    if (func_02098228(self, a1, 0, buf) == 0) {
        return 0;
    }
    return func_02097e5c(self, buf);
}
