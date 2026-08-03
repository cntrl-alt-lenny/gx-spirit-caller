typedef struct {
    unsigned int cardId;
    void *handler;
} Ov002CardHandlerRecord;

struct D524 {
    char _pad[8];
    int field_8;
};

extern const Ov002CardHandlerRecord data_ov002_022c8f28[67];
extern struct D524 data_ov002_022cd444;
extern char data_ov002_022d008c[];

extern int func_ov002_02297048(void *self, const Ov002CardHandlerRecord *rec);
extern int func_ov002_022978ac(void *self, int x);
extern int func_ov002_02298658(void *self);
extern int func_ov002_02297c58(void *self);
extern int func_ov002_022973ac(void *self, int x);

int func_ov002_02297a24(void) {
    void *self = *(void **)(data_ov002_022d008c + 0xcec);
    unsigned int i;
    const Ov002CardHandlerRecord *rec;

    switch (data_ov002_022cd444.field_8) {
    case 0:
        rec = data_ov002_022c8f28;
        for (i = 0; i < 0x43; i++) {
            if (func_ov002_02297048(self, rec) != 0) {
                return 0;
            }
            rec++;
        }
        (data_ov002_022cd444.field_8)++;
        /* fallthrough */
    case 1:
        if (func_ov002_022978ac(self, 0) != 0) {
            if (func_ov002_02298658(self) != 0) {
                return 0;
            }
        }
        (data_ov002_022cd444.field_8)++;
        /* fallthrough */
    case 2:
        if (func_ov002_02297c58(self) != 0) {
            return 0;
        }
        (data_ov002_022cd444.field_8)++;
        /* fallthrough */
    case 3:
        if (func_ov002_022973ac(self, 0) != 0) {
            return 0;
        }
        (data_ov002_022cd444.field_8)++;
        /* fallthrough */
    default:
        return 1;
    }
}
