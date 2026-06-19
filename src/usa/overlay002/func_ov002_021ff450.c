/* func_ov002_021ff450: true if either word func_ov002_0220ea10 fills is set. */
extern void func_ov002_0220ea10(int a, int *out);
int func_ov002_021ff450(int arg0) {
    int buf[2];
    func_ov002_0220ea10(arg0, buf);
    return buf[0] != 0 || buf[1] != 0;
}
