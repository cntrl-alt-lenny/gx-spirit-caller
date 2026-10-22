typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
extern u8 *func_0206f45c(u8 *p);
extern int func_0207039c(void);
extern unsigned int func_02070430(int a, int b);
extern void func_0207092c(int a);
extern int func_02070a38(int *out);
extern void func_0207445c(void);
extern unsigned long long func_020930b0(void);
extern void func_02094688(const void *src, void *dst, u32 len);
extern int (*data_0219ef14)(void);
typedef struct { u16 id, flags, qd, an, ns, ar; u8 name[48]; } Packet;
int func_0206f1a4(u8 *name, int type, int id, void *out, u32 capacity)
{
    Packet query;
    int len;
    u8 *label, *p;

    u8 c;
    int i;
    int result;
    u32 start;
    u8 *end;
    query.id = (id >> 8) | (id << 8);
    if (type != 0x20) query.flags = 1; else query.flags = 0x1001;
    query.qd = 0x100;
    query.an = 0;
    query.ns = 0;
    query.ar = 0;
    len = 0;
    label = query.name;
    c = *name++;
    p = label + 1;
    while (c != 0) {
        if (c != '.') {
            if (p - (u8 *)&query >= 60) return -1;
            *p++ = c;
            len++;
        } else {
            *label = len;
            label = p;
            len = 0;
            p++;
        }
        c = *name++;
    }
    *label = len;
    p[0] = 0;
    p[1] = (u32)type >> 8;
    p[2] = type;
    p[3] = 0;
    p[4] = 1;
    func_02070430((int)&query, p + 5 - (u8 *)&query);
    result = 0;
    start = func_020930b0() >> 16;
    while (data_0219ef14() != 0 && result == 0 && (int)((u32)(func_020930b0() >> 16) - start) < 15) {
        if (func_0207039c() == 0) {
            func_0207445c();
        } else {
            u8 *q = (u8 *)func_02070a38(&len);
            if ((u32)len > 12 && id == (u16)((*(u16 *)q >> 8) | (*(u16 *)q << 8))) {
                int code = q[3] & 15;
                if (code == 3) result = -1;
                else if (code == 0) {
                    end = q + len;
                    u16 n = (q[4] << 8) | q[5];

                    q += 12;
                    for (i = n; i-- != 0;) {
                        q = func_0206f45c(q) + 4;

                    }
                    while (q < end) {
                        u16 size;
                        q = func_0206f45c(q);
                        size = (q[8] << 8) | q[9];
                        if (type == (u16)((q[0] << 8) | q[1])) {
                            if (type != 12) {
                                u8 *a = q + 6;
                                u16 hi = (a[size] << 8) | (a + size)[1];
                                u8 *b = q + 8;
                                u16 lo = (b[size] << 8) | (b + size)[1];
                                result = (hi << 16) | lo;
                            } else if (size <= capacity) {
                                func_02094688(q + 10, out, size);
                                result = 1;
                            } else result = 2;
                            break;
                        }
                        q += size + 10;
                    }
                }
            }
            func_0207092c(len);
        }
    }
    return result;
}







