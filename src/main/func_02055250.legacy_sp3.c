extern int func_0206e9b0(void *self, int prop, int value);

int func_02055250(void *self, int flag) {
    int cur = func_0206e9b0(self, 3, 0);
    int newval = flag ? (cur & ~4) : (cur | 4);
    return func_0206e9b0(self, 4, newval) == 0;
}
