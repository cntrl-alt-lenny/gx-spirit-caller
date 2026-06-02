/* func_ov006_021be878: scan up to 7 slots; record whether any passes the
 * 021b7ce0 predicate into obj+0x78; return 1. */
extern int func_ov006_021b7ce0(void *g, int x, int i);
extern char data_ov006_0224f448[];
int func_ov006_021be878(int *obj) {
    int found = 0, i;
    for (i = 0; i < 7; i++) {
        if (func_ov006_021b7ce0(data_ov006_0224f448, obj[20], i) >= 0) {
            found = 1;
            break;
        }
    }
    obj[30] = found;
    return 1;
}
