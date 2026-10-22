typedef unsigned char u8;
typedef struct { int id; char pad[0xa8]; } Item;
typedef struct { int state, count, status; Item *items; } Request;
typedef struct { int mode; char pad[0x14]; void *entries; u8 count, busy, changed; } State;
extern State *data_0219dc80;
extern int func_02048880(int value);
extern int func_020489c4(int a);
extern int func_02048b08(void *arr, int count, int target);
extern void func_02048fac(int index);
extern void func_02052df4(void *self, int a1);
extern void func_020535d4(int a0);
/* The void C thunk forwards the integer return of func_02053688, read here. */
extern int func_02053644(void *p);
extern int func_02055738(void **a0, int a1, int *out);
void func_0204861c(void **obj, Request *req, int index) {
    int i;
    int result;
    if (req->state == 0 && req->count != 0 && func_02053644((char *)data_0219dc80->entries + index * 12) != 0) {
        if (data_0219dc80->mode != 1) return;
        data_0219dc80->busy = 1;
        for (i = 0; i < req->count; i++) {
            if (func_02048b08(data_0219dc80->entries, index, req->items[i].id)) {
                data_0219dc80->count++;
                data_0219dc80->changed = 1;
                req->status = 0x601;
                return;
            }
        }
        for (i = 0; i < req->count; i++) {
            func_02048880(func_02055738(obj, req->items[i].id, &result));
            if (result == -1) {
                func_020489c4(req->items[i].id);
            } else {
                func_02052df4((char *)data_0219dc80->entries + index * 12, req->items[0].id);
                func_020535d4((int)((char *)data_0219dc80->entries + index * 12));
                func_02048fac(index);
                data_0219dc80->count++;
                data_0219dc80->changed = 1;
                req->status = 0x601;
                return;
            }
        }
        if (req->status != 0x600) {
            data_0219dc80->count++;
            data_0219dc80->changed = 1;
        }
    } else {
        if (req->state != 0) {
            if (func_02048880(req->state) != 0) return;
        } else {
            if (data_0219dc80->mode != 1 && func_02053644((char *)data_0219dc80->entries + index * 12) != 0) return;
            data_0219dc80->count++;
            data_0219dc80->changed = 1;
        }
    }
}

