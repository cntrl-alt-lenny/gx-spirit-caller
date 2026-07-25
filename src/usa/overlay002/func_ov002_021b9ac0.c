typedef struct {
    unsigned int field0 : 13;
    unsigned int pad13 : 1;
    unsigned int bit14 : 1;
    unsigned int pad15 : 17;
} S021b9ba0;

extern int func_02030538(int);

int func_ov002_021b9ac0(S021b9ba0 *p) {
    if (func_02030538(p->field0) != 0) {
        return p->bit14;
    }
    return 1;
}
