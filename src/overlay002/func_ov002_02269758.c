extern int func_ov002_02257c54(void *arg0, int arg1);
extern void func_ov002_021b1570(int a, int b, void *c, int n);
typedef struct { unsigned short low:8; unsigned short high:8; } State;
typedef struct { unsigned short id; unsigned short flags:15; unsigned short done:1; char pad[20]; } Record;
extern struct { char pad[12]; State state; } data_ov002_022cdc68;
extern State data_ov002_022cdc74;
extern Record data_ov002_022ce588[];
extern struct {
    char pad[0x484]; int index; int unused; void *current;
    char pad2[0x124]; int a; int b; int c;
} data_ov002_022ce288;
int func_ov002_02269758(void) {
    int index = data_ov002_022ce288.index;
    Record *current = &data_ov002_022ce588[index];
    Record *previous = index > 0 ? current - 1 : 0;
    switch (data_ov002_022cdc68.state.high) {
    case 0: {
        unsigned short next = data_ov002_022cdc68.state.high + 1;
        data_ov002_022ce288.a = 0;
        data_ov002_022ce288.c = 0;
        data_ov002_022cdc68.state.high = next;
    }
    case 1: {
        int result;
        data_ov002_022ce288.current = current;
        result = func_ov002_02257c54(current, (int)previous);
        if (result != 0) {
            unsigned short done = result > 0 ? 1 : 0;
            current->done = done;
            data_ov002_022cdc74.high++;
        }
        return 0;
    }
    case 2:
        func_ov002_021b1570(0x1d, -1, current, 0x18);
        return 1;
    }
    return 1;
}

