/* func_0203db20: dispatch on func_0207b510()'s state (13-way, 0-12, all
 * cases listed to force jump-table lowering per C-87); most handlers'
 * return values are discarded and the function returns 0, except state
 * 0 (returns 1 with no call) and state 11 (calls func_0203c80c(0) and
 * returns -1). Style B epilogue with a pure-padding sub sp,#4 (no r3
 * spill, no real local) => legacy_sp3 routing. */
extern int  func_0207b510(void);
extern int  func_0207c124(void);
extern void func_0207bde0(void);
extern void func_0207bb38(void);
extern void func_0207b7a0(void);
extern void func_0207b544(void);
extern void func_0203c80c(int a);

int func_0203db20(void) {
    int v = func_0207b510();
    switch (v) {
    case 0:
        return 1;
    case 1:
        func_0207c124();
        break;
    case 2:
        break;
    case 3:
        func_0207bde0();
        break;
    case 4:
        break;
    case 5:
        break;
    case 6:
        func_0207bb38();
        break;
    case 7:
        break;
    case 8:
        break;
    case 9:
        func_0207b7a0();
        break;
    case 10:
        break;
    case 12:
        func_0207b544();
        break;
    case 11:
        func_0203c80c(0);
        return -1;
    default:
        break;
    }
    return 0;
}
