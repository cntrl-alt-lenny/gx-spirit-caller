typedef struct { unsigned char pad, state, limit, count; } Status;
typedef struct { unsigned char id; char name[23]; int value; char pad[0xe4]; int active; } Slot;
typedef struct { char pad[0x350]; Status *status; char pad2[4]; signed char map[60][4]; Slot slots[60]; } State;
typedef struct { unsigned char id; char name[51]; int value; char pad[28]; } Record;
typedef struct { char pad[0x3cd0]; int changed; char pad2[0x64]; Record records[60]; } Data;
extern State *data_ov004_0229159c;
extern Data data_ov004_0220b500;
extern void Fill32(int value, void *dest, unsigned size);
extern void func_ov004_021d6468(void *p);
extern char *func_020aadf8(char *dst, const char *src);
static inline int is_ready(Status *p) {
    if (p->state == 6 && p->count < p->limit) return 1;
    return 0;
}
int func_ov004_021d38c4(int index, int *out) {
    Data *data;
    int rec;
    Status *status;
    int state;
    int ready;
    if (data_ov004_0229159c == 0) return 0;
    status = &data_ov004_0229159c->status[(signed char)index];
    state = status->state;
    ready = is_ready(status);
    if (ready) {
        if (out) *out = 6;
    } else {
        if (state == 0) {
            if (out) Fill32(0, out, 0x20);
            return 0;
        }
        if (out) {
            *out = 2;
            if (state == 2) *out = 3;
        }
    }
    if (out) {
        rec = data_ov004_0229159c->map[index][0];
        data = &data_ov004_0220b500;
        func_ov004_021d6468(0);
        State *s = data_ov004_0229159c;
        if (s->slots[index].active) {
            Slot *slot = &s->slots[index];
            data->changed = data->records[rec].value == 0;
            data->records[rec].id = slot->id;
            data->records[rec].value = slot->value;
            func_020aadf8(data->records[rec].name, slot->name);
        }
        *((unsigned char *)out + 8) = data->records[rec].id;
        out[1] = data->records[rec].value;
        func_020aadf8((char *)out + 9, data->records[rec].name);
    }
    return 1;
}





