/* func_ov002_022859e8 (ov002): for each of 5 slots of player idx's row
 * (stride 0x868, row+i*0x14): if slot.id:13 != 0, run a guard chain
 * (func_ov002_021c9fc4 / func_0202f9e8 / f36 nonzero / func_ov002_021bd948);
 * on the final guard's success, clear f36 and set f38 to 1.
 * Two independent walking pointers: row (f36/f38, +0x14 stride) and
 * slot (id, row+0x30, +0x14 stride) - matches the original's r7/r6. */
extern char data_ov002_022cf16c[];
extern int func_0202f9e8(int id);
extern int func_ov002_021bd948(int idx, int i);
extern int func_ov002_021c9fc4(int idx);

typedef struct {
    unsigned int id : 13;
    char _pad[16];
} Slot022859e8;

void func_ov002_022859e8(int idx)
{
    int i;
    unsigned int id;
    Slot022859e8 *slot = (Slot022859e8 *)(data_ov002_022cf16c + (idx & 1) * 0x868 + 0x30);
    char *row = data_ov002_022cf16c + (idx & 1) * 0x868;

    for (i = 0; i < 5; i++, slot++, row += 0x14) {
        id = slot->id;

        if (id == 0)
            continue;
        if (*(unsigned short *)(row + 0x38) == 0) {
            if (func_ov002_021c9fc4(idx) == 0)
                continue;
        }
        if (*(unsigned short *)(row + 0x38) == 0) {
            if (func_0202f9e8(id) != 0)
                continue;
        }
        if (*(unsigned short *)(row + 0x36) == 0)
            continue;
        if (func_ov002_021bd948(idx, i) != 0) {
            *(unsigned short *)(row + 0x36) = 0;
            *(unsigned short *)(row + 0x38) = 1;
        }
    }
}
