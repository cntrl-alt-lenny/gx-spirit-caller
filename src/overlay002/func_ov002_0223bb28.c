typedef unsigned int u32;
typedef unsigned short u16;
typedef union { u32 word; struct { u32 id:13; u32 rest:19; } bits; } Entry;
struct S {
    char pad0[0x494];
    int head;
    u16 entries[128];
    char pad1[0x104];
    int key, f6a0, count, f6a8, used, flag;
};
extern struct S data_ov002_022ce288;
extern int func_0202de9c(int unused0);
extern int func_02030b84(int a0);
extern int func_02031684(int x);
extern int func_ov002_021bd85c(int a, int b);
extern int func_ov002_0223b468(int key);
extern void func_ov002_0223b584(void);
extern Entry *func_ov002_0223ba60(int a);
extern int func_ov002_021b9aa8(u32 a, u32 b);
extern int func_ov002_0223b5cc(int arg0, int arg1);
extern int func_ov002_021b947c(int a);
extern int func_ov002_0223b6ec(int arg0, int arg1, int arg2);
int func_ov002_0223bb28(int arg0, int arg1)
{
    int i;
    Entry *p;
    int result;
    if (func_0202de9c(arg1) != 3) return 0;
    if (func_ov002_021bd85c(arg1, -1) != 0) return 0;
    if (func_02030b84(arg1) == 0) return 0;
    data_ov002_022ce288.key = arg1;
    data_ov002_022ce288.count = func_ov002_0223b468(arg1);
    data_ov002_022ce288.used = 0;
    data_ov002_022ce288.flag = func_02031684(arg1) == 0;
    func_ov002_0223b584();
    for (i = 0; i < data_ov002_022ce288.count; i++) {
        p = func_ov002_0223ba60(arg0);
        if (p == 0) return 0;
        data_ov002_022ce288.entries[(u32)(data_ov002_022ce288.head + data_ov002_022ce288.used++) % 128] = ((p->word << 2) >> 24) * 2 + ((p->word << 18) >> 31);
        if (func_ov002_021b9aa8(arg0, ((p->word << 2) >> 24) * 2 + ((p->word << 18) >> 31)) >= 0) {
            func_ov002_0223b5cc(p->bits.id, 1);
        } else {
            result = func_ov002_021b947c(((p->word << 2) >> 24) * 2 + ((p->word << 18) >> 31));
            func_ov002_0223b6ec(result & 255, ((u16)result >> 8) & 255, 1);
        }
    }
    return 1;
}

