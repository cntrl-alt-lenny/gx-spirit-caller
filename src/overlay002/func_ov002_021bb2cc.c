typedef struct { unsigned int id : 13; unsigned int rest : 19; } Obj;
typedef struct S { int pad0[2]; int f8; int fc; int f10; int pad14[8]; int f34; } S;
extern int func_ov002_021b9ecc(int self, int playerRow);
extern int func_ov002_021ba0b0(Obj *p);
extern int func_ov002_021badb0(S *p);
extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022d016c[];
extern int data_ov002_022cd3f4[];
extern Obj data_ov002_022cd4b8;
extern Obj data_ov002_022cd4cc;
extern S data_ov002_022cd420[];
int func_ov002_021bb2cc(int self, int id) {
    int i;
    int count = 0;
    unsigned char *row = data_ov002_022cf16c + (self & 1) * 0x868;
    int bit = self << 4;
    for (i = 0; i < 5; i++, row += 0x14, bit++) {
        int check = func_ov002_021b9ecc(self, i);
        if (check == id) {
            unsigned int flags = *(unsigned int *)(row + 0x40);
            unsigned short active = *(unsigned short *)(row + 0x38);
            if ((active & ~((flags >> 6) & 1) & ~(((flags >> 1) | (flags >> 2)) & 1)) != 0) {
                if ((*(unsigned int *)(data_ov002_022d016c + 0xd4) & (1 << bit)) == 0)
                    count++;
            }
        }
    }
    if (*(unsigned int *)(data_ov002_022d016c + 0xd0) & 1) {
        if (self == data_ov002_022cd3f4[0] && id == func_ov002_021ba0b0(&data_ov002_022cd4b8)) {
            if (func_ov002_021badb0(&data_ov002_022cd420[data_ov002_022cd3f4[0]]) != 0)
                count++;
        }
        if (self == data_ov002_022cd3f4[1] && id == func_ov002_021ba0b0(&data_ov002_022cd4cc)) {
            if (func_ov002_021badb0(&data_ov002_022cd420[1 - data_ov002_022cd3f4[0]]) != 0)
                count++;
        }
    }
    return count;
}

