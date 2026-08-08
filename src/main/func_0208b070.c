struct Func0208b0a4Self { int f0; int f4; int f8; int f12; };

extern int func_020b3870(int a, int b);

int func_0208b070(struct Func0208b0a4Self *self) {
    int total = self->f12;
    int cur = self->f8;
    int start;
    if (cur >= total) {
        return self->f4;
    }
    start = self->f0;
    return start + func_020b3870(cur * (self->f4 - start), total);
}
