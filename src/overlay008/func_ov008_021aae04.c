extern void func_ov008_021b219c(void);
extern void func_ov008_021ab120(int *);
extern void func_0202c1ac(void), func_0202af40(void), func_0202c3c8(void);
extern void func_02009758(int), func_02009dec(void), func_02009e9c(void);
extern void func_0208e2f4(unsigned short *, int, int);
extern void func_0208c884(unsigned short *, int);
extern void func_02001ba4(void), func_02006918(void);
extern int data_ov008_021b2d34[];
extern unsigned char data_02104f4c[];
struct State { char pad[12]; unsigned int mask; char pad2[0x554]; int flag; };
extern struct State data_ov008_021b2780;
struct Row { int a, score, b; unsigned short count; unsigned short c; int d, e; int f18, f1c, f20, f24, f28, f2c, f30; };
extern struct Row data_ov008_021b2790[];
struct Counter { char pad[0x50]; unsigned short count; };
extern struct Counter data_0210674c;
int func_ov008_021aae04(void) {
    int all = 1;
    int total;
    struct Row *row;
    int i;
    unsigned char *dst;
    unsigned int mask;
    *(volatile unsigned int *)0x04000000 &= ~0x1f00;
    *(volatile unsigned int *)0x04001000 &= ~0x1f00;
    func_ov008_021b219c();
    func_ov008_021ab120(data_ov008_021b2d34);
    func_0202c1ac(); func_0202af40(); func_0202c3c8();
    total = 0;
    mask = data_ov008_021b2780.mask;
    row = data_ov008_021b2790;
    dst = data_02104f4c;
    for (i = 0; i < 26; i++, dst += 0x1c) {
        if (mask & (1 << i)) {
            dst[0x156d] = row->count;
            *(int *)(dst + 0x1570) = row->f18;
            *(int *)(dst + 0x1574) = row->f1c;
            *(int *)(dst + 0x1578) = row->f20;
            *(int *)(dst + 0x157c) = row->f24;
            dst[0x156f] = row->f28;
            dst[0x1584] = row->score;
            if (row->count != 0) all = 0;
            if (row->score >= 100) total++;
            row++;
        }
    }
    if (all && data_ov008_021b2780.flag) {
        data_0210674c.count++;
        if (data_0210674c.count >= 10) func_02009758(0);
        func_02009dec(); func_02009e9c();
    }
    if (total >= 13) func_02009758(1);
    func_0208e2f4((unsigned short *)0x04001050, 0, 0);
    *(volatile unsigned short *)0x0400104a &= ~0x3f00;
    *(volatile unsigned short *)0x0400104a &= ~0x3f;
    *(volatile unsigned int *)0x04001000 &= ~0xe000;
    func_0208c884((unsigned short *)0x0400006c, 0);
    func_0208c884((unsigned short *)0x0400106c, 0);
    func_02001ba4(); func_02006918();
    return 1;
}



