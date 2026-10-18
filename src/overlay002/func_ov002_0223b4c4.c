#include <nitro/types.h>

typedef struct {
    u16 id;
    u16 f2;
    u16 f4;
    u16 f6;
} ScanEntry;

extern ScanEntry *func_ov002_0223b3cc(int key);

int func_ov002_0223b4c4(int key, int idx)
{
    ScanEntry *e;
    switch (key) {
    case 0x157e:
        return 1;
    case 0x19ef:
        switch (idx) {
        case 0: return 0x18a6;
        case 1: return 0x18a7;
        case 2: return 0x18a8;
        case 3: return 0x18f9;
        }
        break;
    }
    e = func_ov002_0223b3cc(key);
    if (e == 0)
        return 0;
    switch (idx) {
    case 0: return e->f2;
    case 1: return e->f4;
    case 2: return e->f6;
    }
    return 0;
}
