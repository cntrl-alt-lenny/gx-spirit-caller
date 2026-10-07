/* func_0207fff8: measure one line of text: add up the advance of each
 * character until the iterator callback returns 0 or newline (10); *end
 * receives the iterator state after a newline (else 0); the trailing
 * spacing is dropped. */
typedef struct {
    signed char _pad_00;
    signed char _pad_01;
    unsigned short fallback;
} Font;
typedef struct {
    Font *font;
    int (*next)(void *st);
    unsigned short flag;
} Ctx;
extern int func_02080114(Ctx *c, int ch);
extern signed char *func_020800b8(Ctx *c, int glyph);

int func_0207fff8(Ctx *c, int spacing, const char *str, const char **end) {
    int width;
    int ch;
    int (*next)(void *st);
    const char *it;
    int glyph;
    signed char *info;
    int adv;

    it = str;
    next = c->next;
    width = 0;
    ch = next(&it);
    while (ch != 0) {
        if (ch == 10) {
            break;
        }
        glyph = func_02080114(c, ch);
        if (glyph == 0xffff) {
            glyph = c->font->fallback;
        }
        info = func_020800b8(c, glyph);
        if (c->flag != 0) {
            adv = info[0] + (unsigned char)info[1];
        } else {
            adv = info[2];
        }
        width += spacing + adv;
        ch = next(&it);
    }
    if (end != 0) {
        *end = ch == 10 ? it : 0;
    }
    if (width > 0) {
        width -= spacing;
    }
    return width;
}
