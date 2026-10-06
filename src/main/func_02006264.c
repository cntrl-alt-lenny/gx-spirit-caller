typedef struct {
    char pad[0x10];
    int f10;
    int f14;
    int f18;
    int f1c;
    unsigned int f20;
    int f24;
    unsigned int flag0 : 1;
    unsigned int flag1 : 1;
    unsigned int rest : 30;
} State_02006264;

extern State_02006264 data_02103d74;
extern int func_020061bc(unsigned int a);

int func_02006264(void) {
    if (data_02103d74.flag1) {
        if (func_020061bc(data_02103d74.f20 & 0x3fffffff) >= 2) {
            int dx = data_02103d74.f1c - data_02103d74.f14;
            int dy = data_02103d74.f18 - data_02103d74.f10;
            if (dy * dy + dx * dx < 100) {
                return 1;
            }
        }
    }
    return 0;
}
