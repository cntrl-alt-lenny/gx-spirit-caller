typedef struct {
    char pad[0x810];
    unsigned short stride;
} Grid;

extern int func_020a66a4(int v);

int func_0209f8c8(Grid *g, int a1, int a2, int bits) {
    return g->stride * func_020a66a4(a1 & ((1 << bits) - 1)) + a2;
}
