typedef struct {
    unsigned short w0;
    unsigned short bit0:1;
    unsigned short pad1:5;
    unsigned short kind:6;
    unsigned short pad12:2;
    unsigned short bit14:1;
    unsigned short pad15:1;
} S021ff3bc;
struct Self {
    S021ff3bc head;
    char pad4[0x10];
    unsigned int pad20:9;
    unsigned int bit9:1;
    unsigned int rest20:22;
};
extern int func_ov002_021ff3bc(S021ff3bc *p, int unused1);
extern int func_ov002_022536e8(void *self, int arg1, int arg2);
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
int func_ov002_022053f8(struct Self *self, int arg1) {
    unsigned int i;
    if ((unsigned short)(self->head.kind + 0xfffa) <= 1) {
        if (self->bit9 == self->head.bit0) return 0;
        if (func_ov002_021ff3bc(&self->head, arg1) == 0) return 0;
        i = 0;
        if (i < *(unsigned int *)(data_ov002_022cf178 + (self->head.bit0 & 1) * 0x868)) {
            do {
                if (func_ov002_022536e8((void *)self->head.bit0, self->head.w0, i) != 0) return 1;
                i++;
            } while (i < *(unsigned int *)(data_ov002_022cf16c + (self->head.bit0 & 1) * 0x868 + 0xc));
        }
    }
    return 0;
}

