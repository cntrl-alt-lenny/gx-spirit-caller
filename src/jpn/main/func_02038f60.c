typedef struct thing_s thing_t;

typedef struct {
    char       _pad_00[0x0c];
    void     **cursor_b;   /* 0x0c */
    unsigned  *cursor_a;   /* 0x10 */
} list_mgr_t;

struct thing_s { char _pad[0x14]; unsigned field14; /* 0x14 */ };

extern list_mgr_t data_0219c3a0;
extern short       data_020fe3e0;

void func_02038f60(thing_t *t) {
    if (data_0219c3a0.cursor_a == 0)
        return;
    *data_0219c3a0.cursor_a = t->field14;
    data_0219c3a0.cursor_a[1] = 0xffff;
    data_0219c3a0.cursor_a += 1;

    *data_0219c3a0.cursor_b = t;
    data_0219c3a0.cursor_b[1] = 0;
    data_0219c3a0.cursor_b += 1;

    data_020fe3e0++;
}
