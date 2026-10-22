typedef unsigned short u16;
typedef struct {
    u16 id;
    u16 side:1;
    u16 slot:5;
    u16 kind:6;
    u16 rest:4;
    u16 pad4:6;
    u16 value:9;
    u16 rest4:1;
} Self;
typedef struct {
    unsigned int pad:13;
    unsigned int low:1;
    unsigned int pad2:8;
    unsigned int high:8;
    unsigned int pad3:2;
    unsigned int other[4];
} Entry;
struct Obj1074c;
extern char data_ov002_022cf16c[];
extern int func_ov002_021de480(int arg0, int arg1, int arg2, int arg3);
extern int func_ov002_0221074c(struct Obj1074c *self, int unused1);
int func_ov002_02232c84(Self *self, int arg) {
    Entry *entry;
    if (self->kind == 5) {
        entry = (Entry *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30);
        if (self->value != entry[self->slot].high * 2 + entry[self->slot].low)
            return 0;
        func_ov002_021de480(self->side, self->slot, 0, 0);
        return 0;
    }
    return func_ov002_0221074c((struct Obj1074c *)self, arg);
}
