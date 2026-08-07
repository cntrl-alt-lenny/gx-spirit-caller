/* func_0203e95c: sp3-tier (no r3-spill, sub sp,#4, pop{regs,pc}
 * single-step). Allocates a 0x10-byte object, then per mode (3/4/5)
 * fetches a position pair via func_02092fc8 (returned in r0:r1) and
 * dispatches func_0203e384 with mode-specific offsets/table lookups.
 */

extern void *func_0203c8b0(int size);
extern long long func_02092fc8(void);
extern int func_0203e384(void *a, void *b, int c, int d);
extern char data_020bee1c[];

void func_0203e95c(int mode) {
    char *obj = (char *)func_0203c8b0(0x10);

    switch (mode) {
    case 3: {
        long long v = func_02092fc8();
        signed char sb;
        *(int *)(obj + 0xcb0) = (int)v;
        *(int *)(obj + 0xcb4) = (int)(v >> 32);
        sb = *(signed char *)(obj + 0xd00 + 0x11);
        func_0203e384(data_020bee1c + 0x10, data_020bee1c + 0x18, sb, 0x200000);
        break;
    }
    case 4: {
        long long v = func_02092fc8();
        unsigned char idx;
        int ip;
        unsigned short h;
        *(int *)(obj + 0xcb0) = (int)v;
        *(int *)(obj + 0xcb4) = (int)(v >> 32);
        idx = *(unsigned char *)(obj + 0xd0f);
        ip = idx * 0xc0;
        h = *(unsigned short *)(obj + ip + 0x4a6);
        func_0203e384(obj + 0x474 + ip, obj + 0x47c + ip, h - 1, 0x300000);
        break;
    }
    case 5: {
        long long v = func_02092fc8();
        unsigned char idx;
        signed char sb;
        *(int *)(obj + 0xcb0) = (int)v;
        *(int *)(obj + 0xcb4) = (int)(v >> 32);
        idx = *(unsigned char *)(obj + 0xd0f);
        sb = *(signed char *)(obj + 0xd00 + 0x11);
        func_0203e384(data_020bee1c + 0x10, obj + 0x304 + idx * 0x24, sb, 0x300000);
        break;
    }
    }
}
