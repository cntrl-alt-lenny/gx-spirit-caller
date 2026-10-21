typedef struct {
    int f_0;
    unsigned short h_4;
    char _pad6[2];
    int f_8;
} state_020628fc_t;

struct S020643ec_A0 {
    unsigned char _pad_00[0xc];
    int f_c;
    int f_10;
    int f_14;
};

extern int func_020628fc(state_020628fc_t *p);
extern int func_020643ec(struct S020643ec_A0 *a0, void *a1, void *a2);

int func_02063dc8(struct S020643ec_A0 *self) {
    void *flag;
    if (func_020628fc((state_020628fc_t *)self) == 0) {
        return 0;
    }
    if (self->f_c == 6) {
        flag = 0;
    } else {
        flag = 1;
    }
    if (func_020643ec(self, 2, flag) == 0) {
        return 0;
    } else {
        return 1;
    }
}
