typedef struct {
    unsigned char type;
    unsigned char length;
    unsigned char *data;
} Entry;
typedef struct {
    unsigned char count;
    Entry entries[16];
} Result;
typedef struct {
    unsigned short size;
    unsigned char pad[0x3a];
    unsigned short invalid;
    unsigned short count;
    unsigned char data[1];
} Input;
Result func_0209e19c(Input *input) {
    Result result;
    unsigned char *p;
    int i;
    unsigned char limit;
    unsigned char total;
    if (input->invalid != 0) {
        result.count = 0;
        return result;
    }
    result.count = input->count;
    if (result.count == 0) {
        return result;
    }
    if (result.count > 16) {
        result.count = 16;
    }
    total = 0;
    p = input->data;
    limit = input->size * 2 - 0x40;
    for (i = 0; i < result.count; i++) {
        unsigned char length;
        result.entries[i].type = p[0];
        result.entries[i].length = p[1];
        result.entries[i].data = p + 2;
        length = result.entries[i].length + 2;
        total += length;
        if (total > limit) {
            result.count = 0;
            return result;
        }
        p += length;
    }
    return result;
}


