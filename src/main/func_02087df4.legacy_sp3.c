typedef struct {
    unsigned char pad[0x3c];
    unsigned char field_3c;
} Inner_02087df4;

typedef struct {
    Inner_02087df4 *inner;
} Outer_02087df4;

extern short data_020c31f8[];
extern void func_020951a8(int, int, int);

void func_02087df4(Outer_02087df4 *p, int a1, int a2) {
    Inner_02087df4 *inner = p->inner;
    if (inner == 0) {
        return;
    }
    func_020951a8(inner->field_3c, a1, data_020c31f8[a2]);
}
