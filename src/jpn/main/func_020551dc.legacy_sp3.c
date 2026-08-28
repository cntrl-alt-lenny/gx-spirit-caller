extern int func_0206e93c(void *self, int prop, int value);

int func_020551dc(void *self, int flag) {
    int cur = func_0206e93c(self, 3, 0);
    int newval = flag ? (cur & ~4) : (cur | 4);
    return func_0206e93c(self, 4, newval) == 0;
}
