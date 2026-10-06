typedef struct {
    int a;
    int b;
} pair_0206e1e8_t;

extern pair_0206e1e8_t data_0219ef34;
extern int func_0206e174(void);

int func_0206e1e8(int a, int b) {
    if (func_0206e174() == 0) {
        return -0x27;
    }
    data_0219ef34.a = a;
    data_0219ef34.b = b;
    return 0;
}
