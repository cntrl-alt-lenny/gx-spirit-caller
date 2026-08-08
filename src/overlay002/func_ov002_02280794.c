/* func_ov002_02280794: limit = min(arg3, func_ov002_0225368c(arg0,arg1,arg2)).
 * Records arg0 into data_ov002_022cd524[0]; if arg1==0x18e0, also folds in
 * min with func_ov002_021bcf00(1-arg0). limit==0 forces limit=1. While
 * counter<limit, call func_ov002_0227f03c; break on a negative result;
 * otherwise func_ov002_021afb64() + func_ov002_021aff4c(result,counter+1)
 * and counter++. Stores counter into D016C->f_d44 and returns it. */
#include "ov002_core.h"

extern int data_ov002_022cd524[];
extern int func_ov002_0225368c(int ctx, int card_id, int arg2);
extern int func_ov002_021bcf00(int a);
extern int func_ov002_0227f03c(int a, int b, int c);
extern void func_ov002_021afb64(void);
extern void func_ov002_021aff4c(int index, int value);

int func_ov002_02280794(int arg0, int arg1, int arg2, int arg3) {
    int limit = arg3;
    int callResult = func_ov002_0225368c(arg0, arg1, arg2);
    int counter;

    if (limit >= callResult)
        limit = callResult;

    data_ov002_022cd524[0] = arg0;

    if (arg1 == 0x18e0) {
        int r = func_ov002_021bcf00(1 - arg0);
        if (limit >= r)
            limit = r;
    }

    if (limit == 0)
        limit = 1;

    counter = 0;
    if (limit > 0) {
        do {
            int result = func_ov002_0227f03c(arg0, arg1, arg2);
            if (result < 0)
                break;
            func_ov002_021afb64();
            func_ov002_021aff4c(result, counter + 1);
            counter++;
        } while (counter < limit);
    }

    D016C->f_d44 = counter;
    return counter;
}
