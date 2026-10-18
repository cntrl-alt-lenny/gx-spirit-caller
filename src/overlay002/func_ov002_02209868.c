typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 f0;
    u16 bit0 : 1;
    u16 rest : 15;
} Obj;

extern int data_ov002_022d016c[];
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern int func_ov002_021ff320();
extern int func_ov002_021bae7c(int a, int b, int c);
extern int func_ov002_022536e8(int a, int b, int c);

int func_ov002_02209868(Obj *self) {
    u32 i;
    if (func_ov002_021ff320(self) == 0) {
        return 0;
    }
    if (*(int *)((char *)data_ov002_022d016c + 0xcf8) != 0) {
        if (func_ov002_021bae7c(1 - self->bit0, 0x178b, -1) != 0) {
            return 0;
        }
    }
    i = 0;
    if (i < *(u32 *)(data_ov002_022cf178 + (self->bit0 & 1) * 0x868)) {
        do {
            if (func_ov002_022536e8(self->bit0, self->f0, i) != 0) {
                return 1;
            }
            i++;
        } while (i < *(u32 *)(data_ov002_022cf16c + (self->bit0 & 1) * 0x868 + 0xc));
    }
    return 0;
}
