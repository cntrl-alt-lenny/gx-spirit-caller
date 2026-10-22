typedef struct { char pad[0xc]; unsigned short h_c; } state_chain_t;
typedef struct { unsigned char pad[0x30]; unsigned short f30; } T;
typedef struct { char pad[8]; int f8; char pad2[12]; int f18; } state_8_18_t;
struct Obj;
struct Pack;
extern void *func_020854a4(void *self);
extern void *func_020854e4(state_chain_t *p);
extern int func_02082050(const unsigned short *p);
extern int func_02082044(const unsigned short *p);
extern int func_02081f50(T *p);
extern void func_02082030(state_8_18_t *p, int a, int b);
extern void func_02081f48(void *p, int value);
extern void func_02081f5c(struct Obj *o, int flag);
extern void func_02081ee4(struct Obj *o, int flag);
extern int func_02081b5c(struct Pack *a, void *ctx);
extern int (*data_021020f4)(int size, int kind, int arg);
extern void (*data_021020f8)(int value);
extern int (*data_021020fc)(int size, int flag, int arg);
extern void (*data_02102100)(int value);

int func_02085074(void *p)
{
    void *obj;
    int a, b, c;
    int ok1, ok2, ok3;
    switch (*(unsigned int *)p) {
    case 0x30444d42:
    case 0x30585442:
        ok1 = 1; ok2 = 1; ok3 = 1;
        obj = func_020854a4(p);
        if (obj != 0) {
            a = func_02082050(obj);
            b = func_02082044(obj);
            c = func_02081f50(obj);
            if (a != 0) {
                a = data_021020f4(a, 0, 0);
                if (a == 0) ok1 = 0;
            } else { a = 0; }
            if (b != 0) {
                b = data_021020f4(b, 1, 0);
                if (b == 0) ok2 = 0;
            } else { b = 0; }
            if (c != 0) {
                c = data_021020fc(c, *(unsigned short *)((char *)obj + 0x20) & 0x8000, 0);
                if (c == 0) ok3 = 0;
            } else { c = 0; }
            if (!ok1 || !ok2 || !ok3) {
                data_02102100(c);
                data_021020f8(b);
                data_021020f8(a);
                return 0;
            }
            func_02082030(obj, a, b);
            func_02081f48(obj, c);
            func_02081f5c(obj, 1);
            func_02081ee4(obj, 1);
        }
        if (*(unsigned int *)p == 0x30444d42) {
            struct Pack *pack = func_020854e4(p);
            if (obj != 0) func_02081b5c(pack, obj);
        }
        return 1;
    case 0x30414342:
    case 0x30414d42:
    case 0x30415442:
    case 0x30415642:
    case 0x30505442:
        return 1;
    default:
        return 0;
    }
}


