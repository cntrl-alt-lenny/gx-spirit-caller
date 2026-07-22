typedef struct {
    unsigned int field0 : 13;
    unsigned int pad13 : 1;
    unsigned int bit14 : 1;
    unsigned int pad15 : 17;
} S021b9ba0;

extern int func_0203058c(int);

int func_ov002_021b9ba0(S021b9ba0 *p) {
    if (func_0203058c(p->field0) != 0) {
        return p->bit14;
    }
    return 1;
}
