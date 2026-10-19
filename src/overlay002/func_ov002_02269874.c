extern int func_ov002_02257ca8(void *arg0, int arg1);
extern void func_ov002_021b1570(int a, int b, void *c, int n);
typedef struct { unsigned short low:8; unsigned short high:8; } State;
typedef struct { unsigned short id; unsigned short unused; unsigned short done:1; unsigned short flags:15; char pad[18]; } Record;
extern struct { char pad[14]; State state; } data_ov002_022cdc68;
extern State data_ov002_022cdc76;
extern Record data_ov002_022ce588[];
extern struct {
    char pad[0x484]; int index; int unused; void *current;
    char pad2[0x128]; int a; int b;
} data_ov002_022ce288;
int func_ov002_02269874(void) {
    int index = data_ov002_022ce288.index;
    Record *current = &data_ov002_022ce588[index];
    Record *previous = index > 0 ? current - 1 : 0;
    if (previous && previous->id == 0) previous = 0;
    switch (data_ov002_022cdc68.state.low) {
    case 0: {
        unsigned short next = data_ov002_022cdc68.state.low + 1;
        data_ov002_022ce288.a = 0;
        data_ov002_022ce288.b = 0;
        data_ov002_022cdc68.state.low = next;
    }
    case 1: {
        int result;
        data_ov002_022ce288.current = current;
        result = func_ov002_02257ca8(current, (int)previous);
        if (result != 0) {
            unsigned short done = result > 0 ? 1 : 0;
            current->done = done;
            data_ov002_022cdc76.low++;
        }
        return 0;
    }
    case 2:
        func_ov002_021b1570(0x1b, -1, current, 0x18);
        return 1;
    }
    return 1;
}
