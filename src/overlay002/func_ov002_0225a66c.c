extern void func_ov002_0225a578(void *);
extern int func_020a7440(unsigned char *, unsigned char *, int);
extern int func_ov002_021be384(int, int, int);
extern int func_ov002_021be2d8(int, int, int);
/* Original caller supplies an extra index argument. */
extern int func_ov002_021c031c(int, int);
extern int func_ov002_021c034c(int, int, int);
extern int func_ov002_021bf294(int, int, int, int, int);
extern int func_ov002_021b3ecc(int, int, int);
extern void func_ov002_021d479c(unsigned short, unsigned short, unsigned short, unsigned short);
extern int func_ov002_0229ade0(int, int, int, int);
extern void func_ov002_021e2d94(int, int, int, int);
typedef struct { int f0, f4, f8; int padc[3]; int f18, f1c, f20; char pad24[0xc8]; int fec, ff0; } State;
extern State data_ov002_022cd3f4;
typedef struct { char pad[0xd2c]; int fd2c, fd30; } Control;
extern Control data_ov002_022d016c;
extern unsigned char data_ov002_022cd4e0[];
#define D(o) (*(int *)((unsigned char *)&data_ov002_022cd3f4 + (o)))
#define S(o) (*(int *)((unsigned char *)&data_ov002_022d016c + (o)))
int func_ov002_0225a66c(void) {
    int buf[17];
    int failed = 0;
    func_ov002_0225a578(buf);
    if (data_ov002_022cd3f4.fec != buf[0] || data_ov002_022cd3f4.ff0 != buf[1]) {
        data_ov002_022cd3f4.f8 = 0;
        data_ov002_022d016c.fd30 = 0;
        data_ov002_022d016c.fd2c = 1;
        return 1;
    }
    if (func_ov002_021be384(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c, 0) == 0) failed = 1;
    if (func_020a7440(data_ov002_022cd4e0, (unsigned char *)buf, 0x44) != 0) failed = 1;
    if (data_ov002_022cd3f4.f8 != 0) {
        if (func_ov002_021c031c(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c) == 0) {
            if (func_ov002_021c034c(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c, 1) == 0) failed = 1;
        }
    } else {
        if (func_ov002_021bf294(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c, data_ov002_022cd3f4.f4, data_ov002_022cd3f4.f20, 0) == 0) failed = 1;
    }
    if (func_ov002_021b3ecc(data_ov002_022cd3f4.f4, 0xb, 0x177a) != 0) failed = 1;
    if (failed != 0) {
        if (func_ov002_021be2d8(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c, 0) == 0) {
            func_ov002_021d479c((unsigned short)((data_ov002_022cd3f4.f0 != 0 ? 0x8000 : 0) | 0x1b), (unsigned short)data_ov002_022cd3f4.f1c, 1, 0);
            data_ov002_022cd3f4.f8 = 0;
            data_ov002_022d016c.fd30 = 0;
            data_ov002_022d016c.fd2c = 1;
            return 1;
        } else {
            data_ov002_022cd3f4.f8 = 0;
            data_ov002_022d016c.fd30 = 0;
            data_ov002_022d016c.fd2c = 2;
            data_ov002_022cd3f4.f18 = 1;
            func_ov002_0229ade0(0xb, data_ov002_022cd3f4.f1c, 1 - data_ov002_022cd3f4.f0, -1);
            func_ov002_021e2d94(data_ov002_022cd3f4.f0, data_ov002_022cd3f4.f1c, 0x15, 1);
            return 1;
        }
    }
    return 0;
}

