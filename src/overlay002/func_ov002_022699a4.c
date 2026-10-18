struct Self02257cfc;
extern int func_ov002_02257cfc(struct Self02257cfc *self, int arg1);
extern void func_ov002_021b1570(int a, int b, void *c, int n);
typedef struct { unsigned short low:8; unsigned short high:8; } State;
extern struct { char pad[14]; State state; } data_ov002_022cdc68;
extern State data_ov002_022cdc76;
extern char data_ov002_022ce588[];
extern struct {
    char pad[0x484]; int index; int unused; void *current;
    char pad2[0x118]; int a; int b; int c;
} data_ov002_022ce288;
int func_ov002_022699a4(void) {
    int index = data_ov002_022ce288.index;
    struct Self02257cfc *current = (struct Self02257cfc *)(data_ov002_022ce588 + index * 0x18);
    struct Self02257cfc *previous = index > 0 ? (struct Self02257cfc *)((char *)current - 0x18) : 0;
    switch (data_ov002_022cdc68.state.high) {
    case 0: {
        unsigned short next = data_ov002_022cdc68.state.high + 1;
        data_ov002_022ce288.a = 0x80;
        data_ov002_022ce288.b = 0;
        data_ov002_022ce288.c = 0;
        data_ov002_022cdc68.state.high = next;
    }
    case 1:
        data_ov002_022ce288.current = current;
        data_ov002_022ce288.a = func_ov002_02257cfc(current, (int)previous);
        if (data_ov002_022ce288.a == 0) {
            data_ov002_022cdc76.high++;
        }
        return 0;
    case 2:
        func_ov002_021b1570(0x19, -1, previous ? previous : current, previous ? 0x30 : 0x18);
        return 1;
    }
    return 1;
}



