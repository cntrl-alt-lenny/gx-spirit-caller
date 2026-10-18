struct State { char pad[0x5a8]; int state; int count; };
struct Arg { unsigned short a; unsigned short side:1; unsigned short rest:15; };
struct Row { unsigned int pad0:13; unsigned int lo:1; unsigned int pad1:8; unsigned int hi:8; unsigned int pad2:2; };
extern struct State data_ov002_022ce288;
extern char data_ov002_022cf178[];
extern char data_ov002_022cf16c[];
extern void func_ov002_021d7c1c(void *a, void *b, void *c);
extern int func_ov002_021ca5bc(int arg0);
extern void func_ov002_021df818(void *self, int side, int val);
int func_ov002_02236620(struct Arg *self) {
    unsigned int idx, off;
    struct Row *row;
    switch (data_ov002_022ce288.state) {
    case 0x80:
        data_ov002_022ce288.count = 0;
    case 0x7f:
        idx = self->side;
        off = (idx & 1) * 0x868;
        if (*(int *)(data_ov002_022cf178 + off) != 0) {
            func_ov002_021d7c1c((void *)idx, data_ov002_022cf16c + off + 0x120, 0);
            row = (struct Row *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x120);
            if (func_ov002_021ca5bc(row->hi * 2 + row->lo) != 0) {
                data_ov002_022ce288.count++;
            }
            return 0x7f;
        }
        return 0x7e;
    case 0x7e:
        func_ov002_021df818(self, 1 - self->side, data_ov002_022ce288.count * 200);
        return 0;
    }
    return 0;
}
