typedef struct {
    unsigned int cardId;
    void *handler;
} Ov002CardHandlerRecord;

struct D524 {
    char _pad[8];
    int field_8;
};

extern const Ov002CardHandlerRecord data_ov002_022c9038[67];
extern struct D524 data_ov002_022cd524;
extern char data_ov002_022d016c[];

extern int func_ov002_02297158(void *self, const Ov002CardHandlerRecord *rec);
extern int func_ov002_022979bc(void *self, int x);
extern int func_ov002_02298768(void *self);
extern int func_ov002_02297d68(void *self);
extern int func_ov002_022974bc(void *self, int x);

int func_ov002_02297b34(void) {
    void *self = *(void **)(data_ov002_022d016c + 0xcec);
    unsigned int i;
    const Ov002CardHandlerRecord *rec;

    switch (data_ov002_022cd524.field_8) {
    case 0:
        rec = data_ov002_022c9038;
        for (i = 0; i < 0x43; i++) {
            if (func_ov002_02297158(self, rec) != 0) {
                return 0;
            }
            rec++;
        }
        (data_ov002_022cd524.field_8)++;
        /* fallthrough */
    case 1:
        if (func_ov002_022979bc(self, 0) != 0) {
            if (func_ov002_02298768(self) != 0) {
                return 0;
            }
        }
        (data_ov002_022cd524.field_8)++;
        /* fallthrough */
    case 2:
        if (func_ov002_02297d68(self) != 0) {
            return 0;
        }
        (data_ov002_022cd524.field_8)++;
        /* fallthrough */
    case 3:
        if (func_ov002_022974bc(self, 0) != 0) {
            return 0;
        }
        (data_ov002_022cd524.field_8)++;
        /* fallthrough */
    default:
        return 1;
    }
}
