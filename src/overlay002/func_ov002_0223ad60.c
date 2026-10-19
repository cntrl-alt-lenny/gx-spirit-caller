typedef struct { unsigned short f0; unsigned short flag0:1; unsigned short field:5; unsigned short :10; } Card021c1e44;
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern void func_ov002_021d479c(unsigned short a0, unsigned short a1, unsigned short a2, unsigned short a3);
extern int func_ov002_022112f8(Card021c1e44 *a0, int a1);
extern unsigned char data_ov002_022ce288[];
extern int data_ov002_022cd3f4[];
extern unsigned char data_ov002_022cf1a4[];
extern unsigned char data_ov002_022d016c[];
int func_ov002_0223ad60(Card021c1e44 *a0, int a1)
{
    if (*(int *)(data_ov002_022ce288 + 0x5a8) == 0x80) {
        int player = data_ov002_022cd3f4[0];
        int index = data_ov002_022cd3f4[7];
        int side = player & 1;
        if (*(unsigned short *)(data_ov002_022cf1a4 + side * 0x868 + index * 0x14) != 0 && func_ov002_021c1e44(a0, player, index) == 0) {
        if (*(int *)(data_ov002_022ce288 + 0x5ac) == 0) {
            unsigned int flags = *(unsigned int *)(data_ov002_022d016c + 0xd0);
            if (flags & 1) return 0;
            if (!((flags >> 1) & 1)) return 0;
            func_ov002_021d479c((unsigned short)((data_ov002_022cd3f4[0] ? 0x8000 : 0) | 0x20), (unsigned short)data_ov002_022cd3f4[7], 0, 0);
            *(int *)(data_ov002_022ce288 + 0x5ac) = 1;
            return 0x80;
        }
        } else return 0;
    }
    return func_ov002_022112f8(a0, a1);
}

