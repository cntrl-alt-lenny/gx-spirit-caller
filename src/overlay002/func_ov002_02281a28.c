/* func_ov002_02281a28: if (arg1==11) test whether the :13 id-bitfield of
 * cf16c-row's arr120[arg2] resolves (via func_0202b878) to 0x16. */

typedef unsigned int u32;

struct ent { unsigned int f0 : 13; unsigned int _hi : 19; };

extern char data_ov002_022cf16c[];
extern u32 func_0202b878(int id);

int func_ov002_02281a28(int arg0, int arg1, int arg2)
{
    struct ent *arr;

    if (arg1 == 0xb) {
        arr = (struct ent *)(data_ov002_022cf16c + (arg0 & 1) * 0x868 + 0x120);
        if (func_0202b878(arr[arg2].f0) == 0x16)
            return 1;
    }
    return 0;
}
