struct RowFields { unsigned int id:13; unsigned int bit13:1; unsigned int pad:8; unsigned int fieldA:8; unsigned int pad2:2; };
struct Self { unsigned short f0; unsigned short b0:1; unsigned short p5:5; unsigned short pad1:10; unsigned short pad2:6; unsigned short nine:9; unsigned short pad3:1; unsigned short rest[3]; unsigned short mode; };
struct Card { unsigned int id:13; unsigned int side:1; unsigned int rest:18; };
struct State { char pad[0x5a8]; int mode; int slot; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_02220038(void *self, int arg);
extern int func_ov002_0220e518(void *self);
extern int func_ov002_021bc618(int arg0);
extern int func_ov002_021bc6c4(int arg0);
/* The C definition takes four arguments; this caller supplies only the side. */
extern int func_ov002_021ca2b8();
extern int func_ov002_021ca3f0(int arg0, int arg1);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern int func_ov002_0227adb8(int a, int b, int c, int d);
int func_ov002_02237994(struct Self *self, int arg) {
    switch (self->mode) {
    case 1: return func_ov002_02220038(self, arg);
    case 2: func_ov002_0220e518(self); return 0;
    case 3:
        switch (data_ov002_022ce288.mode) {
        case 0x80: {
            char *rowBase = data_ov002_022cf16c + (self->b0 & 1) * 0x868 + 0x30;
            struct RowFields *row = (struct RowFields *)(rowBase + self->p5 * 20);

            if (self->nine != row->fieldA * 2 + row->bit13) return 0;
            if (*(unsigned short *)(data_ov002_022cf1a4 + (self->b0 & 1) * 0x868 + self->p5 * 20) == 0) return 0;
            if (func_ov002_021bc618(self->b0) == 0) return 0;
            if (func_ov002_021ca2b8(self->b0) == 0) return 0;
            if (func_ov002_021ca3f0(self->b0, 0x19ed) == 0) return 0;

            {
            struct Card card = {0};
            card.id = 0x19ed;
            card.side = self->b0;
            data_ov002_022ce288.slot = func_ov002_021bc6c4(self->b0);
            func_ov002_0227adb8(self->b0, (int)&card, 1, (self->f0 << 16) | 1);
            return 0x7f;
            }
        }
        case 0x7f:
            func_ov002_021d59cc(self->b0, self->p5, (unsigned short)((unsigned char)self->b0 | ((unsigned char)data_ov002_022ce288.slot << 8)), 6, 0);
            break;
        }
        return 0;
    }
    return 0;
}





