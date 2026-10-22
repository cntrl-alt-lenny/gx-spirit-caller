typedef struct { int x, y, z; } Vec;
typedef struct { Vec v; short id; signed char mode; unsigned char flag : 1; unsigned char flags : 7; } State;
typedef struct { unsigned int a, b, c; } Entry;
extern void *func_02022224(void);
extern int func_020224c0(char *base, int mode, int val);
extern int func_02022540(int val);
extern int func_02022580(int arg0);
extern int func_020225b4(int idx, int *src, int n);
extern void *func_02022608(int a0, int *a1);
extern int (*data_020c6894[])(int, int, State *, Vec *, Vec *);
int func_02022644(Entry **script, State *state, Vec *out) {
    int active = 0;
    int duration;
    int now;
    Vec target;
    Vec result;
    int start;
    now = (int)func_02022224();
    target.x = (short)func_020224c0((char *)script, ((*script)->a >> 20) & 15, (unsigned short)(*script)->b) << 4;
    target.y = (short)func_020224c0((char *)script, ((*script)->a >> 20) & 15, (unsigned short)((*script)->b >> 16)) << 4;
    target.z = (short)func_020224c0((char *)script, ((*script)->a >> 20) & 15, (unsigned short)(*script)->c) << 4;
    duration = (short)(*script)->a;
    if (duration == 0) {
        if (state->flag) {
            func_02022580(state->id);
            state->id = -1;
            state->flag = 0;
        }
        if (state->mode == 1) { target.x = 0; target.y = 0; target.z = 0; }
        state->v = target;
        *out = target;
        (*script)++;
        return 0;
    }
    switch (((*script)->a >> 16) & 15) {
    case 2:
        if (state->flag) {
            func_02022580(state->id);
            state->id = -1;
            state->flag = 0;
        }
        (*script)++;
        break;
    case 0:
        if (state->flag) { active = 1; }
        else {
            if (state->id < 0) state->id = func_02022540(now);
            func_02022608(state->id, &start);
            if (now - start >= duration) {
                if (state->mode == 1) { target.x = 0; target.y = 0; target.z = 0; }
                state->v = target;
                *out = target;
                func_02022580(state->id);
                state->id = -1;
                state->flag = 0;
                (*script)++;
            } else {
                data_020c6894[state->mode](now - start, duration, state, &target, &result);
                *out = result;
                active = 1;
            }
        }
        break;
    case 1:
        if (state->flag) { active = 1; }
        else {
            state->id = func_02022540((int)func_02022224());
            func_020225b4(state->id, (int *)script, 1);
            state->flag = 1;
            (*script)++;
        }
        break;
    }
    return active;
}


