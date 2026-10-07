/* func_0207ff84: height of a string: count lines (the iterator callback
 * returns each character; 10 starts a new line) and return
 * lines * (spacing + line height) - spacing. */
typedef struct {
    signed char _pad_00;
    signed char height;
} Font;
typedef struct {
    Font *font;
    int (*next)(void *st);
} Ctx;
typedef struct {
    int a;
    int b;
} Pair;
typedef struct {
    const char *p;
    Pair size;
} Iter;

int func_0207ff84(Ctx *c, int spacing, const char *str) {
    Iter it;
    int ch;
    Pair *q;
    int lines;
    int (*next)(void *st);

    it.p = str;
    q = &it.size;
    q->a = 0;
    q->b = 0;
    next = c->next;
    lines = 1;
    ch = next(&it);
    while (ch != 0) {
        if (ch == 10) {
            lines++;
        }
        ch = next(&it);
    }
    return lines * (spacing + c->font->height) - spacing;
}
