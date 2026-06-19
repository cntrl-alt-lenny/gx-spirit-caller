/* func_ov013_021c9f18: 2-global dispatch — check flag, invoke handle.
 *
 * Uses the force-both-pool-loads idiom (#203) to match baserom's
 * shape where both pointers load up-front before the branch.
 */

extern void Task_InvokeLocked(void *p);

typedef struct {
    char _pad_00[0x244];
    int  flag;
} data_ov013_021cbc00_t;

typedef struct {
    char  _pad_00[0x208];
    void *handle;
} data_ov013_021cbc3c_t;

extern data_ov013_021cbc00_t data_ov013_021cbb20;
extern data_ov013_021cbc3c_t data_ov013_021cbb5c;

void func_ov013_021c9f18(void) {
    data_ov013_021cbc00_t *a = &data_ov013_021cbb20;
    data_ov013_021cbc3c_t *b = &data_ov013_021cbb5c;
    if (a->flag == 0) return;
    Task_InvokeLocked(b->handle);
}
