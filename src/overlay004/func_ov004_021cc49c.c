typedef struct {
    char pad[0x90];
    int selection;
    char pad94[0x10];
    int offset;
    char pada8[8];
    int action;
} State;
extern State data_ov004_0220b500;
extern unsigned char data_02104bac[];
extern unsigned int func_02006194(void);
extern unsigned int func_0200617c(void);
extern void func_0200612c(int *out_a, int *out_b);
extern void func_02006110(int *out_a, int *out_b);
extern void func_ov004_021cc21c(void);
extern void func_ov004_021cc2a4(void);
void func_ov004_021cc49c(void) {
    State *s = &data_ov004_0220b500;
    int z, y, x;
    s->action = 0;
    if (s->selection < 0) s->selection = 0;
    if (func_02006194() != 0 || func_0200617c() != 0) {
        func_0200612c(&z, &x);
        func_02006110(&z, &y);
        if (x < 32) return;
        y += s->offset;
        if (y < 99 || y >= 123) return;
        if (z >= 9 && z < 112) {
            s->action = 1;
            s->selection = 0;
            if (func_0200617c() != 0) func_ov004_021cc21c();
        }
        if (z >= 117 && z < 220) {
            s->action = 2;
            s->selection = 1;
            if (func_0200617c() != 0) func_ov004_021cc2a4();
        }
    } else {
        if (s->selection == 0 && (*(unsigned short *)(data_02104bac + 0x54) & 1)) {
            s->action = 1;
            func_ov004_021cc21c();
        } else if ((*(unsigned short *)(data_02104bac + 0x54) & 2) ||
                   (s->selection == 1 && (*(unsigned short *)(data_02104bac + 0x54) & 1))) {
            s->action = 2;
            s->selection = 1;
            func_ov004_021cc2a4();
        } else if (*(unsigned short *)(data_02104bac + 0x54) & 0x20) {
            s->selection = 0;
        } else if (*(unsigned short *)(data_02104bac + 0x54) & 0x10) {
            s->selection = 1;
        }
    }
}
