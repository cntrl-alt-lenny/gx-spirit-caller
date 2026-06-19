/* func_ov011_021ca2f4: 2-global dispatch. Forces mwcc to load both
 * globals up-front by declaring local pointers before the branch.
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char _pad_00[0x2d0];
    int  flag;
} data_ov011_021d4000_t;

typedef struct {
    char  _pad_00[0x294];
    void *handle;
} data_ov011_021d403c_t;

extern data_ov011_021d4000_t data_ov011_021d3f20;
extern data_ov011_021d403c_t data_ov011_021d3f5c;

void func_ov011_021ca2f4(void) {
    data_ov011_021d4000_t *a = &data_ov011_021d3f20;
    data_ov011_021d403c_t *b = &data_ov011_021d3f5c;
    if (a->flag == 0) return;
    Task_InvokeLocked(b->handle);
}
