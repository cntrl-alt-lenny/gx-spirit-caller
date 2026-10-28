typedef unsigned short u16;
typedef unsigned char u8;
struct F021ff354_F2 { u16 bit0:1; u16 pad6:5; u16 tag6:6; u16 flags:2; u16 rest:2; };
struct F021ff354_F4 { u16 pad6:6; u16 field9:9; u16 top:1; };
struct F021ff354_Self { u16 pad0; struct F021ff354_F2 f2; struct F021ff354_F4 f4; };
struct node { char _pad[8]; u16 arr8[5]; u16 f18; };
struct Other { u16 id; u16 f2; u16 f4; u16 kind:8; u16 rest:8; };
extern int func_ov002_021ff354(struct F021ff354_Self *self, int unused1);
extern int IsValue12D3Or147E(int a0);
extern unsigned int func_0202b878(int id);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
/* This caller supplies only two arguments; the thunk ignores the others. */
extern int func_ov002_021c8940();
extern char data_ov002_022cf1a4[];
int func_ov002_02204380(struct F021ff354_Self *self, struct Other *other) {
    if (func_ov002_021ff354(self, (int)other) && other && other->kind == 1 &&
        !IsValue12D3Or147E(other->id) && func_0202b878(other->id) == 0x17) {
        int pair = func_ov002_0223de94((struct node *)other, 0);
        int index = (u8)((u16)pair >> 8);
        int side = (u8)pair;
        if (index <= 4) {
            int value = *(u16 *)(data_ov002_022cf1a4 + (side & 1) * 0x868 + index * 0x14);
            if (value && func_ov002_021c8940(side, index) == 1) return 2;
        }
    }
    return self->f2.flags == 0;
}


