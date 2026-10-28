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
struct Slot {
    unsigned int :13;
    unsigned int low:1;
    unsigned int :8;
    unsigned int high:8;
    unsigned int :2;
    char pad[16];
};
extern char data_ov002_022cf16c[];
extern char data_ov002_022d016c[];
extern int func_ov002_021b3ecc(int arg0, int arg1, int arg2);
extern int func_ov002_021decac(int a, int b, int c);
int func_ov002_02216ce4(int arg) {


    struct Node *self = (struct Node *)arg;
    struct Slot *slot;
    int i, side, j;
    if (self->blocked) return 0;

    slot = (struct Slot *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30) + self->index;
    if (self->value != slot->high * 2 + slot->low) return 0;
    i = 0;
    do {
        side = *(int *)(data_ov002_022d016c + 0xcec) ^ i;
        j = 0;
        do {
            if (func_ov002_021b3ecc(side, j, 0x12ea))
                func_ov002_021decac(arg, side, j);
            j++;
        } while (j < 5);
        i++;
    } while (i < 2);
    return 0;
}










