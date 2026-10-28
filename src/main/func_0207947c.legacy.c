extern void *(*data_0219eee0)(int);
extern void (*data_0219ef0c)(void *);
extern void func_020945f4(void *dst, int val, int n);
extern void func_02094688(void *src, void *dst, int n);
extern void func_02079838(unsigned short *out, unsigned short *in, int capacity);
extern void func_02079a08(void *arg0, unsigned short *arg1, unsigned short *arg2, int arg3);
extern int func_02079e20(short *arr, int n);
extern void func_02079640(unsigned short *q, unsigned short *a, unsigned short *b, unsigned short *r, int n, unsigned short *work);

void func_0207947c(unsigned short *out, unsigned short *base, unsigned short *exp, int n, unsigned short *mod)
{
    unsigned short *temp;
    unsigned short *work;
    int bit;
    unsigned int end;
    temp = data_0219eee0(n * 8);
    if (temp == 0) return;
    work = temp + n;
    func_020945f4(out + 1, 0, (n - 1) * 2);
    out[0] = 1;
    bit = (n - func_02079e20((short *)exp, n)) * 16;
    end = n * 16;
    for (; (unsigned int)bit < end; bit++) {
        if (exp[n - (bit >> 4) - 1] & (0x8000U >> (bit & 15))) {
            func_02094688(base, out, n * 2);
            bit++;
            break;
        }
    }
    for (; (unsigned int)bit < end; bit++) {
        func_02079838(temp, out, n);
        func_02094688(temp, out, n * 2);
        if (mod != 0) func_02079640(0, out, mod, out, n, work);
        if (exp[n - (bit >> 4) - 1] & (0x8000U >> (bit & 15))) {
            func_02079a08(temp, out, base, n);
            func_02094688(temp, out, n * 2);
            if (mod != 0) func_02079640(0, out, mod, out, n, work);
        }
    }
    data_0219ef0c(temp);
}

