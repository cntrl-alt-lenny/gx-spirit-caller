typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern int func_ov002_021d479c(int p0, int p1, int p2, int p3);

void func_ov002_021d8128(int arg0, void *arg1, int arg2) {
    struct Ov002Key *rec = (struct Ov002Key *)arg1;
    int b = (arg2 != 0) ? 1 : 0;
    int flag = (arg0 != 0) ? 0x8000 : 0;
    func_ov002_021d479c((u16)(flag | 0x33), 0xe, (u16)b, (u16)(rec->a * 2 + rec->b));
}
