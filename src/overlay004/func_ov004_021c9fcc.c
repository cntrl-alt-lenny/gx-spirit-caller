extern void func_ov004_021c9f94(void *);
typedef struct { int f0, f4, f8, fc; } Req;
typedef struct { int f0, f4; } Out;
extern void func_0201ef90(int *, int *, int *, int, int, int, Req *, int, int, Out *);
extern int OS_SPrintf(char *, const char *, int, const char *);
typedef struct { int a, b, c, d; } Names;
extern Names data_ov004_02200dbc;
extern char data_ov004_02209ad4[];
typedef struct { int value; int flags; char pad[0x88]; int handle; } Obj;

void func_ov004_021c9fcc(Obj *obj, int id, int mode, int flags, int count) {
    char *paths[4];
    Names names;
    char buffers[4][0x20];
    int i;
    int action;

    func_ov004_021c9f94(obj);
    names = data_ov004_02200dbc;
    for (i = 0; i < 4; i++) {
        OS_SPrintf(buffers[i], data_ov004_02209ad4, id, (const char *)((int *)&names)[i]);
        paths[i] = buffers[i];
    }
    if (mode == 1) action = 1;
    else action = 2;
    func_0201ef90((int *)((char *)obj + 8), (int *)((char *)obj + 0xc),
                  (int *)((char *)obj + 0x10), flags,
                  count << 9, action, (Req *)paths,
                  count > 0 ? 1 : 0, 0x200, (Out *)((char *)obj + 0x90));
    obj->value = count;
    obj->flags = flags;
}
