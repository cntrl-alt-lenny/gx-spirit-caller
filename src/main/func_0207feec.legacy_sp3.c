/* func_0207feec: measure a multi-line string: each func_0207fff8 call
 * measures one line and advances str; out gets the widest line and the
 * total height ((lines - 1) * (spacing + line height) - spacing). */
typedef struct {
    signed char _pad_00;
    signed char height;
} Font;
typedef struct {
    Font *font;
    int (*next)(void *st);
} Ctx;
typedef struct {
    int w;
    int h;
} Size;
extern int func_0207fff8(Ctx *c, int a1, const char *str, const char **end);

void func_0207feec(Size *out, Ctx *c, int a1, int spacing, const char *str) {
    Size res = {0, 0};
    int lines = 1;

    while (str != 0) {
        int w = func_0207fff8(c, a1, str, &str);
        if (w > res.w) {
            res.w = w;
        }
        lines++;
    }
    res.h = (lines - 1) * (spacing + c->font->height) - spacing;
    *out = res;
}
