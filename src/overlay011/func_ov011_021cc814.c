extern int func_ov011_021cc7dc(void);
extern unsigned int func_02019124(void);
extern int func_ov011_021cf0a4(void);
extern unsigned func_ov011_021cdb7c(void);
extern void func_ov011_021cc664(int a, int b);
typedef struct {
    char pad0[0x218];
    int factor;
    char pad1[0x48];
    int mode;
    unsigned int unused : 5;
    unsigned int first : 4;
    unsigned int second : 4;
} State;
extern State data_ov011_021d403c;
void func_ov011_021cc814(void) {
    State *s = &data_ov011_021d403c;
    int bonus = func_ov011_021cc7dc();
    int start = func_02019124();
    int end = start + bonus;
    if (end > 255) end = 255;
    if (func_ov011_021cf0a4() == 0) {
        func_ov011_021cc664(start + (s->factor * (end - start)) / 4096, end);
        return;
    }
    switch (s->mode) {
    case 0:
        if (s->first == s->second) end = start;
        break;
    case 1:
        if (func_ov011_021cdb7c() == 0) end = start;
        break;
    }
    func_ov011_021cc664(start, end);
}


