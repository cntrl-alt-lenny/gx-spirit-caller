typedef unsigned char u8;
typedef unsigned short u16;
typedef struct Pair { int a; int b; } Pair;
typedef struct Rec {
    u8 type;
    u8 pad1;
    u16 h2;
    u16 h4;
    char pad6[10];
} Rec;

extern void func_02096040(Pair *p);
extern int func_02095e68(void *q, Rec *r, Pair *t);
extern int func_02089a84(void *a, int b, int c, int d);

int func_020899c0(void *a, void *q, int key, int c, int d)
{
    Pair t;
    Pair p8;
    Rec r;
    func_02096040(&p8);
    t = p8;
    if (q == 0) {
        return 0;
    }
    if (func_02095e68(q, &r, &t) != 0) {
        do {
            if (r.type == 1 && key == r.h4) {
                if (func_02089a84(a, r.h2, c, d) == 0) {
                    return 0;
                }
            }
        } while (func_02095e68(q, &r, &t) != 0);
    }
    return 1;
}
