typedef struct { unsigned short pad; unsigned short side:1; } Self;
typedef struct { unsigned id:13; unsigned low:1; unsigned pad:8; unsigned high:8; unsigned rest:2; } Slot;
typedef struct { unsigned pad:17; unsigned flag:1; unsigned rest:14; } Flags;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf288[];
extern int func_0202e234(int x);
extern int func_0203058c(int a);
extern int func_ov002_021c38c4(int side, int index);
int func_ov002_02296900(Self *self) {
    unsigned i;
    if ((*(unsigned *)(data_ov002_022cf288 + (self->side & 1) * 0x868) >> 17) & 1)
        return 0;
    i = 0;
    if (i < *(unsigned *)(data_ov002_022cf178 + (self->side & 1) * 0x868)) {
        do {
            int id = ((Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120))[i].id;
            if (func_0202e234(id) != 0 && func_0203058c(id) == 0) {
                Slot *slot = &((Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120))[i];
                if (func_ov002_021c38c4(self->side, slot->high * 2 + slot->low) >= 5)
                    return 1;
            }
            i++;
        } while (i < *(unsigned *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0xc));
    }
    return 0;
}

