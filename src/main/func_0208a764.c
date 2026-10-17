typedef struct Obj {
    char pad0[0x110];
    int flag : 1;
    char pad114[0x50];
    void (*f164)(struct Obj *);
} Obj;

extern void func_0208a728(Obj *o);
extern void func_0208a6b8(void *q, Obj *o);
extern void func_0208a8bc(Obj *o);
extern char data_021a5d30[];
extern char *data_021a5840;

void func_0208a764(Obj *o)
{
    if (o->flag == 0) {
        return;
    }
    func_0208a728(o);
    o->f164(o);
    func_0208a6b8(data_021a5d30, o);
    if (data_021a5840 != 0) {
        func_0208a6b8(data_021a5840 + 0x4e0, o);
    }
    func_0208a8bc(o);
}
