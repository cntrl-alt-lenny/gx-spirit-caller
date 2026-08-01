/* func_ov002_021ef6f4 (ov002): guard chain via func_ov002_021b9ecc's "kind"
 * result (passed straight through to func_0202e5ac, still in r0), the
 * owner bit (bit0 of *(obj+2)), func_ov002_021bc8c8, then a final
 * data_ov002_022cf1a4 table check. C-60 table family for the tail.
 */

typedef unsigned char  u8;
typedef unsigned short u16;
typedef unsigned int   u32;

struct Obj2 { char _pad0[2]; unsigned short owner : 1; unsigned short _rest : 15; };

extern u8  data_ov002_022cf1a4[];
extern int func_0202e5ac(int kind);
extern int func_ov002_021b9ecc(int side, int state);
extern int func_ov002_021bc8c8(int owner, int side, int state);

int func_ov002_021ef6f4(void *obj, int side, int state)
{
    int kind;
    int owner;

    kind = func_ov002_021b9ecc(side, state);
    if (state > 4) {
        return 0;
    }
    if (func_0202e5ac(kind) == 0) {
        return 0;
    }
    if (kind == 0x158c) {
        return 0;
    }

    owner = ((struct Obj2 *)obj)->owner;
    if (func_ov002_021bc8c8(owner, side, state) == 0) {
        goto ret0;
    }

    owner = ((struct Obj2 *)obj)->owner;
    if (owner == side) {
        goto ret1;
    }
    if (*(u16 *)(data_ov002_022cf1a4 + (side & 1) * 0x868 + state * 0x14) == 0) {
        goto ret0;
    }

ret1:
    return 1;

ret0:
    return 0;
}
