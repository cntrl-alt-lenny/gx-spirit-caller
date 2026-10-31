typedef struct { char pad[8]; int f_8; int f_c; } state_8_c_t;
struct Func0208b0a4Self { int f0; int f4; int f8; int f12; };
typedef struct Obj {
    char pad0[0xe8];
    struct Func0208b0a4Self state;
    char padf8[0x18];
    struct { int bit0:1; int bit1:1; int bit2:1; int bit3:1; int rest:28; } flags;
    int field114;
    int field118;
    char pad11c[0x38];
    int field154;
    int field158;
    char pad15c[0x14];
} Obj_0208a7c8_t;
extern Obj_0208a7c8_t data_021a5d3c[];
extern short data_020c31f8[];
extern void func_0208a7c8(Obj_0208a7c8_t *a);
extern void func_02088268(struct Obj *o, int base);
extern int func_020882fc(struct Obj *o);
extern int func_0208b040(state_8_c_t *p);
extern void func_0208b058(state_8_c_t *p);
extern int func_0208b070(struct Func0208b0a4Self *self);
void func_0208a8f8(void) {
    int i;
    int base;
    Obj_0208a7c8_t *p = data_021a5d3c;
    for (i=0; i<4; i++,p++) {
        if (p->flags.bit0) {
            if (p->field114 == 0) {
                func_0208a7c8(p);
            } else {
                if (p->flags.bit2 && p->field118 != 0) {
                    func_020882fc(p);
                    p->flags.bit1 = 1;
                    p->flags.bit2 = 0;
                }
                if (p->flags.bit1) {

                    func_0208b058((state_8_c_t *)&p->state);
                    base = data_020c31f8[p->field154];
                    { int sum = func_0208b070(&p->state);
                    sum = data_020c31f8[sum >> 8];
                    sum += base;
                    if (sum != p->field158) {
                        func_02088268(p,sum);
                        p->field158 = sum;
                    }
                    }
                    if (p->flags.bit3 && func_0208b040((state_8_c_t *)&p->state)) {
                        func_0208a7c8(p);
                    }
                }
            }
        }
    }
}




