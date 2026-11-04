typedef struct {
    char _pad[4];
    unsigned int f_4;
    unsigned int f_8;
} state_v_t;
typedef struct { char pad[0x24]; int f_24; } context_t;
typedef struct { int id; int value; char first[0x100]; char second[0x100]; int a; int b; } Output;
typedef struct { int field_0; void *field_4; } State;
extern State *data_0219dc80;
extern int func_02047804(void);
extern int func_02048108(void);
extern int func_02052f04(context_t *self, state_v_t *p);
extern int func_02055738(void **a0, int a1, int *out);
extern int func_020557b8(int *self, int index, Output *out);
int func_020488f4(state_v_t *entry, Output *out) {
    int index = 0;
    int id;
    enum { FALSE, TRUE } result;
    if (data_0219dc80 == 0 || func_02047804() == 0) return 0;
    /* The context accessor exposes its pointer value as an integer. */
    id = func_02052f04((context_t *)func_02048108(), entry);
    if (id > 0) {
        if (func_02055738(data_0219dc80->field_4, id, &index) != 0) return 0;
    }
    if (id <= 0 || index == -1) return 0;
    if (func_020557b8(data_0219dc80->field_4, index, out) != 0) result = FALSE;
    else result = TRUE;
    return result;
}
















