/* func_ov002_0222d2f8: dispatch on CE288->f_5a8 (data_ov002_022ce288+0x5a8).
 * v==0x80: submit a kind-21 request via func_ov002_0226b22c(b0,row,3,1) and
 * return 0x7f. v==0x7f: check data_ov002_022d0e6c+0xb2 (u16); if ==3 call
 * func_ov002_02257704(self) and forward the result to
 * func_ov002_021de408(self, result); else if ==0, do the same via
 * func_ov002_02257750(self, &func_ov002_021efac8). Otherwise (neither v
 * value) return 0. */
struct Self0222d2f8 {
    unsigned short f_0;
    unsigned short b0 : 1;
    unsigned short row : 5;
    unsigned short _pad : 10;
};

extern char data_ov002_022ce288[];
extern char data_ov002_022d0e6c[];
extern int func_ov002_0226b22c(int b0, int row, int a2, int a3);
extern int func_ov002_02257704(void *self);
extern int func_ov002_02257750(void *self, int val);
extern int func_ov002_021de408(int a, int b);
extern int func_ov002_021efac8(void *self, int player, int idx);

int func_ov002_0222d2f8(struct Self0222d2f8 *self) {
    int v = *(int *)(data_ov002_022ce288 + 0x5a8);
    int cbret;

    switch (v) {
    case 0x7f:
        goto handle_7f;
    case 0x80:
        break;
    default:
        goto ret0_alt;
    }
    {
        int b0 = self->b0;
        int row = self->row;
        func_ov002_0226b22c(b0, row, 3, 1);
    }
    return 0x7f;

handle_7f:
    if (*(unsigned short *)(data_ov002_022d0e6c + 0xb2) == 3) {
        cbret = func_ov002_02257704(self);
        func_ov002_021de408((int)self, cbret);
        goto ret0_shared;
    }
    if (*(unsigned short *)(data_ov002_022d0e6c + 0xb2) == 0) {
        cbret = func_ov002_02257750(self, (int)func_ov002_021efac8);
        func_ov002_021de408((int)self, cbret);
    }
ret0_shared:
    return 0;
ret0_alt:
    return 0;
}
