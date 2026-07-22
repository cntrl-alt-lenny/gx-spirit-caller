typedef struct {
    char pad[0x9c];
    unsigned int field_9c;
} T_020821e4;

extern T_020821e4 data_021a18b8;

void func_020821e4(int a0, int a1, int a2, int a3, int s0, int s1) {
    data_021a18b8.field_9c = a0 | (a1 << 4) | (a2 << 6) | s1 | (a3 << 24) | (s0 << 16);
}
