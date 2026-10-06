typedef struct Obj {
    char           _pad_00[0xb0];
    unsigned short fb0;
    char           _pad_b2[0xc4 - 0xb2];
} Obj;

extern int data_0219b36c;
extern Obj data_0219d388[];
extern int func_0203b830(Obj *p);
extern void func_020927b8(void *mutex);
extern void func_02092748(void *mutex);

int func_0203c3dc(void) {
    int i;
    int min;
    int count;
    Obj *o = data_0219d388;
    int r;

    func_020927b8(&data_0219b36c);
    count = 0;
    min = 0x10000;
    for (i = 0; i < 8; i++, o++) {
        if (o->fb0 & 0x8000) {
            r = func_0203b830(o);
            if (r < min) {
                min = r;
            }
            count++;
        }
    }
    func_02092748(&data_0219b36c);
    if (count == 0) {
        return 0;
    }
    if (min <= 0) {
        return 4;
    }
    if (min > 4) {
        return 1;
    }
    if (min > 2) {
        return 2;
    }
    return 3;
}
