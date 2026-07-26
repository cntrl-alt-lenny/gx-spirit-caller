#include <nitro/types.h>

typedef struct {
    u16 id;        /* offset 0x0 */
    u16 _u2;
    u16 _u4;
    u16 field_6;   /* offset 0x6 */
} ScanEntry;

extern ScanEntry *func_ov002_0223b3cc(int key);

int func_ov002_0223b468(int key)
{
    ScanEntry *e;
    switch (key) {
    case 0x157e: return 5;
    case 0x19ef: return 4;
    }
    e = func_ov002_0223b3cc(key);
    if (e == 0)
        return 0;
    if (e->field_6 != 0)
        return 3;
    return 2;
}
