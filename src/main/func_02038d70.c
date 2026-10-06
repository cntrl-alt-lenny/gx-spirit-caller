typedef struct {
    char pad[0x4];
    int field4;
    char pad2[0x5c - 0x8];
} Elem02038dac;

extern Elem02038dac data_0219c4e8[];
extern Elem02038dac data_0219d068[];

Elem02038dac *func_02038d70(Elem02038dac *p) {
    if (p == 0) {
        p = data_0219c4e8;
    } else {
        p++;
    }
    for (;;) {
        if (p >= data_0219d068) {
            break;
        }
        if (p->field4 != 0) {
            return p;
        }
        p++;
    }
    return 0;
}
