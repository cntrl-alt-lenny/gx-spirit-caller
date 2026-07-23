typedef struct {
    unsigned char pad[0x3c];
    unsigned char field_3c;
} Inner_02087df4;

typedef struct {
    Inner_02087df4 *inner;
} Outer_02087df4;

extern short data_020c3104[];
extern void func_020950b4(int, int, int);

void func_02087d0c(Outer_02087df4 *p, int a1, int a2) {
    Inner_02087df4 *inner = p->inner;
    if (inner == 0) {
        return;
    }
    func_020950b4(inner->field_3c, a1, data_020c3104[a2]);
}
