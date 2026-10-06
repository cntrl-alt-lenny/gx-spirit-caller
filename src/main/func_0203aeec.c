typedef struct {
    int           key;
    short         value;
    unsigned char extra;
    unsigned char sub;
} slot_0203aeec_t;

typedef struct {
    char            _pad[0x40];
    slot_0203aeec_t slots[0x10];
} sub_0203aeec_t;

typedef struct {
    char            _pad[0x78];
    sub_0203aeec_t *f78;
} obj_0203aeec_t;

typedef struct {
    short         value;
    unsigned char extra;
    unsigned char sub;
} out_0203aeec_t;

int func_0203aeec(obj_0203aeec_t *o, out_0203aeec_t *out, int key, int sub) {
    int i;
    slot_0203aeec_t *s = o->f78->slots;

    for (i = 0; i < 0x10; i++, s++) {
        if (s->key == key && s->sub == sub) {
            out->value = s->value;
            out->extra = s->extra;
            out->sub = sub;
            return 1;
        }
    }
    return 0;
}
