typedef struct Obj Obj;
typedef struct {
    char pad0[0xc];
    int queue[2];
    int pad14[2];
    unsigned int flags;
    char pad20[0x34];
    int (*callback)(Obj *, int);
    unsigned int mask;
} State;
struct Obj {
    int pad0[2];
    State *state;
    unsigned int flags;
    int pad10;
    int result;
};
/* The IRQ primitive returns the saved mask in r0 as read by the original caller. */
extern int OS_DisableIrq(void);
extern void OS_RestoreIrq(int unused0);
extern void func_02091a8c(void *q);
extern void func_02096728(void *self, int param2);
extern int (*data_020c35cc[])(Obj *);

static inline int is_async(Obj *obj) { if (obj->flags & 4) return 1; else return 0; }

int func_020965ac(Obj *obj, int index) {
    int result;
    unsigned int bit = 1U << index;
    State *state = obj->state;
    if (is_async(obj) != 0U) state->flags |= 0x200;
    else state->flags |= 0x100;
    if (state->mask & bit) {
        result = state->callback(obj, index);
        switch (result) {
        case 0:
        case 1:
        case 4:
            obj->result = result;
            break;
        case 8:
            state->mask &= ~bit;
            result = 7;
            break;
        }
    } else result = 7;
    if (result == 7) result = data_020c35cc[index](obj);
    if (result == 6) {
        if (is_async(obj) != 0U) {
            int saved = OS_DisableIrq();
            while (state->flags & 0x200) func_02091a8c(&state->queue);
            result = obj->result;
            OS_RestoreIrq(saved);
        }
    } else {
        if (is_async(obj) != 0U) {
            state->flags &= ~0x200;
            obj->result = result;
        } else {
            state->flags &= ~0x100;
            func_02096728(obj, result);
        }
    }
    return result;
}








