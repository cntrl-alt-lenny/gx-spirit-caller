typedef struct { unsigned short count; } state_0201ef3c_t;
extern void func_0201ef3c(state_0201ef3c_t *p, void **tasks1, void **tasks2);
extern void Task_InvokeLocked(void *p);
extern void func_020058b4(void);
extern unsigned char data_02104f4c[];
extern void *data_ov017_021b877c[];
typedef struct {
    state_0201ef3c_t *state;
    int pad;
    void *tasks[19];
    void *extra[2];
} Row;
typedef struct {
    Row rows[5];
    unsigned char a, b, c, d;
    unsigned short e;
    unsigned short gap;
    unsigned int f;
} Data;
typedef union {
    struct { unsigned int a:5, b:5, c:5, d:5, e:5, f:6, unused:1; } bits;
    unsigned int raw;
} Packed;
int func_ov017_021b6f40(Data *p) {

    unsigned int value;
    Row *row;
    int i;
    value = 0;
    value |= p->a & 31;
    value |= (p->b & 31) << 5;
    value |= (p->c & 31) << 10;
    value |= (p->d & 31) << 15;
    value |= (p->e & 31) << 20;
    value |= (p->f & 63) << 25;
    *(unsigned int *)(data_02104f4c + 0xa64) = value;
    row = p->rows;
    for (i = 0; i < 5; i++, row++) {
        if (row->extra[0]) {
            func_0201ef3c(row->state, row->tasks, row->extra);
            row->extra[1] = 0;
            row->extra[0] = 0;
        }
    }
    func_020058b4();
    for (i = 0; i < 3; i++) {
        if (data_ov017_021b877c[i]) Task_InvokeLocked(data_ov017_021b877c[i]);
    }
    return 1;
}





