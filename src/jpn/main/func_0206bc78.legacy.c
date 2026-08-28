/* func_0206bc78: query func_0206c000 with data_0219ebf8->field_20; on a
 * non-negative result, spin up func_0206c3f8(data_02101d9c) and stash it
 * into data_0219ec08. Returns func_0206c000's result either way. */

typedef struct {
    unsigned char _pad_00[0x20];
    int field_20;
} Vt_0206bcec_t;

extern Vt_0206bcec_t *data_0219ebf8;
extern int func_0206c000(int v);
extern void *func_0206c3f8(void *param0);
extern char data_02101d9c[];
extern void *data_0219ec08;

int func_0206bc78(void) {
    int r4 = func_0206c000(data_0219ebf8->field_20);
    if (r4 >= 0) {
        data_0219ec08 = func_0206c3f8(data_02101d9c);
    }
    return r4;
}
