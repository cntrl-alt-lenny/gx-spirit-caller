typedef struct {
    char pad[0x4];
    int field4;
    char pad2[0x5c - 0x8];
} Elem02038dac;

extern Elem02038dac data_0219d00c[];

Elem02038dac *func_02038dac(int arg0) {
    int i;
    Elem02038dac *p = data_0219d00c;
    for (i = 0x1f; i >= 0; i--) {
        if (p->field4 == arg0) {
            return p;
        }
        p--;
    }
    return 0;
}
