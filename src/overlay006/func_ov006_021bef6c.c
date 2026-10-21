typedef struct {
    char _pad0[0x18];
    unsigned int f_18;
    char _pad1[4];
    unsigned int f_20;
} state_02001d98_t;
extern void func_02001d68(int arg);
extern void func_02001d98(state_02001d98_t *p, int v);
extern void func_02004f58(int a, int b, int c, int d, int e, int f);
extern int func_02005554(int a0, int a1, int a2);
extern void *func_0208dd9c(void);
extern char *func_ov006_021b6be0(char *base, int sel, int idx);
extern char data_ov006_0224f448[];

int func_ov006_021bef6c(char *obj) {
    unsigned char *p = (unsigned char *)func_ov006_021b6be0(data_ov006_0224f448, 2, 0);
    char *q = (char *)func_0208dd9c() + 64;
    int x, y;
    func_02001d68(*(unsigned char *)p);
    func_02001d98((state_02001d98_t *)(obj + 4), 5);
    x = func_02005554((int)(p + 1), 12, 5);
    switch (*(int *)(obj + 0x40)) {
    case 0: case 3:
        x = 107;
        y = 3;
        break;
    default:
        x = 165 - x / 2;
        y = 12;
    }
    func_02004f58((int)(obj + 4), (int)(p + 1), (int)q, x, y, 12);
    func_02001d98((state_02001d98_t *)(obj + 4), -1);
    return 1;
}


