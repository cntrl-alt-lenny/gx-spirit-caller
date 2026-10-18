typedef struct {
    int key;
    int pad[2];
    int (*fn)(int, int, int);
} Entry;

extern Entry data_ov002_022c819c[];
extern int func_ov002_021b40dc(int a, int b, int c, int d);
extern int func_ov002_02259aec(int a, int b, int c);

void func_ov002_02259ee8(int arg0, int arg1, int arg2, int arg3) {
    unsigned i;

    if (arg1 == 0xe && func_ov002_021b40dc(arg0, 0xb, 0x1a04, arg3) != 0) {
        func_ov002_02259aec(arg0, arg2, arg3);
        return;
    }
    for (i = 0; i < 0x1b; i++) {
        if (arg2 == data_ov002_022c819c[i].key) {
            if (data_ov002_022c819c[i].fn(arg0, arg2, arg3) != 0)
                return;
        }
    }
}
