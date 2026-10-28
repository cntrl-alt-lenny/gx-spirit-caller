typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern int func_0207039c(void);
extern void func_0207092c(int);
extern int func_02070a38(int *);
extern int func_02073da0(const unsigned short *, const unsigned short *);
extern void func_0207445c(void);
extern unsigned long long func_020930b0(void);
extern u32 data_0219eee8, data_0219eeec, data_0219eef8, data_0219ef00, data_0219ef18, data_0219ef1c;
extern u32 data_0219ef34[2];
extern u16 data_0219ef2c[];
extern int (*data_0219ef14)(void);
#define BE32(p) (((u32)(u16)(((p)[0] << 8) | (p)[1]) << 16) | (u16)(((p)[2] << 8) | (p)[3]))
int func_0206f688(u32 id, int timeout) {
    int len;
    int result;
    u32 start;
    int limit;
    limit = (timeout + 1) * 15;
    start = func_020930b0() >> 16;
    result = 0;
    while (data_0219ef14() != 0 && result == 0 && (int)((u32)(func_020930b0() >> 16) - start) < limit) {
        if (func_0207039c() == 0) {
            func_0207445c();
        } else {
            u8 *p = (u8 *)func_02070a38(&len);
            if ((u32)len > 0xf0 && p[0] == 2 && id == ((u32)(u16)((*(u16 *)(p+4) >> 8) | (*(u16 *)(p+4) << 8)) << 16 | (u16)((*(u16 *)(p+6) >> 8) | (*(u16 *)(p+6) << 8))) && func_02073da0((u16 *)(p+0x1c), data_0219ef2c) == 0) {
                u8 *end;
                u32 value;
                value = BE32(p+0x10);
                end = p + len;
                result = 3;
                if (p[0xec] == 0x63 && p[0xed] == 0x82 && p[0xee] == 0x53) {
                    u8 *base = p;
                    p += 0xf0;
                    if (base[0xef] == 0x63) {
                    u8 tag;
                    while (p < end && (tag = *p++) != 0xff) {
                        if (tag != 0) {
                        switch (tag) {
                        case 1: data_0219eee8 = BE32(p+1); break;
                        case 3: data_0219eef8 = BE32(p+1); break;
                        case 6:
                            if (*p < 8) data_0219ef34[1] = 0;
                            else data_0219ef34[1] = BE32(p+5);
                            data_0219ef34[0] = BE32(p+1); break;
                        case 0x33: data_0219ef18 = BE32(p+1); break;
                        case 0x35:
                            switch (p[1]) { case 2: result = 1; data_0219ef00 = value; break; case 5: result = 2; data_0219ef1c = value; break; }
                            break;
                        case 0x36: data_0219eeec = BE32(p+1); break;
                        }
                        p += *p + 1;
                        }
                    }
                }
                }
            }
            func_0207092c(len);
        }
    }
    return result;
}















