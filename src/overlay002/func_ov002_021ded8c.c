typedef unsigned int u32;
typedef unsigned short u16;
typedef struct { u32 id:13; u32 side:1; u32 unused:8; u32 index:8; u32 rest:2; u32 tail[4]; } Obj;
typedef struct { u32 low:9; u32 side:1; u32 index:4; u32 gap:4; u32 other:1; u32 type:4; u32 high:9; } Event;
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
extern void func_ov002_021d9828(u32 event, Obj *obj, int a, int b);
extern void func_ov002_02244fe4(int a, u32 b);
extern void func_ov002_021dcc48(Obj *obj, int side, int index, int flags);
void func_ov002_021ded8c(Obj *obj, u32 event) {
    Event *e = (Event *)&event;
    int side = e->side;
    int index = e->index;
    int different = e->other != side;
    int type = e->type;
    int special = type == 14;
    int flags;
    if (obj->id == 0) return;
    if (index >= 5) return;
    func_ov002_021d479c((u16)((side ? 0x8000 : 0) | 0x32), (u16)index, (u16)type, (u16)(different ? 1 : 0));
    func_ov002_021d9828(*(u32 *)e, obj, 0, 0);
    func_ov002_02244fe4(0x16, event);
    flags = 6;
    if (different) flags |= 1;
    if (special) flags |= 0x1000000;
    func_ov002_021dcc48(obj, side, index, flags);
}









