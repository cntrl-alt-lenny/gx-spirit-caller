typedef struct { int value; } Word;
typedef struct { unsigned int pad : 13; unsigned int flag : 1; unsigned int pad2 : 8; unsigned int id : 8; unsigned int pad3 : 2; } Slot;
typedef struct { char pad[0x14]; unsigned int count; char pad2[0x400]; Slot slots[276]; } Side;
extern Side data_ov002_022cf16c[];
typedef struct { unsigned int count; char pad[0x864]; } Count;
extern Count data_ov002_022cf180[];
extern void func_ov002_021b91c4(int *dst, const int *src);
extern void func_ov002_021b91d0(Word *a, Word *b);
void func_ov002_021c2c54(int player, int id)
{
    Slot *slot;
    int i;
    Side *row;
    int off = (player & 1) * 0x868;
    unsigned int count = data_ov002_022cf180[player & 1].count;
    i = count - 1;
    if (i >= 0) {
        row = &data_ov002_022cf16c[player & 1];
        slot = &row->slots[i];
        do {
            if (id == slot->id * 2 + slot->flag) {
                func_ov002_021b91d0(&((Word *)((char *)data_ov002_022cf16c + off + 0x418))[i], &((Word *)((char *)data_ov002_022cf16c + off + 0x418))[count]);
                if ((unsigned int)i < *(unsigned int *)((char *)data_ov002_022cf180 + off)) {
                    do {
                        func_ov002_021b91c4((int *)&row->slots[i], (int *)&((Side *)((char *)data_ov002_022cf16c + (unsigned int)off))->slots[i + 1]);
                        i++;
                    } while ((unsigned int)i < ((Side *)((char *)data_ov002_022cf16c + (unsigned int)off))->count);
                }
                return;
            }
            slot--;
            i--;
        } while (i >= 0);
    }
}










