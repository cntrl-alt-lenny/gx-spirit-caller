typedef unsigned short u16;

struct Entity {
    u16 unk0;
    u16 f0 : 1;
    u16 f1 : 5;
    u16 f6 : 6;
    u16 f12 : 2;
    u16 g0 : 6;
    u16 g6 : 9;
};

struct State { unsigned char pad[0x5b4]; int step; };
extern struct State data_ov002_022ce1a8;

extern void func_ov002_021e267c(int a, int b, int c, int d);
extern void func_ov002_021f495c(struct Entity *e, int arg);
extern void func_ov002_021faa84(struct Entity *e, int arg);

void func_ov002_021f8470(struct Entity *e, int arg)
{
    if (data_ov002_022ce1a8.step == 0) {
        func_ov002_021e267c(e->f0, 0x16b8, 1, e->g6);
        func_ov002_021f495c(e, arg);
    }
    func_ov002_021faa84(e, arg);
}
