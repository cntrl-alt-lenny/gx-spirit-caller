/* func_0206bcec: query func_0206c074 with data_0219ecd8->field_20; on a
 * non-negative result, spin up func_0206c46c(data_02101e7c) and stash it
 * into data_0219ece8. Returns func_0206c074's result either way. */

typedef struct {
    unsigned char _pad_00[0x20];
    int field_20;
} Vt_0206bcec_t;

extern Vt_0206bcec_t *data_0219ecd8;
extern int func_0206c074(int v);
extern void *func_0206c46c(void *param0);
extern char data_02101e7c[];
extern void *data_0219ece8;

int func_0206bcec(void) {
    int r4 = func_0206c074(data_0219ecd8->field_20);
    if (r4 >= 0) {
        data_0219ece8 = func_0206c46c(data_02101e7c);
    }
    return r4;
}
