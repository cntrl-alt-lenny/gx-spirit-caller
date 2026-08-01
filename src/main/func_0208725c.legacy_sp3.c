#include "game/prototypes.h"

extern int data_021a4834;

typedef struct {
    void (*fn)(void);
    int unused;
} Callback0208725c;

extern Callback0208725c data_021a4838;
extern Callback0208725c data_021a4844;

extern void func_020952f8(void);
extern void func_02087c34(void);

extern signed char data_021a482c;
extern int data_021a4830;

void func_0208725c(void)
{
    if (data_021a4834 != 0)
        return;
    data_021a4834 = 1;

    func_020952f8();

    data_021a4838.fn = (void (*)(void))func_02087174;
    data_021a4838.unused = 0;
    data_021a4844.fn = (void (*)(void))func_02087168;
    data_021a4844.unused = 0;

    func_0209a83c((int)&data_021a4838);
    func_0209a824((int)&data_021a4844);
    func_020872fc();
    func_02088d5c();
    func_02087c34();

    data_021a482c = -1;
    data_021a4830 = 1;
}
