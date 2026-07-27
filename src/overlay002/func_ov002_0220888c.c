struct Obj { unsigned short u0; unsigned short flag0 : 1, k5 : 5, : 10; };
struct Rec20 { unsigned w0; char pad[0x10]; };   /* stride 0x14, word w0 holds bits16/17 */

extern char data_ov002_022cf1ac[];

int func_ov002_0220888c(struct Obj *card) {
    int flag0 = card->flag0 & 1;
    int k5 = card->k5;
    struct Rec20 *base = (struct Rec20 *)(data_ov002_022cf1ac + flag0 * 0x868);
    unsigned v = base[k5].w0;
    if ((v >> 16) & 1) goto yes;
    if (!((v >> 17) & 1)) goto no;
yes:
    return 1;
no:
    return 0;
}
