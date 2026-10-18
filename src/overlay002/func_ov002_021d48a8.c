typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u32 pad0;
    u16 a;
    u16 b;
    u16 c;
    u16 d;
    u16 e;
} Data68;

typedef struct {
    u16 pad[0x180];
    u32 flags;
} Data68b;

extern Data68 data_ov002_022cdc68;
extern Data68b data_ov002_022cd968;
extern u32 data_ov002_022cdc6c;
extern void func_ov002_0229cd40(void *p);

void func_ov002_021d48a8(u16 a, u16 b, u16 c, u16 d) {
    data_ov002_022cdc68.a = a;
    data_ov002_022cdc68.b = b;
    data_ov002_022cdc68.c = c;
    data_ov002_022cdc68.d = d;
    data_ov002_022cd968.flags |= 4;
    data_ov002_022cdc68.e &= ~0xff;
    func_ov002_0229cd40(&data_ov002_022cdc6c);
}
