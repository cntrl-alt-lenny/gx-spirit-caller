typedef unsigned short u16;
typedef struct { u16 pad; u16 side : 1; } Obj;
struct Slot { unsigned int id : 13; unsigned int rest : 19; u16 pad; u16 value; char tail[12]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_021bbf50(int arg0);
extern int func_ov002_02281760(int a0, int player, ...);
int func_ov002_02296d78(Obj *self) {
    int count = 0;
    int i;
    struct Slot *p;
    int offset;
    char *row;
    if ((!func_ov002_021bbf50(self->side)) < 3) return 0;
    if (func_ov002_02281760((int)self, 1 - self->side, 0)) return 1;
    row = data_ov002_022cf16c + ((1 - self->side) & 1) * 0x868;
    p = (struct Slot *)(row + 0x30);
    for (i = 0, offset = 0; i < 5; i++, offset += 0x14) {
        if (p->id && *(u16 *)(row + offset + 0x36)) count++;
        p++;
    }
    return count >= 3;
}




