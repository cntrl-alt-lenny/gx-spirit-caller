typedef unsigned int u32;
typedef unsigned short u16;
extern struct { char pad[0xd28]; u32 idx; char pad2[0x18]; int flag; } data_ov002_022d016c;
extern struct { u32 id; int flag; } data_ov002_022c8368[];
extern int data_ov002_022cd744[];
extern int func_ov002_021fd81c(u32 packed, u16 value, int extra);
extern int func_ov002_021b97d4(int a, u32 b);
extern int func_ov002_021ae4bc(void *self, int idx);
extern int func_ov002_021e30b4(int arg0, int arg1, int arg2);
extern void func_ov002_021d5b80(int arg0, int arg1, int arg2, int arg3);
int func_ov002_02264b84(u32 self) {
    u32 id;
    u32 packed;
    u32 i = data_ov002_022d016c.idx;
    if (i < 5) {
        if (i < 5) {
        packed = ((self << 31) & 0x80000000) | 0x0a500000;
        do {
            id = data_ov002_022c8368[i].id;
            if (func_ov002_021fd81c(packed | (u16)id, 0, 0)) {
                if (data_ov002_022cd744[self] == 0 && data_ov002_022c8368[i].flag != 0) {
                    func_ov002_021ae4bc((void *)0xfa, func_ov002_021b97d4(self, id));
                } else {
                    data_ov002_022d016c.flag = 1;
                }
                data_ov002_022d016c.idx += 5;
                return 0;
            }
            i = data_ov002_022d016c.idx + 1;
            data_ov002_022d016c.idx = i;
        } while (i < 5);
        }
    } else {
        u32 j = i - 5;
        if (data_ov002_022d016c.flag) {
            func_ov002_021e30b4(((self << 31) & 0x80000000) | 0x0a500000 | (u16)data_ov002_022c8368[j].id, 0, 0);
        } else {
            func_ov002_021d5b80(self, 0xb, data_ov002_022c8368[j].id, 0);
            data_ov002_022d016c.idx++;
        }
        data_ov002_022d016c.idx -= 5;
        return data_ov002_022d016c.idx >= 5;
    }
    return 1;
}





