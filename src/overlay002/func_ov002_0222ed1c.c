extern char data_ov002_022cf16c[];
extern char data_ov002_022cf1a4[];
extern int func_ov002_022101c4(void *self, int a1);

struct W {
    unsigned int pad0 : 13;
    unsigned int lo : 1;
    unsigned int pad1 : 8;
    unsigned int hi : 8;
    unsigned int pad2 : 2;
};

struct S {
    unsigned short a;
    unsigned short side : 1;
    unsigned short idx : 5;
    unsigned short pad : 10;
    unsigned short pad2 : 6;
    unsigned short key : 9;
    unsigned short pad3 : 1;
};

int func_ov002_0222ed1c(struct S *self, int a1) {
    struct W *w = (struct W *)(data_ov002_022cf16c + (self->side & 1) * 0x868 + 0x30 + self->idx * 20);

    if (self->key != w->hi * 2 + w->lo) {
        return 0;
    }
    if (*(unsigned short *)(data_ov002_022cf1a4 + (self->side & 1) * 0x868 + self->idx * 20) == 0) {
        return 0;
    }
    return func_ov002_022101c4(self, a1);
}
