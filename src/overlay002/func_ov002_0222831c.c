typedef struct {
    unsigned int id : 13;
    unsigned int lo : 1;
    unsigned int pad : 8;
    unsigned int hi : 8;
    unsigned int rest : 2;
    char pad2[0x10];
} Slot;

typedef struct {
    char pad0[0x30];
    Slot ents[1];
    char pad2[0x868 - 0x44];
} Side;

typedef struct {
    unsigned short f0;
    struct {
        unsigned short side : 1;
        unsigned short idx : 5;
        unsigned short rest : 10;
    } f2;
    struct {
        unsigned short pad : 6;
        unsigned short val : 9;
        unsigned short rest : 1;
    } f4;
} Self;

extern Side data_ov002_022cf16c[];
extern int func_ov002_02206780(Self *s, int x);
extern void func_ov002_0227ac64(int a, void *b, int c, int d, int e);

int func_ov002_0222831c(Self *self, int x) {
    int mode = 1;
    unsigned int val = self->f4.val;
    Slot *p = &data_ov002_022cf16c[self->f2.side & 1].ents[self->f2.idx];
    if (val != p->hi * 2 + p->lo) {
        return 0;
    }
    if (func_ov002_02206780(self, x) == 0) {
        return 0;
    }
    if (self->f0 != 0x1472) {
        if (self->f0 == 0x1aca) {
            mode = 2;
        }
    } else {
        mode = 2;
    }
    func_ov002_0227ac64(self->f2.side, &data_ov002_022cf16c[self->f2.side & 1].ents[self->f2.idx], 1, mode, 1);
    return 0;
}
