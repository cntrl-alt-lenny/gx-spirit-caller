typedef unsigned short u16;
typedef struct { u16 f0; u16 b0 : 1; } Self022927d0;

typedef struct {
    char _pad[0xf8];
    unsigned int id : 13;
} RowF8;

extern char data_ov002_022cf16c[];
extern char data_ov002_022cf26c[];

int func_ov002_022927d0(Self022927d0 *self) {
    int poff = (self->b0 & 1) * 0x868;
    RowF8 *row = (RowF8 *)(data_ov002_022cf16c + poff);
    int flag = 0;
    if (row->id != 0) {
        if (*(unsigned short *)(data_ov002_022cf26c + poff) != 0)
            flag = 1;
    }
    return flag == 0;
}
