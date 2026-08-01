struct Item1 {
    char _pad[8];
    int field_8;
    char _pad2[0x20 - 0xc];
};

struct Item2 {
    int field_0;
    char _pad[0xc - 4];
};

struct Arg {
    char _pad0[0x18];
    struct Item1 *field_18;
    struct Item2 *field_1c;
    char _pad1[4];
    int field_24;
    int field_28;
    char _pad2[0x26c - 0x2c];
    int field_26c;
    int field_270;
};

extern int  func_0200fbd4(struct Item1 *item);
extern int  func_0200fd84(struct Item2 *item);
extern void func_02010040(void *item, int result, int flag);

int func_020109a8(struct Arg *arg0) {
    if (arg0 == 0) return 0;

    if (arg0->field_18 != 0) {
        int i = 0;
        if (arg0->field_24 > 0) {
            struct Item1 *item = arg0->field_18;
            do {
                if (item->field_8 != 0 && !(arg0->field_26c & (1 << i))) {
                    int result = func_0200fbd4(item);
                    if (result != 0) {
                        func_02010040(item, result, 0);
                    }
                }
                i++;
                item++;
            } while (i < arg0->field_24);
        }
    }

    if (arg0->field_1c != 0) {
        struct Item2 *item = arg0->field_1c;
        int j = 0;
        if (arg0->field_28 > 0) {
            do {
                if (item->field_0 != 0 && !(arg0->field_270 & (1 << j))) {
                    int result = func_0200fd84(item);
                    if (result != 0) {
                        func_02010040(item, result, 1);
                    }
                }
                j++;
                item++;
            } while (j < arg0->field_28);
        }
    }

    return 1;
}
