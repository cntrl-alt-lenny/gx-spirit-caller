extern void *(*data_0219eee0)(int);
extern void (*data_0219ef0c)(void *);
extern void func_02077ab4(int id);
extern int func_02077aec(void);
extern void func_02078f08(unsigned char *out, unsigned short *in, int length, int capacity);
extern void func_02078f50(unsigned short *out, unsigned char *in, int length, int capacity);
extern void func_02078fb0(unsigned short *out, unsigned short *a, unsigned short *exponent, int n, unsigned short *mod);
extern void func_02079640(unsigned short *q, unsigned short *a, unsigned short *b, unsigned short *r, int n, unsigned short *work);
extern void func_02079a08(void *arg0, unsigned short *arg1, unsigned short *arg2, int arg3);
extern void func_02079bbc(unsigned short *out, unsigned short *a, unsigned short *b, int capacity);
extern void func_02079c74(unsigned short *p, int n);
extern void func_02079d30(unsigned short *out, unsigned short *a, unsigned short *b, int capacity);
extern int func_02079ddc(unsigned short *arr, int idx);
typedef struct {
    int length;
    unsigned char *value;
    int p_len; unsigned char *p;
    int q_len; unsigned char *q;
    int dp_len; unsigned char *dp;
    int dq_len; unsigned char *dq;
    int qi_len; unsigned char *qi;
} Key;
void func_02076870(unsigned char *out, unsigned char *in, Key *key)
{
    int n, saved;
    unsigned short *a, *b, *c, *d, *e, *f, *g, *h;
    if (key == 0) return;
    if (key->length == 0) return;
    n = (key->length << 1) / 2 + 1;
    a = data_0219eee0(n * 20);
    if (a == 0) return;
    b = a + n;
    c = b + n;
    d = c + n;
    e = d + n;
    f = e + n;
    g = f + n;
    h = g + n;
    func_02078f50(a, in, key->length, n);
    func_02078f50(b, key->dp, key->dp_len, n);
    func_02078f50(f, key->p, key->p_len, n);
    saved = func_02077aec();
    func_02078fb0(d, a, b, n, f);
    func_02078f50(b, key->dq, key->dq_len, n);
    func_02078f50(f, key->q, key->q_len, n);
    func_02078fb0(e, a, b, n, f);
    func_02077ab4(saved);
    func_02079bbc(a, d, e, n);
    func_02078f50(b, key->qi, key->qi_len, n);
    func_02079a08(c, a, b, n);
    func_02078f50(b, key->q, key->q_len, n);
    func_02079a08(a, c, b, n);
    func_02079d30(c, a, e, n);
    func_02078f50(b, key->value, key->length, n);
    if (func_02079ddc(c, n) < 0) {
        func_02079c74(c, n);
        func_02079640(0, c, b, g, n, h);
        func_02079bbc(g, b, g, n);
    } else {
        func_02079640(0, c, b, g, n, h);
    }
    func_02078f08(out, g, 0x30, n);
    data_0219ef0c(a);
}
