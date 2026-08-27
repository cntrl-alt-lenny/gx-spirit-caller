/* func_02095a74: e = &data_021a8140[r0 & 0xff]; if (((r0>>8)&0xff) != e->tag)
 * return; if (e->fn == 0) return; e->fn(e->arg);  (indirect call via blx). */

typedef struct {
    void (*fn)(int arg);
    int  arg;
    unsigned char tag;
} Entry021a8220;

extern Entry021a8220 data_021a8140[];

void func_02095a74(int code)
{
    Entry021a8220 *e = &data_021a8140[code & 0xff];

    if (((code >> 8) & 0xff) != e->tag)
        return;
    if (e->fn == 0)
        return;
    e->fn(e->arg);
}
