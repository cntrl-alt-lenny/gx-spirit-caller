typedef int (*StepFn)(int);

struct DuelState {
    char pad[0xd2c];
    int step;
    int sub;
};

extern struct DuelState data_ov002_022d016c;
extern StepFn data_ov002_022cb96c[];

int func_ov002_022627ac(int a)
{
    StepFn fn = data_ov002_022cb96c[data_ov002_022d016c.step];
    if (fn != 0) {
        if (fn(a)) {
            data_ov002_022d016c.sub = 0;
            data_ov002_022d016c.step = data_ov002_022d016c.step + 1;
        }
        return 0;
    }
    return 1;
}
