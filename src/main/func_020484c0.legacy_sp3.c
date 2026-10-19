typedef unsigned char u8;
typedef struct { int words[3]; } Entry;
typedef struct { char pad[0x14]; int count; Entry *entries; } State;
typedef struct { int state; int id; char pad[0x86]; u8 name[1]; } Request;
extern State *data_0219dc80;
extern int func_02048108(void);
extern int func_020489c4(int a);
/* The assembly thunk forwards r0, r1 and r2 to func_0205337c. */
extern void func_02052ddc(int context, void *entry, char *out);
extern void func_02052df4(void *self, int a1);
extern int func_02052f04(int context, void *entry);
/* The existing void thunk preserves the integer returned by func_02053688. */
extern int func_02053644(void *p);
/* Existing definition takes one argument; this caller explicitly supplies r1 too. */
extern int func_02055938(void *arg0, int id);
extern int func_02055a18(void *arg0, int id);
extern int func_020aaf40(const u8 *a, const u8 *b);
void func_020484c0(void *obj, Request *req) {
    int found = 0;
    int i;
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
                    func_02055a18(obj, req->id);
                    func_02052df4((char *)data_0219dc80->entries + offset, req->id);
                    found = 1;
                }
            } else if (func_02053644((char *)data_0219dc80->entries + offset) == 3 || func_02053644((char *)data_0219dc80->entries + offset) == 2) {
                id = req->id;
                if (id == func_02052f04(func_02048108(), (char *)data_0219dc80->entries + offset)) {
                    func_02055a18(obj, id);
                    found = 1;
                }
            }
            i++;
            offset += 12;
        } while (i < data_0219dc80->count);
    }
    if (found) func_020489c4(req->id);
    else func_02055938(obj, req->id);
}
