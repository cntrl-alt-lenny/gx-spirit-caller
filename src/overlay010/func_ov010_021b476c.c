typedef struct {
    char pad[0x10];
    unsigned short *table_10;
} state_hw_t;
extern int func_ov005_021ab260(void *obj, int idx);
extern unsigned short func_ov005_021ab384(state_hw_t *p, int idx, unsigned int mask);
extern int func_ov005_021ab3a0(void *obj, int idx);
extern int func_ov005_021ab3b4(void *obj, int idx);
extern struct { char pad[0x128]; void *field_128; } data_ov010_021b91b4;
typedef struct {
    char pad[0x7c];
    state_hw_t *field_7c;
    char pad80[0xe4];
    char *field_164;
    int *field_168;
    char *field_16c;
} Data9260;
extern Data9260 data_ov010_021b9260;
extern int data_ov010_021b91c0[];
extern unsigned int data_021067d4[];
static inline int card_flag(int id) {
    if (data_021067d4[id >> 5] & (1 << (id & 31))) return 1;
    return 0;
}
char *func_ov010_021b476c(int id, int *out1, int *out2) {
    Data9260 *d = &data_ov010_021b9260;
    char *result;
    int kind;
    unsigned short index;
    kind = func_ov005_021ab3a0(data_ov010_021b91b4.field_128, id);
    index = func_ov005_021ab3b4(data_ov010_021b91b4.field_128, id) >> 16;
    if (kind != 0) {
        result = d->field_164 + data_ov010_021b91c0[kind - 0x28a];
    } else {
        result = d->field_16c + d->field_168[index];
    }
    if (out1 != 0) {
        int flag = card_flag(id);
        if (flag == 0)
            *out1 = 2;
        else
            *out1 = 0x3fff;
    }
    if (out2 != 0) {
        if (func_ov005_021ab260(d->field_7c, id) == 0)
            *out2 = 0x3fff;
        else if (func_ov005_021ab384(d->field_7c, id, 2) != 0)
            *out2 = 0;
        else
            *out2 = 1;
    }
    return result;
}



