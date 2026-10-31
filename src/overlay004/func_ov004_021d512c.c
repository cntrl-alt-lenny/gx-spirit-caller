typedef struct { unsigned char f_0, f_1, f_2, f_3; int f_4, f_8, f_c, f_10; } obj_02033c2c_t;
struct Arg { unsigned char field_0; signed char field_1, field_2; char _pad3; int field_4, field_8; };
typedef struct { signed char id; unsigned char type, limit, count; } Entry;
typedef struct { char pad[0x48]; int f48; char pad4c[0x3c]; int index; char pad8c[0x3c04]; int f3c90; } State;
extern State data_ov004_0220b500;
extern void *func_0203268c(void);
extern void func_02033c2c(obj_02033c2c_t *p, int b, int c, int flag, int e, int f);
extern void func_02033c74(struct Arg *arg0, int arg1, int arg2, int arg3);
extern void func_02033d28(unsigned char *p);
extern void func_020945f4(void *p, int value, unsigned int size);
void func_ov004_021d512c(void *selfv) {
    char *self = selfv;
    int changed = 0;
    int flag;
    char *ctx;
    State *state;
    if (*(int *)(self + 0x38) != 0) {
        *(int *)(self + 0x38) = 0;
        flag = 1;
    } else { flag = 0; }
    if (flag) {
        func_020945f4(self + 0x358, 0, 0xf0);
        func_02033c2c((obj_02033c2c_t *)(self + 0x344), 8, 0x1e, 0, (int)(self + 0x358), (int)(self + 0x448));
        self[0x261] = 0;
        self[0x260] = 0;
        self[0x262] = 0;
    }
    ctx = func_0203268c();
    func_02033c74((struct Arg *)(self + 0x344), *(int *)(ctx + 0xe7c), *(int *)(ctx + 0xeac), 0x6e);
    state = &data_ov004_0220b500;
    if (state->index >= 0) {
        Entry *entry = &(*(Entry **)(self + 0x350))[(signed char)state->index];
        int valid;
        if (entry->type == 6 && entry->count < entry->limit) valid = 1;
        else valid = 0;
        if (!valid) state->index = -1;
        else {
            self[0x260] = entry->id;
            *(int *)(self + 0x30) = 0x1e;
            changed = 1;
            *(int *)(self + 0x38) = 1;
            *(int *)(self + 0x3c) = 0;
        }
    } else if (state->f3c90 != 0) {
        *(int *)(self + 0x30) = 0x1c;
        changed = 1;
        *(int *)(self + 0x38) = 1;
        *(int *)(self + 0x3c) = 0;
    } else if (state->f48 == 1) {
        *(int *)(self + 0x30) = 0x18;
        changed = 1;
        *(int *)(self + 0x38) = 1;
        *(int *)(self + 0x3c) = 0;
    }
    if (changed) func_02033d28((unsigned char *)(self + 0x344));
}
