struct F02202240_Self {
    unsigned short f0;
    unsigned short bit0 : 1;
    unsigned short rest : 15;
};

struct F02202240_Ent {
    unsigned int v : 13;
    unsigned int rest : 19;
};

extern unsigned char data_ov002_022cf16c[];
extern unsigned char data_ov002_022cf180[];
extern int func_0202b878(int id);

int func_ov002_02202240(struct F02202240_Self *self) {
    unsigned int i = 0;
    if (i < *(unsigned int *)(data_ov002_022cf180 + ((1 - self->bit0) & 1) * 0x868)) {
        do {
            struct F02202240_Ent *e = (struct F02202240_Ent *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868 + 0x418);
            if (func_0202b878((unsigned short)e[i].v) == 0x16) {
                return 1;
            }
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + ((1 - self->bit0) & 1) * 0x868 + 0x14));
    }
    return 0;
}
