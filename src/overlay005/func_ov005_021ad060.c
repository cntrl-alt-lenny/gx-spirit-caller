typedef unsigned int u32;
typedef struct {
    int f0, f4;
    unsigned int mode;
    char pad0c[0x14];
    int f20;
    int f24;
    unsigned short length;
    char pad2a[0x1a];
    char *source;
    char text[0x20];
    unsigned char widths[0x20];
} State;
typedef struct { int f0; unsigned int language:3; unsigned int rest:29; } Settings;
extern Settings data_02104f4c;
extern char data_ov005_021b1e6c[];
extern void func_02094504(int value, void *dst, unsigned int size);
extern char *func_020aadf8(char *dst, const char *src);
extern int func_020aaddc(const char *s);
extern int func_020054a4(const unsigned int *c, int font);
extern int func_ov005_021af2dc(State *p);
extern int func_ov005_021adf3c(State *p);
extern int func_ov005_021afac8(int *p);
int func_ov005_021ad060(State *p) {
    char *source = p->source;
    unsigned int mode = p->mode;
    unsigned int ch;
    int i;
    func_02094504(0, data_ov005_021b1e6c, 0x3d4);
    p->source = source;
    p->mode = mode;
    func_020aadf8(p->text, p->source);
    func_ov005_021af2dc(p);
    if (data_02104f4c.language == 0) {
        p->length = (unsigned int)func_020aaddc(p->text) >> 1;
        if (p->length >= ((p->mode == 0 || p->mode == 3 || p->mode == 4) ? 10 : 12))
            p->length = ((p->mode == 0 || p->mode == 3 || p->mode == 4) ? 10 : 12) - 1;
    } else {
        p->length = func_020aaddc(p->text);
        for (i = 0; i < p->length; i++) {
            ch = (unsigned char)p->text[i];
            p->widths[i] = func_020054a4(&ch, 12);
            if (p->text[i] == 0x20)
                p->widths[i] = 6;
        }
        if (p->length >= ((p->mode == 0 || p->mode == 3 || p->mode == 4) ? 10 : 12) * 2)
            p->length = ((p->mode == 0 || p->mode == 3 || p->mode == 4) ? 10 : 12) * 2 - 1;
    }
    func_ov005_021adf3c(p);
    if (p->f20 > 6)
        func_ov005_021afac8((int *)p);
    return 1;
}
