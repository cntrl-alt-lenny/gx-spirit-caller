#include "game/prototypes.h"

extern int data_021a4754;

typedef struct {
    void (*fn)(void);
    int unused;
} Callback0208725c;

extern Callback0208725c data_021a4758;
extern Callback0208725c data_021a4764;

extern void func_02095204(void);
extern void func_02087b4c(void);
extern void func_0208708c(void);
extern void func_02087080(void *);

extern signed char data_021a474c;
extern int data_021a4750;

void func_02087174(void)
{
    if (data_021a4754 != 0)
        return;
    data_021a4754 = 1;

    func_02095204();

    data_021a4758.fn = (void (*)(void))func_0208708c;
    data_021a4758.unused = 0;
    data_021a4764.fn = (void (*)(void))func_02087080;
    data_021a4764.unused = 0;

    func_0209a748((int)&data_021a4758);
    func_0209a730((int)&data_021a4764);
    func_02087214();
    func_02088c74();
    func_02087b4c();

    data_021a474c = -1;
    data_021a4750 = 1;
}
