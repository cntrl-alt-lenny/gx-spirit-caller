/* func_ov002_021bd6c8: event-code match — true if arg0 is the special 0x10f4
 * while the live code f220 is 0x150b, or simply if arg0 equals f220. */
struct g016c { char _a[220]; int f220; };
extern struct g016c data_ov002_022d016c;
int func_ov002_021bd6c8(int arg0) {
    if (arg0 == 0x10f4 && data_ov002_022d016c.f220 == 0x150b)
        return 1;
    return data_ov002_022d016c.f220 == arg0;
}
