/* func_02049f00: arg0==0 registers a fixed set of codes then walks
 * data_0219dbd4 (154 entries, 12-byte stride) registering each nonzero
 * byte; arg0==1/2/other are no-ops. */
extern unsigned char data_0219dbd4[];
extern void func_020672b4(void *a, int b);

void func_02049f00(int arg0, void *arg1)
{
    switch (arg0) {
    case 0: {
        unsigned char *p;
        int i;

        func_020672b4(arg1, 0x8);
        func_020672b4(arg1, 0xa);
        func_020672b4(arg1, 0x32);
        func_020672b4(arg1, 0x33);
        func_020672b4(arg1, 0x34);
        func_020672b4(arg1, 0x35);
        func_020672b4(arg1, 0x36);

        p = data_0219dbd4;
        for (i = 0; i < 0x9a; i++) {
            if (*p != 0) {
                func_020672b4(arg1, *p);
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
