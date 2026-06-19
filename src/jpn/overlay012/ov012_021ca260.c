/* func_ov012_021ca260: sibling of func_ov011_021ca2f4. */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char _pad_00[0x1bc];
    int  flag;
} data_ov012_021cc6a0_t;

typedef struct {
    char  _pad_00[0x180];
    void *handle;
} data_ov012_021cc6dc_t;

extern data_ov012_021cc6a0_t data_ov012_021cc5c0;
extern data_ov012_021cc6dc_t data_ov012_021cc5fc;

void func_ov012_021ca260(void) {
    data_ov012_021cc6a0_t *a = &data_ov012_021cc5c0;
    data_ov012_021cc6dc_t *b = &data_ov012_021cc5fc;
    if (a->flag == 0) return;
    Task_InvokeLocked(b->handle);
}
