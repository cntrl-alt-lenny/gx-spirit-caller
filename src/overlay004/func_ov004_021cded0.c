typedef unsigned int u32;
typedef unsigned short u16;
typedef struct {
    u32 resource, unk4, unk8, unkc;
    u16 unk10, unk12;
    unsigned short f14:4, flag14:1, rest14:11;
    u16 f16;
    unsigned px:7, py:7, mode:3, rest18:15;
    unsigned a:8, b:8, rest1c:16;
    u32 unk20, unk24;
} Obj;
struct Ctx {
    char pad0[0x40];
    int f40;
    int f44;
    char pad48[4];
    int f4c;
    char pad50[0x18];
    int cd[4];
};
struct G4f4c {
    unsigned char pad0[4];
    unsigned f4 : 3;
    unsigned rest4 : 29;
    char pad8[0xa34];
    unsigned char b3c_lo : 3;
    unsigned char b3c_hi : 5;
    char pad3d[0x27];
    u32 f64;
};
struct G40ac {
    char pad0[0xba4];
    int f_ba4;
    int fa8;
};
struct G594c {
    char pad0[0x52];
    u16 f52;
    char pad54[4];
    u16 f58;
};
extern struct Ctx data_ov004_0220b500;
extern struct G4f4c data_02104f4c;
extern signed char data_02104c78[];
extern char data_02104c7a[];
extern struct G594c data_0210594c;
extern char data_02105989[];
extern struct G40ac data_021040ac;
extern char data_ov004_02209d08[];
extern char data_ov004_02209d10[];
extern char data_ov004_02209d30[];
extern char data_ov004_02209d4c[];
extern char data_ov004_02209d68[];
extern void func_02001bc8(void *, int, int);
extern void func_02001d68(int);
extern int func_02006b10(char *);
extern int func_02006c0c(char *, int, int);
extern void Task_Invoke(int);
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern int func_0202c0c0(int);
extern int func_02034844(void);
extern int OS_SPrintf(char *, char *, ...);
extern void func_02094550(void *, int, int);
extern int func_020a978c(char *, char *, ...);
extern void func_ov004_021cdd38(int, char *);

void func_ov004_021cded0(int player) {
    char pal[32];
    char name[32];
    char buf[32];
    Obj o;
    struct Ctx *c = &data_ov004_0220b500;
    int r5;
    u32 v;
    int w;
    if (player == 0) {
        func_02001bc8(pal, 0x7fff, 0x1ce7);
        func_02094550(pal, 0x05000300, 0x20);
    }
    if (c->cd[player] > 0) return;
    if (player == 0) {
        func_02001d68(data_02104f4c.b3c_lo);
        func_ov004_021cdd38(0, data_02105989);
    } else {
        func_02001d68(data_02104c78[func_02034844()]);
        func_ov004_021cdd38(1, data_02104c7a + func_02034844() * 0x1a);
    }
    func_02001d68(data_02104f4c.f4);
    if (c->f40 != 0 && c->f4c == 1) {
        if (player != 0) r5 = data_021040ac.f_ba4;
        else r5 = data_0210594c.f58;
        func_020a978c(name, data_ov004_02209d08, func_0202c0c0(0x6c7), r5);
    } else {
        if (player != 0) r5 = data_021040ac.f_ba4;
        else r5 = data_0210594c.f52;
        func_020a978c(name, data_ov004_02209d08, func_0202c0c0(0x6c6), r5);
    }
    func_ov004_021cdd38(player + 2, name);
    if (data_ov004_0220b500.f44 != 0) {
        if (player == 0) {
            v = data_02104f4c.f64;
            OS_SPrintf(buf, data_ov004_02209d10, (((v & 0x3e0) >> 5) - 1) * 10 + (v & 0x1f));
        } else if (data_02104c78[func_02034844()] == 0) {
            OS_SPrintf(buf, data_ov004_02209d30);
        } else {
            OS_SPrintf(buf, data_ov004_02209d4c);
        }
    } else if (player == 0) {
        v = data_02104f4c.f64;
        OS_SPrintf(buf, data_ov004_02209d10, (((v & 0x3e0) >> 5) - 1) * 10 + (v & 0x1f));
    } else {
        w = data_021040ac.fa8;
        OS_SPrintf(buf, data_ov004_02209d10, (((w & 0x3e0) >> 5) - 1) * 10 + (w & 0x1f));
    }
    if (func_02006b10(buf) == 0) OS_SPrintf(buf, data_ov004_02209d68);
    r5 = func_02006c0c(buf, 4, 0);
    func_0201d47c(&o);
    o.resource = r5;
    o.f14 = 4;
    o.unkc = player * 0x1000 + 0x1400;
    o.flag14 = 1;
    o.unk10 = player != 0 ? -1 : 0x400;
    func_0201e5b8(&o);
    Task_Invoke(r5);
    c->cd[player] = 0x10;
}
