typedef unsigned int u32;
typedef unsigned short u16;
typedef int fx32;
typedef struct { int index; u32 count; } State;
typedef struct { char pad[0xb88]; int mode; u32 entry; char gap[0xc]; int flag; } Duel;
typedef struct { char pad[0xcf0]; int value; char gap[0x10]; int mode; int other; int flag; } Context;
extern State data_ov002_022d0f2c;
extern Duel data_021040ac;
extern Context data_ov002_022d016c;
extern u32 data_021067fc[], data_02106804[];
extern char data_ov002_022cd73c[], data_02104ce4[];
/* Copy32's assembly body takes source, destination and byte count. */
extern void Copy32(const void *, void *, unsigned int);
extern void func_0208c884(unsigned short *a0, int a1);
extern void func_02005800(int value);
extern void func_02094504(u32 value, void *dst, u32 size);
extern int func_020210b8(void);
extern void func_0200ad90(void);
extern void func_0202c4b4(void);
extern void func_0202af40(void);
extern void func_02001ba4(void);
extern void func_02006918(void);
extern void func_0208c8cc(u32 a, u32 b, u32 c);
extern void func_0208c8b0(unsigned int v);
extern int func_02036590(unsigned int id, int arg);
extern void func_0208e2f4(volatile u16 *ptr, fx32 a, fx32 brightness);
extern void func_020139fc(int x);
extern void func_020057dc(void *arg);
extern int func_0201261c(void);
int func_ov002_0229ab6c(void) {
    data_ov002_022d0f2c.count++;
    if (data_ov002_022d0f2c.count < 16) {
        func_0208c884((u16 *)0x0400006c, -data_ov002_022d0f2c.count);
        func_0208c884((u16 *)0x0400106c, -data_ov002_022d0f2c.count);
        return 0;
    }
    *(volatile u32 *)0x04000000 &= ~0xe000;
    *(volatile u32 *)0x04001000 &= ~0xe000;
    *(volatile u32 *)0x04000000 &= ~0x1f00;
    *(volatile u32 *)0x04001000 &= ~0x1f00;
    func_02005800(0);
    func_02094504(0, (void *)0x05000000, 0x400);
    func_02094504(0, (void *)0x05000400, 0x400);
    func_020210b8();
    func_0200ad90();
    func_0202c4b4();
    func_0202af40();
    func_02001ba4();
    func_02006918();
    Copy32(data_ov002_022cd73c, data_02104ce4, 0x22c);
    func_0208c8cc(1,0,1);
    func_0208c8b0(0);
    *(volatile u32 *)0x04000014 = 0;
    *(volatile u32 *)0x04000018 = 0;
    *(volatile u32 *)0x0400001c = 0;
    *(volatile u32 *)0x04001010 = 0;
    *(volatile u32 *)0x04001014 = 0;
    *(volatile u32 *)0x04001018 = 0;
    *(volatile u32 *)0x0400101c = 0;
    func_02036590(0x08f00001,0);
    func_02036590(0x08f00000,0);
    func_0208e2f4((volatile u16 *)0x04000050,0x3f,-16);
    func_0208e2f4((volatile u16 *)0x04001050,0x3f,-16);
    func_0208c884((u16 *)0x0400006c,0);
    func_0208c884((u16 *)0x0400106c,0);
    if (data_021040ac.mode == 3) {
        u32 entry = data_021040ac.entry;
        data_021067fc[entry >> 5] |= 1u << (entry & 31);
        if (data_021040ac.flag == 1)
            data_02106804[entry >> 5] |= 1u << (entry & 31);
    }
    if (data_ov002_022d016c.flag == 0 && data_ov002_022d016c.mode != 3)
        func_020139fc(data_ov002_022d016c.value << 1);
    func_020057dc(func_0201261c);
    return 0;
}
