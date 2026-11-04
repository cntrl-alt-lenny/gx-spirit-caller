typedef unsigned char u8;
typedef struct { int words[3]; } Entry;
typedef struct { char pad[0x14]; int count; Entry *entries; } State;
typedef struct { int state; int id; char pad[0x86]; u8 name[1]; } Request;
extern State *data_0219dc80;
extern int func_02048108(void);
extern int func_020489f8(Entry *table, int count, int key);
extern void func_02048fac(int index);
extern void func_02052ddc(int context, void *entry, char *out);
extern void func_02052df4(void *self, int a1);
extern int func_02052f04(int context, void *entry);
extern void func_020535d4(void *p);
extern int func_02053644(void *p);
extern int func_02053650(void *p);
extern int func_020aaf40(const u8 *a, const u8 *b);
void func_02048314(void *obj, Request *req) {
    int i;
    int found = 0;
    int ok = 1;
    int offset;
    int id;
    char buf[0x15];
    if (req->state != 0) return;
    i = 0;
    if (data_0219dc80->count > 0) {
        offset = 0;
        do {
            if (func_02053644((char *)data_0219dc80->entries + offset) == 1) {
                func_02052ddc(func_02048108(), (char *)data_0219dc80->entries + offset, buf);
                if (func_020aaf40((const u8 *)buf, req->name) == 0) {
                    func_02052df4((char *)data_0219dc80->entries + offset, req->id);
                    func_020535d4((char *)data_0219dc80->entries + offset);
                    found = 1;
                }
            } else if (func_02053644((char *)data_0219dc80->entries + offset) == 3 || func_02053644((char *)data_0219dc80->entries + offset) == 2) {
                if (func_02053650((char *)data_0219dc80->entries + offset) == 1) {
                    ok = 0;
                } else {
                    id = req->id;
                    if (id == func_02052f04(func_02048108(), (char *)data_0219dc80->entries + offset)) {
                        func_02052df4((char *)data_0219dc80->entries + offset, id);
                        func_020535d4((char *)data_0219dc80->entries + offset);
                        found = 1;
                    }
                }
            }
            i++;
            offset += 12;
        } while (i < data_0219dc80->count);
    }
    if (found == 0) return;
    {
        int r = func_020489f8(data_0219dc80->entries, data_0219dc80->count, req->id);
        if (ok) func_02048fac(r);
    }
    *((char *)data_0219dc80 + 0x1d) = 1;
}
