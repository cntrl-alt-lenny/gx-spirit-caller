typedef struct {
    char pad[0x16];
    unsigned short h_16;
} state_021a8d2c_h16_t;

extern state_021a8d2c_h16_t *data_021a8c4c;
extern int func_0209de04(int a0, int a1, int flags);

int func_0209dffc(int a0, int a1) {
    int result = func_0209de04(a0, a1, 0xf00);
    if (result == 0) {
        data_021a8c4c->h_16 = 0;
    }
    return result;
}
