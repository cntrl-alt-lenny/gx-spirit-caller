typedef unsigned short u16;
typedef unsigned int u32;
struct Self { u16 id; u16 bit:1; u16 slot:5; u16 rest:10; u16 flags:6; u16 value:9; u16 spare:1; };
struct Word { u32 low:13; u32 bit:1; u32 mid:8; u32 value:8; u32 high:2; };
struct Entry { struct Word card; char pad[16]; };
struct Player { char pad[0x30]; struct Entry entries[1]; };
extern char data_ov002_022cf16c[];
extern struct { char pad[0x5a8]; int state; } data_ov002_022ce288;
extern void func_ov002_021ae400(int a, int b);
extern void func_ov002_021af9d0(int a, int b, int c, int d);
extern int *func_ov002_021afb74(void);
extern int func_ov002_021d59cc(int arg0, int arg1, int arg2, int arg3, unsigned short arg4);
extern int func_ov002_021e1aec(int arg0, int arg1, int arg2);
extern int func_ov002_021e286c(int arg0);
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
int func_ov002_02225b34(struct Self *self) {
    struct Word *p;
    unsigned int value;
    struct Word *q;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0225368c(self->bit, self->id, 0) == 0) {
            *(u16 *)((char *)self + 4) |= 8;
            return 0;
        }
        func_ov002_021ae400(self->bit, 0x5e);
        return 0x7f;
    case 0x7f:
        func_ov002_021af9d0(self->bit, 6, self->id, 0);
        return 0x7e;
    case 0x7e:
        p = (struct Word *)func_ov002_021afb74();
        value = ((struct Word *)func_ov002_021afb74())->value * 2 + p->bit;
        func_ov002_021e1aec(self->bit, value, 0x80);
        q = &((struct Player *)(data_ov002_022cf16c + (self->bit & 1) * 0x868))->entries[self->slot].card;
        if (q->value * 2 + q->bit == self->value)
            func_ov002_021d59cc(self->bit, self->slot, self->id, 3, (u16)value);
        func_ov002_021e286c(self->bit);
        return 0;
    }
    return 0;
}

