typedef unsigned short u16;
typedef unsigned char u8;
struct node { u16 id; u16 player:1; u16 slot:5; u16 unused:10; u16 a:2; u16 flag:1; u16 marked:1; u16 b:2; u16 value:9; u16 c:1; };
struct Entry { unsigned int a:13; unsigned int bit:1; unsigned int b:8; unsigned int value:8; unsigned int c:2; unsigned int rest[4]; };
extern char data_ov002_022cf16c[];
extern int func_ov002_0223df38(void *, int, int *);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_0225764c(int arg0, int arg1, int arg2);
extern int func_ov002_021d5d48();
int func_ov002_02223120(struct node *self) {
    int packed;
    struct Entry *e = (struct Entry *)(data_ov002_022cf16c + (self->player & 1) * 0x868 + 0x30);
    if (self->value != e[self->slot].value * 2 + e[self->slot].bit) return 0;
    if (self->flag) { self->marked = 1; return 0; }
    if (func_ov002_0223df38(self, 0, 0)) {
        packed = func_ov002_0223de94(self, 0);
        int a = packed & 0xff;
        int b = ((u16)packed >> 8) & 0xff;
        if (func_ov002_0225764c((int)self, a, b)) {
            func_ov002_021d5d48(self->player, (u16)((u8)self->player | ((u8)self->slot << 8)), packed & 0xffff);
            return 0;
        }
    }
    self->marked = 1;
    return 0;
}



