/* CAMPAIGN-PREP candidate for func_0204e914 (main, class C, MED tier) — brief 496.
 * UNVERIFIED + ITERATION-EXPECTED: the MED tier rarely first-build-matches.
 * The campaign drops this into src/, runs ninja + objdiff, and applies the
 * risk note below (these usually need 1+ reshape or a permuter/.s fallback).
 *   recipe:     0x200 stack buf; formatter w/ stacked count word; tail=&buf[n+1]; strlen+memcpy append
 *   risk:       func_0209150c's signature/stack-arg layout (str[sp]=3, str[sp+4]=lit) is struct-guessed; the varargs marshalling (which lit goes where, 3 = arg count) must match the real prototype or the str-to-stack ordering diverges. struct-guessed.
 *   confidence: low
 */
// func_0204e914 — sprintf-into-stack-buffer then forward call (class C)
// func_0209150c(buf, 0x200, fmt, a, b, ...) is a vsnprintf-style formatter
// taking a leading count word on the stack (str [sp]=3, [sp+4]=fmt2 word).
// Buffer is a 0x200 byte stack array at sp+8. r7=arg0, r5=arg2, r4=arg3,
// r6=arg1 (a byte appended after the formatted text).

extern char data_020ff9d4[];
extern char data_020ff9dc[];
extern char data_020ff9e4[];
extern void func_0205538c(int, int, char *);
extern int  func_0209150c(char *buf, int n, char *f0, char *f1, char *f2, int x);
extern void func_02094688(char *dst, char *src, int n);   // memcpy
extern int  func_020aaddc(char *s);                       // strlen

void func_0204e914(int a0, int a1, int a2, char *a3) {
    char buf[0x200];
    int n;
    char *tail;

    n = func_0209150c(buf, 0x200, data_020ff9e4, data_020ff9d4, data_020ff9dc, 3);
    buf[n] = (char)a1;
    buf[n + 1] = 0;
    tail = &buf[n + 1];

    if (a3 != 0) {
        int len = func_020aaddc(a3);
        func_02094688(a3, tail, len);
        tail[len] = 0;
    }

    func_0205538c(a0, a2, buf);
}
