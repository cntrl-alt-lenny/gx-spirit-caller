typedef unsigned short u16;
typedef unsigned int u32;

struct Obj { char pad[0x2c]; u32 f2c; u16 f30; u16 f32; u32 f34; int f38; };

extern void func_02090114(void);
extern void func_020900a0(void *p, int a, int b);
extern void func_02090048(void);

void func_02081ee4(struct Obj *o, int flag)
{
    if (flag != 0) {
        func_02090114();
    }
    func_020900a0((char *)o + o->f38, (o->f2c & 0xffff) * 8, o->f30 * 8);
    o->f32 |= 1;
    if (flag != 0) {
        func_02090048();
    }
}
