/* func_ov002_02259204: arm a type-7 request in the shared duel-command block
 * data_ov002_022d008c (21 band-callers). Sets the command id (7), stashes
 * arg0 as the request param, clears the two status words, copies the current
 * selection (data_ov002_022cd65c.f4), and clears the result word.
 */

struct g016c {
    char _a[3400];
    int f3400;
    int _p1;
    int f3408;
    int f3412;
    int f3416;
    char _p2[16];
    int f3436;
    char _p3[20];
    int f3460;
};
struct g73c { char _a[4]; int f4; };

extern struct g016c data_ov002_022d008c;
extern struct g73c data_ov002_022cd65c;

void func_ov002_02259204(int arg0) {
    data_ov002_022d008c.f3400 = 7;
    data_ov002_022d008c.f3460 = arg0;
    data_ov002_022d008c.f3412 = 0;
    data_ov002_022d008c.f3408 = 0;
    data_ov002_022d008c.f3436 = data_ov002_022cd65c.f4;
    data_ov002_022d008c.f3416 = 0;
}
