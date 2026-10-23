typedef unsigned int u32;
typedef unsigned short u16;
struct Raw { u32 value; };
typedef struct { u32 id:13; u32 side:1; u32 unused:8; u32 index:8; u32 rest:2; u16 f4, f6, f8, fa; u32 tail[2]; } Obj;
typedef struct S { int pad0[2]; int f8, fc, f10; int pad14[8]; int f34; } S;
typedef struct { unsigned long low:9; unsigned long side:1; unsigned long index:4; unsigned long flag:1; unsigned long one:1; unsigned long gap:1; unsigned long other:1; unsigned long owner:1; unsigned long type:4; unsigned long zero:1; unsigned long high:8; } Event;
extern int data_ov002_022cd3f4[];
extern Obj data_ov002_022cd4b8[];
extern S data_ov002_022cd420[];
extern int func_ov002_021ba0b0(Obj *p);
extern int func_0202e2f8(int unused0);
extern int func_ov002_021ca5bc(int arg0);
extern int func_ov002_021badb0(S *p);
extern void func_ov002_021d479c(u16 a0,u16 a1,u16 a2,u16 a3);
extern void func_ov002_021d9828(Event event,Obj *obj,int a,int b);
extern void func_ov002_02244fe4(int a,u32 b);
extern void func_ov002_021dcc48(Obj *obj,int side,int index,int flags);
int func_ov002_021df2c4(int idx) {
    int side = idx == 0 ? data_ov002_022cd3f4[0] : data_ov002_022cd3f4[1];
    int pos = idx == 0 ? data_ov002_022cd3f4[7] : data_ov002_022cd3f4[8];
    Obj *obj = &data_ov002_022cd4b8[idx];
    int id = func_ov002_021ba0b0(obj);
    int packed = obj->index * 2 + obj->side;
    if (id != 0) {
        int flags = 0;
        int special = !func_ov002_021ca5bc(packed) == 0 && func_0202e2f8(id) == 0;
        Event event = {0};


        if (id == 0x16f8) {
            if (func_ov002_021badb0(&data_ov002_022cd420[data_ov002_022cd3f4[0] ^ idx]) != 0) special = 0;
        }
        event.low = packed;
        event.side = side;
        event.index = pos;
        event.flag = obj->f6;
        event.other = obj->f8;
        event.owner = side;
        event.one = 1;
        event.zero = 0;
        event.type = special ? 14 : 15;
        func_ov002_021d479c((u16)((side ? 0x8000 : 0) | 0x46),(u16)pos,(u16)event.type,(u16)event.low);
        func_ov002_021d9828(event,obj,0,0);
        if (func_0202e2f8(id) == 0) func_ov002_02244fe4(0x1b,((struct Raw *)&event)->value);
        if (special) flags |= 0x1000000;
        func_ov002_021dcc48(obj,side,pos,flags);
        return 1;
    }
    return 0;
}











