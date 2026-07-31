/* func_ov002_022935a0: compare a candidate's stat (func_0202b8f0/
 * func_0202b920, id from func_ov002_021afb74()&0x1fff) against a
 * per-side max computed via func_ov002_02280a1c's two out-params,
 * gated by func_ov002_022806a4's side check; func_0202de9c tiebreak.
 */

typedef struct {
    unsigned short id;
    unsigned short side : 1;
} Ov002022935a0Thing;

typedef struct {
    unsigned int id : 13;
} Ov002021afb74Ret;

extern int func_ov002_022806a4(int side, int a, int b);
extern Ov002021afb74Ret *func_ov002_021afb74(void);
extern int func_0202b8f0(int id);
extern int func_0202b920(int id);
extern int func_0202de9c(int id);
extern void func_ov002_02280a1c(int side, int *out2, int *out1, int d);

int func_ov002_022935a0(Ov002022935a0Thing *p) {
    int r4 = 0;
    int id;
    int b, a;

    if (func_ov002_022806a4(1 - p->side, p->id, 0) >= 0) {
        id = func_ov002_021afb74()->id;
        if (func_0202b8f0(id) > func_0202b920(id)) {
            r4 = func_0202b8f0(id);
        } else {
            r4 = func_0202b920(id);
        }
    }

    if (func_ov002_022806a4(p->side, p->id, 0) < 0) {
        goto ret0;
    }

    id = func_ov002_021afb74()->id;
    func_ov002_02280a1c(1 - p->side, &b, &a, 0);
    if (r4 <= ((b > a) ? b : a)) {
        r4 = (b > a) ? b : a;
    }

    if (func_0202b8f0(id) > 0x6a4) {
        if (func_0202b920(id) >= r4) goto ret1;
    }
    if (func_0202de9c(id) != 1) goto ret0;

ret1:
    return 1;
ret0:
    return 0;
}
