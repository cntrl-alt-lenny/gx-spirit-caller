typedef struct {
    char pad[0x54];
    int a;
    int b;
} T_02097238;

void func_02097238(T_02097238 *p, int a, int b) {
    if (b == 0) {
        a = 0;
    } else if (a == 0) {
        b = 0;
    }
    p->a = a;
    p->b = b;
}
