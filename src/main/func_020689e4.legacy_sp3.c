typedef struct {
    char _pad_18[0x18];
    void *field_18;
} Obj02068ab4;
extern int func_02068ab4(Obj02068ab4 *self, int b, int c);
/* The original passes only r0; its r0:r1 result is a double.
 * The existing C thunk's int return loses the original high return word. */
extern double func_020ac45c();

double func_020689e4(Obj02068ab4 *self, int b, double fallback)
{
    int result = func_02068ab4(self, b, 0);
    if (result != 0) {
        fallback = func_020ac45c(result);
    }
    return fallback;
}
