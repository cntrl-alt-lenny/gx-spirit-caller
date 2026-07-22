typedef struct {
    char pad[0x4];
    short field4;
} Struct0219b2e0;

extern Struct0219b2e0 data_0219b2e0;
extern int data_0219b344[];

int func_02037b04(void) {
    int idx = data_0219b2e0.field4;
    int v;
    if (idx < 0) {
        goto ret0;
    }
    v = data_0219b344[idx];
    if (v != 0) {
        return v;
    }
ret0:
    return 0;
}
