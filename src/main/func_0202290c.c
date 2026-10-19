typedef struct { int x, y, z; } Vec;
typedef struct { Vec v; short id; signed char mode; unsigned char flags; } State;
typedef struct { unsigned int a, b, c; } Entry;
extern void *func_02022224(void);
extern int func_020224c0(char *base, int mode, int val);
extern int func_02022580(int arg0);
extern void *func_02022608(int a0, int *a1);
extern int (*data_020c6894[])(int, int, State *, Vec *, Vec *);
int func_0202290c(char *base, State *state, Vec *out) {
    int now;
    int start;
    Vec target;
    Vec result;
    Entry **slot;
    int duration;
    Entry *entry;
    now = (int)func_02022224();
    slot = func_02022608(state->id, &start);
    if (slot == 0) return 0;
    entry = *slot;
    duration = (short)entry->a;
    target.x = (short)func_020224c0(base, ((entry->a >> 20) & 15), (unsigned short)entry->b) << 4;
    target.y = (short)func_020224c0(base, ((entry->a >> 20) & 15), (unsigned short)(entry->b >> 16)) << 4;
    target.z = (short)func_020224c0(base, ((entry->a >> 20) & 15), (unsigned short)entry->c) << 4;
    if (duration >= 0) {
        if (now - start >= duration) {
            if (state->mode == 1) {
                target.x = 0;
                target.y = 0;
                target.z = 0;
            }
            state->v = target;
            *out = target;
            func_02022580(state->id);
            state->id = -1;
            state->flags &= ~1;
        } else {
            data_020c6894[state->mode](now - start, duration, state, &target, &result);
            *out = result;
        }
    }
    return 1;
}


