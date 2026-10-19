typedef struct {
    void *ctx;
    unsigned int index;
    int field8;
    int flag;
    int length;
    char text[1];
} Rec;
typedef struct {
    char pad0[8];
    void *ctx;
    char pad1[0x1a];
    unsigned short index;
    char *addr;
    int field2c;
    Rec *rec;
    int skip;
} Self;
typedef struct { void *ctx; char *addr; } Req;
extern int func_020970a8(void *param0, int param1, int param2);
int func_02096e24(Self *self) {
    Rec *rec = self->rec;
    Req req;
    unsigned char header;
    unsigned short index;
    int result;
    req.ctx = self->ctx;
    req.addr = self->addr;
    result = func_020970a8(&req, (int)&header, 1);
    if (result != 0) return result;
    rec->length = header & 0x7f;
    rec->flag = (header >> 7) & 1;
    if (rec->length == 0) return 1;
    if (self->skip == 0) {
        result = func_020970a8(&req, (int)rec->text, rec->length);
        if (result != 0) return result;
        rec->text[rec->length] = 0;
    } else {
        req.addr += rec->length;
    }
    if (rec->flag != 0) {
        result = func_020970a8(&req, (int)&index, 2);
        if (result != 0) return result;
        rec->ctx = self->ctx;
        *(unsigned short *)&rec->index = index & 0xfff;
        *((unsigned short *)&rec->index + 1) = 0;
        rec->field8 = 0;
    } else {
        rec->ctx = self->ctx;
        rec->index = self->index;
        self->index++;
    }
    self->addr = req.addr;
    return result;
}
