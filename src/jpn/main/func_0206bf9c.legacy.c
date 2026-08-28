/* func_0206bf9c: if data_0219ec40.field_1c < field_14, fail with -1;
 * otherwise dispatch data_0219ebf8's vtable field_1c on data_0219ec3c's
 * value, clear data_0219ec3c, and return 0. */

typedef struct {
    unsigned char _pad_00[0x14];
    int field_14;
    unsigned char _pad_18[0x1c - 0x18];
    int field_1c;
} Data_0219ed20_t;

extern Data_0219ed20_t data_0219ec40;

typedef void (*Cb1c_t)(void *);

typedef struct {
    unsigned char _pad_00[0x1c];
    Cb1c_t field_1c;
} Vt_0206c010_t;

extern Vt_0206c010_t *data_0219ebf8;
extern void *data_0219ec3c;

int func_0206bf9c(void) {
    if (data_0219ec40.field_1c < data_0219ec40.field_14) {
        return -1;
    }
    data_0219ebf8->field_1c(data_0219ec3c);
    data_0219ec3c = 0;
    return 0;
}
