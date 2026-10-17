typedef unsigned short u16;
typedef struct { u16 f0; u16 b0 : 1; } Self0229288c;

typedef struct {
    char _pad[0xf8];
    unsigned int id : 13;
} RowF8;

extern char data_ov002_022cf16c[];
extern int func_ov002_022927d0(Self0229288c *self, int arg);

int func_ov002_0229288c(Self0229288c *self, int arg) {
    RowF8 *row = (RowF8 *)(data_ov002_022cf16c + 0x868 * (self->b0 & 1));
    if (row->id == 0x10f4) return 1;
    return func_ov002_022927d0(self, arg);
}
