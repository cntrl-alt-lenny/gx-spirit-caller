struct Ov002Side {
    unsigned short pad0;
    unsigned short side : 1;
};

extern unsigned data_ov002_022cd524[];
extern int func_ov002_022575c8(void *a, int b, int c);
extern int func_ov002_021c84a8(int a, int b);

int func_ov002_02291798(struct Ov002Side *arg0) {
    int i;

    for (i = 0; i <= 4; i++) {
        if (func_ov002_022575c8(arg0, arg0->side, i) != 0 && data_ov002_022cd524[121 + i] > 1) {
            if (func_ov002_021c84a8(arg0->side, i) != 0)
                return 1;
        }
    }
    return 0;
}
