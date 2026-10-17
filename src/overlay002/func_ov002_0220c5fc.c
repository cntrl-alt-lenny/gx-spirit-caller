struct Self0220c5fc {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short row : 5;
    unsigned short type : 6;
    unsigned short _pad : 4;
};

extern char data_ov002_022cf1a8[];
extern int func_ov002_0220736c(struct Self0220c5fc *self, int arg1);
extern int func_ov002_02207a70(struct Self0220c5fc *self, int arg1);

int func_ov002_0220c5fc(struct Self0220c5fc *self, int arg1) {
    switch (self->type) {
    case 6:
        return 1;
    case 15: {
        int b0 = self->b0;
        int row = self->row;
        if (*(int *)(data_ov002_022cf1a8 + (b0 & 1) * 0x868 + row * 20) & 2) {
            return func_ov002_0220736c(self, arg1);
        }
        break;
    }
    case 22: {
        int b0 = self->b0;
        int row = self->row;
        if (*(int *)(data_ov002_022cf1a8 + (b0 & 1) * 0x868 + row * 20) & 4) {
            return func_ov002_02207a70(self, arg1);
        }
        break;
    }
    }
    return 0;
}
