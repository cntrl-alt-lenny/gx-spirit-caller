typedef struct {
    int           active;
    unsigned char state;
    unsigned char mode;
    unsigned char data[0x12];
    unsigned char ctx[0x10];
} elem_02033d78_t;

extern unsigned char func_02051c4c(unsigned char state, unsigned char *data, unsigned char *ctx);
extern unsigned char func_02051b10(unsigned char state, unsigned char *data, unsigned char *ctx);

void func_02033d78(elem_02033d78_t *e, int n) {
    int i;

    for (i = 0; i < n; i++, e++) {
        if (e->active != 0) {
            if (e->mode == 0) {
                e->state = func_02051c4c(e->state, e->data, e->ctx);
            } else {
                e->state = func_02051b10(e->state, e->data, e->ctx);
            }
            if (e->state == 0) {
                return;
            }
        }
    }
}
