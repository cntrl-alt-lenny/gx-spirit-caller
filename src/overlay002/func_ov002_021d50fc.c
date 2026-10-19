typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
typedef struct { u32 id:13; u32 flags:19; } Card;
extern char data_ov002_022cf16c[];
typedef struct { char pad[0xd40]; u32 count; } Work;
extern Work data_ov002_022d016c;
extern int func_ov002_021c1954(int self, int arg1);
extern int func_ov002_021c10e8(int self, int slot, int mode);
extern int func_ov002_021bc6c4(int arg0);
extern int func_ov002_021b8fcc(int a0, int a1);
extern int func_ov002_021bd030(int self);
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
extern void func_ov002_021d7054(int a, int b);
int func_ov002_021d50fc(int self, int slot) {
    int other;
    int target;
    if (func_ov002_021c1954(self, slot) != 0) return 0;
    if (((Card *)(data_ov002_022cf16c + (self & 1) * 0x868 + slot * 20 + 0x30))->id != 0) {
        other = func_ov002_021c10e8(self, slot, 0);
        if (other != self) {
            target = func_ov002_021bc6c4(other);
            if (func_ov002_021b8fcc(self, slot) != 0) {
                if (func_ov002_021bd030(1 - self) < 0) target = -1;
            }
            if (target == -1) {
                func_ov002_021de480(self, slot, 1, 0);
            } else {
                if (++data_ov002_022d016c.count >= 10) {
                    data_ov002_022d016c.count = 0;
                    func_ov002_021de480(self, slot, 0, 0);
                } else {
                    func_ov002_021d7054((u16)((u8)self | ((u8)slot << 8)), (u16)((u8)other | ((u8)target << 8)));
                }
            }
            return 1;
        }
    }
    return 0;
}


