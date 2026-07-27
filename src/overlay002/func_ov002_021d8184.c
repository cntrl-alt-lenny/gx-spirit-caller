/* func_ov002_021d8184 (ov002): simpler 021d8128-family variant -- arg-pack
 * tail into 021d479c with p0 = flag|0x33, p1 = 0xe, p2 = arg2 passed raw
 * (no bool), p3 = Ov002Key a*2+b extract of *(u32*)arg1. */
typedef unsigned short u16;
typedef unsigned int   u32;

struct Ov002Key { u32 id : 13; u32 b : 1; u32 : 8; u32 a : 8; u32 : 2; };

extern int func_ov002_021d479c(int p0, int p1, int p2, int p3);

int func_ov002_021d8184(int arg0, void *arg1, int arg2) {
    struct Ov002Key *rec = (struct Ov002Key *)arg1;
    int flag = (arg0 != 0) ? 0x8000 : 0;
    return func_ov002_021d479c((u16)(flag | 0x33), 0xe, (u16)arg2, (u16)(rec->a * 2 + rec->b));
}
