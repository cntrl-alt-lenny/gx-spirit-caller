struct Host;
struct Src { int pad; int (*next)(int *pos); };
struct Cur { struct Host *host; struct Src *src; int step; };

extern int func_020807fc();

void func_020817f0(struct Cur *cur, int x, int a2, int a3, int a4, int *out)
{
    int step = cur->step;
    struct Src *src = cur->src;
    int pos = a4;
    int (*next)(int *) = src->next;
    int c = next(&pos);
    while (c != 0) {
        if (c == 10) {
            break;
        }
        x += func_020807fc(cur->host, src, x, a2, a3, c);
        x += step;
        c = next(&pos);
    }
    if (out != 0) {
        *out = (c == 10) ? pos : 0;
    }
}
