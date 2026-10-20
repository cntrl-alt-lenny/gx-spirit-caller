typedef struct { unsigned short pad; unsigned short side : 1; } Self;
typedef struct { unsigned int id:13; unsigned int bit:1; unsigned int pad:8; unsigned int index:8; unsigned int rest:2; } Entry;
extern char data_ov002_022cf288[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern int func_0202e234(int x);
extern int func_0203058c(int a);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_02292da4(void);
extern int func_ov002_0228d544(int side, int (*predicate)(void), int flag, int mode);
extern int func_ov002_021c38c4(int side, int index);
/* The caller supplies a side and tests the result; the existing void/pointer definition loses both facts. */
extern int func_ov002_0227d660(int side, int arg);
int func_ov002_02292dac(Self *self) {
    int excluded;
    int i;

        if (!((*(unsigned int *)(data_ov002_022cf288 + (self->side & 1) * 0x868) >> 17) & 1)) {
            excluded = func_ov002_0228d544(self->side, func_ov002_02292da4, 1, 1);
            if (excluded < 0) return 0;
            i = 0;
            if (i < *(unsigned int *)(data_ov002_022cf178 + (self->side & 1) * 0x868)) do {
                int id = ((Entry *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120))[i].id;
                if (i != excluded && func_0202e234(id) != 0 && func_0203058c(id) == 0 && func_ov002_021bc618(self->side) != 0) {
                    Entry *p = &((Entry *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120))[i];
                    int n = func_ov002_021c38c4(self->side, p->index * 2 + p->bit);
                    if (n >= 7) {
                        if (func_ov002_0227d660(self->side, 1) >= 0) return 1;
                    } else if (n >= 5) return 1;
                }
                i++;
            } while (i < *(unsigned int *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0xc));
        }
    return 0;
}






