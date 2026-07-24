/* func_ov002_021ef7b4: repeated obj+2 bitfield extracts (orig RELOADS ldrh
 * [r6,#2] before each of the 2nd/3rd owner uses; the kind-check and the
 * first owner-read share the initial load), 3 calls, branchy. owner is a
 * :1 bitfield read via an actual bitfield type (raw (x<<31)>>31 folds to
 * `and #1` since the shift is symmetric -- keep it a real bitfield). */
typedef unsigned short u16;

struct Obj021ef7b4 {
    u16 f0;
    struct {
        u16 owner : 1;
        u16 _pad1 : 5;
        u16 kind : 6;
        u16 _pad2 : 4;
    } f2;
};

extern int func_ov002_021bc288(int side, int state);
extern int func_ov002_021bc618(int owner);
extern int func_ov002_021bc8c8(int owner, int side, int state);

int func_ov002_021ef7b4(struct Obj021ef7b4 *obj, int side, int state)
{
    int owner;

    if (obj->f2.kind == 0x23)
        return 1;

    owner = obj->f2.owner;
    if (func_ov002_021bc8c8(owner, side, state) == 0)
        return 0;

    if (func_ov002_021bc618(obj->f2.owner) != 0)
        goto return_true;
    if (obj->f2.owner != side)
        return 0;
    if (func_ov002_021bc288(side, state) == 0)
        return 0;
return_true:
    return 1;
}
