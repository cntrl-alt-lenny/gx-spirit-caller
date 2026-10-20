typedef unsigned short u16;
typedef unsigned int u32;
extern int func_ov002_021b9a30(u32 a, u32 b);
extern int func_0202e2c8(int unused0);
extern void func_ov002_021d479c(u16 a0, u16 a1, u16 a2, u16 a3);
struct Entry { u16 id : 13; u16 : 3; u16 pad; };
extern struct Entry data_ov002_022d0250[];
int func_ov002_021d8204(u32 arg0, u32 arg1) {
    u32 kind;
    u16 flag;
    u16 p2;
    if (func_ov002_021b9a30(arg0, arg1) >= 0) {
        kind = func_0202e2c8(data_ov002_022d0250[arg1].id) ? 0xc : 0xd;
        flag = arg0 & 1;
        p2 = (u16)(((kind << 27) >> 26) | flag);
        func_ov002_021d479c(0x3f, (u16)(((arg1 << 22) >> 16) | (flag | 0x1e)),
            p2, 0);
        return 1;
    }
    return 0;
}






