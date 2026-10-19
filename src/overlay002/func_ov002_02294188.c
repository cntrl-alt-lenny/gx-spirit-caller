struct Flags { unsigned short bit0:1; unsigned short rest:15; };
struct Self { unsigned short pad; struct Flags f2; };
struct Entry { unsigned int id:13; unsigned int rest:19; };
struct Side { unsigned int pad0[3]; unsigned int count1; unsigned int pad10; unsigned int count2; char pad18[0x108]; struct Entry first[0xbe]; struct Entry second[0x114]; };
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf180[];
extern int func_ov002_0227c678(unsigned int side, int mode, int id);
extern int func_ov002_022815a4(unsigned int id, int mode);
int func_ov002_02294188(struct Self *self) {
    int i;
    unsigned int id;
    i=0;
    if (i < *(unsigned int *)(data_ov002_022cf178 + (self->f2.bit0 & 1)*0x868)) {
        do {
            id = ((struct Entry *)(data_ov002_022cf16c + (self->f2.bit0 & 1)*0x868 + 0x120))[i].id;
            if (func_ov002_0227c678(self->f2.bit0, 1, (unsigned short)id)) return 0;
            if (func_ov002_022815a4(id, 0)) return 0;
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + (self->f2.bit0 & 1)*0x868 + 0xc));
    }
    i=0;
    if (i < *(unsigned int *)(data_ov002_022cf180 + (self->f2.bit0 & 1)*0x868)) {
        do {
            id = ((struct Entry *)(data_ov002_022cf16c + (self->f2.bit0 & 1)*0x868 + 0x418))[i].id;
            if (func_ov002_022815a4(id, 0)) return 1;
            i++;
        } while (i < *(unsigned int *)(data_ov002_022cf16c + (self->f2.bit0 & 1)*0x868 + 0x14));
    }
    return 0;
}






