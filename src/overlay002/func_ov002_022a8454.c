typedef unsigned short u16;
typedef unsigned int u32;

typedef struct {
    u16 side : 1;
    u16 kind : 5;
    u16 idx : 8;
    u16 pad : 2;
} Bits;

extern int func_ov002_0225929c(void *self);
extern int func_ov002_022ae718(void *p);
extern u32 data_ov002_022cd73c[];
extern u16 data_ov002_022d1a9c;

int func_ov002_022a8454(char *self) {
    int r = func_ov002_0225929c(self);
    Bits *b;
    switch (r) {
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
        return 0;
    }
    b = (Bits *)(self + 0x590);
    if (b->kind <= 10) {
        return (*(u32 *)(self + b->side * 4 + 0x588) >> b->kind) & 1;
    }
    if (b->kind == 11) {
        return (*(u32 *)(self + b->side * 4 + 0x588) >>
                (b->idx - *(int *)(self + b->side * 0xcc + 0x488) + 0x10)) & 1;
    }
    if (data_ov002_022cd73c[1] != b->side || b->kind != 13) {
        return 0;
    }
    return func_ov002_022ae718(&data_ov002_022d1a9c);
}
