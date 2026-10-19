typedef struct {
    char pad0[8];
    int mode;
    int state;
    int trigger;
    void (*callback)(int);
    int target;
    short rectX;
    short rectY;
    unsigned short rectW;
    unsigned short rectH;
} Widget;
extern int func_0208c844(unsigned short *);
extern void func_0208c884(unsigned short *a0, int a1);
extern void func_0207ed94(void *);
extern void func_0207ec68(void *);
extern int func_0207f05c(void *, void *, unsigned short);
extern int func_ov010_021b2924(Widget *self, void *rngArg, int arg2);
extern int func_ov010_021b6c4c(int);
extern int func_ov010_021b7104(int arg0);
extern char data_ov010_021b9890[];
extern char data_ov010_021b9bec[];
extern char data_ov010_021b98a8[];
extern int data_ov010_021b9884[];
extern int data_ov010_021b8d44[];

int func_ov010_021b8514(void) {
    int saved;
    char *self = data_ov010_021b9890;
    saved = func_0208c844((unsigned short *)0x0400006c);
    char *out = data_ov010_021b9bec;
    int total = 0;
    func_0207ed94(data_ov010_021b98a8);
    func_0207ec68(data_ov010_021b98a8);
    switch (data_ov010_021b9884[3]) {
    case 3:
        total += func_ov010_021b6c4c((int)&out);
        break;
    case 7:
        total += func_ov010_021b7104((int)&out);
        break;
    }
    total += func_ov010_021b2924((Widget *)(self + 0x3c), self + 0x18, (int)&out);
    if (total > 0) {
        func_0207f05c(self + 0x18, data_ov010_021b9bec, (unsigned short)total);
    }
    func_0208c884((unsigned short *)0x0400106c, saved);
    if (data_ov010_021b8d44[25] == 0) {
        *(unsigned int *)0x04001000 &= ~0x1f00;
    }
    return 1;
}


