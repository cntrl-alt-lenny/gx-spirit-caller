struct S02206bf8 {
    unsigned short id;
    unsigned short b0 : 1;
    unsigned short _r : 15;
};

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern int func_ov002_021bbc58(int a, int b);
extern int func_ov002_021ca2b8(int a);
extern int func_ov002_022536e8(int a, int b, int c);

int func_ov002_02206bf8(struct S02206bf8 *self) {
    unsigned int i;
    if (!func_ov002_021bbc58(self->b0, 0x12)) return 0;
    if (!func_ov002_021ca2b8(self->b0)) return 0;
    i = 0;
    if (*(unsigned int *)(data_ov002_022cf178 + (self->b0 & 1) * 0x868) > i) {
        do {
            if (func_ov002_022536e8(self->b0, self->id, i)) return 1;
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0xc));
    }
    return 0;
}
