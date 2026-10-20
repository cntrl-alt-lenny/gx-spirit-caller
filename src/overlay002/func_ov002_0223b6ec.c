struct S {
    char pad[0x69c];
    int f69c, f6a0, f6a4, f6a8, f6ac, f6b0;
    int f6b4[5];
};
struct Entry { char pad[0x40]; unsigned int flags; };
extern struct S data_ov002_022ce288;
extern int data_ov002_022ce93c[];
extern char data_ov002_022cf16c[];
extern int func_ov002_0223b430(int arg0, int arg1, int arg2);
extern int func_ov002_021b9ecc(int arg0, int arg1);
extern int func_020315e8(int arg0);
int func_ov002_0223b6ec(int arg0, int arg1, int arg2)
{
    int i;
    int last = -1;
    int count = 0;
    int extra = 0;
    int key = data_ov002_022ce288.f69c;
    int n = data_ov002_022ce288.f6a4;
    int value;
    struct Entry *p;
    if (key == 0x1a4e && arg2 == 2) {
        n = 2;
        data_ov002_022ce288.f6b4[1] = 7;
    }
    for (i = 0; i < n; i++) {
        value = data_ov002_022ce288.f6b4[i];
        if (func_ov002_0223b430(value, arg0, arg1)) {
            last = i;
            count++;
        } else if (value > 0x14 && data_ov002_022ce288.f6b0 == 0) {
            if (func_020315e8(func_ov002_021b9ecc(arg0, arg1))) {
                p = (struct Entry *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + arg1 * 0x14);
                if (((p->flags >> 6) & 1) == 0) {
                    last = i;
                    count++;
                    extra++;
                }
            }
        }
    }
    if (count != 0) {
        if (arg2 != 0) {
            if (count > 1) {
                data_ov002_022ce288.f6a8++;
                if (count == extra) data_ov002_022ce288.f6b0 = 1;
            } else {
                data_ov002_022ce93c[last] = 0;
                if (extra != 0) data_ov002_022ce288.f6b0 = 1;
            }
        }
        return 1;
    }
    return 0;
}
