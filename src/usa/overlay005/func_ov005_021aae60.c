#include "ov005_core.h"
extern void func_02006e00(int);
extern void Task_InvokeLocked(int);
void func_ov005_021aae60(int *o) {
    if (o[0]) func_02006e00(o[0]);
    if (o[4]) Task_InvokeLocked(o[4]);
}
