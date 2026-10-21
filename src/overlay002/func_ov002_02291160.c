struct Card {
    unsigned short id;
    unsigned short side : 1;
    unsigned short slot : 5;
    unsigned short rest : 10;
};
extern int func_ov002_021bbd14(int self, int arg2);
extern unsigned int func_0202b8c0(int id);
extern unsigned int func_0202b878(int id);
extern int func_ov002_02281920(int a, int b);

int func_ov002_02291160(struct Card *self) {
    if (func_ov002_021bbd14(self->side, self->id) - (self->slot <= 10) <= 0)
        return 1;
    if (func_0202b8c0(self->id) == 4) {
        if (func_0202b878(self->id) == 23) {
            if (func_ov002_02281920(self->side, 0x19a3)) return 1;
        } else {
            if (func_ov002_02281920(self->side, 0x19a4)) return 1;
        }
    }
    return 0;
}
