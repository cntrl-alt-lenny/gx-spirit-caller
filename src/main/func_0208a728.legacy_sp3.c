typedef struct Obj {
    char pad0[0x120];
    int f120;
} Obj;
extern void func_02088518(Obj *o);

void func_0208a728(Obj *o)
{
    int c = o->f120;
    if (c == 0) {
        return;
    }
    o->f120 = c - 1;
    if (o->f120 != 0) {
        return;
    }
    func_02088518(o);
}
