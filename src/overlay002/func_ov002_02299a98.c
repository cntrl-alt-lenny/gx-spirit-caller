struct State524 {
    int pad[2];
    int step;
};

struct Data16c {
    char pad[0xcec];
    void *obj;
};

extern struct State524 data_ov002_022cd524;
extern struct Data16c data_ov002_022d016c;

extern int func_ov002_022974bc(void *obj, int a);
extern int func_ov002_02297d68(void *obj);
extern int func_ov002_0229979c(void *obj, int a, int b);

int func_ov002_02299a98(void)
{
    void *obj = data_ov002_022d016c.obj;
    int i;

    switch (data_ov002_022cd524.step) {
    case 0:
        if (func_ov002_022974bc(obj, 1)) {
            return 0;
        }
        data_ov002_022cd524.step++;
    case 1:
        if (func_ov002_02297d68(obj)) {
            return 0;
        }
        data_ov002_022cd524.step++;
    case 2:
        for (i = 0; i <= 4; i++) {
            if (func_ov002_0229979c(obj, i, 1)) {
                return 0;
            }
        }
        return 1;
    default:
        return 1;
    }
}
