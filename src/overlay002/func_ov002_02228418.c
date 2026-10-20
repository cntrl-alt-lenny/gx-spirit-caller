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
    char pad2[0x824];
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
typedef struct { unsigned short value; char pad[0x12]; } Entry;
typedef struct { Entry ents[1]; char pad[0x854]; } Values;
extern Values data_ov002_022cf1a4[];
extern int func_ov002_021de5d4(int a, int b, int c);
int func_ov002_02228418(Self *self) {
    unsigned int side = self->f2.side;
    unsigned int idx = self->f2.idx;
    unsigned int val = self->f4.val;
    Slot *p = &data_ov002_022cf16c[side & 1].ents[idx];
    if (val != p->hi * 2 + p->lo) return 0;
    if (data_ov002_022cf1a4[side & 1].ents[idx].value == 0) return 0;
    func_ov002_021de5d4(side, idx, 0);
    return 0;
}


