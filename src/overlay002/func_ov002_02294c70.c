typedef unsigned short u16;
struct Self { u16 f0; u16 b0:1; u16 rest:15; };
struct Slot { unsigned int id:13; unsigned int rest:19; unsigned int pad[4]; };
struct Player { unsigned char pad[0x30]; struct Slot slots[5]; unsigned char tail[0x7d4]; };
extern struct Player data_ov002_022cf16c[];
extern int func_ov002_022806a4(int a, int b, int c);
extern int *func_ov002_021afb74(void);
extern unsigned int func_0202b8a8(int id);
/* Original caller leaves the fourth parameter unspecified. */
extern int func_ov002_021c84e0();
int func_ov002_02294c70(struct Self *self) {
    int i;
    int level;
    if (func_ov002_022806a4(self->b0, self->f0, 0) >= 0) {
        level = (int)func_0202b8a8(((unsigned int)*func_ov002_021afb74() << 19) >> 19);
        for (i = 0; i < 5; i++) {
            if (data_ov002_022cf16c[self->b0 & 1].slots[i].id) {
                if (func_ov002_021c84e0(self->b0, i) >= level)
                    return 0;
            }
        }
        return 1;
    }
    return 0;
}


