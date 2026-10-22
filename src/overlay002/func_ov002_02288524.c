struct F02291248_F2 { unsigned short bit0:1; unsigned short pad:5; unsigned short tag6:6; unsigned short rest:4; };
struct F02291248_Self { unsigned short f0; struct F02291248_F2 f2; };
struct Slot { unsigned int id:13; unsigned int rest:19; };
struct Row { unsigned char pad[0x14]; unsigned int count; unsigned char pad2[0x400]; struct Slot slots[0x114]; };
struct Count { unsigned int count; unsigned char pad[0x864]; };
extern struct Row data_ov002_022cf16c[];
extern struct Count data_ov002_022cf180[];
extern int func_ov002_02291248(struct F02291248_Self *self);
extern unsigned int func_0202b878(int id);
extern int func_0202b8f0(int unused0);
int func_ov002_02288524(struct F02291248_Self *self) {
    unsigned int i;
    if (func_ov002_02291248(self) == 0) return 0;
    i = 0;
    if (i < data_ov002_022cf180[self->f2.bit0 & 1].count) do {
        int id = data_ov002_022cf16c[self->f2.bit0 & 1].slots[i].id;
        if (func_0202b878(id) == 9) {
            if (func_0202b8f0(id) >= 0x9c4) return 1;
        }
        i++;
    } while (i < data_ov002_022cf16c[self->f2.bit0 & 1].count);
    return 0;
}



