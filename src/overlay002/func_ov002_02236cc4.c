typedef unsigned short u16; typedef unsigned int u32;

typedef struct {
    u16 f_0;
    u16 f_2;
} Self02210104;
extern int func_ov002_02210104(Self02210104 *self, int unused1);

struct Entry {
    u16 f0;
    u16 side : 1;
    u16 index : 5;
    u16 rest : 10;
    u16 low : 6;
    u16 value : 9;
    u16 high : 1;
};
struct Row {
    u32 pad0 : 13;
    u32 low : 1;
    u32 pad1 : 8;
    u32 high : 8;
    u32 pad2 : 2;
    char pad[16];
};
struct Side {
    char pad[48];
    struct Row rows[104];
    char tail[24];
};
extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];

int func_ov002_02236cc4(struct Entry *self, int unused1) {
    struct Row *row = (struct Row *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30 + self->index * 20);
    if (self->value != row->high * 2 + row->low) return 0;
    if (*(u16 *)(data_ov002_022cf1a4 + (self->side & 1) * 0x868 + self->index * 20) == 0) return 0;
    return func_ov002_02210104((Self02210104 *)self, unused1);
}


