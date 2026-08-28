extern int func_02098134(void *self, int a1, int a2, void *buf);
extern int func_02097d68(void *self, void *buf);

int func_02097d24(void *self, int a1) {
    int buf[4];
    if (func_02098134(self, a1, 0, buf) == 0) {
        return 0;
    }
    return func_02097d68(self, buf);
}
