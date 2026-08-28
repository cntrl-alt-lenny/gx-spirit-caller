/* func_02062458: null-checked field store. Soft-assert (logs, doesn't
 * return) if self is null, then unconditionally stores through it
 * anyway — matches the project's other soft-assert guard chains. */

extern void func_020a6c60(const char *file, const char *msg, int zero, int line);
extern char data_02101438[];
extern char data_02101444[];

typedef struct {
    char _pad_40[0x40];
    int field_40;
} Obj020624cc;

void func_02062458(Obj020624cc *self, int val) {
    if (self == 0) {
        func_020a6c60(data_02101438, data_02101444, 0, 0x19c);
    }
    self->field_40 = val;
}
