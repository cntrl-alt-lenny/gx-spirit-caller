typedef struct {
    unsigned int a;
    unsigned int b;
    unsigned char _pad8[0x14];
    struct { unsigned int low8 : 8; unsigned int : 24; };
    unsigned char _pad20[4];
    struct { unsigned int : 17; unsigned int mid4 : 4; unsigned int : 11; };
} state_t;
typedef struct {
    int unused[3];
    int a;
    int b;
} Menu;
extern state_t data_02102c90;
extern void func_02001d0c(state_t *p, int a, int b);
extern void func_02004f58(int a, int b, int c, int d, int e, int f);
extern char *func_0202c0c0(int id);
extern char *func_0208df0c(void);
extern void func_02094504(int value, void *dest, int size);
void func_ov017_021b61dc(Menu *p) {
    char *text;
    unsigned char *row;
    int index;
    func_02094504(0, func_0208df0c() + 0x12c0, 0x12c0);
    func_02001d0c(&data_02102c90, 0x1c, 5);
    row = (unsigned char *)p + p->b;
    index = p->a;
    text = func_0202c0c0((row + index)[0x20] + 0x79f);
    func_02004f58((int)&data_02102c90, (int)text, (int)(func_0208df0c() + 0x12c0), 1, 2, 0xc);
}

