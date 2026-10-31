typedef struct { int key, prev, next, used, f10, f14, f18; } Entry;
typedef struct { int f0; int *info; Entry *entries; } State;
typedef struct { char pad[0x10]; unsigned short *table_10; } state_hw_t;
typedef struct { Entry *first, *next; int extra; } Frame;
typedef struct { int pad[5]; int count; unsigned dirty:1; unsigned rest:31; } Object;
extern int Task_PostLocked(void *arg0, int arg1, int arg2);
extern void Task_InvokeLocked(void *p);
extern int func_ov005_021ab274(State *o, int idx, Entry **out);
extern int func_ov005_021ab2e0(int *o, int *p);
extern int func_ov005_021ab260(void *obj, int idx);
extern unsigned short func_ov005_021ab384(state_hw_t *p, int idx, unsigned int mask);
int func_ov005_021ab108(Object *o, int capacity) {
    int depth = 0;
    Frame *frames;
    int *indices;
    int count = 0;
    Frame *frame;
    if (!o->dirty) return o->count;
    frames = (Frame *)Task_PostLocked((void *)(capacity * sizeof(Frame)), 4, 0);
    indices = (int *)Task_PostLocked((void *)(capacity * sizeof(int)), 4, 0);
    indices[0] = func_ov005_021ab274((State *)o, 0, (Entry **)frames);
    while (indices[depth] != 0 || depth > 0) {
        if (func_ov005_021ab384((state_hw_t *)o, indices[depth], 1)) {
            count++;
            if (func_ov005_021ab260(o, indices[depth]) &&
                func_ov005_021ab384((state_hw_t *)o, indices[depth], 2)) {
                depth++;
                indices[depth] = func_ov005_021ab274((State *)o, indices[depth-1], (Entry **)&frames[depth]);
                continue;
            }
        }
        frame = &frames[depth];
        indices[depth] = func_ov005_021ab2e0((int *)o, (int *)frame);
        if (indices[depth] == 0) {
            do {
                if (depth <= 0) break;
                frame--;
                depth--;
                indices[depth] = func_ov005_021ab2e0((int *)o, (int *)frame);
            } while (indices[depth] == 0);
        }
    }
    o->count = count;
    o->dirty = 0;
    Task_InvokeLocked(indices);
    Task_InvokeLocked(frames);
    return count;
}



