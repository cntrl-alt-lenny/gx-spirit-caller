#include "ov008_core.h"
extern void func_020060f4(int *, int *);
int func_ov008_021aa498(int a0, int a1, int a2, int a3) {
    int A, B;
    func_020060f4(&A, &B);
    if (a0 <= A && a2 > A && a1 <= B && a3 > B) {
        return 1;
    }
    return 0;
}
