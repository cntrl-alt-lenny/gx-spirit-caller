struct Node {
    unsigned short id;
    unsigned short side:1;
    unsigned short index:5;
    unsigned short :10;
    unsigned short :2;
    unsigned short blocked:1;
    unsigned short :3;
    unsigned short value:9;
    unsigned short :1;
};
extern int func_ov002_021de408(int a, int b);
extern void func_ov002_021d8904(int player, int idx, int value);
extern int func_ov002_021e104c();
extern int func_ov002_02257704(void *self);
int func_ov002_02216a08(struct Node *self, struct Node *other) {
    other->blocked = 1;
    switch (self->id) {
    case 0x12f5:
        func_ov002_021de408((int)self, 0x1f << ((1-self->side)*16));
        return 0;
    case 0x12f6:
        func_ov002_021d8904(other->side, other->index, other->value);
        return 0;
    case 0x12f7:
        { int side = self->side; int index = self->index; int bit = 1 << (side*16+index); int mask = 0x1f << ((1-side)*16); func_ov002_021de408((int)self, mask | bit); }
        return 0;
    case 0x131c:
        func_ov002_021de408((int)self, func_ov002_02257704(self));
        return 0;
    case 0x162a:
        func_ov002_021d8904(other->side, other->index, other->value);
        func_ov002_021e104c(self->side, 1);
        return 0;
    }
    return 0;
}


