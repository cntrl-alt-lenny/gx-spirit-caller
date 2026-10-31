typedef struct {
    unsigned int low:3;
    unsigned int kind:4;
    unsigned int x:9;
    unsigned int y:9;
    unsigned int high:7;
    unsigned int low4:16;
    unsigned int index:8;
    signed int value:8;
} Entry;
extern unsigned int func_ov000_021ac760(void *p);
extern void func_ov012_021caea8(int idx, int a1, int a2, int a3, void *a4, int a5);
int func_ov012_021caf80(Entry *p) {
    int coords[2];
    int flag = 0;
    coords[0] = p->x << 12;
    coords[1] = p->y << 12;
    if (p->kind == 1) flag = 1;
    if (func_ov000_021ac760(p)) {
        func_ov012_021caea8(p->index + 1, p->value, 2, 16, coords, 0);
    } else if (flag) {
        coords[1] += 0x1000;
        func_ov012_021caea8(p->index, p->value, 2, 16, coords, 0);
    } else {
        func_ov012_021caea8(p->index, p->value, 2, 16, coords, 0);
    }
    return 0;
}
