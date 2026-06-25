#include "ov005_core.h"
extern void Task_Invoke(int);
extern void Task_InvokeLocked(int);
void func_ov005_021aaf40(int *o) {
    if (o[0]) Task_Invoke(o[0]);
    if (o[4]) Task_InvokeLocked(o[4]);
}
