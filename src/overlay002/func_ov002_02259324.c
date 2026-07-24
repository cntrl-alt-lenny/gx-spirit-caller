/* func_ov002_02259324: like func_ov002_022592ec but cmd-id is the constant 9
 * and arg0 lands in the f3460 (+0xD84) param slot. Same struct + store
 * schedule as the shipped sibling 022592ec (offset-member, not pointer-cast,
 * is what gives `ldr [base,#off]` instead of a pool-folded address). */

struct g016c {
    char _a[3400];
    int f3400;
    int _p1;
    int f3408;
    int f3412;
    int f3416;
    char _p2[16];
    int f3436;
    char _p3[20];
    int f3460;
};
struct g73c { char _a[4]; int f4; };

extern struct g016c data_ov002_022d016c;
extern struct g73c data_ov002_022cd73c;

void func_ov002_02259324(int arg0) {
    data_ov002_022d016c.f3400 = 9;
    data_ov002_022d016c.f3460 = arg0;
    data_ov002_022d016c.f3412 = 0;
    data_ov002_022d016c.f3408 = 0;
    data_ov002_022d016c.f3436 = data_ov002_022cd73c.f4;
    data_ov002_022d016c.f3416 = 0;
}
