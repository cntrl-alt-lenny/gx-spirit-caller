typedef unsigned short u16;
typedef unsigned char u8;
struct Self { u16 f0; u16 side:1; u16 pad2:15; u16 pad4:2; u16 blocked:1; u16 rest:13; };
struct Node;
struct node;
extern int func_ov002_0223df38(struct Node *self, int idx, int *out);
extern u16 func_ov002_0223de94(struct node *arg0, int arg1);
extern int func_ov002_021de9d4(int a, int b, int c);
extern void func_ov002_021d71e0(int a, int b, int c);
extern int func_ov002_021e286c(int arg0);
/* The original caller supplies only the two meaningful arguments. */
extern int func_ov002_021e104c();
struct State { char pad[0x5a8]; int state, value, flag; };
struct Row { unsigned pad:13; unsigned side:1; unsigned rest:18; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
int func_ov002_0221db5c(struct Self *self) {
    int raw;
    if (self->blocked) return 0;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        if (func_ov002_0223df38((struct Node *)self, 0, 0)) {
            raw = func_ov002_0223de94((struct node *)self, 0);
            if (!func_ov002_021de9d4((int)self, (u8)raw, (u8)((u16)raw >> 8))) return 0;
            data_ov002_022ce288.value = *(int *)(data_ov002_022cf178 + (self->side & 1) * 0x868);
            data_ov002_022ce288.flag = 0;
            return 0x7f;
        }
        return 0;
    case 0x7f:
        if (*(int *)(data_ov002_022cf178 + (self->side & 1) * 0x868)) {
            if (self->side != ((struct Row *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120))->side)
                data_ov002_022ce288.flag = 1;
            func_ov002_021d71e0(self->side, 0, 1);
            return 0x7f;
        }
        return 0x7e;
    case 0x7e:
        func_ov002_021e286c(self->side);
        if (data_ov002_022ce288.flag) func_ov002_021e286c(1 - self->side);
        return 0x7d;
    case 0x7d:
        func_ov002_021e104c(self->side, data_ov002_022ce288.value);
        return 0x7c;
    default: return 0;
    }
}
