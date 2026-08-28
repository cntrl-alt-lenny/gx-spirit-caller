/* func_02062df8: assert count>0, fetch the last element, forward to
 * func_0206220c with a rebased offset; on success clear field_90 and
 * return 1, else return 0. */

extern void func_020a6c60(const char *file, const char *msg, int zero, int line);
extern int func_020540cc(void *handle);
extern void *func_0205405c(void *handle, int idx);
extern int func_0206220c(void *self, int a, int b);
extern char data_0210145c[];
extern char data_02101464[];

typedef struct {
    char _pad_50[0x50];
    int field_50;          /* +0x50 */
    char _pad_60[0x60 - 0x54];
    void *field_60;         /* +0x60 */
    char _pad_90[0x90 - 0x64];
    int field_90;            /* +0x90 */
} Obj02062e6c;

typedef struct {
    int f0;
    int f4;
} Elem02062e6c;

int func_02062df8(Obj02062e6c *self) {
    int count = func_020540cc(self->field_60);
    Elem02062e6c *elem;

    if (count <= 0) {
        func_020a6c60(data_0210145c, data_02101464, 0, 0x475);
    }

    elem = func_0205405c(self->field_60, count - 1);
    if (func_0206220c(self, self->field_50 + elem->f0, elem->f4) == 0) {
        return 0;
    }
    self->field_90 = 0;
    return 1;
}
