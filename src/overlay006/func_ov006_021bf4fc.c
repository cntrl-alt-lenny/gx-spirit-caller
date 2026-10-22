typedef struct {
    char _pad0[0x18];
    unsigned int f_18;
    char _pad1[4];
    unsigned int f_20;
} state_02001d98_t;
extern void *func_0208dd9c(void);
extern void func_02094504(int value, void *dest, int size);
extern void func_02001d68(int arg);
extern void func_02001d98(state_02001d98_t *p, int v);
extern char *func_0202c0c0(int id);
extern char *func_0202c44c(int idx);
extern int func_02005554(int a0, int a1, int a2);
extern void func_02004f58(int a, int b, int c, int d, int e, int f);
struct Mode { int pad; unsigned chan : 3; };
extern struct Mode data_02104f4c;
extern struct { char pad[0x240]; int index; } data_ov006_02255448;
int func_ov006_021bf4fc(char *obj) {
    char *q = func_0208dd9c();
    char *g;
    int width;
    func_02094504(0, q + 0x40, 0x1000);
    func_02001d68(data_02104f4c.chan);
    func_02001d98((state_02001d98_t *)(obj + 4), 5);
    if (data_ov006_02255448.index == 0)
        g = func_0202c0c0(0x1cd);
    else
        g = func_0202c44c(data_ov006_02255448.index);
    width = func_02005554((int)g, 12, 5);
    if (width >= 168) {
        func_02001d98((state_02001d98_t *)(obj + 4), 4);
        width = func_02005554((int)g, 12, 4);
    }
    func_02004f58((int)(obj + 4), (int)g, (int)(q + 0x40), 165 - width / 2, 12, 12);
    func_02001d98((state_02001d98_t *)(obj + 4), -1);
    return 1;
}
