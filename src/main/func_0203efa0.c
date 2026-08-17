typedef struct {
    unsigned char _lo4 : 4;
    unsigned char field : 2;
    unsigned char _hi2 : 2;
} bf_d0c_t;

extern int func_0206eb08(void);
extern void func_0203eca4(void *self);
extern unsigned long long func_020930b0(void);
extern unsigned long long func_020b3808(unsigned long long value, unsigned int k, int flag);

int func_0203efa0(char *self) {
    if (func_0206eb08()) {
        func_0203eca4(self);
        return (((bf_d0c_t *)(self + 0xd0c))->field == 1) ? 0xf : 0xd;
    } else {
        unsigned long long diff = func_020930b0() - *(unsigned long long *)(self + 0xcb0);
        unsigned long long r = func_020b3808(diff << 6, 0x01ff6210, 0);
        if (r < 10) {
            return 0xc;
        }
        *(unsigned char *)(self + (*(unsigned char *)(self + 0xd13) << 2) + 0x444) = 1;
        return 0xb;
    }
}
