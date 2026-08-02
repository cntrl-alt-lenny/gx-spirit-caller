/* func_ov002_02257a60: result = func_ov002_0225737c(p, q); if NULL
 * return 1. Save/restore data_ov002_022ce1a8.field_48c around a
 * result->field_c(p,q) call (if non-NULL): 0->return 0, >1->return 1,
 * ==1->fall through. Reset field_5c0=0; if result->field_8 is NULL,
 * return 1. Else double do-while (i:0..1, j:0..10) over
 * data_ov002_022cf08c[i&1] rows (stride 0x14 within, base stride
 * 0x868 per outer i), skipping when bit2 of row->field_40 is set,
 * calling result->field_8(p,i,j); nonzero return -> restore+return 1.
 * Loop exhausted -> restore+return 0.
 */

typedef struct {
    unsigned char _pad_000[0x48c];
    void         *field_48c;
    unsigned char _pad_490[0x5c0 - 0x490];
    int           field_5c0;
} data_ce288_t;

extern data_ce288_t data_ov002_022ce1a8;
extern char data_ov002_022cf08c[];

typedef struct {
    unsigned char _pad_00[8];
    int (*field_8)(void *p, int i, int j);
    int (*field_c)(void *p, void *q);
} result_02257b48_t;

extern result_02257b48_t *func_ov002_0225737c(void *p, void *q);

int func_ov002_02257a60(void *p, void *q) {
    result_02257b48_t *result;
    void *saved;
    int i, j;

    result = func_ov002_0225737c(p, q);
    if (result == 0) {
        goto ret1;
    }

    saved = data_ov002_022ce1a8.field_48c;

    if (result->field_c != 0) {
        int r;
        data_ov002_022ce1a8.field_48c = p;
        r = result->field_c(p, q);
        data_ov002_022ce1a8.field_48c = saved;
        if (r == 0) {
            return 0;
        }
        if (r > 1) {
            return 1;
        }
    }

    data_ov002_022ce1a8.field_5c0 = 0;
    if (result->field_8 == 0) {
        goto ret1;
    }

    data_ov002_022ce1a8.field_48c = p;
    i = 0;
    do {
        char *row = data_ov002_022cf08c + (i & 1) * 0x868;
        j = 0;
        do {
            if (!((*(unsigned int *)(row + 0x40) >> 2) & 1)) {
                if (result->field_8(p, i, j) != 0) {
                    data_ov002_022ce1a8.field_48c = saved;
                    return 1;
                }
            }
            j++;
            row += 0x14;
        } while (j <= 10);
        i++;
    } while (i < 2);

    data_ov002_022ce1a8.field_48c = saved;
    return 0;

ret1:
    return 1;
}
