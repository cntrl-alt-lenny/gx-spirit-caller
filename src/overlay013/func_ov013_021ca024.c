typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { unsigned short lo:8, hi:8; } Color;
typedef struct {
    void *task;
    int pad4;
    int x, y;
    unsigned short z;
    u16 pad12;
    unsigned short mode:4;
    unsigned short enabled:1;
    unsigned short rest14:11;
    unsigned short rest16:14, flag16:1, top16:1;
    unsigned a:7;
    unsigned b:7;
    unsigned c:3;
    unsigned rest18:15;
    unsigned red:8;
    unsigned green:8;
    unsigned rest1c:16;
    u32 pad20;
    Color color[2];
} Obj;
extern int func_0201d47c(Obj *o);
extern int func_0201e5b8(Obj *o);
extern void Task_Invoke(void *p);
extern void func_ov000_021ab4bc(int idx, int val);
extern void func_0208c8cc(u32 a, u32 b, u32 c);


extern char data_ov013_021cbc00[];
extern char data_ov013_021cbc3c[];

void func_ov013_021ca024(void) {
    Obj o;
    char *w = data_ov013_021cbc3c;
    if (*(int *)(data_ov013_021cbc00 + 0x248) != 0) {
    func_0201d47c(&o);
    o.task = *(void **)(w + 0x20c);
    o.x = 0;
    o.y = 0;
    o.z = 0x200;
    o.mode = 0;
    o.enabled = 1;
    o.a = 0;
    o.b = 0;
    o.c = 2;
    if (*(int *)(w + 0x150) == 1) {
        o.mode = 0;
        o.green = 0x40;
        o.color[0].lo = 0;
        o.color[1].lo = 0x40;
        o.red = 0x40;
        o.color[0].hi = 0;
        o.color[1].hi = 0x40;
        o.flag16 = 1;
        o.enabled = 0;
        o.z = 0;
    }
    func_0201e5b8(&o);
    Task_Invoke(o.task);
    *(void **)(w + 0x20c) = 0;
    func_ov000_021ab4bc(0, 1);
    func_0208c8cc(1, 0, 0);
    }
}













