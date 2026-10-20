typedef unsigned short u16;
typedef unsigned char u8;
struct node;
struct Node;
typedef struct { u16 id; u16 side:1; u16 kind:5; u16 rest:10; } Card021c1e44;
struct Card {
    u16 id;
    u16 side:1; u16 kind:5; u16 rest:10;
    u16 pad0:2; u16 flag:1; u16 failed:1; u16 pad1:2; u16 number:9; u16 pad2:1;
    u16 count; u16 slots[5]; u16 start;
};
struct Row { unsigned id:13; unsigned bit13:1; unsigned pad:8; unsigned field:8; unsigned rest:2; char tail[16]; };
extern char data_ov002_022cf16c[];
extern u16 func_ov002_0223de94(struct node *, int);
extern int func_ov002_0223df38(struct Node *, int, int *);
extern int func_ov002_021e797c(struct Card *, int, int);
extern unsigned int func_0202b878(int id);
extern int func_ov002_021d5d48(int a, int b, int c, int unused);
extern int func_ov002_021d90c0(int flag, int arg1, int arg2);
extern int func_ov002_021c1e44(Card021c1e44 *a0, int a1, int a2);
extern int func_ov002_021c1a2c(int, int, int);
extern void func_ov002_0226b11c(int unused0, int unused1);
int func_ov002_0220e77c(struct Card *self) {
    int packed;
    int side, kind;
    unsigned base;
    struct Row *rows;
    packed = func_ov002_0223de94((struct node *)self, 0);
    base = (unsigned)data_ov002_022cf16c + (self->side & 1) * 0x868;

    side = packed & 0xff;
    kind = ((u16)packed >> 8) & 0xff;
    if (self->number != ((struct Row *)(base + 0x30))[self->kind].field * 2 + ((struct Row *)(base + 0x30))[self->kind].bit13) return 0;
    if (!func_ov002_0223df38((struct Node *)self, 0, 0) || !func_ov002_021e797c(self, side, kind)) {
        self->failed = 1;
        return 0;
    }
    if (func_0202b878(self->id) == 0x17 && self->flag) {
        self->failed = 1;
        return 0;
    }
    func_ov002_021d5d48(self->side, (u16)((u8)self->side | ((u8)self->kind << 8)), packed & 0xffff, (u8)self->side);
    switch (self->id) {
    case 0x12c6:
    case 0x145b:
        func_ov002_021d90c0(self->side, self->kind, self->slots[1]);
        break;
    case 0x1322:
    case 0x169a:
        if (!self->flag && side != self->side && !func_ov002_021c1e44((Card021c1e44 *)self, side, kind) && func_ov002_021c1a2c(side, kind, self->id))
            func_ov002_0226b11c(side, kind);
        break;
    }
    return 0;
}



