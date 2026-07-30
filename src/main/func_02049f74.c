/* func_02049f74: arg0==0 registers a fixed set of codes then walks
 * data_0219dcb4 (154 entries, 12-byte stride) registering each nonzero
 * byte; arg0==1/2/other are no-ops. */
extern unsigned char data_0219dcb4[];
extern void func_02067328(void *a, int b);

void func_02049f74(int arg0, void *arg1)
{
    switch (arg0) {
    case 0: {
        unsigned char *p;
        int i;

        func_02067328(arg1, 0x8);
        func_02067328(arg1, 0xa);
        func_02067328(arg1, 0x32);
        func_02067328(arg1, 0x33);
        func_02067328(arg1, 0x34);
        func_02067328(arg1, 0x35);
        func_02067328(arg1, 0x36);

        p = data_0219dcb4;
        for (i = 0; i < 0x9a; i++) {
            if (*p != 0) {
                func_02067328(arg1, *p);
            }
            p += 0xc;
        }
        return;
    }
    case 1:
        return;
    case 2:
        return;
    }
}
