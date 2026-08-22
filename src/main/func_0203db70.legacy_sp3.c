/* func_0203db70: dispatch on func_0207b5f8()'s state (13-way, 0-12, all
 * cases listed to force jump-table lowering per C-87); most handlers'
 * return values are discarded and the function returns 0, except state
 * 0 (returns 1 with no call) and state 11 (calls func_0203c85c(0) and
 * returns -1). Style B epilogue with a pure-padding sub sp,#4 (no r3
 * spill, no real local) => legacy_sp3 routing. */
extern int  func_0207b5f8(void);
extern int  func_0207c20c(void);
extern void func_0207bec8(void);
extern void func_0207bc20(void);
extern void func_0207b888(void);
extern void func_0207b62c(void);
extern void func_0203c85c(int a);

int func_0203db70(void) {
    int v = func_0207b5f8();
    switch (v) {
    case 0:
        return 1;
    case 1:
        func_0207c20c();
        break;
    case 2:
        break;
    case 3:
        func_0207bec8();
        break;
    case 4:
        break;
    case 5:
        break;
    case 6:
        func_0207bc20();
        break;
    case 7:
        break;
    case 8:
        break;
    case 9:
        func_0207b888();
        break;
    case 10:
        break;
    case 12:
        func_0207b62c();
        break;
    case 11:
        func_0203c85c(0);
        return -1;
    default:
        break;
    }
    return 0;
}
