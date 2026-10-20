typedef void (*Handler)(int, int, int, int, int, int);
typedef struct {
    char pad0[0x1c];
    void *store;
    int unknown;
    int state;
    char pad28[0x60];
    Handler handler;
    int handler_arg;
} Context;
typedef struct {
    int id;
    int type;
    char text[0x100];
    char other[0x100];
    int x;
    int y;
} Entry;
extern Context *data_0219daec;
extern char data_020ff918[], data_020ff91c[], data_020ff908[];
extern int func_02045280(void);
extern void func_020467f4(void);
extern void func_020466f4(int arg);
extern int func_0204918c(int a);
/* This caller supplies an extra r1 argument beyond the existing C definition. */
extern int func_020556c8(void *self, int id);
extern int func_02055738(void **a0, int a1, int *out);
extern int func_020557b8(void *a0, int id, Entry *out);
extern int func_02045b1c(char *key, char *out, char *text, int sep);
extern long func_020acca0(char *s, char **end, int base);
extern void func_0205121c(int a0, int a1, int a2, int a3, int a4);
extern void func_02046254(int a, int b, int c, int d, int e);
extern void func_0204525c(int a0, int a1);
extern int func_02049038(int id, char *a, char *b);
int func_02046c88(int a0, Handler a1, int a2, int a3, int a4) {
    int index = -1;
    char number[4];
    Entry entry;
    int id;
    unsigned char first; unsigned char second;
    if (func_02045280() != 0 || data_0219daec->state != 3) return 0;
    func_020467f4();
    data_0219daec->handler = a1;
    data_0219daec->handler_arg = a2;
    func_020466f4(5);
    id = func_0204918c(a0);
    if (id == 0 || func_020556c8(&data_0219daec->store, id) == 0) {
        a3 = 11;
    } else {
        func_02055738(&data_0219daec->store, id, &index);
        func_020557b8(&data_0219daec->store, index, &entry);
        if (entry.type != 6) {
            a3 = 11;
        } else {
            number[0] = '0';
            func_02045b1c(data_020ff918, number, entry.text, 47);
            first = func_020acca0(number, 0, 10);
            func_02045b1c(data_020ff91c, number, entry.text, 47);
            second = func_020acca0(number, 0, 10);
            if (second == first) {
                a3 = 13;
            } else {
                func_0205121c(id, (int)func_02046254, 0, a3, a4);
                return 1;
            }
        }
    }
    func_0204525c(a3, 0);
    data_0219daec->handler(a3, 0, 1, 0, 0, data_0219daec->handler_arg);
    if (data_0219daec != 0 && data_0219daec->state == 5) {
        func_020466f4(3);
        func_02049038(1, data_020ff908, 0);
    }
    return 1;
}


