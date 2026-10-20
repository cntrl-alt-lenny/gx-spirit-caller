typedef unsigned short u16;
typedef unsigned int u32;
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
void func_ov002_021d81d4(u32 arg0, u32 arg1) {
    u32 flag = arg0 & 1;
    func_ov002_021d479c(0x3f, (u16)(((arg1 & 0x3ff) << 6) | (flag | 0x1e)), 0x5c | flag, 0);
}
