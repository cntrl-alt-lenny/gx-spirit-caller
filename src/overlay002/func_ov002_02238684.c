typedef unsigned int u32;
typedef unsigned short u16;
typedef unsigned char u8;

typedef struct Obj {
    u32 pad[5];
    u32 id : 9;
} Obj;

extern char data_ov002_022cf16c[];
extern u32 func_ov002_021b947c(u32 id);
extern void func_ov002_021d7d0c(void *obj, u32 a, void *p);

int func_ov002_02238684(Obj *obj)
{
    u32 v = func_ov002_021b947c(obj->id);
    u16 lo = v;
    u32 hi = v >> 16;
    u32 kind = (lo >> 8) & 0xff;
    u32 idx = v & 0xff;
    u16 h = hi;
    if (kind == 0xe) {
        func_ov002_021d7d0c(obj, idx, data_ov002_022cf16c + (idx & 1) * 0x868 + 0x418 + h * 4);
    }
    return 0;
}
