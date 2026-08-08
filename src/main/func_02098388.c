typedef struct {
    volatile int field_0;
    int field_4;
    int field_8;
    int field_c;
    int field_10;
    char _pad_14[4];
    int field_18;
    volatile int field_1c;
} Obj_t;

void func_02098388(Obj_t *obj) {
    obj->field_0 = 0;
    obj->field_4 = obj->field_0;
    obj->field_1c = 0;
    obj->field_18 = obj->field_1c;
    obj->field_8 = 0;
    obj->field_10 = 0xe;
    obj->field_c = 0;
}
